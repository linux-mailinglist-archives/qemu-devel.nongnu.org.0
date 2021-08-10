Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A73E559E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:38:26 +0200 (CEST)
Received: from localhost ([::1]:50240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNHF-00059t-JA
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNEA-0005ua-JX
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNE9-0006N6-0p
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628584512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5nMflC19ecxieOhdjBJlUkTghao5VGxkmoTbtJRh2c=;
 b=SMmVISEBFvJZPWxm1KZ10XKEPDOgiM/G4HDDAh9Xedcydb+anQqLNxtvwBQZwaOHUM/b4t
 vkeSwvIznZ8SqdSL3XO2f0Q7Ghn0eV6EO0AulaOL7j4CVozygafK9jW+SarAGq/fg53O+C
 18UmUrQSzsHgnccjT8BWvY8xAVxdhIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-tp1avq_xOOiNyEUHjb2gcA-1; Tue, 10 Aug 2021 04:35:11 -0400
X-MC-Unique: tp1avq_xOOiNyEUHjb2gcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F1828B176B
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:34:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 967135E7D9;
 Tue, 10 Aug 2021 08:34:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 88326180092B; Tue, 10 Aug 2021 10:34:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] MAINTAINERS: update spice entry.
Date: Tue, 10 Aug 2021 10:34:47 +0200
Message-Id: <20210810083450.2377374-5-kraxel@redhat.com>
In-Reply-To: <20210810083450.2377374-1-kraxel@redhat.com>
References: <20210810083450.2377374-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90dfe93d7246..ef916c993472 100644
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


