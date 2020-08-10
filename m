Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A3B240BB5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 19:13:32 +0200 (CEST)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5BMZ-0003hS-3i
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 13:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIn-0005jb-S3
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54099
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k5BIm-0002kK-BU
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 13:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597079375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=UrSwDkPgGhedoZk8uAsSqPZsW0Yj5KtsdiJaF9EI/lY=;
 b=TGPTA7+RNZcFbPNe/5KTri3Km3Vp++NX5OIHW5kun+oLPMep1XnxsclyvlPSmY8i26A7Vm
 D1F8INtHNNXSDy9hM9xXjbGpUI5RaWG9Miyi4ImjtQIomI1uPG0HFFQ4u7IGAcNWYBKxdR
 eK6h7RipyzL8d4XrdmwWWite9IiuCCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-dnLgfsu4N7K_StgYI_zTzw-1; Mon, 10 Aug 2020 13:09:33 -0400
X-MC-Unique: dnLgfsu4N7K_StgYI_zTzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA70C79EC0
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:32 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CCCB5F1E9
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 17:09:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 014/147] tests/vm: include setuptools
Date: Mon, 10 Aug 2020 19:06:52 +0200
Message-Id: <1597079345-42801-15-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 03:31:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

They are a dependency of Meson, so install them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/vm/freebsd | 1 +
 tests/vm/netbsd  | 1 +
 tests/vm/openbsd | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 29252fa..b34b14f 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -33,6 +33,7 @@ class FreeBSDVM(basevm.BaseVM):
         "pkgconf",
         "bzip2",
         "python37",
+        "py37-setuptools",
 
         # gnu tools
         "bash",
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 2e87199..93d48b6 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -31,6 +31,7 @@ class NetBSDVM(basevm.BaseVM):
         "pkgconf",
         "xz",
         "python37",
+        "py37-setuptools",
 
         # gnu tools
         "bash",
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index dfe633e..7e27fda 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -30,6 +30,7 @@ class OpenBSDVM(basevm.BaseVM):
         "git",
         "pkgconf",
         "bzip2", "xz",
+        "py3-setuptools",
 
         # gnu tools
         "bash",
-- 
1.8.3.1



