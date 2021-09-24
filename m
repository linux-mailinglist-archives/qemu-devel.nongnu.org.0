Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A6417B40
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 20:47:24 +0200 (CEST)
Received: from localhost ([::1]:33428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqEF-0001IY-Bx
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 14:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mTqB2-0007QM-5a
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:44:04 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mTqAz-0002JL-Fp
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:44:03 -0400
Received: by mail-ed1-x531.google.com with SMTP id eg28so39828225edb.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 11:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+tFmkGz9wd2B/JiKAsbFeSjzrAKs4XAFmONGYZc7HHk=;
 b=WK71u0a+6GUNLBP488v3g/k4lN9qKs+sinOy4225jmbeM0O73qe46rxIIfSwb3jL8v
 dYIiRYAoainoILBLN80T6aU0xGuL8q42E0nRkj7rQTBkOIHokT8MvZWG3JmZzpRSt+Hn
 UmNWyUOemWq+O8zIRCm8NP15oUqDd7T8CquUYUhO+vP9f94d97YLMSCREWOGiPYAn/Jx
 YxRsi7rWp//xmLOaKjxT6yi60iY17M39ydhROxPXjAdb7NDU2YjWhStN/eIxvcJK/V91
 HGbNGt8f1HdLdlw0d4l0Ts0+8rqe2NmnftEdzJAxIslk9uQCpmLkm2s02OPr+Fi8TIcO
 5TCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+tFmkGz9wd2B/JiKAsbFeSjzrAKs4XAFmONGYZc7HHk=;
 b=gi6SxK09t1oE7gKb9Lu96wBLt2kL0ux+tNI9t8lhfQ8OgvnQ2+sJnpAH4qL5XRg8hz
 az3xJkeLb+bUefl3eUFpzN3qkvokirBq4gFusXV+aeMKMFd9K0k1uRV2ZQSJd32pIiHQ
 ldfr4W4QSyYa/ZHAKKCL2j2zGwZMtFyAMmoFu/Lu6jDowm7bkpMnT5kYJXYcxASbAZWZ
 WKofToGNvq8Lf4wbQhBDHY7NCAnybCa+pZrjvtSpWegyVEwfoNA2+djcAujh0SzG7KmJ
 VGUG8OGz3E1HuGUYt3jRkhFpVghe5ObFVBLvT2DRfD8UT6ic7nEDWNkZ6u013h9u/0RR
 fSNw==
X-Gm-Message-State: AOAM531YwN9jwWvd6tzaOzILTILAiNkYNm01fI0f4SfUGYJK3BXyKAaP
 E4ZnDtfL8g5Ur1woOPqIdI8y0JAbArLf7Jx7WWMa0w==
X-Google-Smtp-Source: ABdhPJypZg9iGqBsE26maRXONTqv8ZrwD+qdMrqhBkJ5nSNKRwtL4xjVqrdQjkGCf+kTyN+6vlqRyZCV8/HHCgXb9pc=
X-Received: by 2002:a17:906:1e0c:: with SMTP id
 g12mr13365997ejj.155.1632509039067; 
 Fri, 24 Sep 2021 11:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAMvPwGr-FuQWHTQYxppAyT9uPhzCUDcezgz+jV=GwHGoQF4N6A@mail.gmail.com>
 <1a0d6240-6654-0cf7-01ce-ef3ebf497a5c@amsat.org>
 <942903da-c16f-23dd-155d-61af84962935@kaod.org>
In-Reply-To: <942903da-c16f-23dd-155d-61af84962935@kaod.org>
From: Titus Rwantare <titusr@google.com>
Date: Fri, 24 Sep 2021 11:43:22 -0700
Message-ID: <CAMvPwGpWftHwxJBbRUzHmsuguspUPBXgU+ROZqRJ2ypa4z6ETg@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Add an iBT device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "andrew@aj.id.au" <andrew@aj.id.au>, qemu-arm@nongnu.org, 
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>, 
 Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=titusr@google.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 03:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Titus,
>
> On 9/24/21 10:42, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/24/21 01:48, Titus Rwantare wrote:
> >> Hello all,
> >>
> >> I'd like some clarification on how the following code transfers irqs
> >> back and forth:
> >>> b/hw/arm/aspeed_soc.c
> >>> +    /* iBT */
> >>> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
> >>> +        return;
> >>> +    }
> >>> +    memory_region_add_subregion(&s->lpc.iomem,
> >>> +                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DE=
V_LPC],
> >>> +                   &s->ibt.iomem);
> >>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,
>
>
> The iBT device IRQ is connected to a subdevice irq of the LPC device.
> See aspeed_lpc_realize(). And triggered in aspeed_lpc_set_irq()

Yes, that side makes sense. I tried to get at that irq from
aspeed_ibt.c as follows:

qemu_irq_lower(ibt->lpc->subdevice_irqs[aspeed_lpc_ibt]); // or raise

static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
{
AspeedIBTState *ibt =3D ASPEED_IBT(dev);
SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
IPMIInterface *ii =3D IPMI_INTERFACE(dev);
ibt->lpc =3D ASPEED_LPC(dev);
...

but this doesn't work and maybe I'm misusing the dynamic cast?

> >>> +                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_=
ibt));
> >>> }
> >>
> >> and
> >>
> >>> hw/misc/aspeed_ibt.c
> >>> +static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
> >>> +{
> >>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> >>> +    AspeedIBTState *ibt =3D ASPEED_IBT(dev);
> >> ...
> >>> +
> >>> +    sysbus_init_irq(sbd, &ibt->irq);
> >>
> >> I ask because the code in aspeed_soc.c seems to connect to the
> >> lpc->subdevice_irqs[aspeed_lpc_ibt], initialised on
> >> hw/misc/aspeed_lpc.c:408.
> >> I noticed that bmc firmware running in qemu was checking the BT_CTRL
> >> register less frequently than I'd like while editing this patch to use
> >> the IPMIInterface.
>
> OK.
>
> This might be a problem in aspeed_ibt_update_irq(). This patch is
> an experiment from some few years ago. It still works good enough
> for the witherspoon-bmc and powernv9 machines for simple IPMI
> commands: fru, sdr, lan, power off (to be checked).
>
> Could you share your BMC and host command line ?
>

Host:
-chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,reconnect=3D10 \
-device ipmi-bmc-extern,chardev=3Dipmichr1,id=3Dbmc0 \
-device isa-ipmi-bt,bmc=3Dbmc0,irq=3D10 -nodefaults

BMC:
-chardev socket,id=3Dipmichr1,host=3Dlocalhost,port=3D9999,server=3Don,wait=
=3Doff \
-device ipmi-host-extern,chardev=3Dipmichr1,responder=3D/machine/soc/ibt

But for this to work you need Hao's patch as well: [PATCH 7/8]
hw/ipmi: Add an IPMI external host device.

