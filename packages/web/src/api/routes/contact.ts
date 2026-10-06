import { z } from "zod";
import { base } from "../__core/app";
import { db } from "../database";
import * as schema from "../database/schema";

export const contact = {
  submit: base
    .input(
      z.object({
        name: z.string().min(2).max(120),
        email: z.string().email().max(200),
        message: z.string().min(10).max(4000),
      }),
    )
    .handler(async ({ input }) => {
      const [row] = await db
        .insert(schema.contactMessages)
        .values({
          name: input.name.trim(),
          email: input.email.trim(),
          message: input.message.trim(),
        })
        .returning({ id: schema.contactMessages.id });

      return { ok: true as const, id: row?.id ?? null };
    }),
};
