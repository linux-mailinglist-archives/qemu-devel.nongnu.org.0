Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF274A8302
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 12:16:47 +0100 (CET)
Received: from localhost ([::1]:41150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFa6S-0001fs-LG
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 06:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFa4S-0000oB-PX
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:14:36 -0500
Received: from [2a00:1450:4864:20::42d] (port=40452
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.griffin@linaro.org>)
 id 1nFa4Q-0004n7-SR
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 06:14:36 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s18so4325451wrv.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mEUUJiO5+uMjULtZJtqhGga9ZLEanrPmRGzNOqiELKk=;
 b=hIpKnUJRial9C+by2RZ80mfKNhiJ1equBFzR2bCaOTwhzjGYEYehJ+CnHPCWsQJVZ/
 +gf7jpiWj9DSLp3n2SjQJGDBnUsbhbW+eBQmyv6zErseblf3WdNoK6+1DV65xFjEpvVa
 VrfgQqnaYKvuzVnZ4CzqCh2rQUDwpRXu5NcR68BeslJrSEFck/LXEYBne1P3qHJ8RsEf
 htjmVaHYd9J5vD0jCEojClR/Hu816byJiF614/g36xkmOX1C26PplsMAhCX3Nu2vsLMl
 +9M8b8mPIPkdspsN/7qk50onvcM5O/Sh+64kVi5SxNlSdPGA9EdMdYpTgGy+WtLd29Sf
 9glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mEUUJiO5+uMjULtZJtqhGga9ZLEanrPmRGzNOqiELKk=;
 b=SEUPWN3ajj1fsB32KFDjVY9AJJz3tRLM/jemmUUGxQrAsD8MpuyNG+K7xHP4xI5k6U
 TmxHh4aevUxclKWp6+f8jOPAF8HN/zugJzVbr1A1qbGAV/IJ7D2vp8iLTBwdlhGIE4Pp
 lgO0R85b3hUuZn2NwbQfAikus9eeCMa63OuDSZr6Mr8uxQjbl/clfmRW0+sQlh+D0IaZ
 W725Ah8Y2s3kl8zEmtFzOLVsY8pe2ivFsqY+FfAiODdIQn/TSaeQlg8mxetwYSdOodsW
 7Rijncx5z/xp5WY0O22pCPcXyRpPpvCyuwnN6sP1hY54IfymeHQozHog/Ir0otgNMAj5
 TNCg==
X-Gm-Message-State: AOAM533KTtqgf0cgKGzXp3oXLphNXhsf9Sk6/xCW5JGcXhzhF90gFkqy
 oQMMfqBi79Zp5iL2PYLZhS2VoA==
X-Google-Smtp-Source: ABdhPJxGsL2lkRpIPqp33CBt8l6Uzo/zL/XVnZW2+M0VFeWhhsc76Cb1HBDWvJKhJ3FO3EOtR8f2HQ==
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr30191692wrd.8.1643886872931; 
 Thu, 03 Feb 2022 03:14:32 -0800 (PST)
Received: from xps15-9570.lan ([85.210.223.90])
 by smtp.gmail.com with ESMTPSA id e13sm24032474wrq.35.2022.02.03.03.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 03:14:32 -0800 (PST)
Date: Thu, 3 Feb 2022 11:14:30 +0000
From: Peter Griffin <peter.griffin@linaro.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 3/8] vhost-user-video: boiler plate code for
 vhost-user-video device
Message-ID: <20220203111430.GB371411@xps15-9570.lan>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-4-peter.griffin@linaro.org>
 <87wnj6b6rp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wnj6b6rp.fsf@linaro.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.griffin@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, stratos-dev@op-lists.linaro.org,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Thanks for reviewing.

On Tue, 11 Jan 2022, Alex Bennée wrote:
> 
> Peter Griffin <peter.griffin@linaro.org> writes:
> 
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  hw/display/Kconfig                   |   5 +
> >  hw/display/meson.build               |   3 +
> >  hw/display/vhost-user-video.c        | 386 +++++++++++++++++++++++++++
> >  include/hw/virtio/vhost-user-video.h |  41 +++
> >  4 files changed, 435 insertions(+)
> >  create mode 100644 hw/display/vhost-user-video.c
> >  create mode 100644 include/hw/virtio/vhost-user-video.h
> >
> > diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> > index a2306b67d8..186163b015 100644
> > --- a/hw/display/Kconfig
> > +++ b/hw/display/Kconfig
> > @@ -118,6 +118,11 @@ config VHOST_USER_VGA
> >      default y
> >      depends on VIRTIO_VGA && VHOST_USER_GPU
> >  
> > +config VHOST_USER_VIDEO
> > +    bool
> > +    default y
> > +    depends on VIRTIO && VHOST_USER
> > +
> >  config DPCD
> >      bool
> >      select AUX
> > diff --git a/hw/display/meson.build b/hw/display/meson.build
> > index 861c43ff98..48284528cf 100644
> > --- a/hw/display/meson.build
> > +++ b/hw/display/meson.build
> > @@ -37,6 +37,9 @@ softmmu_ss.add(when: 'CONFIG_MACFB', if_true: files('macfb.c'))
> >  softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
> >  
> >  specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
> > +specific_ss.add(when: 'CONFIG_VHOST_USER_VIDEO', if_true: files('vhost-user-video.c'))
> > +specific_ss.add(when: ['CONFIG_VHOST_USER_VIDEO', 'CONFIG_VIRTIO_PCI' ],
> > +  if_true: files('vhost-user-video-pci.c'))
> >  
> >  if config_all_devices.has_key('CONFIG_QXL')
> >    qxl_ss = ss.source_set()
> > diff --git a/hw/display/vhost-user-video.c b/hw/display/vhost-user-video.c
> > new file mode 100644
> > index 0000000000..506e350365
> > --- /dev/null
> > +++ b/hw/display/vhost-user-video.c
> > @@ -0,0 +1,386 @@
> > +/*
> > + * Vhost-user VIDEO virtio device
> > + *
> > + * This is the boilerplate for instantiating a vhost-user device
> > + * implementing a virtio-video device.
> > + *
> > + * The virtio video decoder and encoder devices are virtual devices that
> > + * support encoding and decoding respectively.
> > + *
> > + * The actual back-end for this driver is the vhost-user-video daemon.
> > + * The code here just connects up the device in QEMU and allows it to
> > + * be instantiated.
> > + *
> > + * Copyright (c) 2021 Linaro Ltd
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/virtio/virtio-bus.h"
> > +#include "hw/virtio/vhost-user-video.h"
> > +#include "qemu/error-report.h"
> > +
> > +/* currently there is no VIDEO enc/dec defined in Linux virtio_ids.h */
> > +#define VIRTIO_ID_VIDEO_ENC         30
> > +#define VIRTIO_ID_VIDEO_DEC         31
> > +#define MAX_CAPS_LEN 4096
> > +
> > +static void vhost_user_video_get_config(VirtIODevice *vdev, uint8_t *config)
> > +{
> > +    VHostUserVIDEO *video = VHOST_USER_VIDEO(vdev);
> > +    struct virtio_video_config *vconfig = (struct virtio_video_config *)config;
> > +    int ret;
> > +    Error *local_err = NULL;
> > +
> > +    memset(config, 0, sizeof(struct virtio_video_config));
> > +
> > +    ret = vhost_dev_get_config(&video->vhost_dev, config,
> > +                               sizeof(struct virtio_video_config), &local_err);
> > +    if (ret) {
> > +        error_report("vhost-user-video: get device config space failed");
> > +
> > +        /*TODO vhost_dev_get_config() fails so for now lets just set
> >  it here */
> 
> Is this a lifetime issue?

I believe so. I spent some time trying to get it working, but then added this
workaround so I could progress on the virtio-video implementation.

I will take another look and see if I can get thie config coming from the daemon
as intended.

Looking at other examples, hw/display/vhost-user-gpu.c get_config() hook seems to call
vhost_dev_config successfully like I'm doing here.

But hw/block/vhost-user-blk.c and hw/virtio/vhost-user-vsock.c seem to have
a slightly different mechanism of using VhostDevConfigOps
.vhost_dev_config_notifier() which I don't recall having looked into that previously.

> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

kind regards,

Peter.

