Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F99390BCC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 23:49:15 +0200 (CEST)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llevK-0001FI-0H
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 17:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lletu-0000Y3-BW
 for qemu-devel@nongnu.org; Tue, 25 May 2021 17:47:46 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:39833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lletn-0003Vv-2V
 for qemu-devel@nongnu.org; Tue, 25 May 2021 17:47:46 -0400
Received: by mail-il1-x12f.google.com with SMTP id o9so29567448ilh.6
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 14:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NAE+Osa6qF9lrh/7zfYue5s1szqW0ywWFSG7n+8N3NU=;
 b=sydibvOtT+HTB4IZQ4W2xfMCYO07WXDPNrM1R28hy8uEAxdrfDVHKlI3tAUDKXWdU+
 F1XoBSshpp47DLF7i4lk2LbWhG18lTLmmEKNYne9wZLTxK5v32kxdW0JuoMKYf1Mb3sp
 NvTIdUWcwKPABjwdqwsp9X3bNFkDy7omj5m3b1I7zBPpRpwDsgdP2GbflyVmvsIXrzqc
 AWuZsmEbZDYB4zSHHltY8VNHKH+O2AFJOfCfAj6SowbRAhvCROrhFNfSBVsvDgDzqrIS
 4k3Mcyial/t5ZY6oUQLYfzD4uzflBTNt8HlvB9p3zc29q3WqfRGxmN0NJigu7lpXubid
 lvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NAE+Osa6qF9lrh/7zfYue5s1szqW0ywWFSG7n+8N3NU=;
 b=WQ6ZpCjgtNdl7N8bg8PgL4Sj6jarWLvAx4VpGCCMeBso97LWQclJ1HCswYP4OuUL9+
 Y5v2HB8xovHVW6jNm18KZi0795kQdSkRycpjY9te4/uYbPZbC8OIPsGm4/Zj6aQHhPEr
 kUzwPi5mtqa3YcgPoocN7sPViPbcqbWfb2o2T+ej1f9jPhdGLUS/RQsJuCWew/qkICgO
 fTfn7Ytutq6JCJDQ4L52CGtFOiYphKv6XU0nxZTNpsMkbm92ykavwuBtWjCxr3gonRP8
 ptg01XjH1WA77rLM/YBKls25jDOWMm1HgoZgB7RgueS4Kzr9PWy9qIaqahjwNbBR35JM
 pGwg==
X-Gm-Message-State: AOAM530TBmQPpjv1FhNyDhoaOA/XNOLwwfw8p7ckHlXN2dCDf2CFSxUd
 qSSYepcLAfcVvqUUUqA20jm1+/QCFp1gTAVtj9o=
X-Google-Smtp-Source: ABdhPJwOhGBs1RDQmR+6xSZjQjtJ5SKWPzmpE4VRi7WIsiNFSC+Zl28XG4wYO688Qk+Me6BbhCA750c19YRq/9LRcto=
X-Received: by 2002:a92:6b05:: with SMTP id g5mr22998172ilc.40.1621979256750; 
 Tue, 25 May 2021 14:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210511101951.165287-1-alistair.francis@wdc.com>
 <20210511101951.165287-37-alistair.francis@wdc.com>
 <CAFEAcA-ZPxvdTE13cjxy7o7mcD7DT7p8nRPbueF_S9QO0F3_FA@mail.gmail.com>
 <CAKmqyKNfZy4SryA91u65mxvsumTKb+dyX2whaCEpkAxr7rq9gQ@mail.gmail.com>
 <573b18ae-baa5-1d38-9d5c-b484d8a49748@c-sky.com>
In-Reply-To: <573b18ae-baa5-1d38-9d5c-b484d8a49748@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 May 2021 07:47:10 +1000
Message-ID: <CAKmqyKOOsD3v0wB6c7neVbGxEdHWXyGKsUL9MAM4gMvzE=RKSQ@mail.gmail.com>
Subject: Re: [PULL v3 36/42] target/riscv: Remove the hardcoded MSTATUS_SD
 macro
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 12:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
> On 5/21/21 6:55 AM, Alistair Francis wrote:
> > On Thu, May 20, 2021 at 11:55 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >> On Tue, 11 May 2021 at 11:22, Alistair Francis <alistair.francis@wdc.com> wrote:
> >>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>> Message-id: fcc125d96da941b56c817c9dd6068dc36478fc53.1619234854.git.alistair.francis@wdc.com
> >>> ---
> >>>   target/riscv/cpu_bits.h  | 10 ----------
> >>>   target/riscv/csr.c       | 12 ++++++++++--
> >>>   target/riscv/translate.c | 19 +++++++++++++++++--
> >>>   3 files changed, 27 insertions(+), 14 deletions(-)
> >>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> >>> index 26eccc5eb1..a596f80f20 100644
> >>> --- a/target/riscv/translate.c
> >>> +++ b/target/riscv/translate.c
> >>> @@ -78,6 +78,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> >>>       return ctx->misa & ext;
> >>>   }
> >>>
> >>> +#ifdef TARGET_RISCV32
> >>> +# define is_32bit(ctx)  true
> >>> +#elif defined(CONFIG_USER_ONLY)
> >>> +# define is_32bit(ctx)  false
> >>> +#else
> >>> +static inline bool is_32bit(DisasContext *ctx)
> >>> +{
> >>> +    return (ctx->misa & RV32) == RV32;
> >>> +}
> >>> +#endif
> >> Hi; Coverity points out (CID 1453107) that this is_32bit() function
> >> can never return true for at least some build configs, because RV32
> >> is defined as ((target_ulong)1 << (TARGET_LONG_BITS - 2))
> >> but ctx->misa is a uint32_t field, which (if TARGET_LONG_BITS is
> >> 64) is not big enough for the RV32 bit.
> > This seems like a false positive as RV32 is defined as:
> >
> > ((target_ulong)1 << (TARGET_LONG_BITS - 2))
> >
> > while ctx->misa is a target_ulong.
>
> Although the misa in RISCVCPUState is target_ulong, the misa in
> DisasContext is uint32_t.
>
> I think we should  fix up the misa in DisasContext.

Good catch, I'll send a patch.

Alistair

>
> Zhiwei
>
> >
> > So it should always be able to return true.
> >
> > Alistair
> >
> >> Bug, or false positive ?
> >>
> >> thanks
> >> -- PMM

