Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F0C3BB4F1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 03:36:05 +0200 (CEST)
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0DWl-0002eY-GZ
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 21:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m0DVP-0001xF-6c
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 21:34:39 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:44670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m0DVM-0001wD-EK
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 21:34:38 -0400
Received: by mail-oi1-x232.google.com with SMTP id q23so19000702oiw.11
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 18:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z4wqJ1TIgLbfwUWeXkEGJ59Kr4TD9Mx6O1qPJgtBB/8=;
 b=Abyq+9nEir9BQVgRRxZsaVKC6THcoDaMkmZZdrq6nmrZ4fgCI85ej8zd3KubEyJkpH
 1T8Ufp+QBHzq0k7/g2aiNuJt7ZGkSUr8ig4xOV0zrV1Efhb8IQrjh+cv63+NZxRkvCcG
 rltNGy70/cTBGL7AK8/Yk3GOqgJ+NXY19G1uh5nxoA5FFvemyo82QpCMdCX+luvvQYvz
 eoKHAM0Vpe3J2e5Sj0XU5VffkQiY4x+JiYWWNeSJh+715O2AAYM+CtsHq1xqoZTBttTt
 B2KUqPiA8YVlDeX4VVwgyR5rbj6/tf7BL8KGw92WhtO+v5q+q9iDNGDeNGCJpJ29qXRz
 jGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z4wqJ1TIgLbfwUWeXkEGJ59Kr4TD9Mx6O1qPJgtBB/8=;
 b=EdTPgQckhKMl/oyiYL7HK4KUXDlT/WExhYP2XYU/N/OoQM5bPg/jsTNSehNOObXTu7
 ljhhoFbzlAfYGsu7bYN0Np+KhL0ipM6E1A1c/WX1IzKzPDm2e7AiUtSPBYEBjGMNqMB3
 JGqjCRR3+lebEEsMv3mBUmEsvFeGw28azpV1qr1qXv0Qmsk5obBjVibS/cgDdMU2wl7I
 GXvsfPwT90E7s/ykP22mYs1EzG4q2ZRFOtgOkQL78PjlyiD3qL27CYovUW5NqNF5d2fw
 1TYSzDtwfm/tWqqhOf4PoX5+urBJzM5dBOM5OWICxWtSZ5NMSIyJNalfBBcxL07lxuES
 VETQ==
X-Gm-Message-State: AOAM533yHEddPLTFwsR2I7eRx625F2iP0wnNVJ36xn4exCP3Jk8jDs2o
 D1RmhbMN5/dn/eiYC5PZpdZztfm6VL1/VOcs+fI=
X-Google-Smtp-Source: ABdhPJwYPRMAv/5CWatgntiCXxztH7qfzcJYa2llZhSGIQ9rroqUh6hzec4oQdkRtSRJABwHZaQ8H0kvS2HO4BRRSuE=
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr8462662oif.169.1625448874494; 
 Sun, 04 Jul 2021 18:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <1624764506-19841-1-git-send-email-cyruscyliu@gmail.com>
 <CAAKa2jmWU=M8V9Lsjrjs-AV=RP6wVNb7mWBAM+MkT9HTdrwtzA@mail.gmail.com>
 <CADBGO78TVLf4qaJDhTvkJ61vPdzmAT1BFrCpDurgPOdmFyP1Og@mail.gmail.com>
In-Reply-To: <CADBGO78TVLf4qaJDhTvkJ61vPdzmAT1BFrCpDurgPOdmFyP1Og@mail.gmail.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Mon, 5 Jul 2021 09:34:22 +0800
Message-ID: <CAAKa2jk9HS7cY1N6icRJJdZxBqhzcrxYPSCpdGVSm_OLwCcNbQ@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-dwc2: Enforce epnum to 0 for the control
 endpoint to avoid the assertion failure in usb_ep_get()
To: Paul Zimmerman <pauldzim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x232.google.com
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

Hi Paul,

On Mon, Jul 5, 2021 at 6:27 AM Paul Zimmerman <pauldzim@gmail.com> wrote:
>
> On Sat, Jun 26, 2021 at 10:21 PM Qiang Liu <cyruscyliu@gmail.com> wrote:
> >
> > Hi folks,
> >
> > I found this bug by my dwc2 fuzzer.
> > It seems that
> > * https://bugs.launchpad.net/qemu/+bug/1907042
> > * https://bugs.launchpad.net/qemu/+bug/1525123
> > or
> > * https://gitlab.com/qemu-project/qemu/-/issues/119
> > * https://gitlab.com/qemu-project/qemu/-/issues/303
> > have reported similar issues.
> >
> > Would it be better to consider and fix them together?
> >
> > Best,
> > Qiang
> >
> > On Sun, Jun 27, 2021 at 11:28 AM Qiang Liu <cyruscyliu@gmail.com> wrote:
> > >
> > > When eptype is USB_ENDPOINT_XFER_CONTROL and pid is
> > > TSIZ_SC_MC_PID_SETUP, usb_ep_get() should return the control endpoint.
> > > In hw/usb/core.c, the assumed epnum of the control endpoint is 0. When
> > > epnum is not 0, usb_ep_get() will crash due to the check assert(pid ==
> > > USB_TOKEN_IN || pid == USB_TOKEN_OUT).
> > >
> > > The description
> > > http://www.capital-micro.com/PDF/CME-M7_Family_User_Guide_EN.pdf
> > > (18.5.3.4 (14), 18.5.3.4 (10)) a) mentions that the pid is maintained by
> > > the host, b) but doesn't mention that whether the epnum should be 0 for
> > > the control endpoint. However, usb_ep_get() assumes it is 0. To avoid
> > > potential assertion failure in usb_ep_get(), we could enforce epnum to 0
> > > and warn users.
> > >
> > > Fixes: 153ef1662c3 ("dwc-hsotg (dwc2) USB host controller emulation")
> > > Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> > > ---
> > >  hw/usb/hcd-dwc2.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
> > > index e1d96ac..65d9d46 100644
> > > --- a/hw/usb/hcd-dwc2.c
> > > +++ b/hw/usb/hcd-dwc2.c
> > > @@ -636,6 +636,11 @@ static void dwc2_enable_chan(DWC2State *s,  uint32_t index)
> > >      }
> > >
> > >      if (eptype == USB_ENDPOINT_XFER_CONTROL && pid == TSIZ_SC_MC_PID_SETUP) {
> > > +        if (epnum != 0) {
> > > +            qemu_log_mask(LOG_GUEST_ERROR,
> > > +                          "epnum should be 0 for the control endpoint\n");
> > > +            epnum = 0;
> > > +        }
> > >          pid = USB_TOKEN_SETUP;
> > >      } else {
> > >          pid = epdir ? USB_TOKEN_IN : USB_TOKEN_OUT;
> > > --
> > > 2.7.4
> > >
>
> Hi Qiang,
>
> Sorry for the late reply, I've had a busy week.
> Yes, I think it would be best to fix this in the core since it affects more
> than one host.
My current fix is in the following.

diff --git a/hw/usb/core.c b/hw/usb/core.c
index 975f762..a29b378 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -735,10 +735,11 @@ void usb_ep_dump(USBDevice *dev)

 struct USBEndpoint *usb_ep_get(USBDevice *dev, int pid, int ep)
 {
     struct USBEndpoint *eps;

     assert(dev != NULL);
-    if (ep == 0) {
+    if (ep == 0 || pid == USB_TOKEN_SETUP) {
         return &dev->ep_ctl;
     }
     assert(pid == USB_TOKEN_IN || pid == USB_TOKEN_OUT);

>I'm not sure that forcing the Control endpoint to 0 is
> the best solution though, perhaps it would be better to print an error
> message and fail the operation? AFAIK there are no real-world devices
> that have Control endpoints other than 0, although I believe it is allowed
> by the USB spec.
I think, as a malicious guest, if the spec allows, it can set the
control endpoint to non-zero.

> Let's wait and see what Gerd thinks.
Yes!

Best,
Qiang

