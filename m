Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8846773D7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 02:38:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJlm7-000719-EA; Sun, 22 Jan 2023 20:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pJlm5-00070v-Je
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 20:37:29 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pJlm3-0002qz-Nb
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 20:37:29 -0500
Received: by mail-ed1-x535.google.com with SMTP id v30so12890291edb.9
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 17:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dqY28piJnpOPhZdoXXPwSShDYmDrmrN8Ihx9LyeY+bk=;
 b=hfIq5YZTfakhGkEEm1Ambk2DL1+kAh+bZ1Pzw4e+5tyc2VGztupqabJvFCqbv/Vpd5
 Fec+ab4ERn0dCzRKPYgAoAZT6vCzDOPCAYOiYw3nzyO/k0ThAb4/rPq+ZBguR6LSnNgP
 398Bwc4drrzBqOasRQjOE3IVwYA5TTAISEPwBT3xuVInGXCUdzGYICIJqcaaPABuf9d5
 3arWcaT6QkVq+Ffigp4uNoMN25FC2pIGjRP4K519BAjB8JEU0JkuO3Gb+Uklr4bgKdbK
 fRANUIruL5mZZukECeKKA/aih9AlCBI1QWnqqFnlYyBAmVHGgQbsU9++y6Sd6P5rvCIX
 eOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dqY28piJnpOPhZdoXXPwSShDYmDrmrN8Ihx9LyeY+bk=;
 b=yhjT2+B/yd+7LhMT7IiEWnSeMUQSQbEGKMmzrAEsx82f9t0oU0aawAD5Oo1p5jubVm
 orkvMpkSEDgaUbRDB8LzXJUrEsLCLUdZj4S/WKGQ7YHzvLk3GtsE9C0AtsoIABJd30YR
 EsUAoN7w5LZgV5O7Ir8UzlPbHvGqiD1Avlj7f8+cLklqq3zvtWI3YYcxlhS8xBsHG/h3
 5jaZBhmezBHX51i2BR4qX1ZPTkhiS8bKx2e3Mu/uZlP3NaXFz/ceQXj8XP809eBSMyy/
 ZN5uNFY51SUXaletwSahh1d8vIl/Ol9nolMrzZeGeTiEyLLnovBwl3HIhX52m3Ji0DUc
 xhqQ==
X-Gm-Message-State: AFqh2kqNkOgCsJYYAAx5JyOo0V4rv7mpyeQS47yst85pxml4aJ7RzsIu
 RK29GduoECLyIfl/WGUekp4vg2RKOmL09rT07ZY7OQ==
X-Google-Smtp-Source: AMrXdXtsRPcbCia3lDjFvw/AuNYykXUns2RvgZ3ExROKzaaAZpvQIronC8YDen/hZzEsMROjik6LDuTmuQPZbn6/vWI=
X-Received: by 2002:a05:6402:3ce:b0:461:15f0:a574 with SMTP id
 t14-20020a05640203ce00b0046115f0a574mr2426456edw.187.1674437846165; Sun, 22
 Jan 2023 17:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
 <20230121023542.1726168-2-philipp.tomsich@vrull.eu>
 <CAKmqyKOQbeLwDuMNKjV5Pfk52pxHLVEviKZ+7gmopgxFE9WKQQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOQbeLwDuMNKjV5Pfk52pxHLVEviKZ+7gmopgxFE9WKQQ@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 23 Jan 2023 02:37:15 +0100
Message-ID: <CAAeLtUBC-bBp2vbc4+8kZVtZP0TrkSgbTGRpJsO3==0Mgw0NZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, Kito Cheng <kito.cheng@sifive.com>, 
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x535.google.com
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

On Mon, 23 Jan 2023 at 02:29, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Jan 21, 2023 at 12:36 PM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > The Zicond standard extension implements the same instruction
> > semantics as XVentanaCondOps, although using different mnemonics and
> > opcodes.
> >
> > Point XVentanaCondOps to the (newly implemented) Zicond implementation
> > to reduce the future maintenance burden.
> >
> > Also updating MAINTAINERS as trans_xventanacondops.c.inc will not see
> > active maintenance from here forward.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > ---
> >
> > Changes in v2:
> > - Calls into the gen_czero_{eqz,nez} helpers instead of calling
> >   trans_czero_{eqz,nez} to bypass the require-check and ensure that
> >   XVentanaCondOps can be enabled/disabled independently of Zicond.
> >
> >  MAINTAINERS                                    |  2 +-
> >  .../insn_trans/trans_xventanacondops.c.inc     | 18 +++---------------
> >  2 files changed, 4 insertions(+), 16 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ca914c42fa..293a9d1c8c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -305,7 +305,7 @@ F: target/riscv/insn_trans/trans_zicond.c.inc
> >  RISC-V XVentanaCondOps extension
> >  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> >  L: qemu-riscv@nongnu.org
> > -S: Supported
> > +S: Odd Fixes
>
> Should this extension be deprecated then?

The extension is out in the wild (as the Ventana Veyron V1 core
implements it), so we shouldn't deprecate it.
However, this now is the thinnest possible layer of implementation
(and will pick up any fixes/updates from Zicond).

I felt that downgrading it to "Odd Fixes" was the right way to
indicate this.  Let me know if you would like to handle it
differently.

Philipp.

