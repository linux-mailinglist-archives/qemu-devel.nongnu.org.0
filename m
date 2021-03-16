Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE733D420
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:43:44 +0100 (CET)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM931-00018Y-EQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lM91b-000811-OF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:42:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lM91a-00082B-3t
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615898533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uTbGyBj/reHj7OstA2iSj4P9szN2HEnzeh0tTXKZi8I=;
 b=c36+3swPeODzsLUQNlfNKTri8Cv9fKo6numxcybaKYkc65eHvtj/1mZthWM+YoGHYTcOcD
 c9inF6e6y27lXsyd2SKN843m2qCZ04GvZzJnT107pTXLsAzlqOAyjCfNlsL4jTwr4e6vi1
 xvwBvpjovkerMNolEK9ITmgNur/Wl9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-AmBiL1EfPFSWJKDsaOd3Dg-1; Tue, 16 Mar 2021 08:42:11 -0400
X-MC-Unique: AmBiL1EfPFSWJKDsaOd3Dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFBC3802B7A
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 12:42:10 +0000 (UTC)
Received: from thuth.com (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B5D1610F0;
 Tue, 16 Mar 2021 12:42:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] docs: Remove obsolete paragraph about config-target.mak
Date: Tue, 16 Mar 2021 13:42:08 +0100
Message-Id: <20210316124208.455456-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$TARGET-NAME/config-target.mak has been removed a while ago.
Remove it now from the documentation, too.

Fixes: fdb75aeff7 ("configure: remove target configuration")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/build-system.rst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 69ce3087e3..7ef36f42d0 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -426,14 +426,6 @@ Built by configure:
   build outputs. Variables which are potentially different for each
   emulator target are defined by the next file...
 
-`$TARGET-NAME/config-target.mak`
-  TARGET-NAME is the name of a system or userspace emulator, for example,
-  x86_64-softmmu denotes the system emulator for the x86_64 architecture.
-  This file contains the variables which need to vary on a per-target
-  basis. For example, it will indicate whether KVM or Xen are enabled for
-  the target and any other potential custom libraries needed for linking
-  the target.
-
 
 Built by Meson:
 
-- 
2.27.0


