Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB148B115
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:41:34 +0100 (CET)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7JHB-0006Y0-D3
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:41:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7JEC-0004SN-4F
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n7JE6-0000tw-Qo
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:38:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641915502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qlpMn/e+kPnz5OCPPsGxU3XGJ0LiNIjrrdwLQrnQJsE=;
 b=gO0tkYtocr8AN5HElznchnxfQkqVzUNtVzHuC5DkoOzNm2mXbPdeU3vFKjOGVFIsUbovss
 rR+2QLrjOZjkJqUFKuZRyKLHmUF+auuycXutaZmq6OoYtIvLwm/jkwo2Kr4ODeLcyKf2kT
 xnuZAeZk4Dbn5m3wj7BDgrHx2asFZlY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-CQ4MVweYOTWt2UpSHc7yZA-1; Tue, 11 Jan 2022 10:38:18 -0500
X-MC-Unique: CQ4MVweYOTWt2UpSHc7yZA-1
Received: by mail-ed1-f70.google.com with SMTP id
 v18-20020a056402349200b003f8d3b7ee8dso13667566edc.23
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 07:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qlpMn/e+kPnz5OCPPsGxU3XGJ0LiNIjrrdwLQrnQJsE=;
 b=oNrzxpAkYVhQijldg4VCc0jvnhszpWR28pe65NX6y6ekMH6V0oKO9SxR0eVdAaWiGH
 OsxaIK1tbs3eR42DB0IZSWEfN6svuOtdGjreVOvnKbKEpGT43liBQnGdJ1p/a+jlH+yT
 k8s/79PsJxXmEZEQrbEuQigXZYOaPiCbBPm7uEg2TQY7DfH2LqrgKHZxDzZY7fuPNi8P
 filO9Y5Ug5F6vZ4leZM+izgMbptgFLx6Li4vM8BC2hAvEosE1LuY0PzRr42aSzFJ/Pgg
 RCtIPuyYeK6H6HhI73lilgrDXA8GI1piyzY5nkF1uT/RT5mFT7MC3rKGboqbe3/rpqVW
 9t6g==
X-Gm-Message-State: AOAM532vg3KCZAXKfzLrk7ZBblNlujbsQhKiblZWq9Sk6jgKJOxZhqgR
 XpTQyUYerWUuyJvixwvzhNbOOBeZY6LqBQPZjRTWXD7GY1l83BDIiM3UW6ntF2lMaZxxjdlqWN2
 1sDlPTW8OH/C3Hug=
X-Received: by 2002:a17:906:4e0a:: with SMTP id
 z10mr4190885eju.203.1641915497547; 
 Tue, 11 Jan 2022 07:38:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT/LppsNQdtNdDi8eCwcRBCsWZG8VSyH9aoCeJBFKcNeTDjYz08cTDZPtus+NL3mRxML4H6Q==
X-Received: by 2002:a17:906:4e0a:: with SMTP id
 z10mr4190867eju.203.1641915497301; 
 Tue, 11 Jan 2022 07:38:17 -0800 (PST)
Received: from redhat.com ([2.55.5.100])
 by smtp.gmail.com with ESMTPSA id g3sm3714338ejo.147.2022.01.11.07.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 07:38:16 -0800 (PST)
Date: Tue, 11 Jan 2022 10:38:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 0/8] virtio: Add vhost-user based Video decode
Message-ID: <20220111103245-mutt-send-email-mst@kernel.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211209145601.331477-1-peter.griffin@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 02:55:53PM +0000, Peter Griffin wrote:
> This series adds support for virtio-video decoder devices in Qemu
> and also provides a vhost-user-video vmm implementation.
> 
> The vhost-user-video vmm currently parses virtio-vido v3 protocol
> (as that is what the Linux frontend driver implements).
> It then converts that to a v4l2 mem2mem stateful decoder device.
> Currently this has been tested using v4l2 vicodec test driver in Linux
> [1] but it is intended to be used with Arm SoCs which often implement
> v4l2 stateful decoders/encoders drivers for their video accelerators.
> 
> The primary goal so far has been to allow continuing development
> of virtio-video Linux frontend driver and testing with Qemu. Using
> vicodec on the host allows a purely virtual dev env, and allows for
> ci integration in the future by kernelci etc.
> 
> This series also adds the virtio_video.h header and adds the
> FWHT format which is used by vicodec driver.
> 
> I have tested this VMM using v4l2-ctl from v4l2 utils in the guest
> to do a video decode to a file. This can then be validated using ffplay
> v4l2-compliance tool in the guest has also been run which stresses the
> interface and issues lots of syscall level tests
> 
> See the README.md for example commands on how to configure guest kernel
> and do a video decode using Qemu, vicodec using this VMM.
> 
> Linux virtio-video frontend driver code:
> https://github.com/petegriffin/linux/commits/v5.10-virtio-video-latest

Are you going to post this btw?


> Qemu vmm code:
> https://github.com/petegriffin/qemu/tree/vhost-virtio-video-master-v1
> 
> This is part of a wider initiative by Linaro called
> "project Stratos" for which you can find information here:
> 
>   https://collaborate.linaro.org/display/STR/Stratos+Home
> 
> Applies cleanly to git://git.qemu.org/qemu.git master(a3607def89).
> 
> Thanks,
> 
> Peter.
> 
> [1] https://lwn.net/Articles/760650/

And the spec status?
Does this match this spec:
https://lore.kernel.org/linux-media/CAPBb6MUD_oYeUt8_bGRwAPCPam40Jtktz2F7+A3SO5PFRdUsiw@mail.gmail.com/T/
?
A year ago a new revision was coming RSN ...


> Peter Griffin (8):
>   vhost-user-video: Add a README.md with cheat sheet of commands
>   MAINTAINERS: Add virtio-video section
>   vhost-user-video: boiler plate code for vhost-user-video device
>   vhost-user-video: add meson subdir build logic
>   standard-headers: Add virtio_video.h
>   virtio_video: Add Fast Walsh-Hadamard Transform format
>   hw/display: add vhost-user-video-pci
>   tools/vhost-user-video: Add initial vhost-user-video vmm
> 
>  MAINTAINERS                                   |    8 +
>  hw/display/Kconfig                            |    5 +
>  hw/display/meson.build                        |    3 +
>  hw/display/vhost-user-video-pci.c             |   82 +
>  hw/display/vhost-user-video.c                 |  386 ++++
>  include/hw/virtio/vhost-user-video.h          |   41 +
>  include/standard-headers/linux/virtio_video.h |  484 +++++
>  tools/meson.build                             |    9 +
>  tools/vhost-user-video/50-qemu-rpmb.json.in   |    5 +
>  tools/vhost-user-video/README.md              |   98 +
>  tools/vhost-user-video/main.c                 | 1680 ++++++++++++++++
>  tools/vhost-user-video/meson.build            |   10 +
>  tools/vhost-user-video/v4l2_backend.c         | 1777 +++++++++++++++++
>  tools/vhost-user-video/v4l2_backend.h         |   99 +
>  tools/vhost-user-video/virtio_video_helpers.c |  462 +++++
>  tools/vhost-user-video/virtio_video_helpers.h |  166 ++
>  tools/vhost-user-video/vuvideo.h              |   43 +
>  17 files changed, 5358 insertions(+)
>  create mode 100644 hw/display/vhost-user-video-pci.c
>  create mode 100644 hw/display/vhost-user-video.c
>  create mode 100644 include/hw/virtio/vhost-user-video.h
>  create mode 100644 include/standard-headers/linux/virtio_video.h
>  create mode 100644 tools/vhost-user-video/50-qemu-rpmb.json.in
>  create mode 100644 tools/vhost-user-video/README.md
>  create mode 100644 tools/vhost-user-video/main.c
>  create mode 100644 tools/vhost-user-video/meson.build
>  create mode 100644 tools/vhost-user-video/v4l2_backend.c
>  create mode 100644 tools/vhost-user-video/v4l2_backend.h
>  create mode 100644 tools/vhost-user-video/virtio_video_helpers.c
>  create mode 100644 tools/vhost-user-video/virtio_video_helpers.h
>  create mode 100644 tools/vhost-user-video/vuvideo.h
> 
> -- 
> 2.25.1


