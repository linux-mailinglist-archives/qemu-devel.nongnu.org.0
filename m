Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30F4EAE04
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:58:17 +0200 (CEST)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBQN-0005RW-Ss
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:58:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hduweili@gmail.com>)
 id 1nZBOi-00043q-My
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:56:34 -0400
Received: from [2607:f8b0:4864:20::12a] (port=44875
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hduweili@gmail.com>)
 id 1nZBOg-0007Cz-MD
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:56:32 -0400
Received: by mail-il1-x12a.google.com with SMTP id 14so7582605ily.11
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRFnsDWLb+x3rhQXANftLpKbj8+b+VtbzLW0iR9afMA=;
 b=iX5oNTaNa3Wc3Oz1y1fNJ/ohKXV0rlbfFQgjqXvYLri/7dr1T31lDX9sLm+58Mv8w7
 v+LzSuMptuyLeGT1kkQ6TPC12bRbT/P0KAdwAjGTaEDiFuWlNBMaC1/xubKUMdB0sLHz
 9bLVrDoPpnF3FKmRQY4DEOfj94eNpnlme7fQd93vgNhsptP91glADfM+w7g/JVbI8tFP
 o7GbnuM9OA1VKLHLniqYjDop7Hw4XL9BZLlXGhTcJ4VYy/WPvgE/hDEBMX/XQgjxjJR/
 GiSytOsyxLxtW2buAL26dORbcNE2P0h3qA+UigBxIIBtDSHgBsYwbMAJhK63CLTdP6zu
 8M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRFnsDWLb+x3rhQXANftLpKbj8+b+VtbzLW0iR9afMA=;
 b=D8TNWIsPKC4B4/HisKKLKFogUoispVZXfh5YV+5B3Fq0JZAGAJCHbFTIbhcw3XH32u
 cXIQs1BpV2FHGENOpu4xeHbhZwJggY7uOkuoHqlpPWNrI5LLue+ryWJm/SlhWsNfuksS
 u3ayswNEiG2x8JE9JfPJg4kZJufiISYBxpegccVtgJ24r0ucMEljIFDdc6yJOICs+3dh
 o/9R6piPYdw22U8OYzwyx903j7Bp2X6khAB2Tj3JMgHykAvsnC/kF4ZiXVIHSunS5a3Z
 OHCyNKVefBEcuPK9iUbsTRYlDYcTjq6MivbjwEc6jNDy7p021KENNzl+L2AnDbcGPrea
 3XaQ==
X-Gm-Message-State: AOAM533j9eeyjuyH2BvRTnRavFRkIglGmx9h3ksZxlMPdZoCNsKHAL46
 Y7jCwZ8lvPr3F4RQq1MGsrnbtOcwiUP3C+CTH+w=
X-Google-Smtp-Source: ABdhPJwzNGqsOB6I1ac8yrMy9pqkna7rHFY5P+UobFWf0OhoN3STy9j/z+6C6nFRSuFWoL4Dc/YVUqda/3lOqMLzEVQ=
X-Received: by 2002:a05:6e02:e11:b0:2c8:a711:42ce with SMTP id
 a17-20020a056e020e1100b002c8a71142cemr8507993ilk.249.1648558589188; Tue, 29
 Mar 2022 05:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220323013417.409858-1-lw945lw945@yahoo.com>
 <20220323013417.409858-2-lw945lw945@yahoo.com>
In-Reply-To: <20220323013417.409858-2-lw945lw945@yahoo.com>
From: =?UTF-8?B?5p2O546u?= <hduweili@gmail.com>
Date: Tue, 29 Mar 2022 20:56:17 +0800
Message-ID: <CAAHarUx9TRsa_rYyz9r-8ipbREtfxJqTtMT3iBFojKmsfzgChw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] fix cmpxchg and lock cmpxchg instruction
To: Wei Li <lw945lw945@yahoo.com>
Content-Type: multipart/alternative; boundary="00000000000019a06105db5af512"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=hduweili@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000019a06105db5af512
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 23, 2022 at 9:37 AM Wei Li <lw945lw945@yahoo.com> wrote:

> This patch fixes a bug reported on issues #508.
> The problem is cmpxchg and lock cmpxchg would touch accumulator when
> the comparison is equal.
>
> Signed-off-by: Wei Li <lw945lw945@yahoo.com>
> ---
>  target/i386/tcg/translate.c | 41 +++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 22 deletions(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 2a94d33742..9677f9576b 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5339,7 +5339,7 @@ static target_ulong disas_insn(DisasContext *s,
> CPUState *cpu)
>      case 0x1b0:
>      case 0x1b1: /* cmpxchg Ev, Gv */
>          {
> -            TCGv oldv, newv, cmpv;
> +            TCGv oldv, newv, cmpv, temp;
>
>              ot = mo_b_d(b, dflag);
>              modrm = x86_ldub_code(env, s);
> @@ -5348,42 +5348,38 @@ static target_ulong disas_insn(DisasContext *s,
> CPUState *cpu)
>              oldv = tcg_temp_new();
>              newv = tcg_temp_new();
>              cmpv = tcg_temp_new();
> +            temp = tcg_temp_new();
>              gen_op_mov_v_reg(s, ot, newv, reg);
>              tcg_gen_mov_tl(cmpv, cpu_regs[R_EAX]);
> +            tcg_gen_mov_tl(temp, cpu_regs[R_EAX]);
>
> -            if (s->prefix & PREFIX_LOCK) {
> +            if ((s->prefix & PREFIX_LOCK) ||
> +                (mod != 3)) {
> +                /* Use the tcg_gen_atomic_cmpxchg_tl path whenever mod !=
> 3.
> +                   While an unlocked cmpxchg need not be atomic, it is not
> +                   required to be non-atomic either. */
>                  if (mod == 3) {
>                      goto illegal_op;
>                  }
>                  gen_lea_modrm(env, s, modrm);
>                  tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
>                                            s->mem_index, ot | MO_LE);
> -                gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> +                gen_extu(ot, oldv);
> +                gen_extu(ot, cmpv);
>              } else {
> -                if (mod == 3) {
> -                    rm = (modrm & 7) | REX_B(s);
> -                    gen_op_mov_v_reg(s, ot, oldv, rm);
> -                } else {
> -                    gen_lea_modrm(env, s, modrm);
> -                    gen_op_ld_v(s, ot, oldv, s->A0);
> -                    rm = 0; /* avoid warning */
> -                }
> +                rm = (modrm & 7) | REX_B(s);
> +                gen_op_mov_v_reg(s, ot, oldv, rm);
>                  gen_extu(ot, oldv);
>                  gen_extu(ot, cmpv);
>                  /* store value = (old == cmp ? new : old);  */
>                  tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv,
> oldv);
> -                if (mod == 3) {
> -                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> -                    gen_op_mov_reg_v(s, ot, rm, newv);
> -                } else {
> -                    /* Perform an unconditional store cycle like physical
> cpu;
> -                       must be before changing accumulator to ensure
> -                       idempotency if the store faults and the instruction
> -                       is restarted */
> -                    gen_op_st_v(s, ot, newv, s->A0);
> -                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> -                }
> +                gen_op_mov_reg_v(s, ot, rm, newv);
>              }
> +            /* Perform the merge into %al or %ax as required by ot. */
> +            gen_op_mov_reg_v(s, ot, R_EAX, oldv);
> +            /* Undo the entire modification to %rax if comparison equal.
> */
> +            tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
> +                                temp, cpu_regs[R_EAX]);
>              tcg_gen_mov_tl(cpu_cc_src, oldv);
>              tcg_gen_mov_tl(s->cc_srcT, cmpv);
>              tcg_gen_sub_tl(cpu_cc_dst, cmpv, oldv);
> @@ -5391,6 +5387,7 @@ static target_ulong disas_insn(DisasContext *s,
> CPUState *cpu)
>              tcg_temp_free(oldv);
>              tcg_temp_free(newv);
>              tcg_temp_free(cmpv);
> +            tcg_temp_free(temp);
>          }
>          break;
>      case 0x1c7: /* cmpxchg8b */
> --
> 2.30.2
>
>
>
Is this patch OK? or I forgot to add a reviewed-by tags by my hand?
This is my first time participating in this process.
Please let me know if anything is wrong.

Thanks a lot.
Wei Li

--00000000000019a06105db5af512
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgTWFy
IDIzLCAyMDIyIGF0IDk6MzcgQU0gV2VpIExpICZsdDs8YSBocmVmPSJtYWlsdG86bHc5NDVsdzk0
NUB5YWhvby5jb20iPmx3OTQ1bHc5NDVAeWFob28uY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2
PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBw
eCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij5UaGlzIHBhdGNoIGZpeGVzIGEgYnVnIHJlcG9ydGVkIG9uIGlzc3VlcyAjNTA4Ljxi
cj4NClRoZSBwcm9ibGVtIGlzIGNtcHhjaGcgYW5kIGxvY2sgY21weGNoZyB3b3VsZCB0b3VjaCBh
Y2N1bXVsYXRvciB3aGVuPGJyPg0KdGhlIGNvbXBhcmlzb24gaXMgZXF1YWwuPGJyPg0KPGJyPg0K
U2lnbmVkLW9mZi1ieTogV2VpIExpICZsdDs8YSBocmVmPSJtYWlsdG86bHc5NDVsdzk0NUB5YWhv
by5jb20iIHRhcmdldD0iX2JsYW5rIj5sdzk0NWx3OTQ1QHlhaG9vLmNvbTwvYT4mZ3Q7PGJyPg0K
LS0tPGJyPg0KwqB0YXJnZXQvaTM4Ni90Y2cvdHJhbnNsYXRlLmMgfCA0MSArKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPg0KwqAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0
aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL3RhcmdldC9p
Mzg2L3RjZy90cmFuc2xhdGUuYyBiL3RhcmdldC9pMzg2L3RjZy90cmFuc2xhdGUuYzxicj4NCmlu
ZGV4IDJhOTRkMzM3NDIuLjk2NzdmOTU3NmIgMTAwNjQ0PGJyPg0KLS0tIGEvdGFyZ2V0L2kzODYv
dGNnL3RyYW5zbGF0ZS5jPGJyPg0KKysrIGIvdGFyZ2V0L2kzODYvdGNnL3RyYW5zbGF0ZS5jPGJy
Pg0KQEAgLTUzMzksNyArNTMzOSw3IEBAIHN0YXRpYyB0YXJnZXRfdWxvbmcgZGlzYXNfaW5zbihE
aXNhc0NvbnRleHQgKnMsIENQVVN0YXRlICpjcHUpPGJyPg0KwqAgwqAgwqBjYXNlIDB4MWIwOjxi
cj4NCsKgIMKgIMKgY2FzZSAweDFiMTogLyogY21weGNoZyBFdiwgR3YgKi88YnI+DQrCoCDCoCDC
oCDCoCDCoHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgVENHdiBvbGR2LCBuZXd2LCBjbXB2Ozxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCBUQ0d2IG9sZHYsIG5ld3YsIGNtcHYsIHRlbXA7PGJyPg0K
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqBvdCA9IG1vX2JfZChiLCBkZmxhZyk7PGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqBtb2RybSA9IHg4Nl9sZHViX2NvZGUoZW52LCBzKTs8YnI+DQpAQCAt
NTM0OCw0MiArNTM0OCwzOCBAQCBzdGF0aWMgdGFyZ2V0X3Vsb25nIGRpc2FzX2luc24oRGlzYXND
b250ZXh0ICpzLCBDUFVTdGF0ZSAqY3B1KTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgb2xkdiA9
IHRjZ190ZW1wX25ldygpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgbmV3diA9IHRjZ190ZW1w
X25ldygpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgY21wdiA9IHRjZ190ZW1wX25ldygpOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCB0ZW1wID0gdGNnX3RlbXBfbmV3KCk7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqBnZW5fb3BfbW92X3ZfcmVnKHMsIG90LCBuZXd2LCByZWcpOzxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgdGNnX2dlbl9tb3ZfdGwoY21wdiwgY3B1X3JlZ3NbUl9FQVhdKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgdGNnX2dlbl9tb3ZfdGwodGVtcCwgY3B1X3JlZ3NbUl9F
QVhdKTs8YnI+DQo8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHMtJmd0O3ByZWZpeCAmYW1w
OyBQUkVGSVhfTE9DSykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKHMtJmd0O3ByZWZp
eCAmYW1wOyBQUkVGSVhfTE9DSykgfHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKG1v
ZCAhPSAzKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBVc2UgdGhlIHRjZ19n
ZW5fYXRvbWljX2NtcHhjaGdfdGwgcGF0aCB3aGVuZXZlciBtb2QgIT0gMy48YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBXaGlsZSBhbiB1bmxvY2tlZCBjbXB4Y2hnIG5lZWQgbm90
IGJlIGF0b21pYywgaXQgaXMgbm90PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmVxdWlyZWQgdG8gYmUgbm9uLWF0b21pYyBlaXRoZXIuICovPGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiAobW9kID09IDMpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGdvdG8gaWxsZWdhbF9vcDs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdlbl9sZWFfbW9kcm0oZW52LCBzLCBtb2Ry
bSk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0Y2dfZ2VuX2F0b21pY19jbXB4Y2hn
X3RsKG9sZHYsIHMtJmd0O0EwLCBjbXB2LCBuZXd2LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcy0mZ3Q7bWVtX2lu
ZGV4LCBvdCB8IE1PX0xFKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2VuX29wX21v
dl9yZWdfdihzLCBvdCwgUl9FQVgsIG9sZHYpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBnZW5fZXh0dShvdCwgb2xkdik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdlbl9l
eHR1KG90LCBjbXB2KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoH0gZWxzZSB7PGJyPg0KLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChtb2QgPT0gMykgezxicj4NCi3CoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBybSA9IChtb2RybSAmYW1wOyA3KSB8IFJFWF9CKHMpOzxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZW5fb3BfbW92X3ZfcmVnKHMsIG90LCBvbGR2
LCBybSk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdlbl9sZWFfbW9kcm0oZW52LCBzLCBtb2RybSk7PGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdlbl9vcF9sZF92KHMsIG90LCBvbGR2
LCBzLSZndDtBMCk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJtID0gMDsg
LyogYXZvaWQgd2FybmluZyAqLzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJtID0gKG1vZHJtICZhbXA7IDcpIHwgUkVYX0Iocyk7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdlbl9vcF9tb3Zfdl9yZWcocywgb3QsIG9s
ZHYsIHJtKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdlbl9leHR1KG90LCBvbGR2
KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdlbl9leHR1KG90LCBjbXB2KTs8YnI+
DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHN0b3JlIHZhbHVlID0gKG9sZCA9PSBjbXAg
PyBuZXcgOiBvbGQpO8KgICovPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0Y2dfZ2Vu
X21vdmNvbmRfdGwoVENHX0NPTkRfRVEsIG5ld3YsIG9sZHYsIGNtcHYsIG5ld3YsIG9sZHYpOzxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAobW9kID09IDMpIHs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2VuX29wX21vdl9yZWdfdihzLCBvdCwgUl9FQVgsIG9s
ZHYpOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnZW5fb3BfbW92X3JlZ192
KHMsIG90LCBybSwgbmV3dik7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIFBlcmZvcm0gYW4gdW5jb25k
aXRpb25hbCBzdG9yZSBjeWNsZSBsaWtlIHBoeXNpY2FsIGNwdTs8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBtdXN0IGJlIGJlZm9yZSBjaGFuZ2luZyBhY2N1bXVsYXRv
ciB0byBlbnN1cmU8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZGVt
cG90ZW5jeSBpZiB0aGUgc3RvcmUgZmF1bHRzIGFuZCB0aGUgaW5zdHJ1Y3Rpb248YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpcyByZXN0YXJ0ZWQgKi88YnI+DQotwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2VuX29wX3N0X3Yocywgb3QsIG5ld3YsIHMtJmd0
O0EwKTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZ2VuX29wX21vdl9yZWdf
dihzLCBvdCwgUl9FQVgsIG9sZHYpOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdlbl9vcF9tb3ZfcmVnX3Yocywgb3QsIHJtLCBu
ZXd2KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
LyogUGVyZm9ybSB0aGUgbWVyZ2UgaW50byAlYWwgb3IgJWF4IGFzIHJlcXVpcmVkIGJ5IG90LiAq
Lzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCBnZW5fb3BfbW92X3JlZ192KHMsIG90LCBSX0VBWCwg
b2xkdik7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIC8qIFVuZG8gdGhlIGVudGlyZSBtb2RpZmlj
YXRpb24gdG8gJXJheCBpZiBjb21wYXJpc29uIGVxdWFsLiAqLzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCB0Y2dfZ2VuX21vdmNvbmRfdGwoVENHX0NPTkRfRVEsIGNwdV9yZWdzW1JfRUFYXSwgb2xk
diwgY21wdiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgdGVtcCwgY3B1X3JlZ3NbUl9FQVhdKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoHRj
Z19nZW5fbW92X3RsKGNwdV9jY19zcmMsIG9sZHYpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
dGNnX2dlbl9tb3ZfdGwocy0mZ3Q7Y2Nfc3JjVCwgY21wdik7PGJyPg0KwqAgwqAgwqAgwqAgwqAg
wqAgwqB0Y2dfZ2VuX3N1Yl90bChjcHVfY2NfZHN0LCBjbXB2LCBvbGR2KTs8YnI+DQpAQCAtNTM5
MSw2ICs1Mzg3LDcgQEAgc3RhdGljIHRhcmdldF91bG9uZyBkaXNhc19pbnNuKERpc2FzQ29udGV4
dCAqcywgQ1BVU3RhdGUgKmNwdSk8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoHRjZ190ZW1wX2Zy
ZWUob2xkdik7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqB0Y2dfdGVtcF9mcmVlKG5ld3YpOzxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgdGNnX3RlbXBfZnJlZShjbXB2KTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgdGNnX3RlbXBfZnJlZSh0ZW1wKTs8YnI+DQrCoCDCoCDCoCDCoCDCoH08YnI+
DQrCoCDCoCDCoCDCoCDCoGJyZWFrOzxicj4NCsKgIMKgIMKgY2FzZSAweDFjNzogLyogY21weGNo
ZzhiICovPGJyPg0KLS0gPGJyPg0KMi4zMC4yPGJyPg0KPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3Rl
PjwvZGl2PjxiciBjbGVhcj0iYWxsIj48ZGl2PklzIHRoaXMgcGF0Y2ggT0s/IG9yIEkgZm9yZ290
IHRvIGFkZCBhIHJldmlld2VkLWJ5IHRhZ3MgYnkgbXkgaGFuZD88L2Rpdj48ZGl2PlRoaXMgaXMg
bXkgZmlyc3QgdGltZSBwYXJ0aWNpcGF0aW5nIGluIHRoaXMgcHJvY2Vzcy48L2Rpdj48ZGl2PlBs
ZWFzZSBsZXQgbWUga25vdyBpZiBhbnl0aGluZyBpcyB3cm9uZy48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PlRoYW5rcyBhIGxvdC48L2Rpdj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfc2ln
bmF0dXJlIj48ZGl2IGRpcj0ibHRyIj48ZGl2PldlaSBMaTwvZGl2PjxkaXY+PGJyPjwvZGl2Pjwv
ZGl2PjwvZGl2PjwvZGl2Pg0K
--00000000000019a06105db5af512--

