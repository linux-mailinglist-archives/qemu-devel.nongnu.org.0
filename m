Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2D52C250C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:56:38 +0100 (CET)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khWw0-0006s8-PG
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khWtz-0006ML-4Q
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:54:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khWtq-0000iO-6g
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606218860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=veUy09SVZeoUs9Smu4rvbkqmtikMCzugC+bw7H/0vP0=;
 b=inbacEJl6BpLvgbQpa7lQ9v/lwh/8xRSMzVJ19jloW9Xg++kpExsyZwyPq71fuHP/W6TNa
 PXlZfWX+KqdJC9XhTa8bhXwSnPzY75WyABQo9I9Wnh31LUxmFD7S2Bj9RRlxKHdeXiP8IP
 cMyKet2G1j902x8agg+bGb6UqRkzcnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-dEhcaRRNOK6PVIWgMQ67vQ-1; Tue, 24 Nov 2020 06:54:17 -0500
X-MC-Unique: dEhcaRRNOK6PVIWgMQ67vQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CBB6107ACFE
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 11:54:16 +0000 (UTC)
Received: from work-vm (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5FC60BE5;
 Tue, 24 Nov 2020 11:54:08 +0000 (UTC)
Date: Tue, 24 Nov 2020 11:54:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 2/2] libvhost-user: replace qemu/memfd.h usage
Message-ID: <20201124115405.GE3366@work-vm>
References: <20201118080902.30033-1-marcandre.lureau@redhat.com>
 <20201118080902.30033-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118080902.30033-3-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* marcandre.lureau@redhat.com (marcandre.lureau@redhat.com) wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Undo the damage from commit 5f9ff1eff3 ("libvhost-user: Support tracking
> inflight I/O in shared memory") which introduced glib dependency through
> osdep.h inclusion.
> 
> libvhost-user.c tries to stay free from glib usage.
> 
> Use glibc memfd_create directly when available (assumed so when
> MFD_ALLOW_SEALING is defined).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  contrib/libvhost-user/libvhost-user.c | 50 +++++++++++++++++++++++----
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
> index 1c1cfbf1e7..805521859d 100644
> --- a/contrib/libvhost-user/libvhost-user.c
> +++ b/contrib/libvhost-user/libvhost-user.c
> @@ -42,8 +42,6 @@
>  #endif
>  
>  #include "qemu/atomic.h"
> -#include "qemu/osdep.h"
> -#include "qemu/memfd.h"
>  
>  #include "libvhost-user.h"
>  
> @@ -1615,11 +1613,45 @@ vu_inflight_queue_size(uint16_t queue_size)
>             sizeof(uint16_t), INFLIGHT_ALIGNMENT);
>  }
>  
> +#ifdef MFD_ALLOW_SEALING
> +static void *
> +memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd)
> +{
> +    void *ptr;
> +    int ret;
> +
> +    *fd = memfd_create(name, MFD_ALLOW_SEALING);
> +    if (*fd < 0) {
> +        return NULL;
> +    }
> +
> +    ret = ftruncate(*fd, size);

Do you need to do any of the page alignment?

> +    if (ret < 0) {
> +        close(*fd);
> +        return NULL;
> +    }
> +
> +    ret = fcntl(*fd, F_ADD_SEALS, F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL);

I think you'd intended to use the 'flags' parameter there.

> +    if (ret < 0) {
> +        close(*fd);
> +        return NULL;
> +    }
> +
> +    ptr = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, *fd, 0);
> +    if (ptr == MAP_FAILED) {
> +        close(*fd);
> +        return NULL;
> +    }
> +
> +    return ptr;
> +}
> +#endif
> +
>  static bool
>  vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
>  {
> -    int fd;
> -    void *addr;
> +    int fd = -1;
> +    void *addr = NULL;
>      uint64_t mmap_size;
>      uint16_t num_queues, queue_size;
>  
> @@ -1637,9 +1669,13 @@ vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
>  
>      mmap_size = vu_inflight_queue_size(queue_size) * num_queues;
>  
> -    addr = qemu_memfd_alloc("vhost-inflight", mmap_size,
> -                            F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
> -                            &fd, NULL);
> +#ifdef MFD_ALLOW_SEALING
> +    addr = memfd_alloc("vhost-inflight", mmap_size,
> +                       F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
> +                       &fd);
> +#else
> +    vu_panic(dev, "Not implemented: memfd support is missing");

Should there be an ifdef somewhere on the declared features, so it
doesn't get this far because it wont negotiate the feature?

Dave

> +#endif
>  
>      if (!addr) {
>          vu_panic(dev, "Failed to alloc vhost inflight area");
> -- 
> 2.29.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


