Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D2324C74
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:12:19 +0100 (CET)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFCh0-0002YX-4o
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:12:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lFCfm-00023b-1T
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:11:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lFCfk-0003fj-9Q
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yfMfSfDrRzwRQ1MGNOoTbbr5zMk98UHOia//WAiBKI8=;
 b=hlg0xhtbF1A7rXsv9GfKFIj7rbeuMBirDEbXRnLOtqxF2rK9nejSBJHca/vDyGa6KJWpDg
 OzZYhsSjZlN9WKxbk4x2x+tHlBlXbMLvAjwVOPzWYJ8Ffhf1gc6jMhqXVfLXV5YFxAO53I
 UI8o6YUdLbJftQRydnkzDrCaxaB7ftY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-s_xyrj87NOagvhGQwPSQNw-1; Thu, 25 Feb 2021 04:10:57 -0500
X-MC-Unique: s_xyrj87NOagvhGQwPSQNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B06671020C20;
 Thu, 25 Feb 2021 09:10:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A454679F0;
 Thu, 25 Feb 2021 09:10:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 840A218000A7; Thu, 25 Feb 2021 10:10:49 +0100 (CET)
Date: Thu, 25 Feb 2021 10:10:49 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v3 3/3] virtio-gpu: Do not distinguish the primary console
Message-ID: <20210225091049.npg2w7yacxel2cyz@sirius.home.kraxel.org>
References: <20210224110656.5pctwd7hdpvqi2na@sirius.home.kraxel.org>
 <20210225013609.73388-1-akihiko.odaki@gmail.com>
 <20210225013609.73388-3-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210225013609.73388-3-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: qemu Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -        if (m->scanout_id == 0 && m->width == 0) {
> +        if (m->width == 0) {
>              s->ds = qemu_create_placeholder_surface(640, 480,
>                                                      "Guest disabled display.");
>              dpy_gfx_replace_surface(con, s->ds);

Just call dpy_gfx_replace_surface(con, NULL) here and let console.c
create the placeholder?

>      for (i = 0; i < g->conf.max_outputs; i++) {
>          g->scanout[i].con =
>              graphic_console_init(DEVICE(g), i, &virtio_gpu_ops, g);
> -        if (i > 0) {
> -            dpy_gfx_replace_surface(g->scanout[i].con, NULL);
> -        }

I think we should call dpy_gfx_replace_surface(..., NULL)
unconditionally here instead of removing the call.

> +    /* primary head */

Comment can go away as we remove the special case for scanout == 0,

> +    ds = qemu_create_placeholder_surface(scanout->width  ?: 640,
> +                                         scanout->height ?: 480,
> +                                         "Guest disabled display.");
>      dpy_gfx_replace_surface(scanout->con, ds);

likewise "dpy_gfx_replace_surface(..., NULL);"

take care,
  Gerd


