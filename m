Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D0589F76
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:37:25 +0200 (CEST)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdqe-0004Ok-V5
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oJdl6-0008Cy-TN
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:31:40 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:35461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1oJdl4-0000xv-Ur
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:31:40 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-32269d60830so1128957b3.2
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=ROlgdSLkDotA5DBsafTvcYdX0fFiTqU3tYD7fl8eeQQ=;
 b=4/DbC+b4wqTCMyMJG64aTTBhY5352c426lK+LHngZHG/F9lWoSGWsIf7YnBjyDA3lO
 m/gwK1jeoqrPCzFUJTdhglvdG1YBdrpyYUdxr+xoA3WqssRC1nyQWjUdS2XwyyFjZvmM
 JzloleELcI/duC9HPoxUsIZTj+4WEiTEgnrwk86jcdEXJDB3quO79Z8z/vHrC7lFWgt7
 pjGeZzDqYeCKjkemPcW/rzqQ/UyOqegC1tW5+ZDDkDtkVK5cNpF+Tkx5m/83/gYc8ih3
 NErEunn76Z5Pu48akGXA7yOLxozkmsc+9j35Ox+x0m24zfErCvqLH16uREayyHTx8dTQ
 yynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=ROlgdSLkDotA5DBsafTvcYdX0fFiTqU3tYD7fl8eeQQ=;
 b=uM0pPYrUQp/HjyY9/FFxRMMptk9S81k05B01YocEi/+mY3ruR9t/TkQIKUDfhjeut5
 RIpewNTsBpp3vH8NpMgBSYarlZAFnTsdYrn8DD5/JMBx/wisNUfC99fhhPdlkNpvbLc+
 klauN7CkXL1Itirfc1TX74aeXfLT/H+ViuatYc6vf9ML5fsJhl4nrKv19HqVaZDzla4G
 2t2fCxKF9R+sPnpPDQ1vHny5O4q4YKWkqYFCIdkU3Zg7gj1KNXVQQJ7GeWrccquMvDio
 0g7JsbOzWw1PZ/J2ClaOsUNEWbziQnCDsskDLYQLNtEdCf4ykV2Ej91noMRXG3N4TJlx
 wuow==
X-Gm-Message-State: ACgBeo199GARljfkoXFqx20drN6Cn1fk8o3CFN5z/sPEnRq1lzW0pQ1V
 8GKry45B+XJrQOrtscwWoKyikqdYEf9Mb1W6AtOnSg==
X-Google-Smtp-Source: AA6agR7ajqpkaFPCj7cxxq1A0ZDJ+dLKwFAv671G7uOBGUsgJ9COsUXCCtiQDCIFfwgyLMJD1vfly9cNY7GSB9bRvns=
X-Received: by 2002:a81:b41:0:b0:31f:45cd:29a2 with SMTP id
 62-20020a810b41000000b0031f45cd29a2mr2445297ywl.154.1659630697399; Thu, 04
 Aug 2022 09:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
 <CAAhSdy0t+iNs8__nUytjuLAcX=FkVyT712+LJ9grmVRpi+cBdA@mail.gmail.com>
 <b6844eec-77db-1a6c-a518-7aa934d107d4@iscas.ac.cn>
In-Reply-To: <b6844eec-77db-1a6c-a518-7aa934d107d4@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Aug 2022 22:01:24 +0530
Message-ID: <CAAhSdy1L3jDfFea5Lum3MvQXrvYyzMpJjOGX2D3Aqb_vv2ZPow@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix priority of csr related check in
 riscv_csrrw_check
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn, 
 lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::112e;
 envelope-from=anup@brainfault.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 4, 2022 at 5:59 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/8/4 =E4=B8=8A=E5=8D=8811:38, Anup Patel =E5=86=99=E9=81=93=
:
> > On Wed, Aug 3, 2022 at 6:16 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >> Normally, riscv_csrrw_check is called when executing Zicsr instruction=
s.
> >> And we can only do access control for existed CSRs. So the priority of
> >> CSR related check, from highest to lowest, should be as follows:
> >> 1) check whether Zicsr is supported: raise RISCV_EXCP_ILLEGAL_INST if =
not
> >> 2) check whether csr is existed: raise RISCV_EXCP_ILLEGAL_INST if not
> >> 3) do access control: raise RISCV_EXCP_ILLEGAL_INST or RISCV_EXCP_VIRT=
_
> >> INSTRUCTION_FAULT if not allowed
> >>
> >> The predicates contain parts of function of both 2) and 3), So they ne=
ed
> >> to be placed in the middle of riscv_csrrw_check
> >>
> >> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >> ---
> >>   target/riscv/csr.c | 44 +++++++++++++++++++++++++-------------------
> >>   1 file changed, 25 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index 0fb042b2fd..d81f466c80 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -3270,6 +3270,30 @@ static inline RISCVException riscv_csrrw_check(=
CPURISCVState *env,
> >>       /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check =
fails */
> >>       int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
> >>       int csr_min_priv =3D csr_ops[csrno].min_priv_ver;
> >> +
> >> +    /* ensure the CSR extension is enabled. */
> >> +    if (!cpu->cfg.ext_icsr) {
> >> +        return RISCV_EXCP_ILLEGAL_INST;
> >> +    }
> >> +
> >> +    if (env->priv_ver < csr_min_priv) {
> >> +        return RISCV_EXCP_ILLEGAL_INST;
> > This line breaks nested virtualization because for nested virtualizatio=
n
> > to work, the guest hypervisor accessing h<xyz> and vs<xyz> CSRs from
> > VS-mode should result in a virtual instruction trap not illegal
> > instruction trap.
> >
> > Regards,
> > Anup
>
> Do you mean "if (env->priv_ver < csr_min_priv)" ?

I got confused with the csr_min_priv name. This variable holds
min priv spec verison and not the privilege level required for
the CSR.

No issues with the "if (env->priv_ver < csr_min_priv)" check.

Regards,
Anup

>
> If so, I think illegal instruction trap is better, since the csr is not
> implemented(or existed) when
>
> env->priv_ver < csr_min_priv and virtual instruction trap is only raised
> for implemented csr access.
>
> Regards,
>
> Weiwei Li
>
> >> +    }
> >> +
> >> +    /* check predicate */
> >> +    if (!csr_ops[csrno].predicate) {
> >> +        return RISCV_EXCP_ILLEGAL_INST;
> >> +    }
> >> +
> >> +    if (write_mask && read_only) {
> >> +        return RISCV_EXCP_ILLEGAL_INST;
> >> +    }
> >> +
> >> +    RISCVException ret =3D csr_ops[csrno].predicate(env, csrno);
> >> +    if (ret !=3D RISCV_EXCP_NONE) {
> >> +        return ret;
> >> +    }
> >> +
> >>   #if !defined(CONFIG_USER_ONLY)
> >>       int csr_priv, effective_priv =3D env->priv;
> >>
> >> @@ -3290,25 +3314,7 @@ static inline RISCVException riscv_csrrw_check(=
CPURISCVState *env,
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>   #endif
> >> -    if (write_mask && read_only) {
> >> -        return RISCV_EXCP_ILLEGAL_INST;
> >> -    }
> >> -
> >> -    /* ensure the CSR extension is enabled. */
> >> -    if (!cpu->cfg.ext_icsr) {
> >> -        return RISCV_EXCP_ILLEGAL_INST;
> >> -    }
> >> -
> >> -    /* check predicate */
> >> -    if (!csr_ops[csrno].predicate) {
> >> -        return RISCV_EXCP_ILLEGAL_INST;
> >> -    }
> >> -
> >> -    if (env->priv_ver < csr_min_priv) {
> >> -        return RISCV_EXCP_ILLEGAL_INST;
> >> -    }
> >> -
> >> -    return csr_ops[csrno].predicate(env, csrno);
> >> +    return RISCV_EXCP_NONE;
> >>   }
> >>
> >>   static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno=
,
> >> --
> >> 2.17.1
> >>
> >>
>

