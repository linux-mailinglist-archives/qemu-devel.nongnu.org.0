Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6B3A98E0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 13:09:16 +0200 (CEST)
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltTQ3-0007ne-F8
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 07:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOU-0005j0-5K
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltTOR-0000EF-47
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 07:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623841653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ra3S2CuGOsAE+po258R8ftgz9Ve6hgCVD3UtoJp023M=;
 b=fZscvM90c5nlJWFsrm5U+o66SKkX00mYC057vw92kcS2f7ns1SMS1Hr8kr1GL/yY/ntD3V
 eAchxKjrMr20N7NX676Ue0tJFeYQfjwp65102Y9T/KzDOQJjizSX2r8EOl5q9s4Rx5dh/v
 w7z+NCZvlhnOhHlhiq2DRxdL4zx/IQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-JRt2VeJNNXOdZaOmIuBPOg-1; Wed, 16 Jun 2021 07:07:31 -0400
X-MC-Unique: JRt2VeJNNXOdZaOmIuBPOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A84E19200C1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:07:31 +0000 (UTC)
Received: from thuth.com (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 169B36060F;
 Wed, 16 Jun 2021 11:07:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [qemu-web PATCH 2/4] css: Improve the hover effect of the buttons
Date: Wed, 16 Jun 2021 13:07:18 +0200
Message-Id: <20210616110720.880586-3-thuth@redhat.com>
In-Reply-To: <20210616110720.880586-1-thuth@redhat.com>
References: <20210616110720.880586-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: berrange@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The hover effect of buttons was hardly visible since the color did
not change much. Use a brighter color to make it clear that the
button can be pressed.

Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/1
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 assets/css/style.css | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/assets/css/style.css b/assets/css/style.css
index 6ee82c4..bed0bf4 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -304,7 +304,7 @@
 
 	.button:hover
 	{
-		background: #F01111;
+		background: #F68811;
 		text-decoration: none;
 	}
 
-- 
2.27.0


