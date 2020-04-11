Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872CA1A4F2E
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Apr 2020 11:34:24 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNCWt-0001Jh-LR
	for lists+qemu-devel@lfdr.de; Sat, 11 Apr 2020 05:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39527)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cfontana@suse.de>) id 1jNCUZ-0006re-5Y
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 05:32:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cfontana@suse.de>) id 1jNCUY-0005nh-3y
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 05:31:58 -0400
Received: from mx2.suse.de ([195.135.220.15]:41736)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cfontana@suse.de>) id 1jNCUX-0005n6-Uz
 for qemu-devel@nongnu.org; Sat, 11 Apr 2020 05:31:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0414AAE52;
 Sat, 11 Apr 2020 09:31:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Philippe Mathieu-Daude <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH RESEND v3 2/2] Makefile: remove old compatibility gunks
Date: Sat, 11 Apr 2020 11:31:50 +0200
Message-Id: <20200411093150.4741-3-cfontana@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200411093150.4741-1-cfontana@suse.de>
References: <20200411093150.4741-1-cfontana@suse.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 195.135.220.15
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
Cc: Claudio Fontana <cfontana@suse.de>, Alex Bennee <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Makefile b/Makefile
index 7be15eeb7c..00377f28b9 100644
--- a/Makefile
+++ b/Makefile
@@ -567,12 +567,6 @@ slirp/all: .git-submodule-status
 		CC="$(CC)" AR="$(AR)" 	LD="$(LD)" RANLIB="$(RANLIB)"	\
 		CFLAGS="$(QEMU_CFLAGS) $(CFLAGS)" LDFLAGS="$(QEMU_LDFLAGS)")
 
-# Compatibility gunk to keep make working across the rename of targets
-# for recursion, to be removed some time after 4.1.
-subdir-dtc: dtc/all
-subdir-capstone: capstone/all
-subdir-slirp: slirp/all
-
 $(filter %/all, $(TARGET_DIRS_RULES)): libqemuutil.a $(common-obj-y) \
 	$(qom-obj-y)
 
-- 
2.16.4


