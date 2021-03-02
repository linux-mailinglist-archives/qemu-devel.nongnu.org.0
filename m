Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9568F32AC77
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 23:12:49 +0100 (CET)
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHDG4-0001NC-MO
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 17:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lHDEa-0000eV-NJ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:11:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lHDEZ-0002iy-5b
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 17:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614723074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nc6bpKIuxpS3N/UuzcXiRKysODRtrz8C1iycqEUkq3Y=;
 b=F5r60ma7bMTYwZts8Hby5RF7TfnaFrQkin7VBDyRYPukq+5qCWPHoGK1QpRUwIcGhlpbOH
 ZroAjNfX60ecLY75QWayDgy3YPkV+olLtm6HMFdqapq7TFY6XRoMdTpw+h7u2kgB/Koixl
 J8NaHSbA+/cRTdrPRPsOHonWno/HVMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-5OgoKvfxPNWgpJD-x1Y41Q-1; Tue, 02 Mar 2021 17:11:10 -0500
X-MC-Unique: 5OgoKvfxPNWgpJD-x1Y41Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BC1100CCC1;
 Tue,  2 Mar 2021 22:11:09 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B07416F812;
 Tue,  2 Mar 2021 22:11:08 +0000 (UTC)
Date: Tue, 2 Mar 2021 15:11:07 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] vfio: Fix vfio_listener_log_sync function name typo
Message-ID: <20210302151107.31600844@omen.home.shazbot.org>
In-Reply-To: <20201204014240.772-1-yuzenghui@huawei.com>
References: <20201204014240.772-1-yuzenghui@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wanghaibin.wang@huawei.com, kwankhede@nvidia.com, cohuck@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Dec 2020 09:42:40 +0800
Zenghui Yu <yuzenghui@huawei.com> wrote:

> There is an obvious typo in the function name of the .log_sync() callback.
> Spell it correctly.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  hw/vfio/common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 6ff1daa763..d360d6f2da 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1118,7 +1118,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
>                         int128_get64(section->size), ram_addr);
>  }
>  
> -static void vfio_listerner_log_sync(MemoryListener *listener,
> +static void vfio_listener_log_sync(MemoryListener *listener,
>          MemoryRegionSection *section)
>  {
>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> @@ -1136,7 +1136,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
>  static const MemoryListener vfio_memory_listener = {
>      .region_add = vfio_listener_region_add,
>      .region_del = vfio_listener_region_del,
> -    .log_sync = vfio_listerner_log_sync,
> +    .log_sync = vfio_listener_log_sync,
>  };
>  
>  static void vfio_listener_release(VFIOContainer *container)

Sorry for the delay, queued.  Thanks,

Alex


