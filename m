Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58572D2D61
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:43:36 +0100 (CET)
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmeDH-0007Pw-Qe
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kme9e-0005TX-3J
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:39:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kme9b-0003MB-8k
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 09:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607438386;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37+Oxu2Cc+zIP6VXWYrP4C03p5hIHWtjI2/BtkwaFhk=;
 b=ifk/+vQ7Fu/o//v8Q6F6clel18dBf5HsWN4aHmIPB+sw6Zm9oIH5miPzDiFQNXktI0Ytc1
 EQXFNEUDSM8KHgHjtYZarz1ibeirjrj80nHZ4o9qlBiT5pyJH01A1zt6mDvcHLxjCjm/ZI
 bG7ZfcYfz3tOMIfpXKFWTc6lVT76toY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-2NIKSv2DMl6k61upDt4Nhw-1; Tue, 08 Dec 2020 09:39:42 -0500
X-MC-Unique: 2NIKSv2DMl6k61upDt4Nhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 187FF84A5EC
 for <qemu-devel@nongnu.org>; Tue,  8 Dec 2020 14:39:41 +0000 (UTC)
Received: from redhat.com (ovpn-113-15.ams2.redhat.com [10.36.113.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95D5560BE2;
 Tue,  8 Dec 2020 14:39:33 +0000 (UTC)
Date: Tue, 8 Dec 2020 14:39:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 6/9] vnc: add alpha cursor support
Message-ID: <20201208143929.GK3136942@redhat.com>
References: <20201208115737.18581-1-kraxel@redhat.com>
 <20201208115737.18581-7-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208115737.18581-7-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 12:57:34PM +0100, Gerd Hoffmann wrote:
> There is a new vnc extension for cursors with an alpha channel.  Use
> it if supported by the vnc client, prefer it over the "rich cursor"
> extension which supports only a bitmask for transparency.
> 
> This is a visible improvement especially on modern desktops which
> actually use the alpha channel when defining cursors.
> 
> https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#cursor-with-alpha-pseudo-encoding
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/vnc.h |  2 ++
>  ui/vnc.c | 21 ++++++++++++++++++---
>  2 files changed, 20 insertions(+), 3 deletions(-)

Add implemented the client side in GTK-VNC and tested against
this QEMU patch:

  https://gitlab.gnome.org/GNOME/gtk-vnc/-/merge_requests/8

So

Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


