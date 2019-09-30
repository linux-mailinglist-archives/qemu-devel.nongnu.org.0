Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292EEC24A9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 17:51:21 +0200 (CEST)
Received: from localhost ([::1]:54078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iExxG-0002US-SQ
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 11:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iExq8-0008SR-Ke
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:43:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iExq7-0004Ql-BA
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 11:43:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iExq7-0004QP-38; Mon, 30 Sep 2019 11:43:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 43D298A1C8E;
 Mon, 30 Sep 2019 15:43:54 +0000 (UTC)
Received: from [10.36.117.170] (ovpn-117-170.ams2.redhat.com [10.36.117.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3515C219;
 Mon, 30 Sep 2019 15:43:53 +0000 (UTC)
Subject: Re: [PATCH v4 01/18] target/s390x: Add ilen to unwind data
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190927193925.23567-1-richard.henderson@linaro.org>
 <20190927193925.23567-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <e3fc97b7-8ba6-1869-3aba-35c60a171bb6@redhat.com>
Date: Mon, 30 Sep 2019 17:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927193925.23567-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Mon, 30 Sep 2019 15:43:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.09.19 21:39, Richard Henderson wrote:
> From: Richard Henderson <rth@twiddle.net>
> 
> Use ILEN_UNWIND to signal that we have in fact that cpu_restore_state
> will have been called by the time we arrive in do_program_interrupt.
> 
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
>  target/s390x/cpu.h       |  4 +++-
>  target/s390x/interrupt.c |  5 ++++-
>  target/s390x/translate.c | 20 +++++++++++++++++---
>  3 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 1996f44baa..b7d408bf81 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -30,7 +30,7 @@
>  /* The z/Architecture has a strong memory model with some store-after-load re-ordering */
>  #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
>  
> -#define TARGET_INSN_START_EXTRA_WORDS 1
> +#define TARGET_INSN_START_EXTRA_WORDS 2
>  
>  #define MMU_MODE0_SUFFIX _primary
>  #define MMU_MODE1_SUFFIX _secondary
> @@ -803,6 +803,8 @@ int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);
>  void s390_crw_mchk(void);
>  void s390_io_interrupt(uint16_t subchannel_id, uint16_t subchannel_nr,
>                         uint32_t io_int_parm, uint32_t io_int_word);
> +/* instruction length set by unwind info */
> +#define ILEN_UNWIND                 0
>  /* automatically detect the instruction length */
>  #define ILEN_AUTO                   0xff
>  #define RA_IGNORED                  0
> diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
> index a841f7187d..30a9fb8852 100644
> --- a/target/s390x/interrupt.c
> +++ b/target/s390x/interrupt.c
> @@ -28,7 +28,10 @@ void trigger_pgm_exception(CPUS390XState *env, uint32_t code, uint32_t ilen)
>  
>      cs->exception_index = EXCP_PGM;
>      env->int_pgm_code = code;
> -    env->int_pgm_ilen = ilen;
> +    /* If ILEN_UNWIND, int_pgm_ilen already has the correct value.  */
> +    if (ilen != ILEN_UNWIND) {
> +        env->int_pgm_ilen = ilen;
> +    }
>  }
>  
>  void s390_program_interrupt(CPUS390XState *env, uint32_t code, int ilen,
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index a3e43ff9ec..151dfa91fb 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -6309,6 +6309,9 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>      /* Search for the insn in the table.  */
>      insn = extract_insn(env, s, &f);
>  
> +    /* Emit insn_start now that we know the ILEN.  */
> +    tcg_gen_insn_start(s->base.pc_next, s->cc_op, s->ilen);
> +
>      /* Not found means unimplemented/illegal opcode.  */
>      if (insn == NULL) {
>          qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
> @@ -6463,9 +6466,6 @@ static void s390x_tr_tb_start(DisasContextBase *db, CPUState *cs)
>  
>  static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>  {
> -    DisasContext *dc = container_of(dcbase, DisasContext, base);
> -
> -    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op);
>  }
>  
>  static bool s390x_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
> @@ -6473,6 +6473,14 @@ static bool s390x_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>  {
>      DisasContext *dc = container_of(dcbase, DisasContext, base);
>  
> +    /*
> +     * Emit an insn_start to accompany the breakpoint exception.
> +     * The ILEN value is a dummy, since this does not result in
> +     * an s390x exception, but an internal qemu exception which
> +     * brings us back to interact with the gdbstub.
> +     */
> +    tcg_gen_insn_start(dc->base.pc_next, dc->cc_op, 2);
> +
>      dc->base.is_jmp = DISAS_PC_STALE;
>      dc->do_debug = true;
>      /* The address covered by the breakpoint must be included in
> @@ -6567,8 +6575,14 @@ void restore_state_to_opc(CPUS390XState *env, TranslationBlock *tb,
>                            target_ulong *data)
>  {
>      int cc_op = data[1];
> +
>      env->psw.addr = data[0];
> +
> +    /* Update the CC opcode if it is not already up-to-date.  */
>      if ((cc_op != CC_OP_DYNAMIC) && (cc_op != CC_OP_STATIC)) {
>          env->cc_op = cc_op;
>      }
> +
> +    /* Record ILEN.  */
> +    env->int_pgm_ilen = data[2];
>  }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb

