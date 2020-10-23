Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE52972F1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 17:54:39 +0200 (CEST)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVzOo-0005Xu-TI
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 11:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kVz1R-0007ok-Mp
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:30:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kVz1P-0001u7-Or
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 11:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603467026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDZVObZ+IAM4dBjukBIAQNm/sgOhF4MZC41ejzRS10s=;
 b=bfDfAd1K1WRukJDSgUztKxmNKyqcUk29EBT28b62heZBAaJW6VyP9pvZIqlEpxMTsj3vQC
 KvsCStfTKE6sL3qJAu4cUlrv4I/LDUMcuhHqVYFwMSFStm4ctjst9r2z3W3mqDoTTELoqy
 vsW3XozaN2JX9HHJIqnh81sx7olWWPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-2sfL_3PbNHiZuLjlp3jAVA-1; Fri, 23 Oct 2020 11:30:21 -0400
X-MC-Unique: 2sfL_3PbNHiZuLjlp3jAVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD52E196632A
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 15:30:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-189.ams2.redhat.com
 [10.36.113.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CD635B4B4;
 Fri, 23 Oct 2020 15:30:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH 7/7] Add a CONTRIBUTING.md file as guidance for
 contributors
Date: Fri, 23 Oct 2020 16:29:57 +0100
Message-Id: <20201023152957.488974-8-berrange@redhat.com>
In-Reply-To: <20201023152957.488974-1-berrange@redhat.com>
References: <20201023152957.488974-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 CONTRIBUTING.md | 32 ++++++++++++++++++++++++++++++++
 _config.yml     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 CONTRIBUTING.md

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
new file mode 100644
index 0000000..0be58d8
--- /dev/null
+++ b/CONTRIBUTING.md
@@ -0,0 +1,32 @@
+# Contributing to qemu-web
+
+The QEMU project accepts code contributions to the website as patches sent to
+the the developer mailing list:
+
+https://lists.nongnu.org/mailman/listinfo/qemu-devel
+
+For further guidance on sending patches consult:
+
+https://wiki.qemu.org/Contribute/SubmitAPatch
+
+It is expected that contributors check the rendered website before submitting
+patches. This is possible by either running jekyll locally, or by using the
+GitLab CI and Pages infrastructure.
+
+Any branch that is pushed to a GitLab fork will result in a CI job being run
+visible at
+
+https://gitlab.com/yourusername/libvirt-perl/pipelines
+
+The rendered result can be then viewed at
+
+https://yourusername.gitlab.io/qemu-web
+
+Contributions submitted to the project must be in compliance with the
+Developer Certificate of Origin Version 1.1. This is documented at:
+
+https://developercertificate.org/
+
+To indicate compliance, each commit in a series must have a "Signed-off-by"
+tag with the submitter's name and email address. This can be added by passing
+the ``-s`` flag to ``git commit`` when creating the patches.
diff --git a/_config.yml b/_config.yml
index d0473c1..7d34779 100644
--- a/_config.yml
+++ b/_config.yml
@@ -40,3 +40,4 @@ exclude:
   - Gemfile.lock
   - vendor/
   - README
+  - CONTRIBUTING.md
-- 
2.26.2


