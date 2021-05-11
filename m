Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831AE37A5FB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:47:18 +0200 (CEST)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQr7-0002eY-IA
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lgQkE-0005dO-2k
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lgQkA-0002k9-FV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 07:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620733204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5kEb55wHQYwYpQBBYP/kOFmd87doJ+Tu2fvo+rZrbx8=;
 b=CxTVYtb3vHeyTU5j+COW0sTXz88UEijRZD/Q7px4AYwtBtzefQyvPNvgOob2fsb9Cy60iu
 VJC7pKZcWYcXE9Q62+D9+E9QTa4xqIMoVmRDPCK/YVeNnuZ6OGwnk64A2WMxpXu+oNTHVg
 wQxV2AAlDx13qCBfdt+m8Ibg0n6z2KA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-DUC3yB3TMfKbN1Q9qJLsew-1; Tue, 11 May 2021 07:40:01 -0400
X-MC-Unique: DUC3yB3TMfKbN1Q9qJLsew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 098C6107ACCA;
 Tue, 11 May 2021 11:40:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A365960CDE;
 Tue, 11 May 2021 11:39:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A15EE1800399; Tue, 11 May 2021 13:39:57 +0200 (CEST)
Date: Tue, 11 May 2021 13:39:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 12/20] virtio-gpu: Add virtio_gpu_set_scanout_blob
Message-ID: <20210511113957.7xxjcvpavimhgb73@sirius.home.kraxel.org>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
 <20210511080818.366985-13-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210511080818.366985-13-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> -    pixman_image_unref(res->image);
> +    if (res->image) {
> +        pixman_image_unref(res->image);
> +    }

There is qemu_pixman_image_unref().

Like pixman_image_unref except that it also accepts (and ignores) NULL
pointers.

>      virtio_gpu_cleanup_mapping(g, res);
>      QTAILQ_REMOVE(&g->reslist, res, next);
>      g->hostmem -= res->hostmem;
> @@ -494,6 +496,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
>  {
>      struct virtio_gpu_simple_resource *res;
>      struct virtio_gpu_resource_flush rf;
> +    struct virtio_gpu_scanout *scanout;
>      pixman_region16_t flush_region;
>      int i;
>  
> @@ -504,16 +507,28 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
>  
>      res = virtio_gpu_find_check_resource(g, rf.resource_id, false,
>                                           __func__, &cmd->error);
> -    if (!res || res->blob) {
> +    if (!res) {
>          return;
>      }
>  
> -    if (rf.r.x > res->width ||
> +    if (res->blob && display_opengl) {

console_has_gl(scanout->con)

> +    if (!res->blob &&
> +        (rf.r.x > res->width ||
>          rf.r.y > res->height ||
>          rf.r.width > res->width ||
>          rf.r.height > res->height ||
>          rf.r.x + rf.r.width > res->width ||
> -        rf.r.y + rf.r.height > res->height) {
> +        rf.r.y + rf.r.height > res->height)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: flush bounds outside resource"
>                        " bounds for resource %d: %d %d %d %d vs %d %d\n",
>                        __func__, rf.resource_id, rf.r.x, rf.r.y,

Indent needs fixing.
Do we need sanity checks for the res->blob == true case?  I think so ...

>      g->parent_obj.enable = 1;
> -    data = (uint8_t *)pixman_image_get_data(res->image);
> +
> +    if (res->blob) {
> +        if (display_opengl) {

Again console_has_gl(scanout->con)

> +            if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb)) {
> +                virtio_gpu_update_scanout(g, scanout_id, res, r);
> +                return;
> +            }
> +        }
> +
> +        data = res->blob;
> +    } else {
> +        data = (uint8_t *)pixman_image_get_data(res->image);
> +    }
>  
>      /* create a surface for this scanout */
> -    if (!scanout->ds ||
> +    if ((res->blob && !display_opengl) ||

And again.

take care,
  Gerd


