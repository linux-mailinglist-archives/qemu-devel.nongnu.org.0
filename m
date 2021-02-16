Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7A031C9F3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:41:46 +0100 (CET)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByjh-0003yn-PO
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:41:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lByip-0003VC-J3
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:40:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lByin-0004YL-6O
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:40:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613475648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=otsXp83pFMLiPgleffMMh9ll9ydUN+7NVMXJ3ZXwNMw=;
 b=Tst11cKEpJcSnTY+LCfIpr3RpzkJivS9MhoGbBcBcxy4oVhdMXAEI1l9dbLbMBo/sgYZcM
 4yy7u9Nxd56QR6at837s9oLqewY1fPbfLldnvxH/ldTpmdbO+ZVfuAgrorVEaBCgTcTwS9
 grnvKaw0R20V0L4kha0CUkGBiPPLmO8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-0CHHDTCnN2mB4ywZ2yPS5w-1; Tue, 16 Feb 2021 06:40:46 -0500
X-MC-Unique: 0CHHDTCnN2mB4ywZ2yPS5w-1
Received: by mail-ed1-f72.google.com with SMTP id g6so7159733edy.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=otsXp83pFMLiPgleffMMh9ll9ydUN+7NVMXJ3ZXwNMw=;
 b=oNBQ1Wg5j5IMX4rn08+VilCEIq4iZS4fHM1z7oPlRWASyFHHRzZ5qmk9LNThquQ8nn
 oIEigNKsmUHT2nUgLOSEqRRXxrYRtFxty3LttgPPFeSfSGyZhA7xlJEIpjdpoU/2ZM7q
 k9de0ih72j6MXBfCfB7MM9CMuHkI8jKyIbESW1GE19vyu9g4KUWXWtbwfhjRqMyChSCy
 4O8E6m3ob76LwrO9Ud+lmGZPVFj4XqCkNm5831nBxHrurs8WfPZmEP+7wHLFCarV7Z4w
 aTOexTDKirUOP7m59Mx70y46VK7c2+Mi/9tEA2x02vmod8mvhLmeWHFCJJFrszRJuQmi
 UtAA==
X-Gm-Message-State: AOAM5327moiQw+y2ieN9FAcqloP/yk2opS84LKDYQEft0Ig0cujZkOCA
 gpqBjrRt823x031Sj2bkSOSAKVcU6xAZe1Rt9PIzTOmG8YCoqHwsbeiDgDKOmGqUJLVZLWZ2iT9
 zvHYYRRnfNT2FRyI=
X-Received: by 2002:a05:6402:524f:: with SMTP id
 t15mr20189698edd.158.1613475645368; 
 Tue, 16 Feb 2021 03:40:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGG8RfCUbR7OoQ/Yi33LFlwOly9lV/gMzwNyTEF8ty24Ir0hWaXqFH9qj8xyLpXzQws0NAZA==
X-Received: by 2002:a05:6402:524f:: with SMTP id
 t15mr20189682edd.158.1613475645204; 
 Tue, 16 Feb 2021 03:40:45 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id b6sm13851617ejb.8.2021.02.16.03.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 03:40:44 -0800 (PST)
Date: Tue, 16 Feb 2021 06:40:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210216064013-mutt-send-email-mst@kernel.org>
References: <20210216111830.1087847-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210216111830.1087847-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 12:18:30PM +0100, Cornelia Huck wrote:
> The virtio standard specifies that any non-transitional device must
> reject commands prior to revision setting (which we do) and else
> assume revision 0 (legacy) if the driver sends a non-revision-setting
> command first. We neglected to do the latter.
> 
> Fortunately, nearly everything worked as intended anyway; the only
> problem was not properly rejecting revision setting after some other
> command had been issued. Easy to fix by setting revision to 0 if
> we see a non-revision command on a legacy-capable revision-less
> device.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

Feel free to merge.

Curious how was this discovered.

> ---
>  hw/s390x/virtio-ccw.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 4582e94ae7dc..06c06056814b 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -327,13 +327,20 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
>                                     ccw.cmd_code);
>      check_len = !((ccw.flags & CCW_FLAG_SLI) && !(ccw.flags & CCW_FLAG_DC));
>  
> -    if (dev->force_revision_1 && dev->revision < 0 &&
> -        ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
> -        /*
> -         * virtio-1 drivers must start with negotiating to a revision >= 1,
> -         * so post a command reject for all other commands
> -         */
> -        return -ENOSYS;
> +    if (dev->revision < 0 && ccw.cmd_code != CCW_CMD_SET_VIRTIO_REV) {
> +        if (dev->force_revision_1) {
> +            /*
> +             * virtio-1 drivers must start with negotiating to a revision >= 1,
> +             * so post a command reject for all other commands
> +             */
> +            return -ENOSYS;
> +        } else {
> +            /*
> +             * If the driver issues any command that is not SET_VIRTIO_REV,
> +             * we'll have to operate the device in legacy mode.
> +             */
> +            dev->revision = 0;
> +        }
>      }
>  
>      /* Look at the command. */
> -- 
> 2.26.2


