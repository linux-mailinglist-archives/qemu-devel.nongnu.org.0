Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E047494EC3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 14:18:31 +0100 (CET)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAXKe-0006JF-QR
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 08:18:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nAVaj-000352-AI
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:26:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nAVaX-0005kt-Vc
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642677940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3tYCn24oG4Zbgvycyqn5ZBdRmuWqpTEjWKJo8zKoOs=;
 b=DBsG/5SxkH1O0SKQmovYw132c5k1qWInX+/Rs8rt0nLDvHmot0KoX8S/T3u9O5Lw4Oitzs
 5QgvKWJaxtLBMb9KZKQLZ3oHz9P/EStWtcf0Hm0XrhKH9bQaO6E4LanvfO/aKm8s37ytq8
 4/jASMgsSXcE035EXhNhQ3BhAXxFIwE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-HlFC9fXvNKCOhdbOC7D0FA-1; Thu, 20 Jan 2022 06:25:39 -0500
X-MC-Unique: HlFC9fXvNKCOhdbOC7D0FA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v190-20020a1cacc7000000b0034657bb6a66so2637528wme.6
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 03:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=x3tYCn24oG4Zbgvycyqn5ZBdRmuWqpTEjWKJo8zKoOs=;
 b=ihoqCmuegSUfb45+HZjnfUYMJCLpeiPzpw3bQJDKxcXXmwfW4FZ2XWW9iezkmkb2xR
 BY5/hV6pcLX/6H7HtJ4t3WpG9btVvL5INCt6H50EkYcpUN6cBVCyFlOgAUduxWlRtsrQ
 75D6+R+6YJN/vjhxGw54dF5fjsjCVghp+22vk/cXX5ybCqOisHks/uUYPMNgr0OcjYFk
 VvUi9UtnpHvlmtSbLXQmK+yXQGjfCwTWsg2I5Cc9zY1+D+buVENaTHcHxvpYBhraBrxz
 CCG2FvG2aIT9v8Rrth5NZV9giBJ2ybKmvzWpDCWJWw17SWAwaGSC3w3VLlF4K0eFAwMM
 0ADw==
X-Gm-Message-State: AOAM533N5/UzCmIFlc58OvouWbn9rTm4u0oJqjrUHLhsyA0fpcgNCmug
 WwoeieTro+j3EcwqQrC69qpWfowH5Ie//fVF71yCm/Lh+wLUP/Ft1wo118KZLd08D9CW3gCC0a6
 WAthOVPML3mv/ViY=
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr8564173wms.134.1642677938094; 
 Thu, 20 Jan 2022 03:25:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx78FoFHAMGNiqVOzM9DSG0NcXiOUUhceITjrZltEwO4rLSwhZgR75WK2bj90RtIF91DMiDA==
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr8564144wms.134.1642677937797; 
 Thu, 20 Jan 2022 03:25:37 -0800 (PST)
Received: from redhat.com ([2.55.158.216])
 by smtp.gmail.com with ESMTPSA id ay21sm9216299wmb.0.2022.01.20.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 03:25:37 -0800 (PST)
Date: Thu, 20 Jan 2022 06:25:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Message-ID: <20220120055826-mutt-send-email-mst@kernel.org>
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <20220117034606-mutt-send-email-mst@kernel.org>
 <871r16br9n.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <871r16br9n.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 10:11:21AM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Jan 12, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> >> Hello,
> >> 
> >> This patchset adds vhost-user-gpio device's support in Qemu. The support for the
> >> same has already been added to virtio specification and Linux Kernel.
> >> 
> >> A Rust based backend is also in progress and is tested against this patchset:
> >> 
> >> https://github.com/rust-vmm/vhost-device/pull/76
> >
> >
> > I'm reluctant to add this with no tests in tree.
> > Want to write a minimal libhost-user based backend?
> 
> This is going to be a problem going forward as we have more out-of-tree
> backends written as a first preference. While the first couple of vhost
> devices have C implementations in contrib before we worked on the rust
> version I think we are getting to the point of skipping a first C
> version for future devices.

Not sure what to do then. Integrate using submodules somehow?


> However I notice we have qtest/vhost-user-test.c so would that be enough
> to ensure we can instantiate the device and a basic vhost-user
> initialisation sequence doesn't cause it to crap out. This obviously
> won't be exercising the virtq processing itself but does that really
> exercise any of QEMU's boilerplate anyway?

we do have tests e.g. for network based on vhost-user, yes.


> > We also need some maintainers to step up.
> 
> You mean more reviewers for the vhost and virtio sections of QEMU's
> maintainers?
> 
> >
> >
> >> --
> >> Viresh
> >> 
> >> Viresh Kumar (2):
> >>   hw/virtio: add boilerplate for vhost-user-gpio device
> >>   hw/virtio: add vhost-user-gpio-pci boilerplate
> >> 
> >>  hw/virtio/Kconfig                   |   5 +
> >>  hw/virtio/meson.build               |   2 +
> >>  hw/virtio/vhost-user-gpio-pci.c     |  69 ++++++
> >>  hw/virtio/vhost-user-gpio.c         | 343 ++++++++++++++++++++++++++++
> >>  include/hw/virtio/vhost-user-gpio.h |  35 +++
> >>  5 files changed, 454 insertions(+)
> >>  create mode 100644 hw/virtio/vhost-user-gpio-pci.c
> >>  create mode 100644 hw/virtio/vhost-user-gpio.c
> >>  create mode 100644 include/hw/virtio/vhost-user-gpio.h
> >> 
> >> -- 
> >> 2.31.1.272.g89b43f80a514
> 
> 
> -- 
> Alex Bennée


