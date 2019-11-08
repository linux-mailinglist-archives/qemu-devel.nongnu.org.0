Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B67F416F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 08:37:12 +0100 (CET)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSypS-0005lG-P8
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 02:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42569)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iSyoJ-0005MM-Ue
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 02:36:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iSyoI-0002IY-3G
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 02:35:59 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:43639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iSyoH-0002He-0G
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 02:35:58 -0500
Received: by mail-qk1-x736.google.com with SMTP id z23so4399236qkj.10
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 23:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6yiUt1MQOuFry119FxdUeAD8xPWm7rks6SBHzQkAB0A=;
 b=kDR7IkYjNx/mu4UGkogNa7GnejiRcP1RKwbr+68vtZos9u8d8gSCD1YvIx/f7g6tkb
 QQmIjr1lCfC3gjJW4ajzBiGGF8gdSluNMFeQ8H+PAQxgq6/9ebmgZ5/Fb+5Fd3fwBnYk
 DH8sUwYIVoDQcBud8fZvZK6aW74qz6YkY8UfOIjDgDxCnwjoYVlLef5t3fud7wafS0XV
 Dy6WugnYTSj+V5Oz4gmJejKL4ki+cRfzlrrwxeaku6lODQkRB558CivtvjuYsjJkRnJX
 y7js4NTrpOeDISrtiu0Olfmn6fApV2zU/KMz7z/d7tTlLyK7sy3r9D3YscwV3Z2t9oWx
 TDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6yiUt1MQOuFry119FxdUeAD8xPWm7rks6SBHzQkAB0A=;
 b=WIm1ZV60gKsayzJn0Cg4VL02L7YOewrTA++4EOrfgA4BQkoMEbkXfoWfNYecsZade1
 E6UFfoWeSCHD/mXi2p2/hXA1HjdBAp2CvucveCBpipeGGpI2LSPhE5pJFX2pQb7RlLG3
 4SVvnHAvO30e+8jiYXYaBoOwNo//JqKGWmWPF9tFgCY1yDT7Gqu2XPVmv3Ey31g611qL
 q8sHo6Xj4rLsr5q2xTY2QOFQJf8vZ7HjQTaHhG9JQxGutLXFt+FN1xe8dvUC35x9gFw+
 AFmL3obCd8COrX7C3QdGaPMONZw/CBWC8LOLCyc4MYTKS2xNxBlCapSADmvNUINjmyoC
 ipxw==
X-Gm-Message-State: APjAAAV4VQzzAMWxYxF9blAuA8FJPlJeRDIfCdRfHqXZFkkmhR5/ebpz
 1ZU3T1MTbSJ/QsSV6X2RX18Cv/SCQuBZd/Mw41E=
X-Google-Smtp-Source: APXvYqwXeWHDPNAEqvYe6uTrBCncL/H9iFRLbo4pyxR9xfAjjMucrF+DV1aJGvcaEeZAxB8f3i2P0sRu8Uuvy++V+7o=
X-Received: by 2002:a05:620a:14a2:: with SMTP id
 x2mr7566377qkj.236.1573198556068; 
 Thu, 07 Nov 2019 23:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20191105105456.7xbhtistnbp272lj@sirius.home.kraxel.org>
 <20191106084344.GB189998@stefanha-x1.localdomain>
 <20191106095122.jju7eo57scfoat6a@sirius.home.kraxel.org>
 <CAJSP0QUJBkqtVJq17tfX5O-JuvEGcZQviP0C3tv9qSDy-P-hcg@mail.gmail.com>
 <20191106125023.uhdhtqisybilxasr@sirius.home.kraxel.org>
 <CAJSP0QXG5Z3zCnPL+Y7EQfCeey2Fb9OdPdx531Jz2Ofk63wndg@mail.gmail.com>
 <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org>
In-Reply-To: <20191108072210.ywyneaoc2y4slth6@sirius.home.kraxel.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 8 Nov 2019 08:35:44 +0100
Message-ID: <CAJSP0QWZc=z56CHEKa8WVe9Cw2-EhDFU+7NeGgL+g-Go5q3K5Q@mail.gmail.com>
Subject: Re: guest / host buffer sharing ...
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::736
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
Cc: geoff@hostfission.com, virtio-dev@lists.oasis-open.org,
 Alex Lau <alexlau@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 qemu-devel <qemu-devel@nongnu.org>, Tomasz Figa <tfiga@chromium.org>,
 Keiichi Watanabe <keiichiw@chromium.org>,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Dylan Reid <dgreid@chromium.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Dmitry Morozov <dmitry.morozov@opensynergy.com>,
 Pawel Osciak <posciak@chromium.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 8, 2019 at 8:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > Adding a list of common properties to the spec certainly makes sense,
> > > so everybody uses the same names.  Adding struct-ed properties for
> > > common use cases might be useful too.
> >
> > Why not define VIRTIO devices for wayland and friends?
>
> There is an out-of-tree implementation of that, so yes, that surely is
> an option.
>
> Wayland needs (a) shared buffers, mostly for gfx data, and (b) a stream
> pipe as control channel.  Pretty much the same for X11, except that
> shared buffers are optional because the X protocol can also squeeze all
> display updates through the stream pipe.
>
> So, if you want allow guests talk to the host display server you can run
> the stream pipe over vsock.  But there is nothing for the shared
> buffers ...
>
> We could replicate vsock functionality elsewhere.  I think that happened
> in the out-of-tree virtio-wayland implementation.  There also was some
> discussion about adding streams to virtio-gpu, slightly pimped up so you
> can easily pass around virtio-gpu resource references for buffer
> sharing.  But given that getting vsock right isn't exactly trivial
> (consider all the fairness issues when multiplexing multiple streams
> over a virtqueue for example) I don't think this is a good plan.

I also think vsock isn't the right fit.

Defining a virtio-wayland device makes sense to me: you get the guest
RAM access via virtqueues, plus the VIRTIO infrastructure (device IDs,
configuration space, feature bits, and existing reusable
kernel/userspace/QEMU code).

Stefan

