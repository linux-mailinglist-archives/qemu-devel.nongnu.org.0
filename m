Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265AB3F58FC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 09:28:02 +0200 (CEST)
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIQqm-0001zx-SI
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 03:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIQq4-0001Ks-4r
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 03:27:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIQq2-0005aP-OD
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 03:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629790033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FkUg6oqhLzcZH2IqLC0FHeckOqsq02A73ejeZYS6aVo=;
 b=bjtm6zi7a2NNbZzbqSCShli1bvM/r5BRSISWH2gIVxpDlGvNSdZ6faAf7n+o1ZTdHELa2K
 8VBNDIk2Y6YaG0t9jioMXo9kJAb2Y+QmyYWAkuY2gXVdtPzT5JdyGTC2e4azXmZfM55esE
 9jHsXofL+htpsb2qW66KInC1ykRjrn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-Xv0MvFUuNKejLHBUnQSrmA-1; Tue, 24 Aug 2021 03:27:10 -0400
X-MC-Unique: Xv0MvFUuNKejLHBUnQSrmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8398887D541;
 Tue, 24 Aug 2021 07:27:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CD981F6;
 Tue, 24 Aug 2021 07:27:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [qemu-web PATCH] Update the information about the required version of
 macOS
Date: Tue, 24 Aug 2021 09:27:02 +0200
Message-Id: <20210824072702.520187-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The versions that we specify for macOS are way too old already. Let's
rephrase this without specific version numbers, pointing the users
to the latest version instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 _download/macos.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/_download/macos.md b/_download/macos.md
index 06aa811..6832436 100644
--- a/_download/macos.md
+++ b/_download/macos.md
@@ -6,5 +6,5 @@ QEMU can be installed from <strong>MacPorts</strong>:
 
 <pre>sudo port install qemu</pre>
 
-QEMU requires Mac OS X 10.5 or later, but it is recommended
-to use Mac OS X 10.7 or later.
+QEMU requires the latest version of macOS (or at least the previous one if
+it is not out of service yet).
-- 
2.27.0


