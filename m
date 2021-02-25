Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B933248AA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:53:30 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5qL-0004Sj-Ag
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF5pL-00042N-Ta
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:52:27 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lF5pK-0003Ln-8H
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:52:27 -0500
Received: by mail-ed1-x52f.google.com with SMTP id p1so403957edy.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dGiiq1qTA8h7U4ksveba+s3Z2W3HyPoZ51+8t/LGa6k=;
 b=AiZocE9+2KmDjXFF1Otxg1ESyS8qMdcP3ccaR6kbasOh2o+a3It/yOWBaGRRdoO/xR
 ogXC6jHXb80ZN4JsJjydJeTIoOMXTp1UpM5xM59RjYREeDUbThOKbgDx63i9BaQrX5h5
 lSJU3tcSP3rc4BP2WOUivjh1O6On6XAIW0b5tvrSVrRWfFx1KlwMfSWu20oEGkUHFYqZ
 3yLo+LTpDIk4BwkvZdbcLusWvJ3jM/be0kx7Ys+KL6qmi1fUtOwGYzd0+1UnDhJC9G3o
 sehZD3o8AHj6L9f4HIa3j6i/vjEva1JcEBpVQ40NUGZLzF2ehrpE1kXzTZ/kEk6cAk3e
 ZSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dGiiq1qTA8h7U4ksveba+s3Z2W3HyPoZ51+8t/LGa6k=;
 b=BnkoAeVfrC17i6VvGgvBXxHZXxEShrP4oW5iD/y603PnP/an3hmU33yXSkZ5iGxfM9
 rLkL9o3ZhewwZWhSAEimt0P2AtLiZsWnJJLtEpbjZ89+O9Yb5gIf6IkvbctE/sgqdGNr
 4phxG8e3R93+RrKflunPaBDvkAHlTlxxM65tj8d1NJWIRf+tIHXFowHzrSm9pn9JCKxG
 JCK+rNbVRC8TBRYo0wXucqXY6DS7CC6ufQFikyj8b+yeenbZa+rQtsLBjSPsy6NaQb5u
 tygQ7ED+pveZoaZ1WuCmeCRvesNtNTmrXqmvRBaOsq/gfYlrXZIIYXnva7Wo4BpNaVk7
 48Cg==
X-Gm-Message-State: AOAM530lBu6jqMmMClT8aClWWJWLiI687282BBK4vbIHqfbHAfABY+fl
 uS7YmXFww9rGUjLiOALw3bfM0Fk1poFrRzO5nCA=
X-Google-Smtp-Source: ABdhPJwXsXozY2MjY+nQylemcT8qXc8qQfaT+5U0yTvgiHcDlMSIOMfof4stMgqCSfEnmzp/Bfq+WphWjCM1nPDycD4=
X-Received: by 2002:a50:8a90:: with SMTP id j16mr641510edj.334.1614217944282; 
 Wed, 24 Feb 2021 17:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org>
 <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
 <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
In-Reply-To: <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 25 Feb 2021 10:52:13 +0900
Message-ID: <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x52f.google.com
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

2021=E5=B9=B42=E6=9C=8824=E6=97=A5(=E6=B0=B4) 20:17 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Tue, Feb 23, 2021 at 01:50:51PM +0900, Akihiko Odaki wrote:
> > 2021=E5=B9=B42=E6=9C=8822=E6=97=A5(=E6=9C=88) 19:57 Gerd Hoffmann <krax=
el@redhat.com>:
> > >
> > > On Sun, Feb 21, 2021 at 10:34:14PM +0900, Akihiko Odaki wrote:
> > > > This change introduces an additional member, refresh_rate to
> > > > qemu_edid_info in include/hw/display/edid.h.
> > > >
> > > > This change also isolates the graphics update interval from the
> > > > display update interval. The guest will update the frame buffer
> > > > in the graphics update interval, but displays can be updated in a
> > > > dynamic interval, for example to save update costs aggresively
> > > > (vnc) or to respond to user-generated events (sdl).
> > > > It stabilizes the graphics update interval and prevents the guest
> > > > from being confused.
> > >
> > > Hmm.  What problem you are trying to solve here?
> > >
> > > The update throttle being visible by the guest was done intentionally=
,
> > > so the guest can throttle the display updates too in case nobody is
> > > watching those display updated anyway.
> >
> > Indeed, we are throttling the update for vnc to avoid some worthless
> > work. But typically a guest cannot respond to update interval changes
> > so often because real display devices the guest is designed for does
> > not change the update interval in that way.
>
> What is the problem you are seeing?
>
> Some guest software raising timeout errors when they see only
> one vblank irq every 3 seconds?  If so: which software is this?
> Any chance we can fix this on the guest side?
>
> > That is why we have to
> > tell the guest a stable update interval even if it results in wasted
> > frames.
>
> Because of the wasted frames I'd like this to be an option you can
> enable when needed.  For the majority of use cases this seems to be
> no problem ...

I see blinks with GNOME on Wayland on Ubuntu 20.04 and virtio-gpu with
the EDID change included in this patch. The only devices inspecting
the variable, xenfb and modified virtio-gpu, do not yield vblank irq,
but they report the refresh rate to the guest, and the guest
proactively requests them to switch the surface.

I suspect Linux's kernel mode setting causes blinks and other guests
have similar problems.

>
> Also: the EDID changes should go to a separate patch.

That makes sense. I'll isolate it to a seperate patch in a series.

Regards,
Akihiko Odaki

>
> take care,
>   Gerd
>

