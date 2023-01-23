Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CE677A51
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 12:46:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJvFs-0003W3-75; Mon, 23 Jan 2023 06:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJvFq-0003Vv-LH
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:44:50 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJvFp-0005gp-10
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:44:50 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id 3so12501457vsq.7
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 03:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A1uatPTETXUG7oX1WoM7Frud5++O+J/lLe8g/pz/Wms=;
 b=jASGKEZ9vwcAN/MrLNXpyZCxtk085QxtRfpKtaMdMy46tcAs7a13YD+ln6luTs1Phi
 wjAokRlYA/Y9BzCZdUJQ74Oa98CUG6wPXU/0W3uRwy/bY7sKJRoso3lHxVYVMB3J87M6
 ScbrLPnwKiQtdMGneJ2f9U9+ajn8ienNijKFDTkxzjt3RNzmhJvaRPDtK+kgdyMB7aY7
 6z2ZTdA9qMEC2m6HOiUQRydiCTdsJ8SqbxaZCKqq0NHdqwA1KEfa9/ft62BGpbNeo2vV
 TCWyIrylL5eja5E0qe9MrciD0Vefvmr8R9PeTJjmS7Tg7PzOIQ8N/cm7MT1HD7QHVIvU
 DF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A1uatPTETXUG7oX1WoM7Frud5++O+J/lLe8g/pz/Wms=;
 b=isQ4jh8BRSjF75SAdb3OtPaVebvH1fyDXOZxJSSfyB212hUjcSPmwYBW79Xg/VLJ9v
 8hQAhQbFymiLtz08h5NKUSElX9AcClLbEYLuPbJeTUBzPid1B7ApGEPQKykgZ1fW2QOr
 PI7w1zIg+nkLFR/7p2LCnJ6NW5+VEo7jalwqcMqt6LR5VqSwAAAb8cjTr9l5mhMC9pR4
 jBAtihhh/W6w6CRWb3xWRHnAd+hn4P1xP2FQ8Dv1FqIjJdU0+o66EYdr7lhJxuELd6PS
 H0sHaTWaT3j0mCpD7OZc8HTSqiDXGtLIdNngBpoCAIPH9a2glXxCCQyERgsqSGJoDeG1
 dzQA==
X-Gm-Message-State: AFqh2kqr2iL5QBa1Xf0WAThfb8h5Pg9eqtLuXm0dIlVl5djVXRFEVQJj
 UbpFRX0ZnNke7uyNlzyIrxcPvZHkKfBVTzTwB08=
X-Google-Smtp-Source: AMrXdXuYPc5RNQGrRlTmw16p0K9bUfNwZZQcV7TYqrSmY5eDz2inARljRWwFF6OnKF+6Ktu9O8MxLO2Lf5LbWM46vus=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr3154428vsl.10.1674474287841; Mon, 23
 Jan 2023 03:44:47 -0800 (PST)
MIME-Version: 1.0
References: <20230121023542.1726168-1-philipp.tomsich@vrull.eu>
 <20230121023542.1726168-2-philipp.tomsich@vrull.eu>
 <CAKmqyKOQbeLwDuMNKjV5Pfk52pxHLVEviKZ+7gmopgxFE9WKQQ@mail.gmail.com>
 <CAAeLtUBC-bBp2vbc4+8kZVtZP0TrkSgbTGRpJsO3==0Mgw0NZA@mail.gmail.com>
In-Reply-To: <CAAeLtUBC-bBp2vbc4+8kZVtZP0TrkSgbTGRpJsO3==0Mgw0NZA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 21:44:21 +1000
Message-ID: <CAKmqyKPA2ZsMc5s3XLOk6qcy7tY+rcoR79HVSqSJceDoexecLA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: redirect XVentanaCondOps to use the
 Zicond functions
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: qemu-devel@nongnu.org, Kito Cheng <kito.cheng@sifive.com>, 
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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

On Mon, Jan 23, 2023 at 11:37 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> On Mon, 23 Jan 2023 at 02:29, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Sat, Jan 21, 2023 at 12:36 PM Philipp Tomsich
> > <philipp.tomsich@vrull.eu> wrote:
> > >
> > > The Zicond standard extension implements the same instruction
> > > semantics as XVentanaCondOps, although using different mnemonics and
> > > opcodes.
> > >
> > > Point XVentanaCondOps to the (newly implemented) Zicond implementation
> > > to reduce the future maintenance burden.
> > >
> > > Also updating MAINTAINERS as trans_xventanacondops.c.inc will not see
> > > active maintenance from here forward.
> > >
> > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > > ---
> > >
> > > Changes in v2:
> > > - Calls into the gen_czero_{eqz,nez} helpers instead of calling
> > >   trans_czero_{eqz,nez} to bypass the require-check and ensure that
> > >   XVentanaCondOps can be enabled/disabled independently of Zicond.
> > >
> > >  MAINTAINERS                                    |  2 +-
> > >  .../insn_trans/trans_xventanacondops.c.inc     | 18 +++---------------
> > >  2 files changed, 4 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index ca914c42fa..293a9d1c8c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -305,7 +305,7 @@ F: target/riscv/insn_trans/trans_zicond.c.inc
> > >  RISC-V XVentanaCondOps extension
> > >  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > >  L: qemu-riscv@nongnu.org
> > > -S: Supported
> > > +S: Odd Fixes
> >
> > Should this extension be deprecated then?
>
> The extension is out in the wild (as the Ventana Veyron V1 core
> implements it), so we shouldn't deprecate it.
> However, this now is the thinnest possible layer of implementation
> (and will pick up any fixes/updates from Zicond).
>
> I felt that downgrading it to "Odd Fixes" was the right way to
> indicate this.  Let me know if you would like to handle it
> differently.

It probably makes sense to just leave it as supported then. It's up to
a vendor to support their extensions, so I feel that marking it as
"Off Fixes" is a little strange.

Alistair

>
> Philipp.

