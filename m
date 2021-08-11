Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E81A3E8A94
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:51:43 +0200 (CEST)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDi5W-00052f-Ed
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhw7-0005cO-IC
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhw6-0006oh-6E
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628664117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaMh7+6eG8jr1hx2MZQU4tlL9XFxYGsJYUrJKYQXQ+Q=;
 b=DIKWgfKb4B+EwrFP6IeMWuL3JZJSYPJiOvXMgvNKaybe+b9K0ZFDEtnOEmiraiiREJJUWy
 hsnC1yIkh6TnD9NA88hKOgTtkHhLiL08c5SF5wH1zkt02KD/S+kZQ9Uf6C0nawahwtsIkF
 c6DIrQe46U9Dzc8iVidSffWsiof2Z+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-M8xy-0a-O96eahRCS8NTFg-1; Wed, 11 Aug 2021 02:41:56 -0400
X-MC-Unique: M8xy-0a-O96eahRCS8NTFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78D81C73A5
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 06:41:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BF834536;
 Wed, 11 Aug 2021 06:41:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B8D511800997; Wed, 11 Aug 2021 08:41:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] MAINTAINERS: update virtio-gpu entry.
Date: Wed, 11 Aug 2021 08:41:28 +0200
Message-Id: <20210811064128.2776317-8-kraxel@redhat.com>
In-Reply-To: <20210811064128.2776317-1-kraxel@redhat.com>
References: <20210811064128.2776317-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New maintainer wanted. Downgrade status to "Odd Fixes" for now.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210810083450.2377374-8-kraxel@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e86426572a3..6b3697962c1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2157,7 +2157,7 @@ F: include/hw/display/ramfb.h
 
 virtio-gpu
 M: Gerd Hoffmann <kraxel@redhat.com>
-S: Maintained
+S: Odd Fixes
 F: hw/display/virtio-gpu*
 F: hw/display/virtio-vga.*
 F: include/hw/virtio/virtio-gpu.h
@@ -2176,7 +2176,7 @@ F: include/hw/virtio/vhost-user-scsi.h
 
 vhost-user-gpu
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
-M: Gerd Hoffmann <kraxel@redhat.com>
+R: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
 F: docs/interop/vhost-user-gpu.rst
 F: contrib/vhost-user-gpu
-- 
2.31.1


