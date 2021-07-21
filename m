Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C4F3D0AE8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:58:32 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m683k-0002Hi-0a
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m680N-00071V-3g
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:55:03 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:59999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m680L-00058M-4j
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:55:02 -0400
Received: from [192.168.100.1] ([82.142.17.146]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTi9N-1lgSuC15p7-00U0Zu; Wed, 21 Jul 2021 10:54:57 +0200
Subject: Re: [PATCH for-6.2 10/23] target/m68k: Drop checks for
 singlestep_enabled
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210721064155.645508-1-richard.henderson@linaro.org>
 <20210721064155.645508-11-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cdaf5484-a7e1-5bf3-0906-9db3d16df52e@vivier.eu>
Date: Wed, 21 Jul 2021 10:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721064155.645508-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BeLnsJxLoOW48AFGvtQ4bYcpHsDUt9H1TtnOfwjWlmw9w716Sw3
 qZl89VP7uQVOiNEbIle2vGQC1QwRJueLHoBItuvXcPQzJibw0rUMDzC9Q2ibKhehkFyJolR
 7TOop3xMEAn8I/Nf2bJplVNV9oMVAJUnWuq4/hd7Hs/1yFloqllFbIRD+/cRXIhA2HYA4V7
 +fdTIADviamEQnu4oMDsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zf9EWvwtVw0=:8gl7szsvWBsNH/Oa3a2mAM
 xuZzoFd2gaCUrJAPS7wXlIx4Kb53imXsO/w9h3tll12VDbhnRzQSgGWNlhkniyd+g4yOEKFNE
 vArsxe3GH9s5/RtZprbeHKUPjVFZRkOge4DvNBPeubreDK+CWJ194lRcYFt4O1bqisAl33Ads
 PQ/tTZBfZx2bhNuuAfBBo1kWB77pYAmtA2UCO20OstRc35IncmtdSJ8R3Gu7uyygx1UUiZg+1
 GBtS2y3Jgu+dCloc6L7MVeFAX616736f5gXFzIYwqLt/mXD123MYOeUC0YP0AliUaG4v0Wgjw
 ZPU91XybNrhYCzHdcIoz4oElAYOsmD2+RFzzWdOU7VmYJXx6yXKvtBYMnb7CwQMHDFeBlV51l
 UhKXodZ2TwkTTcWbfCemp7ZaoQfSs26/+ZCggYiOTbREddoBEO78PnWudeg4FbaV1MMPAlvA0
 jf3iW1/K42rb48rHvegEBL80h6wHzphs3/eeBhiw5JXECol8bnjnNcXyShwAUkgnG9GvM9f/Z
 gpNo+a1DKWl08lyGU4Ye7918rbzrN8tyuAVOfamZHFvF2CCP30lEwzhTLo044W6oGWYTZYcHk
 XopP1VaQImefcIy/5kDaSJVO/M0QyOQ54Tk36nZDrckcD7MlRbSjbctxwmFXlQVdSvYRxal+I
 nv4iN4ucpw5AkdhNFTho00UUU9oHg5hUqSW5a7zSZpaZF/m/rEbelFmxx1TvdRt+yF4C/xY29
 /Mk8fIxyT6DWNipPhCX5TXFF4PQsqcRMIHSExnoY7p46iIcGbh/C/lmFlcunzcPrZbwJR79Q8
 vYz++89apIUG6lddsyHlGUP+qvzQyo4DLg5+wrvDfqUsRO0PPPJEeno06LGuJrE/9Fb+a0A
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/07/2021 à 08:41, Richard Henderson a écrit :
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 44 +++++++++--------------------------------
>  1 file changed, 9 insertions(+), 35 deletions(-)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index c34d9aed61..c3d281a5f2 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -194,18 +194,6 @@ static void do_writebacks(DisasContext *s)
>      }
>  }
>  
> -static bool is_singlestepping(DisasContext *s)
> -{
> -    /*
> -     * Return true if we are singlestepping either because of
> -     * architectural singlestep or QEMU gdbstub singlestep. This does
> -     * not include the command line '-singlestep' mode which is rather
> -     * misnamed as it only means "one instruction per TB" and doesn't
> -     * affect the code we generate.
> -     */
> -    return s->base.singlestep_enabled || s->ss_active;
> -}
> -
>  /* is_jmp field values */
>  #define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
>  #define DISAS_EXIT      DISAS_TARGET_1 /* cpu state was modified dynamically */
> @@ -320,20 +308,6 @@ static void gen_exception(DisasContext *s, uint32_t dest, int nr)
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>  
> -static void gen_singlestep_exception(DisasContext *s)
> -{
> -    /*
> -     * Generate the right kind of exception for singlestep, which is
> -     * either the architectural singlestep or EXCP_DEBUG for QEMU's
> -     * gdb singlestepping.
> -     */
> -    if (s->ss_active) {
> -        gen_raise_exception(EXCP_TRACE);
> -    } else {
> -        gen_raise_exception(EXCP_DEBUG);
> -    }
> -}
> -
>  static inline void gen_addr_fault(DisasContext *s)
>  {
>      gen_exception(s, s->base.pc_next, EXCP_ADDRESS);
> @@ -1522,10 +1496,10 @@ static void gen_exit_tb(DisasContext *s)
>  /* Generate a jump to an immediate address.  */
>  static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
>  {
> -    if (unlikely(is_singlestepping(s))) {
> +    if (unlikely(s->ss_active)) {
>          update_cc_op(s);
>          tcg_gen_movi_i32(QREG_PC, dest);
> -        gen_singlestep_exception(s);
> +        gen_raise_exception(EXCP_TRACE);
>      } else if (translator_use_goto_tb(&s->base, dest)) {
>          tcg_gen_goto_tb(n);
>          tcg_gen_movi_i32(QREG_PC, dest);
> @@ -6193,7 +6167,7 @@ static void m68k_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>  
>      dc->ss_active = (M68K_SR_TRACE(env->sr) == M68K_SR_TRACE_ANY_INS);
>      /* If architectural single step active, limit to 1 */
> -    if (is_singlestepping(dc)) {
> +    if (dc->ss_active) {
>          dc->base.max_insns = 1;
>      }
>  }
> @@ -6252,17 +6226,17 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>          break;
>      case DISAS_TOO_MANY:
>          update_cc_op(dc);
> -        if (is_singlestepping(dc)) {
> +        if (dc->ss_active) {
>              tcg_gen_movi_i32(QREG_PC, dc->pc);
> -            gen_singlestep_exception(dc);
> +            gen_raise_exception(EXCP_TRACE);
>          } else {
>              gen_jmp_tb(dc, 0, dc->pc);
>          }
>          break;
>      case DISAS_JUMP:
>          /* We updated CC_OP and PC in gen_jmp/gen_jmp_im.  */
> -        if (is_singlestepping(dc)) {
> -            gen_singlestep_exception(dc);
> +        if (dc->ss_active) {
> +            gen_raise_exception(EXCP_TRACE);
>          } else {
>              tcg_gen_lookup_and_goto_ptr();
>          }
> @@ -6272,8 +6246,8 @@ static void m68k_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>           * We updated CC_OP and PC in gen_exit_tb, but also modified
>           * other state that may require returning to the main loop.
>           */
> -        if (is_singlestepping(dc)) {
> -            gen_singlestep_exception(dc);
> +        if (dc->ss_active) {
> +            gen_raise_exception(EXCP_TRACE);
>          } else {
>              tcg_gen_exit_tb(NULL, 0);
>          }
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>

