Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035B83B0557
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:57:10 +0200 (CEST)
Received: from localhost ([::1]:40838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfxl-0006xU-1n
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfsH-0006uh-RZ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvfsF-0000rU-Pv
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624366284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVLR4nyfl/9ugHyAatbOdExKd0NGwpydZQ/qEvg99i4=;
 b=DRyXFAAxoDJTCFW1cX8nD9JzeZo1Np2e3WknvfDkGZOGd/1+C8lFtsHjQuHs0pGhim+ih6
 eDSevts+tOLDjI+cZodlSceqNOA7v9JDHCW2z3+L2ncApkyFDbPmBJeX3rZ+jS9ur0jCZU
 Fsul/tNb1NxbC+1Q1mRxVjHcOqPZhaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-EPuI7RMfNvaTE4uYYRWa4w-1; Tue, 22 Jun 2021 08:51:23 -0400
X-MC-Unique: EPuI7RMfNvaTE4uYYRWa4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 621EF804140
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:51:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1F0860C13;
 Tue, 22 Jun 2021 12:51:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E21821800913; Tue, 22 Jun 2021 14:51:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] modules: hook up modules.h to docs build
Date: Tue, 22 Jun 2021 14:51:10 +0200
Message-Id: <20210622125110.262843-5-kraxel@redhat.com>
In-Reply-To: <20210622125110.262843-1-kraxel@redhat.com>
References: <20210622125110.262843-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 docs/devel/index.rst   | 1 +
 docs/devel/modules.rst | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 docs/devel/modules.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 977c3893bdaf..ba90badbbd6d 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -41,6 +41,7 @@ Contents:
    s390-dasd-ipl
    clocks
    qom
+   modules
    block-coroutine-wrapper
    multi-process
    ebpf_rss
diff --git a/docs/devel/modules.rst b/docs/devel/modules.rst
new file mode 100644
index 000000000000..066f347b89ba
--- /dev/null
+++ b/docs/devel/modules.rst
@@ -0,0 +1,5 @@
+============
+Qemu modules
+============
+
+.. kernel-doc:: include/qemu/module.h
-- 
2.31.1


