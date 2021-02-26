Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2829C325CB0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:49:12 +0100 (CET)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFV3u-0001r8-Kt
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:49:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFV2l-0001OD-02
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 23:47:59 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFV2i-0007jJ-HE
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 23:47:58 -0500
Received: by mail-ej1-x62c.google.com with SMTP id hs11so12620197ejc.1
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 20:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eSegB5Tn100fjF6cMx01sLj7QAzt6mWuluXvHTB2+fo=;
 b=NdrDvZLAm+S+WbPm1+SkWGTWzukLJOHiAt/bPonkTB36VLmZRFCeyvW9oYX0NCxm3K
 Yk6LsUGmgndTGDv+ViVAjvcfIhn7yLqrD5yFYiUBkR5W6m08QKnXpb6lEL/1R+OgBFKT
 +Ui8rmv13ofNMtpZnlkBFFfTKe51pzhx6yC31AfisA5y6Ed6ynD6qYDVcHsI/MxSN7M3
 lZQIYQSIRmCbc9FnyiRNjmoS7wEfpxjzRQzujI6msHfDgqIAvfNWs9tjGR1e8Bq25W9o
 no8lfdwja4+nvU999f0DrSo/ErrUrOsohXkfwL6fbU1OfKyd03ySNqqXLeLlqf3Zqz7e
 VvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eSegB5Tn100fjF6cMx01sLj7QAzt6mWuluXvHTB2+fo=;
 b=lP8aBT07ryOrGFB/MmkhgnctUpNrzJ6KrE7lK0pyE6sBmKZu/b9D6Wv5s80uX1obdC
 9jVxpqDUq0QohcxDzxU5+2xjoj2vi333rFr/fCbzNIhVo9QQVcCSSocecFWdOfxvDCF2
 BbpRQaMnq3/oDFpFklizRFjWDszsGq+B3tXt7zkRd2QysmIWk5UxEfkj4yHvx8BczUTv
 UO96LbUVh23dAy3Gi6CpWl7P2F7vZef+kk+70ph9zlYkGfZgHwyIhllnkc01Xq1+68Iy
 T3uGO0T/sFSl+Y+Ep6vxFEm7Adorg1488KJT3PUloLM8KgKt4DWaWf6PZXpnQUy+8QWS
 cLAg==
X-Gm-Message-State: AOAM532J2CYSDIgEEuy7A4GiP0/pZuL+cyIIeQeqQLRly/sXG0x5rx9n
 0VZOl5wXs2qFiYyIuoXLgcC7gg919EdvS6JxBhU=
X-Google-Smtp-Source: ABdhPJyVniYDvxXKn4lUYlhspOSbMbOOaPMZpGpQWzR0w7eap/HgCB4YP5247R22V8cQ2QJbAVjw+VDjDrVN9B4OBvM=
X-Received: by 2002:a17:907:778d:: with SMTP id
 ky13mr397591ejc.291.1614314873688; 
 Thu, 25 Feb 2021 20:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
 <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
 <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
 <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
 <20210225114626.dn7wevr3fozp5rcu@sirius.home.kraxel.org>
In-Reply-To: <20210225114626.dn7wevr3fozp5rcu@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 26 Feb 2021 13:47:38 +0900
Message-ID: <CAMVc7JX-E_3fE9SCOaYFAtDBRHNmHxmHWiqcJDPE-4zq-QHJbQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8825=E6=97=A5(=E6=9C=A8) 20:46 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
>   Hi,
>
> > > Because of the wasted frames I'd like this to be an option you can
> > > enable when needed.  For the majority of use cases this seems to be
> > > no problem ...
> >
> > I see blinks with GNOME on Wayland on Ubuntu 20.04 and virtio-gpu with
> > the EDID change included in this patch.
>
> /me looks closely at the patch again.
>
> So you update the edid dynamically, each time the refresh rate changes.
> Problem with that approach is software doesn't expect edid to change
> dynamically because on physical hardware it is static information about
> the connected monitor.
>
> So what the virtio-gpu guest driver does is emulate a monitor hotplug
> event to notify userspace.  If you resize the qemu window on the host
> it'll look like the monitor with the old window size was unplugged and
> a new monitor with the new window size got plugged instead, so gnome
> shell goes adapt the display resolution to the new virtual monitor size.
>
> The blink you are seeing probably comes from gnome-shell processing the
> monitor hotplug event.
>
> We could try to skip generating a monitor hotplug event in case only the
> refresh rate did change.  That would fix the blink, but it would also
> have the effect that nobody will notice the update.
>
> Bottom line:  I think making the edid refresh rate configurable might be
> useful, but changing it dynamically most likely isn't.
>
> take care,
>   Gerd
>

The "hotplug" implementation is probably what other combinations of
devices and guests will do if they want to respond to the changes of
the refresh rate, or display mode in general. That makes telling the
dynamic refresh rate to guests infeasible.

As you wrote, making the refresh rate configurable should be still
useful, and I think matching it to the backend physical display is
even better. GTK, the sole implementer of gfx_update_interval in my
patch reports the refresh rate of the physical display the window
resides in. It means the value may change when the physical display
changes its refresh rate, which should be rare if it does, or the
window moves to another physical display.

In the former case, there is nothing different from implementing a
physical display driver for guests so there should be no problem. The
latter case is similar to how the changes of the window size, which is
also part of display mode, is delivered to guests and they should be
consistent. The only inconsistency I see in my patch is that the
refresh rate change has no throttling while the window size change
has. I don't think it is problematic because it should be rare to move
the window across physical displays, but I can implement one if you
don't agree or know other cases the refresh rate frequently changes.

Regards,
Akihiko Odaki

