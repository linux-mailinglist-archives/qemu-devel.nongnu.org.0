Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C533898A2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 23:33:52 +0200 (CEST)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljTp9-0007c0-NI
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 17:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljTnd-00056r-CC
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljTnb-0004Hk-HW
 for qemu-devel@nongnu.org; Wed, 19 May 2021 17:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621459934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tWlr7jbZQ55nHdX3A7ehw5MjxXoRzmBBTO+L1xK7O7I=;
 b=PBk7m+SxuRUgIn6ikveNNsxp4rJ2yYsv/sV5SQBCtKesc+nRGpgRRjnzbka5WKBwJUutgr
 9XNnfiJs5kBziiLxB7lIfnX8eTjvKlIZKklVerVIUDUT3RAjc/J8jXCkjD7Fdtf6bUxk2M
 5EiqT7li5PKDv/nGLXXlcU4ypitACok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-GtV2FgClNfKO5WF8L0Jmcg-1; Wed, 19 May 2021 17:32:11 -0400
X-MC-Unique: GtV2FgClNfKO5WF8L0Jmcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B60B6D24A;
 Wed, 19 May 2021 21:32:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A7101037F21;
 Wed, 19 May 2021 21:32:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Gitlab: Add "Bug" issue reporting template
Date: Wed, 19 May 2021 17:32:01 -0400
Message-Id: <20210519213202.3979359-2-jsnow@redhat.com>
In-Reply-To: <20210519213202.3979359-1-jsnow@redhat.com>
References: <20210519213202.3979359-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based loosely on libvirt's template, written by Peter Krempa.

CC: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab/issue_templates/bug.md | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 .gitlab/issue_templates/bug.md

diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
new file mode 100644
index 00000000000..3f31b5e4a09
--- /dev/null
+++ b/.gitlab/issue_templates/bug.md
@@ -0,0 +1,52 @@
+<!--
+This is the upstream QEMU issue tracker.
+
+Before submitting a bug, please attempt to reproduce your problem using
+the latest development version of QEMU obtained from
+https://gitlab.com/qemu-project/qemu/.
+
+QEMU generally supports the last two releases advertised via
+https://www.qemu.org/. Problems with distro-packaged versions of QEMU
+older than this should be reported to the distribution instead.
+
+See https://www.qemu.org/contribute/report-a-bug/ for guidance.
+-->
+
+## Host environment
+ - Operating system: <!-- Windows 10, Fedora 34, etc. -->
+ - OS/kernel version: <!-- For POSIX hosts, use `uname -a` -->
+ - Architecture: <!-- x86, ARM, etc. -->
+ - QEMU flavor: <!-- qemu-system-x86_64, qemu-aarch64, qemu-img, etc. -->
+ - QEMU version: <!-- `qemu-system-x86_64 --version` -->
+ - QEMU command line:
+   <!--
+   Provide the smallest (but complete) command line that reproduces the problem.
+   Example:
+       ./qemu-system-x86_64 -M q35 -m 4096 -enable-kvm -hda fedora32.qcow2
+   -->
+   ```
+   Insert command line here.
+   ```
+
+## Emulated/Virtualized environment
+ - Operating system: <!-- Windows 10 21H1, Fedora 34, etc. -->
+ - OS/kernel version: <!-- For POSIX guests, use `uname -a` -->
+ - Architecture: <!-- x86, ARM, s390x, etc. -->
+
+
+## Description of problem
+
+
+## Steps to reproduce
+1.
+2.
+3.
+
+
+## Additional information
+<!-- Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
+<!-- See https://qemu-project.gitlab.io/qemu/devel/tracing.html on how to configure additional QEMU logging. -->
+
+
+<!-- The line below ensures that proper tags are added to the issue. Please do not remove it. -- >
+/label ~"kind::Bug"
-- 
2.30.2


