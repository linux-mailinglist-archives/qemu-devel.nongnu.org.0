Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7A24D250
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:29:21 +0200 (CEST)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94IS-0002dl-En
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94DB-0000my-Be
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94D8-0001SN-Uu
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgLa8OOgysOf7Sl9OK2QDbGQukQVDXrVrkDaQKpgc84=;
 b=If6nUiX6b5/CirERaLZb5mNdcyANTf8Dw3YsHXx0MLaINrv+N5pWeO6UtqyLt6K8TdyMpl
 uYswYosSIvl6taJUisSn6LXL3DsC4MLN6sRMsMCrgkpQRCqinWkVinlL16GOyPdT8jCLc7
 BOZRQd/EKysTwhHEAlFlCKsCwMZBCCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-6JMFfSczNLqJQfJTOjmoZw-1; Fri, 21 Aug 2020 06:23:48 -0400
X-MC-Unique: 6JMFfSczNLqJQfJTOjmoZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C32838030D1
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:23:47 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 909805DA74
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:23:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 015/152] tests/vm: include setuptools
Date: Fri, 21 Aug 2020 06:21:12 -0400
Message-Id: <20200821102329.29777-16-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
index 29252fa4a6..b34b14fc53 100755
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
index 2e87199211..93d48b6fdd 100755
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
index dfe633e453..7e27fda642 100755
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
2.26.2



