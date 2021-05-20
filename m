Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C538B9D5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 00:57:58 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljrc5-000680-59
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 18:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ljraH-0004kq-Dj
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:56:05 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ljraD-00050w-EP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:56:04 -0400
Received: by mail-io1-xd35.google.com with SMTP id a11so18324051ioo.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 15:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1IZdUwKPPov4qB5UFJl4QYvczHYRMBpFpsAH8y8AuA=;
 b=omOY7RxQeZTevYpTDiD/Bq1oWZjJJqy7yR/OV4aB14SGpAIaLhhjqKBfYWnBlT1kMc
 ojFpDxhJUHP5I0VT6GfyOqVuG6vpIzYCWpR1v4b3fq6VBbNWu2g3dF/fDlP7GV07cbmE
 SMueI7eQvK7D74QSCAS+/DeyoQOBkpnVUDjeZ7dgcXTGUW99Ed5fyOCCQ6B3QI6r0grf
 AIINALGzDJqPgHM7/cAj4eHsS57POrSBYE9a5HDt9wxj54kOg+jIPZMDts4sWf7DlZz+
 WqIawzX4kQoGN818TLV9UDVO3dd50grvroBu/6JQ4JihPpCvOp5zCW6+xhS0OT0iwcnp
 IguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1IZdUwKPPov4qB5UFJl4QYvczHYRMBpFpsAH8y8AuA=;
 b=ZCFnqPcM3xLMH/fhysdFVLRnE8u7zN+FwTMuDLOJbTMajSiLTrxpY9Lt8hOyoD+tL+
 JLrlPFL5yccE7t5nv0DC4ByxHjXJI2aEBeSPUDyJLL3tnWcdZXoSKsBt4rI2sYtXPAYi
 MKdllgInUiUquRiJXPEMFaDKwKYg7c4C8ni8tEFU+cgfzIpkPx4Bk5HiDtk9mfbyQymm
 EIAgew8gmDMp+LzLmzldnIWce8EMZJmPE/d02Mche3tUOD1AyMgj0fMpbtlZpsBhhr9X
 MPygfkPfv9Kt726mIi+TB+weyf4HSFeCB5/GzBZ6N3xgLqZjambkhd74QgaD5QE1p3u0
 VDRw==
X-Gm-Message-State: AOAM5302lmDn0ZrmpJK57DaPFlvJ/N6kKSnlB72t1WO975zLp8xmsJkN
 k/jZ1l7EGIceohNxXoglBiy5SDDuSlDyamu7yrA=
X-Google-Smtp-Source: ABdhPJxaKR7wmuVewCtRQMpSHAYfPMYmzeHtSs4ukfOmBwJ9S5zh5dk1tpvQtVuVFbEGROuYaBzoDXgmeHkKXx1ZFsY=
X-Received: by 2002:a6b:d609:: with SMTP id w9mr7857621ioa.118.1621551360331; 
 Thu, 20 May 2021 15:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210511101951.165287-1-alistair.francis@wdc.com>
 <20210511101951.165287-37-alistair.francis@wdc.com>
 <CAFEAcA-ZPxvdTE13cjxy7o7mcD7DT7p8nRPbueF_S9QO0F3_FA@mail.gmail.com>
In-Reply-To: <CAFEAcA-ZPxvdTE13cjxy7o7mcD7DT7p8nRPbueF_S9QO0F3_FA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 May 2021 08:55:34 +1000
Message-ID: <CAKmqyKNfZy4SryA91u65mxvsumTKb+dyX2whaCEpkAxr7rq9gQ@mail.gmail.com>
Subject: Re: [PULL v3 36/42] target/riscv: Remove the hardcoded MSTATUS_SD
 macro
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 20, 2021 at 11:55 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 11 May 2021 at 11:22, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Message-id: fcc125d96da941b56c817c9dd6068dc36478fc53.1619234854.git.alistair.francis@wdc.com
> > ---
> >  target/riscv/cpu_bits.h  | 10 ----------
> >  target/riscv/csr.c       | 12 ++++++++++--
> >  target/riscv/translate.c | 19 +++++++++++++++++--
> >  3 files changed, 27 insertions(+), 14 deletions(-)
>
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 26eccc5eb1..a596f80f20 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -78,6 +78,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
> >      return ctx->misa & ext;
> >  }
> >
> > +#ifdef TARGET_RISCV32
> > +# define is_32bit(ctx)  true
> > +#elif defined(CONFIG_USER_ONLY)
> > +# define is_32bit(ctx)  false
> > +#else
> > +static inline bool is_32bit(DisasContext *ctx)
> > +{
> > +    return (ctx->misa & RV32) == RV32;
> > +}
> > +#endif
>
> Hi; Coverity points out (CID 1453107) that this is_32bit() function
> can never return true for at least some build configs, because RV32
> is defined as ((target_ulong)1 << (TARGET_LONG_BITS - 2))
> but ctx->misa is a uint32_t field, which (if TARGET_LONG_BITS is
> 64) is not big enough for the RV32 bit.

This seems like a false positive as RV32 is defined as:

((target_ulong)1 << (TARGET_LONG_BITS - 2))

while ctx->misa is a target_ulong.

So it should always be able to return true.

Alistair

>
> Bug, or false positive ?
>
> thanks
> -- PMM

