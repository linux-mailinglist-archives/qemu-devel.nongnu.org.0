Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D06265511
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 00:28:23 +0200 (CEST)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGV3G-0005ef-Lm
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 18:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGUr1-0001gW-TI
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 18:15:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45539
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGUqz-0002Z4-CD
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 18:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599776140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmwDN3Od7TIxOLT6rZuXjwWjKq2mx8rElfFpX37Okgk=;
 b=Cx5c8LPjS116GVSiSCdw+p1+Y+GYYV0CsKg3310QVIppgbXDpsTSIk7/aBFDUJCmvuvcOV
 gTNoBGzXfIw+UqH2wpvuszlo9B2a5y8Wv+HANtu9QBlQxrjA+559LJR+iI13HOj4eS3qNZ
 bzzoC6a/e1KSkHcibw/TVf8dSeaG80Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-GF7Zy9JjM9qtxco2jKCBEQ-1; Thu, 10 Sep 2020 18:15:38 -0400
X-MC-Unique: GF7Zy9JjM9qtxco2jKCBEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4275D1084C85;
 Thu, 10 Sep 2020 22:15:37 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D67C75121;
 Thu, 10 Sep 2020 22:15:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] docs: Create docs/devel/qom.rst
Date: Thu, 10 Sep 2020 18:15:25 -0400
Message-Id: <20200910221526.10041-9-ehabkost@redhat.com>
In-Reply-To: <20200910221526.10041-1-ehabkost@redhat.com>
References: <20200910221526.10041-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 18:15:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
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


