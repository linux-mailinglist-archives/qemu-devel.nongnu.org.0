Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AF9271F1B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 11:43:09 +0200 (CEST)
Received: from localhost ([::1]:50208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKILk-0001Nt-C8
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 05:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kKIK8-0000Wf-2X
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 05:41:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38485
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kKIK4-0002sm-65
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 05:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600681282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Nij7Tt/cq3N0jvp+o1AoF4DcrIbbuYrsdm3xLoZg1M=;
 b=BCHi1/SsVYDY9mYadpAfsoUNGjFxjvXNeEs1RLUyTvAa2fD1FlVMF1LxTYUfW0R/buk2SB
 9pYb6j7KaLhNLqEMtNl4/on/rHs82NqJQw7CM8U+2duoiHdjlKq3iwDrSdy1UtPZN1DmTY
 K5LuBGvGbfq5gNHxvWYy5PksVzBKPYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-SaSYn_lyNN2TRdTRVZlPtg-1; Mon, 21 Sep 2020 05:41:18 -0400
X-MC-Unique: SaSYn_lyNN2TRdTRVZlPtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4903780ED8E;
 Mon, 21 Sep 2020 09:41:17 +0000 (UTC)
Received: from gondolin (ovpn-112-187.ams2.redhat.com [10.36.112.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F70768D6E;
 Mon, 21 Sep 2020 09:40:57 +0000 (UTC)
Date: Mon, 21 Sep 2020 11:40:54 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/4] virtio: skip legacy support check on machine
 types less than 5.1
Message-ID: <20200921114054.75917251.cohuck@redhat.com>
In-Reply-To: <20200921083807.48380-2-sgarzare@redhat.com>
References: <20200921083807.48380-1-sgarzare@redhat.com>
 <20200921083807.48380-2-sgarzare@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 04:38:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Qinghua Cheng <qcheng@redhat.com>,
 Qian Cai <caiqian@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Sep 2020 10:38:04 +0200
Stefano Garzarella <sgarzare@redhat.com> wrote:

> Commit 9b3a35ec82 ("virtio: verify that legacy support is not accidentally
> on") added a check that returns an error if legacy support is on, but the
> device does not support legacy.
> 
> Unfortunately some devices were wrongly declared legacy capable even if
> they were not (e.g vhost-vsock).
> 
> To avoid migration issues, we add a virtio-device property
> (x-disable-legacy-check) to skip the legacy error, printing a warning
> instead, for machine types < 5.1.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 9b3a35ec82 ("virtio: verify that legacy support is not accidentally on")
> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v4:
>  - fixed commit message and warning message [Cornelia]
> v3:
>  - added virtio_legacy_check_disabled() helper
>  - moved warning where error was returned [Cornelia]
> v2:
>  - fixed Cornelia's e-mail address
> ---
>  include/hw/virtio/virtio.h |  2 ++
>  hw/core/machine.c          |  1 +
>  hw/s390x/virtio-ccw.c      | 15 ++++++++++++---
>  hw/virtio/virtio-pci.c     | 14 ++++++++++++--
>  hw/virtio/virtio.c         |  7 +++++++
>  5 files changed, 34 insertions(+), 5 deletions(-)
> 

(...)

> diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
> index 8feb3451a0..c534cdf2e5 100644
> --- a/hw/s390x/virtio-ccw.c
> +++ b/hw/s390x/virtio-ccw.c
> @@ -1122,9 +1122,18 @@ static void virtio_ccw_device_plugged(DeviceState *d, Error **errp)
>      }
>  
>      if (!virtio_ccw_rev_max(dev) && !virtio_legacy_allowed(vdev)) {
> -        error_setg(errp, "Invalid value of property max_rev "
> -                   "(is %d expected >= 1)", virtio_ccw_rev_max(dev));
> -        return;
> +        /*
> +         * To avoid migration issues, we allow legacy mode when legacy
> +         * check is disabled in the old machine types (< 5.1).
> +         */
> +        if (virtio_legacy_check_disabled(vdev)) {
> +            warn_report("device requires revision >= 1, but for backward "
> +                        "compatibility max_revision=0 is allowed");

Message looks good to me.

> +        } else {
> +            error_setg(errp, "Invalid value of property max_rev "
> +                       "(is %d expected >= 1)", virtio_ccw_rev_max(dev));
> +            return;
> +        }
>      }
>  
>      if (virtio_get_num_queues(vdev) > VIRTIO_QUEUE_MAX) {

(...)


