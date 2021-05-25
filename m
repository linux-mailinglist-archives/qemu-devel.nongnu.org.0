Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EEA38FFCF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:13:33 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llV08-0006i5-3T
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1llUye-0004fK-7D
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1llUyb-0002zG-1O
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621941114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cJztT3qfkyuJ2gheRDrvs1N9d1zlBzm7FOG6hz7uXks=;
 b=cdYMNii4g+WrKQ9EYe0qONjVHSPyqYY640VjQZTgj7FlL4U/Py/jdFtg1+S+juj/gtV64g
 hwsBGpS9tO+o+SqEfpFzz8fRUhZdC9Z4xQlANF7Jv4GEABLCmtRRwMzqkvhUtXLRb2swVi
 yTKQ8mpjXAGx7ZiWdMYdhJhAH1fpkg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-QuHBMgZJOHKIPJmFE2iiLQ-1; Tue, 25 May 2021 07:11:53 -0400
X-MC-Unique: QuHBMgZJOHKIPJmFE2iiLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49D9A801B12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 11:11:52 +0000 (UTC)
Received: from thuth.com (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7014A6F135;
 Tue, 25 May 2021 11:11:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH] configure: Do not add --warn-common to the linker flags
 anymore
Date: Tue, 25 May 2021 13:11:49 +0200
Message-Id: <20210525111149.131222-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are compiling with -fno-common since commit 4c288acbd6 ("configure:
Always build with -fno-common"), so --warn-common (which had been added
in commit 49237acdb725e in 2008 already) should not be necessary anymore
nowadays.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Marked as RFC since I'm not 100% sure whether I'm missing here something...
 but IMHO the --warn-common does not buy us anything if we also compile
 with -fno-common...

 configure | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/configure b/configure
index 86a8a7e44f..99b9216af3 100755
--- a/configure
+++ b/configure
@@ -5383,13 +5383,6 @@ fi
 
 ##########################################
 
-# Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
-if test "$solaris" = "no" && test "$tsan" = "no"; then
-    if $ld --version 2>/dev/null | grep "GNU ld" >/dev/null 2>/dev/null ; then
-        QEMU_LDFLAGS="-Wl,--warn-common $QEMU_LDFLAGS"
-    fi
-fi
-
 # Use ASLR, no-SEH and DEP if available
 if test "$mingw32" = "yes" ; then
     flags="--no-seh --nxcompat"
-- 
2.27.0


