Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C12E39E090
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:33:33 +0200 (CEST)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHFr-00021M-Dv
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHEZ-0000GW-Va
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:32:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqHEV-00029A-Cy
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623079926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tS3fh42pSztgEM+8BG0zwbpPJtZX3iyUdEjmnKh4xK4=;
 b=d0Ikp9R2XEhutO34IeSy9ShKhsuK5PmUIK6WvTNo2mH8i09Y5UyN7lUylIX1naJstOTyyd
 M3l59wX0MaNYlJ9ZXexfy49o5xaszRLpWwjw3Nv4K7wGMv00+hbIB1q/Ue0QvPY8327z2g
 r/KQFWj2dNzV+EUEht5lTfW192mtfVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326--jv-9Yx7Pu25rS8Iv8q45g-1; Mon, 07 Jun 2021 11:32:03 -0400
X-MC-Unique: -jv-9Yx7Pu25rS8Iv8q45g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49EC980EDAA;
 Mon,  7 Jun 2021 15:32:02 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 273365D9D3;
 Mon,  7 Jun 2021 15:32:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] GitLab: Add "Bug" issue reporting template
Date: Mon,  7 Jun 2021 11:31:54 -0400
Message-Id: <20210607153155.1760158-2-jsnow@redhat.com>
In-Reply-To: <20210607153155.1760158-1-jsnow@redhat.com>
References: <20210607153155.1760158-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
 .gitlab/issue_templates/bug.md | 64 ++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 .gitlab/issue_templates/bug.md

diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
new file mode 100644
index 0000000000..e910f7b1c2
--- /dev/null
+++ b/.gitlab/issue_templates/bug.md
@@ -0,0 +1,64 @@
+<!--
+This is the upstream QEMU issue tracker.
+
+If you are able to, it will greatly facilitate bug triage if you attempt
+to reproduce the problem with the latest qemu.git master built from
+source. See https://www.qemu.org/download/#source for instructions on
+how to do this.
+
+QEMU generally supports the last two releases advertised on
+https://www.qemu.org/. Problems with distro-packaged versions of QEMU
+older than this should be reported to the distribution instead.
+
+See https://www.qemu.org/contribute/report-a-bug/ for additional
+guidance.
+
+If this is a security issue, please consult
+https://www.qemu.org/contribute/security-process/
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
+-->
+
+<!--
+The line below ensures that proper tags are added to the issue.
+Please do not remove it.
+-->
+/label ~"kind::Bug"
-- 
2.31.1


