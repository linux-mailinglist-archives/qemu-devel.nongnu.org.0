Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6977B31EBFE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:06:03 +0100 (CET)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCloY-00029c-Br
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lClmO-0000a5-Se
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lClmG-0003ki-Ib
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613664219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWnylHTSqvBAgpSeQegI+53TbibmhQ6JYsvsSrb3o7M=;
 b=DWwfBOOoDX94F3RQjXHUiuqKotCwacH/RwfHaqGYDqFdaWl9oUbIv1yAS3hHq2dCF23lFg
 OFFJFY2ocBTOpcUmPYKnQLBraawugTY82ME4BA25Ja5h9Tp9/s6ii2bwpp9TAILnpH1eqt
 +OPhoZwXqg1WbDY+cv8jauPBz9oopAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-tF4k4gQ9PB60F-lPaT65Mw-1; Thu, 18 Feb 2021 11:03:34 -0500
X-MC-Unique: tF4k4gQ9PB60F-lPaT65Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FCA71934116;
 Thu, 18 Feb 2021 16:03:31 +0000 (UTC)
Received: from gondolin (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43A4D17DC3;
 Thu, 18 Feb 2021 16:03:26 +0000 (UTC)
Date: Thu, 18 Feb 2021 17:03:24 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] hw/s390x: fix build for virtio-9p-ccw
Message-ID: <20210218170324.5697bcd7.cohuck@redhat.com>
In-Reply-To: <20210218034059.1096078-1-pasic@linux.ibm.com>
References: <20210218034059.1096078-1-pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Jakob Naucke <jakob.naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 04:40:59 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> Commit  2c44220d05 ("meson: convert hw/arch*"), which migrated the old
> Makefile.objs to meson.build  accidentally excluded virtio-ccw-9p.c and
> thus the virtio-9p-ccw device from the build (and potentially also
> included the file virtio-ccw-blk.c twice in the source set). And since
> CONFIG_VIRTFS can't be used the way it was used here (see commit
> 2c9dce0196 ("meson: do not use CONFIG_VIRTFS")), the preconditions have
> to be written differently.
> 
> Let's fix this!
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 2c44220d05 ("meson: convert hw/arch*")
> Reported-by: Jakob Naucke <jakob.naucke@ibm.com>
> Cc: qemu-stable@nongnu.org
> ---
>  hw/s390x/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 2a7818d94b..91495b5631 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -40,7 +40,9 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_SCSI', if_true: files('virtio-ccw-scsi.c'))
>  virtio_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-ccw-serial.c'))
> -virtio_ss.add(when: ['CONFIG_VIRTIO_9P', 'CONFIG_VIRTFS'], if_true: files('virtio-ccw-blk.c'))
> +if have_virtfs
> +  virtio_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-ccw-9p.c'))
> +endif
>  virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-ccw.c'))
>  virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'))
>  s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
> 
> base-commit: 1af5629673bb5c1592d993f9fb6119a62845f576

Thanks, applied.


