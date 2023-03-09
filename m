Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A383B6B19C5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 04:07:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa6ax-0005BF-Fw; Wed, 08 Mar 2023 22:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pa6aq-00055G-JI
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 22:05:25 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1pa6ao-0006b0-Kx
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 22:05:24 -0500
Received: by mail-oi1-x235.google.com with SMTP id be16so703767oib.0
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 19:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1678331121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iwufO+Gqkkax9w1/aMb9Hym6Jn4yYY879YeHGUqMxfE=;
 b=E48oRBm0Sz11MM8+aMH02ElOFsGumzgKfDEJMlQYwDhCabUSRke3jpnY6Tstsy9rFK
 enAvBaWO3Rq54hQXkzMPuIW6A4wpItd0xgnaGoeKpibO8nGDmWZHBLu6W8aA5gMKjnpB
 9IIG1zj4PSwInNELY7rpyftwMfqb+5ar1V12DuBzEyldAsT1o3K4kWq8oDhZhWnGdTaZ
 FEQ2h5uH2ejCNXXZVL+jBXd2mmulnGW/vMRUbjsTBInUC5sjRl51smpzDosEp+bB4loA
 6MhzbDKhdkqLSCrmpK8aIqX3BCBS0ns6Woq6XnJZGA400UQi0cDunsAImP1wDmCRc/bm
 QA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678331121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwufO+Gqkkax9w1/aMb9Hym6Jn4yYY879YeHGUqMxfE=;
 b=4ZqWxJnrDo3AJZ2OVqgjC2Y+04zz/ivT0XRVlupryobNmXeZ9W4Wv57tnha/HBvagk
 0jScaBTpjrtT3BAaQgtRtQ62MBNA+2i8Ry9bo7zUPSSFLj8uBLD0SGM0LPHb7M2rXUwJ
 6NRENlQg+jZpVNJ0riMTb/pJHKL1hCm7fAmWmAK4ZhT9xN0Mt7d2Q+PAEHy9JTy/g0pm
 1Pi/yVWzv34j06d08A4l+60zWMJDwFbCT0SpzyuXFJqC5co8CGAWHmu0cZxbr2p0/WgQ
 3I55eJIRn19Lxr2xQqmSTRcpmGjI9nnHudjpBM9kM7CY3+W/SSWYp7uNc1ro6S3GY5yT
 ayjQ==
X-Gm-Message-State: AO0yUKWxqq9+kdK/UxU9BZzGGWOGnMT36hz5oXrbWkfy65ZeTkf+/IaF
 j+NSQCIReU9bok54cZC9SyZjCnsoCezwhDWUO+zu1A==
X-Google-Smtp-Source: AK7set/xSEa+DZpzeaTbJ9R8UMnIMUppK5gnijObLZYhrKVSUGV6IrRufgME1qGERcavtzIbJcsizpED1vLfy0DA3dY=
X-Received: by 2002:a05:6808:2098:b0:383:f981:b1e5 with SMTP id
 s24-20020a056808209800b00383f981b1e5mr11305178oiw.5.1678331121300; Wed, 08
 Mar 2023 19:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20230305094231.1616-1-jim.shu@sifive.com>
 <20230305094231.1616-2-jim.shu@sifive.com>
 <0b2407ee-a7dd-d651-763a-a73b3802dc8f@linux.alibaba.com>
In-Reply-To: <0b2407ee-a7dd-d651-763a-a73b3802dc8f@linux.alibaba.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Thu, 9 Mar 2023 11:05:10 +0800
Message-ID: <CALw707rM3w+yDWhizA122eH5L_OVjhnE2t2BVQy5edr23V6S-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Make the "virt" register writable by GDB
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=jim.shu@sifive.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 6, 2023 at 7:26=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibaba=
.com> wrote:
>
>
> On 2023/3/5 17:42, Jim Shu wrote:
> > This patch also enables debugger to set current privilege mode to
> > VU/VS-mode.
> >
> > Extend previous commit 81d2929c41d32af138f3562f5a7b309f6eac7ca7 to
> > support H-extension.
> >
> > Signed-off-by: Jim Shu <jim.shu@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >   target/riscv/gdbstub.c | 18 ++++++++++++++++--
> >   1 file changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> > index 1755fd9d51..a7f234beaf 100644
> > --- a/target/riscv/gdbstub.c
> > +++ b/target/riscv/gdbstub.c
> > @@ -203,15 +203,29 @@ static int riscv_gdb_get_virtual(CPURISCVState *c=
s, GByteArray *buf, int n)
> >
> >   static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf,=
 int n)
> >   {
> > +#ifdef CONFIG_USER_ONLY
> > +    if (n >=3D 0 && n <=3D 1) {
> > +        return sizeof(target_ulong);
> > +    }
> > +#else
> > +    bool virt;
> > +
> >       if (n =3D=3D 0) {
> > -#ifndef CONFIG_USER_ONLY
> >           cs->priv =3D ldtul_p(mem_buf) & 0x3;
> >           if (cs->priv =3D=3D PRV_H) {
> >               cs->priv =3D PRV_S;
> >           }
> > -#endif
> > +        return sizeof(target_ulong);
> We should return according to the misa_mxl_max. And this is a bug before
> your commit.

Hi Zhiwei,

After reading other gdbstub.c code, I think it is OK to use
'sizeof(target_ulong)' as virtual register length.
Its length is 32-bit in RV32 and is 64-bit in RV64/RV128. We don't
need to handle RV128 specially.
Virtual register length is same as CSR length and
'riscv_gdb_set_csr()' also use 'sizeof(target_ulong)'.

Jim Shu

> > +    } else if (n =3D=3D 1) {
> > +        virt =3D ldtul_p(mem_buf) & 0x1;
> > +        if ((cs->priv =3D=3D PRV_M) && (virt =3D=3D true)) {
> > +            /* M-mode only supports V=3D0. */
> > +            virt =3D false;
> > +        }
> > +        riscv_cpu_set_virt_enabled(cs, virt);
> >           return sizeof(target_ulong);
> Same error here. Otherwise,
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Zhiwei
>
> >       }
> > +#endif
> >       return 0;
> >   }
> >

