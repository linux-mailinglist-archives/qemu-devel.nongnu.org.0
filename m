Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E733D56645E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 09:51:12 +0200 (CEST)
Received: from localhost ([::1]:59466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8dKx-0000Ct-KM
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 03:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o8dHW-0007DG-4O
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:47:38 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:35507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o8dHT-00054X-Py
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 03:47:37 -0400
Received: by mail-pg1-x534.google.com with SMTP id r22so3805462pgr.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 00:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JUCMsGHTZBhitSfrTfUhpn+iBcIV3Nv/IoJU+L3bG9E=;
 b=ys+XPLk7ch5OhNUhKQpmMHspC172kc5R60/e0Z4Os4BXZ4ZA0xv3kNKiAz2jMra9Eg
 3BcVO2ha2xXhr4eulpWNO4iK2IfxLbWl076toMwMhnNi/23proeC41AfatpBKbJEqgMV
 c0eCVEX21aZtXsIRsWJBRn/LEbybDZvRCmDaYrXVMo102U/G++gwlDXfWK5m+4aYkfZ1
 Wmb+O0mNbSFnqmTKkHm+aBqyXiGexlbxBrrNLlblaAeV4sV2knAG7P0B4GPYY2nkfAqu
 q4w7K+YsJMkIqdIKRSNMbBpO0XtbTL2/xZTo8RGYBXTRtBzm/RnutkdCh7I5BXo5QkEm
 cxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JUCMsGHTZBhitSfrTfUhpn+iBcIV3Nv/IoJU+L3bG9E=;
 b=g/7lF7PrIJl4F2qlpehuDgAJNE8yZqDTtwv1BpMt1E6IJrIU3izKDmVwwYm1q1f2Er
 nA+v3FhVGaX+wmei2h7EwzCU60hKPVqLysIyk4AcqZRHsw60qBuld+aICKtiBcrYkJ1y
 pvw3ecKGXQ3Xu1kZGTqz2Em8SXbwb9fCDIoU13KFecMnQeVWifq2/QxT81/LfB+3bitc
 5m1lzSgLTX7e7F0e2dO2MQEHk+wBlHJ2PJpqbjkgq9UTXWfl1M8z2edrbWzTvwmkZgZv
 /wVH7Qam35n7M7112VyPRUPTAFeB41dK1lmx31yvreyLOFXOVUxYGDPuq085mYL/zGUR
 hNVg==
X-Gm-Message-State: AJIora+toKMdoNi+6eaV+CuaS7eWcx5oKv6FeovBQlw0MEib2qh4E79p
 0PoetBGiYCgeB4l4GbHhlSDc/x8To81dST3Ys53/xA==
X-Google-Smtp-Source: AGRyM1u2QzUUeSq5S4UO6hWVxcNI6dXn/J7oIlh8GvuxA2LYt4qaHqWW4JUpmPyV184Cj8aPiR4fNrE2IIhjBe+KURs=
X-Received: by 2002:a63:287:0:b0:412:2f6e:7fc with SMTP id
 129-20020a630287000000b004122f6e07fcmr9462666pgc.185.1657007254244; 
 Tue, 05 Jul 2022 00:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-6-atishp@rivosinc.com>
 <51d95cb9-8607-3667-98ff-e60157c56f70@iscas.ac.cn>
In-Reply-To: <51d95cb9-8607-3667-98ff-e60157c56f70@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 5 Jul 2022 00:47:23 -0700
Message-ID: <CAHBxVyEgTRThnFUzT6xp6yGsBnORp_q0ek1WN8EzPeN0Qg00ZA@mail.gmail.com>
Subject: Re: [PATCH v10 05/12] target/riscv: Implement mcountinhibit CSR
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jul 4, 2022 at 8:31 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/6/21 =E4=B8=8A=E5=8D=887:15, Atish Patra =E5=86=99=E9=81=
=93:
> > From: Atish Patra <atish.patra@wdc.com>
> >
> > As per the privilege specification v1.11, mcountinhibit allows to start=
/stop
> > a pmu counter selectively.
> >
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/cpu.h      |  2 ++
> >   target/riscv/cpu_bits.h |  4 ++++
> >   target/riscv/csr.c      | 25 +++++++++++++++++++++++++
> >   target/riscv/machine.c  |  1 +
> >   4 files changed, 32 insertions(+)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index ffee54ea5c27..0a916db9f614 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -275,6 +275,8 @@ struct CPUArchState {
> >       target_ulong scounteren;
> >       target_ulong mcounteren;
> >
> > +    target_ulong mcountinhibit;
> > +
> >       target_ulong sscratch;
> >       target_ulong mscratch;
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 4d04b20d064e..b3f7fa713000 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -367,6 +367,10 @@
> >   #define CSR_MHPMCOUNTER29   0xb1d
> >   #define CSR_MHPMCOUNTER30   0xb1e
> >   #define CSR_MHPMCOUNTER31   0xb1f
> > +
> > +/* Machine counter-inhibit register */
> > +#define CSR_MCOUNTINHIBIT   0x320
> > +
> >   #define CSR_MHPMEVENT3      0x323
> >   #define CSR_MHPMEVENT4      0x324
> >   #define CSR_MHPMEVENT5      0x325
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index b4a8e15f498f..94d39a4ce1c5 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -1475,6 +1475,28 @@ static RISCVException write_mtvec(CPURISCVState =
*env, int csrno,
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > +static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno=
,
> > +                                         target_ulong *val)
> > +{
> > +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
>
> This seems can be done by add  .min_priv_ver=3DPRIV_VERSION_1_11_0 in
> csr_ops table.
>

Yes. This can be dropped from both read/write_mcountihibit with min_priv_ve=
r.
Thanks.

> Regards,
>
> Weiwei Li
>
> > +    *val =3D env->mcountinhibit;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_mcountinhibit(CPURISCVState *env, int csrn=
o,
> > +                                          target_ulong val)
> > +{
> > +    if (env->priv_ver < PRIV_VERSION_1_11_0) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    env->mcountinhibit =3D val;
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   static RISCVException read_mcounteren(CPURISCVState *env, int csrno,
> >                                         target_ulong *val)
> >   {
> > @@ -3745,6 +3767,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
> >       [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  mctr,   read_zero },
> >       [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  mctr,   read_zero },
> >
> > +    [CSR_MCOUNTINHIBIT]  =3D { "mcountinhibit",   any,    read_mcounti=
nhibit,
> > +                                                       write_mcountinh=
ibit },
> > +
> >       [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any,    read_zero },
> >       [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any,    read_zero },
> >       [CSR_MHPMEVENT5]     =3D { "mhpmevent5",     any,    read_zero },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 2a437b29a1ce..87cd55bfd3a7 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -330,6 +330,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >           VMSTATE_UINTTL(env.siselect, RISCVCPU),
> >           VMSTATE_UINTTL(env.scounteren, RISCVCPU),
> >           VMSTATE_UINTTL(env.mcounteren, RISCVCPU),
> > +        VMSTATE_UINTTL(env.mcountinhibit, RISCVCPU),
> >           VMSTATE_UINTTL(env.sscratch, RISCVCPU),
> >           VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >           VMSTATE_UINT64(env.mfromhost, RISCVCPU),
>

