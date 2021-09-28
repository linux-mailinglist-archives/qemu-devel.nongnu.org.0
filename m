Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3241A6F2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 07:15:15 +0200 (CEST)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV5SU-00083u-5C
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 01:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mV5RT-0007Nt-3x
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 01:14:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mV5RR-00064T-Ke
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 01:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632806047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tp54h8d4EJhCoPpI2pLYCToMYUtOg4FzAZzdpwJ5WLk=;
 b=hRIf/oJL9k28Mil2NzK+fNfk9zuKE1a7PrtgKvDkDiCs87Lrl1emQqhLCbMLNHhYEEQwPh
 Umgy62DCfCqOsZoM9PaT/+X7bp5NzIF/+YClmfASvQ9N3St+QecMXpcrGlIFtMGQTLgufd
 N1F/zKuQX7k4OfS5fIfnlwJOpHl5zK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-LF4vOdTZMfm_v2iQE-yU8A-1; Tue, 28 Sep 2021 01:14:03 -0400
X-MC-Unique: LF4vOdTZMfm_v2iQE-yU8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06F5B801E72;
 Tue, 28 Sep 2021 05:14:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53A825C23A;
 Tue, 28 Sep 2021 05:14:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9165018003B6; Tue, 28 Sep 2021 07:13:58 +0200 (CEST)
Date: Tue, 28 Sep 2021 07:13:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH 1/1] virtio-gpu: CONTEXT_INIT feature
Message-ID: <20210928051358.qlyssfoyrslm7544@sirius.home.kraxel.org>
References: <20210927144840.3661593-1-antonio.caggiano@collabora.com>
 <20210927144840.3661593-2-antonio.caggiano@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20210927144840.3661593-2-antonio.caggiano@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> @@ -212,6 +212,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
>          features |= (1 << VIRTIO_GPU_F_RESOURCE_BLOB);
>      }
>  
> +    features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);

This needs a config option, simliar to the other features.  It is a
guest-visible change so we must be able to turn it off for live
migration compatibility reasons.  We also need a compat property to
turn it off by default for 6.1 + older machine types.

> +    if (cc.context_init) {
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);

This requires a minimum virglrenderer version I guess?

> --- a/include/standard-headers/linux/virtio_gpu.h
> +++ b/include/standard-headers/linux/virtio_gpu.h

Separate patch please.
Also use scripts/update-linux-headers.sh for this.

take care,
  Gerd


