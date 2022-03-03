Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF84CBB02
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 11:07:19 +0100 (CET)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPiMh-0000Hr-1y
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 05:07:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPiIo-0006eY-Mi
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:03:18 -0500
Received: from [2a00:1450:4864:20::630] (port=40541
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPiIm-0007nc-71
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 05:03:18 -0500
Received: by mail-ej1-x630.google.com with SMTP id p15so9455010ejc.7
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 02:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oTeZPuAHC7yulRP8xx3Dc9EuH4SrD8JhzlYGZHqiPPM=;
 b=tbXOs6Vk/+lw9thyUyyBVz2DG6tWQpfTXmOyXhVKGrwhxqeQLTevHAOBnn9ims5wT+
 YLy1saYVOA/U8HqnCbhq8PWVMD3wbqCJTO9gkSMQt+VD6BcNV+oBofYsoVUyX10BCLH2
 KpsRvxqHoOs9joqM4Jmd3G//wNfFf0Nekhkt1DfDK22xZjHLXwxFBesFDbjMTO6vWXWI
 o3ZOI1Uk/r1nFMf5ez4ZZBMnkDvMMnmEQkLOtHg0KbKsJ1VQKvT53YyZ8/LSA7uc0mRL
 kVRXOSM5itTZ8DKiUJS5aFZgtxKpEp6Qe1mGa42Nmk39rZqNVf9sn4a8vOle9M391j6z
 Wa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oTeZPuAHC7yulRP8xx3Dc9EuH4SrD8JhzlYGZHqiPPM=;
 b=No2Sq8MvykLH5c/cNButv19EajyjHU6FbaM/BFa44pncl3OFiHb/HzFIO0FnyKuzAT
 Ua/D4uonTrigaLJwHhA1JcXrPk/wdD7Ts8fBdZzhUwikK7pW9xl3nqEBPXJUJD+61P+P
 pf2Wzy/ttZIy73b//sF9HEXG5ptwtCrjN1XsQOJMKPGTN/qNucEg2Ekqe/wCgzGouWf3
 R13eT+d4eJIr6moCAWUrtgXoyqeOrFegegptRsSvIk++8wXtaBKndLmeCukeU49Pa8LI
 lsB5Ma1cV+axU78McdgVWRQV6iUeP4AyvefgnM6F+W9MaEtMcipL6f/XkNP4ABrRn7bU
 e+rQ==
X-Gm-Message-State: AOAM530InAOT8D9KXJW4fhvVop28SoBj5v3hHX6WdtDaH7fLnFNsAe2j
 NTqfrErBZHXccellqELfpfa7n0XzgPVZiYBzH7CLog==
X-Google-Smtp-Source: ABdhPJxZHMuYdS1n2sdOgY/MgNakT+fS9+Jj33+XsbtVE7yYT83lCmI3/gEE8Y47aAe7QhNzyMcSXdpXdjNLYZsq/4Y=
X-Received: by 2002:a17:907:970e:b0:6da:9224:7fb3 with SMTP id
 jg14-20020a170907970e00b006da92247fb3mr1535318ejc.502.1646301794037; Thu, 03
 Mar 2022 02:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20220219002518.1936806-1-atishp@rivosinc.com>
 <20220219002518.1936806-2-atishp@rivosinc.com>
 <CAKmqyKNEy=Kwg3DXmF0C8f+rYGkf0dw2HKLftgf2ejRFROg6nA@mail.gmail.com>
In-Reply-To: <CAKmqyKNEy=Kwg3DXmF0C8f+rYGkf0dw2HKLftgf2ejRFROg6nA@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 3 Mar 2022 02:03:02 -0800
Message-ID: <CAHBxVyGd4GP-4Vig8An55ck4UVUiBwzMwkBGfAYTxC0G1HWsuQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/12] target/riscv: Fix PMU CSR predicate function
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=atishp@rivosinc.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 2, 2022 at 9:22 PM Alistair Francis <alistair23@gmail.com> wrot=
e:
>
> On Sat, Feb 19, 2022 at 10:34 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > From: Atish Patra <atish.patra@wdc.com>
> >
> > The predicate function calculates the counter index incorrectly for
> > hpmcounterx. Fix the counter index to reflect correct CSR number.
> >
> > Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fau=
lt")
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  target/riscv/csr.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index b16881615997..3799ee850087 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -94,8 +94,9 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
> >              }
> >              break;
> >          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNT=
ER3)) &&
> > -                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTE=
R3))) {
> > +            ctr_index =3D csrno - CSR_CYCLE;
> > +            if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > +                 get_field(env->mcounteren, 1 << ctr_index)) {
>
> This fails to build:
>
> ../target/riscv/csr.c: In function =E2=80=98ctr=E2=80=99:
> ../target/riscv/csr.c:99:13: error: =E2=80=98ctr_index=E2=80=99 undeclare=
d (first use
> in this function); did you mean =E2=80=98tlb_index=E2=80=99?
>   99 |             ctr_index =3D csrno - CSR_CYCLE;
>      |             ^~~~~~~~~
>      |             tlb_index
>

My bad. The ctr_index is defined in PATCH 2. I think I forgot to move
it when I split this one
from PATCH 2. I will send a v6 after addressing your comments on other
patches in this series.

> Alistair
>
> >                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >              }
> >              break;
> > @@ -121,8 +122,9 @@ static RISCVException ctr(CPURISCVState *env, int c=
srno)
> >                  }
> >                  break;
> >              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMC=
OUNTER3H)) &&
> > -                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCO=
UNTER3H))) {
> > +                ctr_index =3D csrno - CSR_CYCLEH;
> > +                if (!get_field(env->hcounteren, 1 << ctr_index) &&
> > +                     get_field(env->mcounteren, 1 << ctr_index)) {
> >                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> >                  }
> >                  break;
> > --
> > 2.30.2
> >
> >

