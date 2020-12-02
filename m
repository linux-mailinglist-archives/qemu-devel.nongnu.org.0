Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B00B2CBB05
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:52:26 +0100 (CET)
Received: from localhost ([::1]:55824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPkH-0000r3-FB
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:52:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOun-0001zy-99
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:59:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkOul-0005AG-HE
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606903150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z8AQZAgl1UdsrqF/icNEETV75RA2NfX+ehHLJ3NCqqw=;
 b=Lj6wKb7VdoGsQKEgm6RWuHuifswaYEktM0weJA/juGW4rZ1JccGabWETzEzZcee1hJVPdZ
 4wsK/tPECGrgTcRl6OfaIbDgRVbII40MhjxztoGwsGlJmHwrvKV/XvFGogM891fAHSdImu
 jxWxBeXW57Q9DYsPhLbGfa19WGr23IU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-0udzyt44MvOr8aYraBRv8Q-1; Wed, 02 Dec 2020 04:59:09 -0500
X-MC-Unique: 0udzyt44MvOr8aYraBRv8Q-1
Received: by mail-wm1-f72.google.com with SMTP id q1so2701981wmq.2
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z8AQZAgl1UdsrqF/icNEETV75RA2NfX+ehHLJ3NCqqw=;
 b=MXD7xarouUlkVIL+e6nWLqclyCQcJC3fTij12+/aXEQebBTgdP4zfmoGpJd22qTNDQ
 fXJCpRVwV9T6Q6W8+gyxSTRqNp+JI1lNVYyrcb3Tl+yd1Xw9QGUA32Eq19yNEN11F5We
 LRUhQFhCC2vkaafVDbZGLzDUti4AOeQrmyv+euhwSXRkfBYwJNe8tZ/RgvHIvgs+GlVv
 zp3mMMpJRNN5wE1jxQkidwkWPOG3smYUJc7PuxGaOibpH48PR/ydgPYXNi5mGwfHa8v6
 AlnMkFChgLzOGt8hr69CvtasG6XJgvEp6zRhty1fM6BsEfmEbheZaKz8icXfrvbKGLx8
 nOxw==
X-Gm-Message-State: AOAM533AjxwrlYJERLgWIybhGXLjIIoeCUvVqeFOH17MuKFhvb0awVGg
 4wbbJNcsQWo7kQR+AYIGuw9NnpOtjkeWUrcF3n0j3Yr0TSrfzO43wKsC53iiGMnKUPjrrQTQzdc
 Mga9c77p13/koRas=
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr2177313wmg.145.1606903146648; 
 Wed, 02 Dec 2020 01:59:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlyOpsA5OFT6XaiG7rTTB0hoZWxmFeJV5oLJmK4wvaw9/zUbY1bAYBODC22GlGVObe124jzQ==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr2177290wmg.145.1606903146488; 
 Wed, 02 Dec 2020 01:59:06 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z11sm1418191wmc.39.2020.12.02.01.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 01:59:05 -0800 (PST)
Date: Wed, 2 Dec 2020 04:59:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 1/1] qemu vhost scsi: add VHOST_SET_VRING_ENABLE support
Message-ID: <20201202045807-mutt-send-email-mst@kernel.org>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-2-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-2-git-send-email-michael.christie@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, jasowang@redhat.com,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 target-devel@vger.kernel.org, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 05:19:00PM -0600, Mike Christie wrote:
> diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> index 7523218..98dd919 100644
> --- a/linux-headers/linux/vhost.h
> +++ b/linux-headers/linux/vhost.h
> @@ -70,6 +70,7 @@
>  #define VHOST_VRING_BIG_ENDIAN 1
>  #define VHOST_SET_VRING_ENDIAN _IOW(VHOST_VIRTIO, 0x13, struct vhost_vring_state)
>  #define VHOST_GET_VRING_ENDIAN _IOW(VHOST_VIRTIO, 0x14, struct vhost_vring_state)
> +#define VHOST_SET_VRING_ENABLE _IOW(VHOST_VIRTIO, 0x15, struct vhost_vring_state)

OK so first we need the kernel patches, then update the header, then
we can apply the qemu patch.

>  /* The following ioctls use eventfd file descriptors to signal and poll
>   * for events. */
> -- 
> 1.8.3.1


