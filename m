Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44821E038
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 20:53:52 +0200 (CEST)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv3aJ-0007im-F5
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 14:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jv3ZK-0007Gz-Hi
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 14:52:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43049
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jv3ZI-0000z0-7i
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 14:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594666366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=AJoez86rF8SRrrU+//Vtlx4qNH9UTvql+NfMdGRwGms=;
 b=GRoXoD7XEKx2N4Ub5DM87wKp63dYafMuPKn1LcDOkrRTZvV9Pez1/X2jSViIgFx15CyC6s
 ON5SnrKZl+G7hLhiauEl8vanmczoqVQNT/VQHP68rjlz9BEazy/MrpyZJFVKXmHOzix3vY
 zrpdp0fyjlBXMyAgmOKiDPe6Eas7aRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-wSk3cOIAOSSnZrkMqBEAgg-1; Mon, 13 Jul 2020 14:52:42 -0400
X-MC-Unique: wSk3cOIAOSSnZrkMqBEAgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF3BE934;
 Mon, 13 Jul 2020 18:52:40 +0000 (UTC)
Received: from thuth.com (ovpn-112-92.ams2.redhat.com [10.36.112.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B533D10013D0;
 Mon, 13 Jul 2020 18:52:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/docker: Remove the libssh workaround from the
 ubuntu 20.04 image
Date: Mon, 13 Jul 2020 20:52:37 +0200
Message-Id: <20200713185237.9419-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The libssh problem only exists in Ubuntu 18.04 - we can enable it
in 20.04 again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/ubuntu2004.docker | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index f7aac840bf..8d10934a2a 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -65,9 +65,6 @@ RUN apt-get update && \
 RUN dpkg -l $PACKAGES | sort > /packages.txt
 ENV FEATURES clang tsan pyyaml sdl2
 
-# https://bugs.launchpad.net/qemu/+bug/1838763
-ENV QEMU_CONFIGURE_OPTS --disable-libssh
-
 # Apply patch https://reviews.llvm.org/D75820
 # This is required for TSan in clang-10 to compile with QEMU.
 RUN sed -i 's/^const/static const/g' /usr/lib/llvm-10/lib/clang/10.0.0/include/sanitizer/tsan_interface.h
-- 
2.18.1


