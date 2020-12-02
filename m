Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5A42CB813
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:07:01 +0100 (CET)
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO6G-0005Sn-GG
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDM-0003st-Kr
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCb-0003pt-00
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCs0riI9kHM//7BOaTOgwbI1V82e+fKC6hbIAxErEfY=;
 b=PQgVSZWo7fbzTSDJuCk6jTwLMhoabLaWj566FhRFa8UnPxLT9FV12jj4Y6JTbmGp8VnGh2
 5L3l6ceRPcc0aTa7EfFQXThKTu+aPQrS3+789Q9JGLpxRBeHETzValAJ2ZwmbEBDEhIY+g
 j3Vjeu7BSwWtgiSQ2MwfobdrW05i+5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-fo-J25G4OBe92JwHJ0v_BQ-1; Wed, 02 Dec 2020 03:09:26 -0500
X-MC-Unique: fo-J25G4OBe92JwHJ0v_BQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C32648558E7
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87E875C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:25 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 096/113] Revert "scripts/kerneldoc: For Sphinx 3 use c:macro
 for macros with arguments"
Date: Wed,  2 Dec 2020 03:08:32 -0500
Message-Id: <20201202080849.4125477-97-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This reverts commit 92bb29f9b2c3d4a98eef5f0db935d4be291eec72.
We will replace the commit with the fix from Linux.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-15-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 073f72c7da..cb603532ed 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -860,23 +860,7 @@ sub output_function_rst(%) {
 	output_highlight_rst($args{'purpose'});
 	$start = "\n\n**Syntax**\n\n  ``";
     } else {
-        if ((split(/\./, $sphinx_version))[0] >= 3) {
-            # Sphinx 3 and later distinguish macros and functions and
-            # complain if you use c:function with something that's not
-            # syntactically valid as a function declaration.
-            # We assume that anything with a return type is a function
-            # and anything without is a macro.
-            if ($args{'functiontype'} ne "") {
-                print ".. c:function:: ";
-            } else {
-                print ".. c:macro:: ";
-            }
-        } else {
-            # Older Sphinx don't support documenting macros that take
-            # arguments with c:macro, and don't complain about the use
-            # of c:function for this.
-            print ".. c:function:: ";
-        }
+	print ".. c:function:: ";
     }
     if ($args{'functiontype'} ne "") {
 	$start .= $args{'functiontype'} . " " . $args{'function'} . " (";
-- 
2.26.2



