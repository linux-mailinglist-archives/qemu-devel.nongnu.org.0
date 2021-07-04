Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F4E3BAF5E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 00:28:55 +0200 (CEST)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Abd-0001ZN-M6
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 18:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1m0Aal-0000ty-IO
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 18:27:59 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:34571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pauldzim@gmail.com>)
 id 1m0Aaj-0001JV-Jz
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 18:27:59 -0400
Received: by mail-io1-xd2b.google.com with SMTP id g22so18885013iom.1
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 15:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dd2i9gXCnoo70dcuu2kqRaabVMri4gOFXwfhD900xAw=;
 b=cjIJvu11T1ekQV+FHcuMhj55MYlpFvpI8FgebgDAcMKMcCa0LcabVfCp801wjZwOiR
 o9HQLtU0HspyFKBpuWn1u79PpOd1CqMZDugCN4tolTdeWzjPuBIJg60MaAqVuF+ALKDG
 MYJeyUeNLsNPrLoadEfyzKyr9rxOgycEayaIMcr5BabAKmswJal/rOCgFgNw1En1/ocB
 Fg5j7N6pgpVaBoDxAbyC0PcHqhsW44t8ly1dTVzIs66iHX95FjeP3+XfX2mWX54cgnLW
 rrFFXBFTljnQQ2A49abCZuoiyrls6GXf9HJrrWc+DF57ivO12ABhYJphSz0X6m2g+wap
 5PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dd2i9gXCnoo70dcuu2kqRaabVMri4gOFXwfhD900xAw=;
 b=NBjzirAD+waSWd4wFrhpFuZ6EbA2svxHHql7EOxcibvxP1LT+Dc45jkUSah18fG9aO
 5QU8BAqNDYhfXwlujS7XaekRwpm62zPleW4U1juZZs+6waEZksMCnS8SJh4rzkqjVYTs
 vEU3SHKdHM37dHvnmi2adAPK87NhePq8bYBS9KH5DGOn5DHNJJ9UnO2ip+GYInlzCHRk
 UZcFpph6Q8g8iFGx4EKKO1aI3LWR3PpeYiRbnMlewRtFxWOy8J6Um3Xec9md8fd9Dxki
 ryBj45NSiumo2ARBuxxrXOA7+uSvpJBwGJFe8h9slOSUTil4eGBsTaYHqKOpZb+d7Fu8
 +YvQ==
X-Gm-Message-State: AOAM531rEHkfjj01j/JUDcze44s/koUnzRlurO1Zv26lo+QOdIuykT43
 83DSRiWYNgC2v0cA+ZkU7b7e7kHW2PwEGxwfXz8=
X-Google-Smtp-Source: ABdhPJxAS7UBcSNNDpUI9xOeZgHae6aGQsQHLP2rDfAnCnWJlpic5K/7uaRGMTCZLJ6cUuseiu4voqsXrBqfS8JDEKo=
X-Received: by 2002:a5d:88c4:: with SMTP id i4mr9468699iol.210.1625437675722; 
 Sun, 04 Jul 2021 15:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <1624764506-19841-1-git-send-email-cyruscyliu@gmail.com>
 <CAAKa2jmWU=M8V9Lsjrjs-AV=RP6wVNb7mWBAM+MkT9HTdrwtzA@mail.gmail.com>
In-Reply-To: <CAAKa2jmWU=M8V9Lsjrjs-AV=RP6wVNb7mWBAM+MkT9HTdrwtzA@mail.gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Sun, 4 Jul 2021 15:27:29 -0700
Message-ID: <CADBGO78TVLf4qaJDhTvkJ61vPdzmAT1BFrCpDurgPOdmFyP1Og@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-dwc2: Enforce epnum to 0 for the control
 endpoint to avoid the assertion failure in usb_ep_get()
To: Qiang Liu <cyruscyliu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=pauldzim@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 26, 2021 at 10:21 PM Qiang Liu <cyruscyliu@gmail.com> wrote:
>
> Hi folks,
>
> I found this bug by my dwc2 fuzzer.
> It seems that
> * https://bugs.launchpad.net/qemu/+bug/1907042
> * https://bugs.launchpad.net/qemu/+bug/1525123
> or
> * https://gitlab.com/qemu-project/qemu/-/issues/119
> * https://gitlab.com/qemu-project/qemu/-/issues/303
> have reported similar issues.
>
> Would it be better to consider and fix them together?
>
> Best,
> Qiang
>
> On Sun, Jun 27, 2021 at 11:28 AM Qiang Liu <cyruscyliu@gmail.com> wrote:
> >
> > When eptype is USB_ENDPOINT_XFER_CONTROL and pid is
> > TSIZ_SC_MC_PID_SETUP, usb_ep_get() should return the control endpoint.
> > In hw/usb/core.c, the assumed epnum of the control endpoint is 0. When
> > epnum is not 0, usb_ep_get() will crash due to the check assert(pid ==
> > USB_TOKEN_IN || pid == USB_TOKEN_OUT).
> >
> > The description
> > http://www.capital-micro.com/PDF/CME-M7_Family_User_Guide_EN.pdf
> > (18.5.3.4 (14), 18.5.3.4 (10)) a) mentions that the pid is maintained by
> > the host, b) but doesn't mention that whether the epnum should be 0 for
> > the control endpoint. However, usb_ep_get() assumes it is 0. To avoid
> > potential assertion failure in usb_ep_get(), we could enforce epnum to 0
> > and warn users.
> >
> > Fixes: 153ef1662c3 ("dwc-hsotg (dwc2) USB host controller emulation")
> > Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > ---
> >  hw/usb/hcd-dwc2.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> > index e1d96ac..65d9d46 100644
> > --- a/hw/usb/hcd-dwc2.c
> > +++ b/hw/usb/hcd-dwc2.c
> > @@ -636,6 +636,11 @@ static void dwc2_enable_chan(DWC2State *s,  uint32_t index)
> >      }
> >
> >      if (eptype == USB_ENDPOINT_XFER_CONTROL && pid == TSIZ_SC_MC_PID_SETUP) {
> > +        if (epnum != 0) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "epnum should be 0 for the control endpoint\n");
> > +            epnum = 0;
> > +        }
> >          pid = USB_TOKEN_SETUP;
> >      } else {
> >          pid = epdir ? USB_TOKEN_IN : USB_TOKEN_OUT;
> > --
> > 2.7.4
> >

Hi Qiang,

Sorry for the late reply, I've had a busy week.
Yes, I think it would be best to fix this in the core since it affects more
than one host. I'm not sure that forcing the Control endpoint to 0 is
the best solution though, perhaps it would be better to print an error
message and fail the operation? AFAIK there are no real-world devices
that have Control endpoints other than 0, although I believe it is allowed
by the USB spec.

Let's wait and see what Gerd thinks.

- Paul

