Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E6038CC70
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:42:56 +0200 (CEST)
Received: from localhost ([::1]:34078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9Al-0002d5-HO
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk96W-0008Ux-L1
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk96T-0004bU-As
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621618708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rK2JHi+c2Xcndehcw8u7RpDqk+/YosoeqCceMOlay5M=;
 b=VmcoQj0MB5pAxS4C3YbBck8IwPWy/YPe6qlsjKsKBb0GzppE5UToeDPaof6LrBX2Lpwjz3
 BV/u2ZjCHs/7wxq3hYpIkfsQRXl3nK6fdlv0R5+vUX2CzNrt9Jum1squCgZnj/I83VL7IM
 Fu8xwG7+RJzA0sQhFbYBka4+yu5+uuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-BokVyu2gOUm0VcVyqaCMnQ-1; Fri, 21 May 2021 13:38:25 -0400
X-MC-Unique: BokVyu2gOUm0VcVyqaCMnQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0382B1005D4E;
 Fri, 21 May 2021 17:38:25 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5E111007623;
 Fri, 21 May 2021 17:38:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] GitLab: Add "Bug" issue reporting template
Date: Fri, 21 May 2021 13:38:17 -0400
Message-Id: <20210521173818.255817-2-jsnow@redhat.com>
In-Reply-To: <20210521173818.255817-1-jsnow@redhat.com>
References: <20210521173818.255817-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 .gitlab/issue_templates/bug.md | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 .gitlab/issue_templates/bug.md

diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
new file mode 100644
index 00000000000..67a02a3ffcf
--- /dev/null
+++ b/.gitlab/issue_templates/bug.md
@@ -0,0 +1,61 @@
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
+ - Operating system: (Windows 10 21H1, Fedora 34, etc.)
+ - OS/kernel version: (For POSIX hosts, use `uname -a`)
+ - Architecture: (x86, ARM, s390x, etc.)
+ - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)
+ - QEMU version: (e.g. `qemu-system-x86_64 --version`)
+ - QEMU command line:
+   <!--
+   Give the smallest, complete command line that exhibits the problem.
+
+   If you are using libvirt, virsh, or vmm, you can likely find the QEMU
+   command line arguments in /var/log/libvirt/qemu/$GUEST.log.
+   -->
+   ```
+   ./qemu-system-x86_64 -M q35 -m 4096 -enable-kvm -hda fedora32.qcow2
+   ```
+
+## Emulated/Virtualized environment
+ - Operating system: (Windows 10 21H1, Fedora 34, etc.)
+ - OS/kernel version: (For POSIX guests, use `uname -a`.)
+ - Architecture: (x86, ARM, s390x, etc.)
+
+
+## Description of problem
+<!-- Describe the problem, including any error/crash messages seen. -->
+
+## Steps to reproduce
+1.
+2.
+3.
+
+
+## Additional information
+
+<!--
+Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
+If using libvirt, libvirt logs and XML domain information may be relevant.
+
+See https://qemu-project.gitlab.io/qemu/devel/tracing.html on how to
+configure additional QEMU logging.
+-->
+
+<!--
+The line below ensures that proper tags are added to the issue.
+Please do not remove it.
+-->
+/label ~"kind::Bug"
-- 
2.30.2


