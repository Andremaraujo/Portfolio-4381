import { useMutation } from "@tanstack/react-query";
import { orpc } from "../lib/api";

/** Submits the portfolio contact form. */
export function useSubmitContact() {
  return useMutation(orpc.contact.submit.mutationOptions());
}
