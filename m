Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42CB3C23F2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:03:49 +0200 (CEST)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qAU-00082Q-DN
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pz3-0004jX-GF
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pz1-0003e4-6V
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUjYRrPh/uMXJj5DcnYCcs6U4CPI7sd0Nwrnp8gCfz0=;
 b=cZMj7bNJ1xmB+WS32L3XWWfkXUc18/BglYSOeKrMXlFpauc7yNl4CuODs4gdV054DvHTH2
 0nAkGy+uvI9gfNFfc0V+YlzEQdEvnYHVXYRdynRijG0Va/usqVF+M2N2eMMijTradhe3ig
 c/9zCF4ITKsjTe1EgfpZuQFuFz46OMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-10h-n_meNdePR-Ysbh4V7w-1; Fri, 09 Jul 2021 08:51:52 -0400
X-MC-Unique: 10h-n_meNdePR-Ysbh4V7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64CB2100C660;
 Fri,  9 Jul 2021 12:51:51 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1632B60843;
 Fri,  9 Jul 2021 12:51:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/28] MAINTAINERS: add block/rbd.c reviewer
Date: Fri,  9 Jul 2021 14:50:24 +0200
Message-Id: <20210709125035.191321-18-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

adding myself as a designated reviewer.

Signed-off-by: Peter Lieven <pl@kamp.de>
Message-Id: <20210707180449.32665-2-pl@kamp.de>
Acked-by: Ilya Dryomov <idryomov@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 86ec36a062..0e9f338e32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3061,6 +3061,7 @@ F: block/vmdk.c
 
 RBD
 M: Ilya Dryomov <idryomov@gmail.com>
+R: Peter Lieven <pl@kamp.de>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/rbd.c
-- 
2.31.1


