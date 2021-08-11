Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ED83E8A59
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:46:43 +0200 (CEST)
Received: from localhost ([::1]:52102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDi0g-0004PH-1T
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhw7-0005bb-Bd
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhw6-0006oe-0U
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628664117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5J3o21QHwQuQB0HbNKa/c6ZjlhWUTYG1M9dczk7e/Ow=;
 b=OZJ0Z/3+2RF0algJVpPeUR7e9EKwtchxPhn12NqsQcIvSDmnkCb9F3MOoVfJBphGVHb4Ny
 y7va6KkHpy5RNnuJJUH6z3Babe0H22CTDdJ1mjFJsrrlEKPu5T8S8ILeKVQ6c5rw8qlOBx
 Oa4dd7hA7GTlBL6f60uRJ7KggZG0QeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-FiPoA2kNPpayHFGv0aoknQ-1; Wed, 11 Aug 2021 02:41:56 -0400
X-MC-Unique: FiPoA2kNPpayHFGv0aoknQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A69D190A7A1
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 06:41:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49BB710016F7;
 Wed, 11 Aug 2021 06:41:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE6A61800996; Wed, 11 Aug 2021 08:41:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] MAINTAINERS: update virtio-input entry.
Date: Wed, 11 Aug 2021 08:41:27 +0200
Message-Id: <20210811064128.2776317-7-kraxel@redhat.com>
In-Reply-To: <20210811064128.2776317-1-kraxel@redhat.com>
References: <20210811064128.2776317-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Message-Id: <20210810083450.2377374-7-kraxel@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b84b7e33e4d0..6e86426572a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1951,7 +1951,7 @@ L: virtio-fs@redhat.com
 
 virtio-input
 M: Gerd Hoffmann <kraxel@redhat.com>
-S: Maintained
+S: Odd Fixes
 F: hw/input/vhost-user-input.c
 F: hw/input/virtio-input*.c
 F: include/hw/virtio/virtio-input.h
-- 
2.31.1


