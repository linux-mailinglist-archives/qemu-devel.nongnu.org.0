Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665BD5BFD81
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:07:55 +0200 (CEST)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayWA-000576-BE
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayEL-0005dr-JZ
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oayEF-0001rY-V1
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663760962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MNXlx0aYoIqnE8TxnvDFd2bW/7nXAJqcEH7S3X27iig=;
 b=B5Jdz04uF58rqqbWX6tbYXidCmWRea8ZBNJxmuW8JBiI9tMkmMcpSMWFwGUeGZr6cSlgEu
 QGzSrsIw8+LNfkMOevRAZtxjY63nlXm0ddfOk6z8fKKHmgSoUYuSWOnRsbmfGRcEhGxFDc
 CrzsHjmWNlNkzTYYfUDhSnkTlRkzEDo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-Tytn9qUGP3aeahkdf36r5A-1; Wed, 21 Sep 2022 07:49:19 -0400
X-MC-Unique: Tytn9qUGP3aeahkdf36r5A-1
Received: by mail-qt1-f199.google.com with SMTP id
 n16-20020ac85b50000000b0035ce9e26eb1so3925004qtw.8
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 04:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=MNXlx0aYoIqnE8TxnvDFd2bW/7nXAJqcEH7S3X27iig=;
 b=oHwzK9eLtuha8roA/Khs4GOAGmsShBTF4t+bFZT32c3Wph2aFzjkwX/WGcg1KWeGPy
 md1oM5jIDkqMlVCTpZSElDuZKe/bkKKSbuG/MVTqd7ZtGSoa1khU19bNeWRtcqEefvzb
 qCLFPKGBJIACK/DlTStbdws3yWuxN2leSsJb0dI25Uojuu447OZRELv6DQjwl3GBST3U
 FjXXQVyV66L2OdE815zyjVulLrdavPpq3Fn1N9NYfJ8k1+Xy4IJShEumQPniK23pSrlx
 vpHxg+E7WGLx+o3gWZZLm6hU36+HqszE+gZY5jlRhpDgHkmHLU1iAeB2le1K8O+yVngE
 z9sw==
X-Gm-Message-State: ACrzQf0+SV6XQpJy4+BfFHAwtRJzE+rE19kxIlQCeDrvJayDYeXwn5VA
 OPBimZs/zU7RwFDR49hF7N6Sl+Zhl0igA2fXzvhjRvqzjOiXKZYus39qq2OW8Qtc1ao9F3jKxM0
 +ocbTpv2IwYVhbQtr1XRVFKpBatjXkyM=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr22445802qvb.17.1663760958294; 
 Wed, 21 Sep 2022 04:49:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XfU3SMj7FNrjw3fcfCEGnaOV+j6QPCLboft5mKe2PqIuwFA/DXOiixiOLunqyoFT0ssqU66vwgrvEKeJOTcw=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr22445775qvb.17.1663760957784; Wed, 21
 Sep 2022 04:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-2-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-2-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 13:49:05 +0200
Message-ID: <CABgObfbs3QKf3F32Xb39eFpF+HA5DKamSVKbjpD6u304wAsgdw@mail.gmail.com>
Subject: Re: [PATCH v2 01/23] target/i386: Remove pc_start
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The DisasContext member and the disas_insn local variable of
> the same name are identical to DisasContextBase.pc_next.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


> ---
>  target/i386/tcg/translate.c | 114 +++++++++++++++++++-----------------
>  1 file changed, 60 insertions(+), 54 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index d6420df31d..1e24bb2985 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -76,7 +76,6 @@ typedef struct DisasContext {
>      DisasContextBase base;
>
>      target_ulong pc;       /* pc = eip + cs_base */
> -    target_ulong pc_start; /* pc at TB entry */
>      target_ulong cs_base;  /* base of CS segment */
>
>      MemOp aflag;
> @@ -1345,13 +1344,13 @@ static void gen_exception(DisasContext *s, int trapno, target_ulong cur_eip)
>     the instruction is known, but it isn't allowed in the current cpu mode.  */
>  static void gen_illegal_opcode(DisasContext *s)
>  {
> -    gen_exception(s, EXCP06_ILLOP, s->pc_start - s->cs_base);
> +    gen_exception(s, EXCP06_ILLOP, s->base.pc_next - s->cs_base);
>  }
>
>  /* Generate #GP for the current instruction. */
>  static void gen_exception_gpf(DisasContext *s)
>  {
> -    gen_exception(s, EXCP0D_GPF, s->pc_start - s->cs_base);
> +    gen_exception(s, EXCP0D_GPF, s->base.pc_next - s->cs_base);
>  }
>
>  /* Check for cpl == 0; if not, raise #GP and return false. */
> @@ -2016,7 +2015,7 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
>      }
>
>      s->pc += num_bytes;
> -    if (unlikely(s->pc - s->pc_start > X86_MAX_INSN_LENGTH)) {
> +    if (unlikely(s->pc - s->base.pc_next > X86_MAX_INSN_LENGTH)) {
>          /* If the instruction's 16th byte is on a different page than the 1st, a
>           * page fault on the second page wins over the general protection fault
>           * caused by the instruction being too long.
> @@ -2589,7 +2588,7 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
>      if (qemu_loglevel_mask(LOG_UNIMP)) {
>          FILE *logfile = qemu_log_trylock();
>          if (logfile) {
> -            target_ulong pc = s->pc_start, end = s->pc;
> +            target_ulong pc = s->base.pc_next, end = s->pc;
>
>              fprintf(logfile, "ILLOPC: " TARGET_FMT_lx ":", pc);
>              for (; pc < end; ++pc) {
> @@ -3199,8 +3198,7 @@ static const struct SSEOpHelper_table7 sse_op_table7[256] = {
>          goto illegal_op; \
>      } while (0)
>
> -static void gen_sse(CPUX86State *env, DisasContext *s, int b,
> -                    target_ulong pc_start)
> +static void gen_sse(CPUX86State *env, DisasContext *s, int b)
>  {
>      int b1, op1_offset, op2_offset, is_xmm, val;
>      int modrm, mod, rm, reg;
> @@ -3242,7 +3240,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>      }
>      /* simple MMX/SSE operation */
>      if (s->flags & HF_TS_MASK) {
> -        gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
> +        gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
>          return;
>      }
>      if (s->flags & HF_EM_MASK) {
> @@ -4675,11 +4673,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      MemOp ot, aflag, dflag;
>      int modrm, reg, rm, mod, op, opreg, val;
>      target_ulong next_eip, tval;
> -    target_ulong pc_start = s->base.pc_next;
>      bool orig_cc_op_dirty = s->cc_op_dirty;
>      CCOp orig_cc_op = s->cc_op;
>
> -    s->pc_start = s->pc = pc_start;
> +    s->pc = s->base.pc_next;
>      s->override = -1;
>  #ifdef TARGET_X86_64
>      s->rex_w = false;
> @@ -4703,7 +4700,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>          s->base.num_insns--;
>          tcg_remove_ops_after(s->prev_insn_end);
>          s->base.is_jmp = DISAS_TOO_MANY;
> -        return pc_start;
> +        return s->base.pc_next;
>      default:
>          g_assert_not_reached();
>      }
> @@ -6044,7 +6041,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>              if (s->flags & (HF_EM_MASK | HF_TS_MASK)) {
>                  /* if CR0.EM or CR0.TS are set, generate an FPU exception */
>                  /* XXX: what to do if illegal op ? */
> -                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
> +                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
>                  break;
>              }
>              modrm = x86_ldub_code(env, s);
> @@ -6585,7 +6582,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                                 offsetof(CPUX86State, segs[R_CS].selector));
>                  tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
>                                   offsetof(CPUX86State, fpcs));
> -                tcg_gen_st_tl(tcg_constant_tl(pc_start - s->cs_base),
> +                tcg_gen_st_tl(tcg_constant_tl(s->base.pc_next - s->cs_base),
>                                cpu_env, offsetof(CPUX86State, fpip));
>              }
>          }
> @@ -6597,7 +6594,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xa5:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_movs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
> +            gen_repz_movs(s, ot, s->base.pc_next - s->cs_base,
> +                          s->pc - s->cs_base);
>          } else {
>              gen_movs(s, ot);
>          }
> @@ -6607,7 +6605,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xab:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_stos(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
> +            gen_repz_stos(s, ot, s->base.pc_next - s->cs_base,
> +                          s->pc - s->cs_base);
>          } else {
>              gen_stos(s, ot);
>          }
> @@ -6616,7 +6615,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xad:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_lods(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
> +            gen_repz_lods(s, ot, s->base.pc_next - s->cs_base,
> +                          s->pc - s->cs_base);
>          } else {
>              gen_lods(s, ot);
>          }
> @@ -6625,9 +6625,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xaf:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & PREFIX_REPNZ) {
> -            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
> +            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
> +                          s->pc - s->cs_base, 1);
>          } else if (prefixes & PREFIX_REPZ) {
> -            gen_repz_scas(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
> +            gen_repz_scas(s, ot, s->base.pc_next - s->cs_base,
> +                          s->pc - s->cs_base, 0);
>          } else {
>              gen_scas(s, ot);
>          }
> @@ -6637,9 +6639,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0xa7:
>          ot = mo_b_d(b, dflag);
>          if (prefixes & PREFIX_REPNZ) {
> -            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 1);
> +            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
> +                          s->pc - s->cs_base, 1);
>          } else if (prefixes & PREFIX_REPZ) {
> -            gen_repz_cmps(s, ot, pc_start - s->cs_base, s->pc - s->cs_base, 0);
> +            gen_repz_cmps(s, ot, s->base.pc_next - s->cs_base,
> +                          s->pc - s->cs_base, 0);
>          } else {
>              gen_cmps(s, ot);
>          }
> @@ -6657,7 +6661,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>              gen_io_start();
>          }
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_ins(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
> +            gen_repz_ins(s, ot, s->base.pc_next - s->cs_base,
> +                         s->pc - s->cs_base);
>              /* jump generated by gen_repz_ins */
>          } else {
>              gen_ins(s, ot);
> @@ -6678,7 +6683,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>              gen_io_start();
>          }
>          if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
> -            gen_repz_outs(s, ot, pc_start - s->cs_base, s->pc - s->cs_base);
> +            gen_repz_outs(s, ot, s->base.pc_next - s->cs_base,
> +                          s->pc - s->cs_base);
>              /* jump generated by gen_repz_outs */
>          } else {
>              gen_outs(s, ot);
> @@ -6790,7 +6796,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      do_lret:
>          if (PE(s) && !VM86(s)) {
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              gen_helper_lret_protected(cpu_env, tcg_const_i32(dflag - 1),
>                                        tcg_const_i32(val));
>          } else {
> @@ -7260,7 +7266,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>              goto illegal_op;
>          val = x86_ldub_code(env, s);
>          if (val == 0) {
> -            gen_exception(s, EXCP00_DIVZ, pc_start - s->cs_base);
> +            gen_exception(s, EXCP00_DIVZ, s->base.pc_next - s->cs_base);
>          } else {
>              gen_helper_aam(cpu_env, tcg_const_i32(val));
>              set_cc_op(s, CC_OP_LOGICB);
> @@ -7286,34 +7292,34 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>          }
>          if (prefixes & PREFIX_REPZ) {
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> -            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - pc_start));
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>              s->base.is_jmp = DISAS_NORETURN;
>          }
>          break;
>      case 0x9b: /* fwait */
>          if ((s->flags & (HF_MP_MASK | HF_TS_MASK)) ==
>              (HF_MP_MASK | HF_TS_MASK)) {
> -            gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
> +            gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
>          } else {
>              gen_helper_fwait(cpu_env);
>          }
>          break;
>      case 0xcc: /* int3 */
> -        gen_interrupt(s, EXCP03_INT3, pc_start - s->cs_base, s->pc - s->cs_base);
> +        gen_interrupt(s, EXCP03_INT3, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
>          break;
>      case 0xcd: /* int N */
>          val = x86_ldub_code(env, s);
>          if (check_vm86_iopl(s)) {
> -            gen_interrupt(s, val, pc_start - s->cs_base, s->pc - s->cs_base);
> +            gen_interrupt(s, val, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
>          }
>          break;
>      case 0xce: /* into */
>          if (CODE64(s))
>              goto illegal_op;
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, pc_start - s->cs_base);
> -        gen_helper_into(cpu_env, tcg_const_i32(s->pc - pc_start));
> +        gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +        gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>          break;
>  #ifdef WANT_ICEBP
>      case 0xf1: /* icebp (undocumented, exits to external debugger) */
> @@ -7419,7 +7425,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0x132: /* rdmsr */
>          if (check_cpl0(s)) {
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              if (b & 2) {
>                  gen_helper_rdmsr(cpu_env);
>              } else {
> @@ -7431,7 +7437,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>          break;
>      case 0x131: /* rdtsc */
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, pc_start - s->cs_base);
> +        gen_jmp_im(s, s->base.pc_next - s->cs_base);
>          if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>              gen_io_start();
>          }
> @@ -7442,7 +7448,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>          break;
>      case 0x133: /* rdpmc */
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, pc_start - s->cs_base);
> +        gen_jmp_im(s, s->base.pc_next - s->cs_base);
>          gen_helper_rdpmc(cpu_env);
>          s->base.is_jmp = DISAS_NORETURN;
>          break;
> @@ -7472,8 +7478,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0x105: /* syscall */
>          /* XXX: is it usable in real mode ? */
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, pc_start - s->cs_base);
> -        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - pc_start));
> +        gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>          /* TF handling for the syscall insn is different. The TF bit is  checked
>             after the syscall insn completes. This allows #DB to not be
>             generated after one has entered CPL0 if TF is set in FMASK.  */
> @@ -7498,14 +7504,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>  #endif
>      case 0x1a2: /* cpuid */
>          gen_update_cc_op(s);
> -        gen_jmp_im(s, pc_start - s->cs_base);
> +        gen_jmp_im(s, s->base.pc_next - s->cs_base);
>          gen_helper_cpuid(cpu_env);
>          break;
>      case 0xf4: /* hlt */
>          if (check_cpl0(s)) {
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> -            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - pc_start));
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>              s->base.is_jmp = DISAS_NORETURN;
>          }
>          break;
> @@ -7601,7 +7607,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              tcg_gen_mov_tl(s->A0, cpu_regs[R_EAX]);
>              gen_extu(s->aflag, s->A0);
>              gen_add_A0_ds_seg(s);
> @@ -7613,8 +7619,8 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> -            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - pc_start));
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
> +            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
>              s->base.is_jmp = DISAS_NORETURN;
>              break;
>
> @@ -7691,9 +7697,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
> -                             tcg_const_i32(s->pc - pc_start));
> +                             tcg_const_i32(s->pc - s->base.pc_next));
>              tcg_gen_exit_tb(NULL, 0);
>              s->base.is_jmp = DISAS_NORETURN;
>              break;
> @@ -7703,7 +7709,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              gen_helper_vmmcall(cpu_env);
>              break;
>
> @@ -7715,7 +7721,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              gen_helper_vmload(cpu_env, tcg_const_i32(s->aflag - 1));
>              break;
>
> @@ -7727,7 +7733,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              gen_helper_vmsave(cpu_env, tcg_const_i32(s->aflag - 1));
>              break;
>
> @@ -7753,7 +7759,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  break;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              gen_helper_clgi(cpu_env);
>              break;
>
> @@ -7899,7 +7905,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              gen_update_cc_op(s);
> -            gen_jmp_im(s, pc_start - s->cs_base);
> +            gen_jmp_im(s, s->base.pc_next - s->cs_base);
>              if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
>                  gen_io_start();
>              }
> @@ -8351,7 +8357,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
> -                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
> +                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
>                  break;
>              }
>              gen_lea_modrm(env, s, modrm);
> @@ -8364,7 +8370,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              if ((s->flags & HF_EM_MASK) || (s->flags & HF_TS_MASK)) {
> -                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
> +                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
>                  break;
>              }
>              gen_lea_modrm(env, s, modrm);
> @@ -8376,7 +8382,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              if (s->flags & HF_TS_MASK) {
> -                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
> +                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
>                  break;
>              }
>              gen_lea_modrm(env, s, modrm);
> @@ -8389,7 +8395,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                  goto illegal_op;
>              }
>              if (s->flags & HF_TS_MASK) {
> -                gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
> +                gen_exception(s, EXCP07_PREX, s->base.pc_next - s->cs_base);
>                  break;
>              }
>              gen_helper_update_mxcsr(cpu_env);
> @@ -8598,7 +8604,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>      case 0x1c2:
>      case 0x1c4 ... 0x1c6:
>      case 0x1d0 ... 0x1fe:
> -        gen_sse(env, s, b, pc_start);
> +        gen_sse(env, s, b);
>          break;
>      default:
>          goto unknown_op;
> --
> 2.34.1
>


