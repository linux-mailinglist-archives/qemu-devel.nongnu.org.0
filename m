Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043793BA001
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 13:47:45 +0200 (CEST)
Received: from localhost ([::1]:50238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzHe4-0003As-H9
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 07:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzHcw-00027x-G2
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 07:46:35 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzHcu-0002J9-4s
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 07:46:34 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bu12so15772618ejb.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AxpYy7JVmBwbKTgtQRPtMPMkmVQwfDOZD1FkgXICRiA=;
 b=Uy5Q/JgrzSssEYlWs1O3oBbpBF5VsScUPiwuZbzrkYFxrdyYr2gVhWICV7qrUNqOqs
 UyEJfkXHlQUqyIZYBq+ZeHj1ANtYdRY404MdAB/mxdaZGo7TJ0MZSKhRDt5UJpZAccRL
 tVTnk8c9KykHriuVTB1ocP1PA9I+Th0g27JPPG/JVgJr6I0ynU69Ih9FSCpEystBsZiV
 E9ngy0JmezTpO2eJXQd1yrD7qQSpJViopRyYk5osoqIr5p73JaVMLbMFojdNjtZMYV7U
 tZjAvgCRlQ5VEX1MX2Mb9mpqAuP8e4/zFoxGHPvMym962nMnESVGCgfd/ErE3yGQvZM5
 gvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AxpYy7JVmBwbKTgtQRPtMPMkmVQwfDOZD1FkgXICRiA=;
 b=jh8R5H9N0iHlieqVV0w0gCsPD7u/ZrDezeonHn4PGIZBg9LGoRElseswnjrl0B2mG3
 C6O2Dxyen2fU1IilouIW915D/H17rb4yKRMWtE5s/NQVFgmpteIX6yAHRZ/P7KwKgyBp
 Wj/3WSB8cUy3GBJD9gNVCoTBOzJeRDPX1knjyQYXwwE2LQsnU0tuXEXhOa48em/EQyyb
 7iqwQPdR3BZu57iTkiqAKZd5eUX1TuAZY7gl+hHAlRjIa/sHeAlVMI3yHMhHhmZF0wEV
 uQqRIQ/x9usUuiNX8iY+jGq74SxDX4UUOQWSlYLlqmeEm1o0T3fJnWeDYneZvXxaQCjh
 RSJg==
X-Gm-Message-State: AOAM531Th0CHQsvnAJpiSxJv86YVFW8fCrq4mpp9luOrfh7HRGhcuIuW
 wtRC0cv6k7Yfn2l/7TQlY9N6dmO3URhGleS53lxh1A==
X-Google-Smtp-Source: ABdhPJzLX68dL8n897b9YSawCEtGqOT+nUGXEruKVe7Crd/+KGYnbSs7NHDp5Qap59NnHvY9fKUVLFYTRcZDJKCkc9Q=
X-Received: by 2002:a17:907:7d91:: with SMTP id
 oz17mr4989633ejc.250.1625226388837; 
 Fri, 02 Jul 2021 04:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
 <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
In-Reply-To: <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jul 2021 12:45:51 +0100
Message-ID: <CAFEAcA9n-3-0V4==-j5-vBFsMHtHmXtkctxsyYEVWi-obipRBw@mail.gmail.com>
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Jul 2021 at 12:02, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Peter,
>
> On 7/2/21 12:40 PM, Peter Maydell wrote:
> > Currently the pl061_read() and pl061_write() functions handle offsets
> > using a combination of three if() statements and a switch().  Clean
> > this up to use just a switch, using case ranges.
> >
> > This requires that instead of catching accesses to the luminary-only
> > registers on a stock PL061 via a check on s->rsvd_start we use
> > an "is this luminary?" check in the cases for each luminary-only
> > register.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/gpio/pl061.c | 106 ++++++++++++++++++++++++++++++++++++------------
> >  1 file changed, 81 insertions(+), 25 deletions(-)
> >
> > diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> > index a6ace88895d..0f5d12e6d5a 100644
> > --- a/hw/gpio/pl061.c
> > +++ b/hw/gpio/pl061.c
> > @@ -55,7 +55,6 @@ struct PL061State {
> >      qemu_irq irq;
> >      qemu_irq out[N_GPIOS];
> >      const unsigned char *id;
> > -    uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
> >  };
> >
> >  static const VMStateDescription vmstate_pl061 =3D {
> > @@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr of=
fset,
> >  {
> >      PL061State *s =3D (PL061State *)opaque;
> >
> > -    if (offset < 0x400) {
> > -        return s->data & (offset >> 2);
> > -    }
> > -    if (offset >=3D s->rsvd_start && offset <=3D 0xfcc) {
> > -        goto err_out;
> > -    }
> > -    if (offset >=3D 0xfd0 && offset < 0x1000) {
> > -        return s->id[(offset - 0xfd0) >> 2];
> > -    }
> >      switch (offset) {
> > +    case 0x0 ... 0x3fc: /* Data */
> > +        return s->data & (offset >> 2);
>
> Don't we need to set pl061_ops.impl.min/max_access_size =3D 4
> to keep the same logic?

I think the hardware intends to permit accesses of any width, but only
at 4-byte boundaries. There is a slight behaviour change here:
accesses to 0x3fd, 0x3fe, 0x3ff now fall into the default case (ie error)
rather than being treated like 0x3fc, and similarly accesses to 0xfdd,
0xfde, 0xfdf are errors rather than treated like 0xfdc. But I think
that it's probably more correct to consider those to be errors.

(We could explicitly check and goto err_out if (offset & 3)
right at the top, I suppose.)

-- PMM

