Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90830276E9F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 12:24:21 +0200 (CEST)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLOQG-0003jv-L7
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 06:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUa-00039c-VI
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUZ-0006Cr-5l
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C75c8C5H3Uf5JEwtP0xToObs8W5BgAHw9Opy9pz7Mp0=;
 b=QXJTMMexH/QDm0R1ENhzoksh3vaIP7h+9IY9XdOqhwjqq3HlRQuvFsyFC4Z/6ZNwoJJpwY
 d96seVjMA7V9yvylUEH0YARQ/Tw+9y35g4R3CREgxSfjxGAceaJ5AXeHROKKYgQR6puouw
 k6d5fftFVM81VMadZnBwLKF1SQ6XK4Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-NaiDoUbSM2isKOR4y6Srkw-1; Thu, 24 Sep 2020 05:24:40 -0400
X-MC-Unique: NaiDoUbSM2isKOR4y6Srkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7022C1891E9D
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:24:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883D05C1C7;
 Thu, 24 Sep 2020 09:24:36 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 73/92] docs: Create docs/devel/qom.rst
Date: Thu, 24 Sep 2020 05:22:55 -0400
Message-Id: <20200924092314.1722645-74-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20200910221526.10041-9-ehabkost@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/index.rst | 1 +
 docs/devel/qom.rst   | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 docs/devel/qom.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 04773ce076..c34b43ec28 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -31,3 +31,4 @@ Contents:
    reset
    s390-dasd-ipl
    clocks
+   qom
diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
new file mode 100644
index 0000000000..dc5be79a4a
--- /dev/null
+++ b/docs/devel/qom.rst
@@ -0,0 +1,5 @@
+===========================
+The QEMU Object Model (QOM)
+===========================
+
+.. kernel-doc:: include/qom/object.h
-- 
2.26.2



