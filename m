Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F346E76F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 12:18:01 +0100 (CET)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvHR2-0001bx-5X
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 06:18:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mvHP4-0000Jm-Tc
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 06:15:59 -0500
Received: from [2a00:1450:4864:20::42a] (port=33571
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mvHP2-00038O-2j
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 06:15:57 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d24so9173090wra.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 03:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kSWjj4fbygcyQ8W64cAyevjzMWH+yYeO8yKkBmu5cMU=;
 b=1iuvydrXE6lnr9jxVvIlEtPT4p2F/pmnmMTJZj1o0h+jCCtawIBYfr2XabXDRGOe6R
 YAiwW/iCpOcIizyW515kt9UjwNw+VKyogqPCzhbdTO5uZ1TILWT88oLaoJ4XoJzVsPdL
 199UVhsIReeegVW0UIEFL0+D9EzBFQ3jskvLdH0E8Ux4C8fbSHFjn0bmPJgGFVboYQ33
 NNs9VveGkQMnCPH3rVihkVJ1w0furBFkXLzrw9dl5V48iczgMMbwII0ynMY4hr4afnQQ
 UWIBFyAjnyDTndlnqaa6KRlDZs6wRvDwK/ryXtNkiLCJPOlVYI5UhSk9rbx9UvAFvjQd
 BVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kSWjj4fbygcyQ8W64cAyevjzMWH+yYeO8yKkBmu5cMU=;
 b=YnDhRy9c4rBSJJnvXp7T8Sb5f8WsZVQtXOxZN8Sc+fS7e0K6wJUiixrQbQFH+ujNct
 0MkfdgL5VYbJkVQJtqJpehxDkYfykwxKqL1jPhvddlzHrol9BvJCxt3BlR3gQcE/CAik
 vjbemXW6f5ITOvN4QtN77sBX1vWmw7Qmm076gLB/DTL/wGbXscp9xeuPEKWbvPPaUZfY
 EL27sbvnuvEBObS+lj7ZFvmPwxKFBS37bSNRRyPerI5Xj205PcE47I6eeugPMsIu9S9+
 8snxwDuPwJWWrcrFRHkpe3MqaXe3HRywkpivMUXTGplmUgGdzXy4+ay41vvEy+8Vs2/D
 Cz/g==
X-Gm-Message-State: AOAM530QIJWifapH0gIoueAwXBiSjiQlRiXzXmEmejVLvkFWFzKj0y47
 Bd7CXRvN4xQBBswKHsLUDf1NrU680JH5EWhgKy5I3A==
X-Google-Smtp-Source: ABdhPJw4f/54DfNT94PGZJELuxO5gx2tMIUJUz5m7E7qIXDzE5baf3OTRLqAtlk/oqxvAfHJDQ+gVwQyOHjmLCSWTFE=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr5396006wru.89.1639048551142; 
 Thu, 09 Dec 2021 03:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-15-anup.patel@wdc.com>
 <CAKmqyKOkNwpufjn-DuLRUnY1+Epn=krWOEyvjAH69LbhD+9DNg@mail.gmail.com>
In-Reply-To: <CAKmqyKOkNwpufjn-DuLRUnY1+Epn=krWOEyvjAH69LbhD+9DNg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Dec 2021 16:45:39 +0530
Message-ID: <CAAhSdy1dqA=Zvr+MAZX_FQ8v2=ob+tPAeF9fhvf0ho3aSOYvZA@mail.gmail.com>
Subject: Re: [PATCH v4 14/22] target/riscv: Implement AIA xiselect and xireg
 CSRs
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42a;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 4, 2021 at 10:26 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Oct 26, 2021 at 6:08 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The AIA specification defines [m|s|vs]iselect and [m|s|vs]ireg CSRs
> > which allow indirect access to interrupt priority arrays and per-HART
> > IMSIC registers. This patch implements AIA xiselect and xireg CSRs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/cpu.h     |   7 ++
> >  target/riscv/csr.c     | 174 +++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/machine.c |   3 +
> >  3 files changed, 184 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 21d9c536ef..bf688eb1ea 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -183,6 +183,10 @@ struct CPURISCVState {
> >      uint8_t miprio[64];
> >      uint8_t siprio[64];
> >
> > +    /* AIA CSRs */
> > +    target_ulong miselect;
> > +    target_ulong siselect;
> > +
> >      /* Hypervisor CSRs */
> >      target_ulong hstatus;
> >      target_ulong hedeleg;
> > @@ -212,6 +216,9 @@ struct CPURISCVState {
> >      target_ulong vstval;
> >      target_ulong vsatp;
> >
> > +    /* AIA VS-mode CSRs */
> > +    target_ulong vsiselect;
> > +
> >      target_ulong mtval2;
> >      target_ulong mtinst;
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 69e857d1e5..e72220fd0f 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -854,6 +854,168 @@ static int read_mtopi(CPURISCVState *env, int csrno, target_ulong *val)
> >      return RISCV_EXCP_NONE;
> >  }
> >
> > +static int aia_xlate_vs_csrno(CPURISCVState *env, int csrno)
> > +{
> > +    if (!riscv_cpu_virt_enabled(env)) {
> > +        return csrno;
> > +    }
> > +
> > +    switch (csrno) {
> > +    case CSR_SISELECT:
> > +        return CSR_VSISELECT;
> > +    case CSR_SIREG:
> > +        return CSR_VSIREG;
> > +    default:
> > +        return csrno;
> > +    };
> > +}
> > +
> > +static int rmw_xiselect(CPURISCVState *env, int csrno, target_ulong *val,
> > +                        target_ulong new_val, target_ulong wr_mask)
> > +{
> > +    target_ulong *iselect;
> > +
> > +    /* Translate CSR number for VS-mode */
> > +    csrno = aia_xlate_vs_csrno(env, csrno);
> > +
> > +    /* Find the iselect CSR based on CSR number */
> > +    switch (csrno) {
> > +    case CSR_MISELECT:
> > +        iselect = &env->miselect;
> > +        break;
> > +    case CSR_SISELECT:
> > +        iselect = &env->siselect;
> > +        break;
> > +    case CSR_VSISELECT:
> > +        iselect = &env->vsiselect;
> > +        break;
> > +    default:
> > +         return RISCV_EXCP_ILLEGAL_INST;
> > +    };
> > +
> > +    if (val) {
> > +        *val = *iselect;
> > +    }
> > +
> > +    wr_mask &= ISELECT_MASK;
> > +    if (wr_mask) {
> > +        *iselect = (*iselect & ~wr_mask) | (new_val & wr_mask);
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int rmw_iprio(target_ulong iselect, uint8_t *iprio,
> > +                     target_ulong *val, target_ulong new_val,
> > +                     target_ulong wr_mask, int ext_irq_no)
> > +{
> > +    int i, firq, nirqs;
> > +    target_ulong old_val;
> > +
> > +    if (iselect < ISELECT_IPRIO0 || ISELECT_IPRIO15 < iselect) {
> > +        return -EINVAL;
> > +    }
> > +#if TARGET_LONG_BITS == 64
> > +    if (iselect & 0x1) {
> > +        return -EINVAL;
> > +    }
> > +#endif
> > +
> > +    nirqs = 4 * (TARGET_LONG_BITS / 32);
> > +    firq = ((iselect - ISELECT_IPRIO0) / (TARGET_LONG_BITS / 32)) * (nirqs);
>
> Don't use TARGET_LONG_BITS, this should be checked at runtime instead

Okay, I will update this.

Regards,
Anup

>
> Alistair

