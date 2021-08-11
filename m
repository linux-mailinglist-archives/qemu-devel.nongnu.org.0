Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01D3E8A4E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:44:17 +0200 (CEST)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhyK-00085I-Ab
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhw2-0005KR-2D
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhw0-0006jP-Lk
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628664111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6sdFFnNJP1+6vn1D29/A7eQl6fMsuJ1cF4BNERGpRY=;
 b=FJf3+lodMYtcrYoVThXMsvH/Qrb669Ikza+j8yRWAsB+bbF0bMJ1/69tDnEMF0g6ovAtOf
 rEaQND6WAL4VzHX9PyfM1LXgUuY23iKtriee9JDzc7pjADg61udaP3aWpdWkVPnfvYXvKm
 D3jURwuLpwZaVfZMcj5odz6KSujXFZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-DKXNBwAxPHqMaYsx70lJLQ-1; Wed, 11 Aug 2021 02:41:50 -0400
X-MC-Unique: DKXNBwAxPHqMaYsx70lJLQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8266190A7A0
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 06:41:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 199F15D740;
 Wed, 11 Aug 2021 06:41:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 99A6C1800994; Wed, 11 Aug 2021 08:41:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] MAINTAINERS: update spice entry.
Date: Wed, 11 Aug 2021 08:41:25 +0200
Message-Id: <20210811064128.2776317-5-kraxel@redhat.com>
In-Reply-To: <20210811064128.2776317-1-kraxel@redhat.com>
References: <20210811064128.2776317-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Message-Id: <20210810083450.2377374-5-kraxel@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cb402d402ec..33b4fc25e349 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2470,7 +2470,7 @@ F: scripts/coccinelle/memory-region-housekeeping.cocci
 
 SPICE
 M: Gerd Hoffmann <kraxel@redhat.com>
-S: Supported
+S: Odd Fixes
 F: include/ui/qemu-spice.h
 F: include/ui/spice-display.h
 F: ui/spice-*.c
-- 
2.31.1


