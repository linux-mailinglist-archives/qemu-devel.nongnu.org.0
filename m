Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF326BEDF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 10:12:55 +0200 (CEST)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kISYg-0002X0-DY
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 04:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kISXX-0001JI-Ax
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 04:11:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kISXV-0003oJ-L5
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 04:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600243900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=21NAeuTj0abPnIKf+MtoAY/tsr+YSACyz1DlDKk6EGw=;
 b=INkeH98sBu3//21Zn/15H1VRG7h2Anjhrzx8dWPPx2Z0WXBrCyEeowpavyed8WGZDmDBBt
 H2TbugYANiMjJ5Six27ENwXq5kGsO/ir+KMhaePky0pshlUNK8puXiVlzrp9G3qJTepkjB
 y9C36aMPHXbD0M6okbjZAU6K46QTrOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-88L1XEZ5P1CZ1pRbcj3kzA-1; Wed, 16 Sep 2020 04:11:37 -0400
X-MC-Unique: 88L1XEZ5P1CZ1pRbcj3kzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 217858030CC;
 Wed, 16 Sep 2020 08:11:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C09E519728;
 Wed, 16 Sep 2020 08:11:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: do not limit Hypervisor.framework test to Darwin
Date: Wed, 16 Sep 2020 04:11:31 -0400
Message-Id: <20200916081131.21775-2-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:35:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christophe de Dinechin <dinechin@redhat.com>, r.bolshakov@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because the target/i386/hvf/meson.build rule culls hvf support
on non-Darwin systems, a --enable-hvf build is succeeding.
To fix this, just try the compilation test every time someone
passes --enable-hvf.

Reported-by: Christophe de Dinechin <dinechin@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index b4c0e0d07c..14b06a2510 100755
--- a/configure
+++ b/configure
@@ -863,7 +863,7 @@ Darwin)
   bsd="yes"
   darwin="yes"
   hax="yes"
-  hvf="yes"
+  hvf=""
   if [ "$cpu" = "x86_64" ] ; then
     QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
     QEMU_LDFLAGS="-arch x86_64 $QEMU_LDFLAGS"
@@ -5867,16 +5867,18 @@ fi
 
 #################################################
 # Check to see if we have the Hypervisor framework
-if [ "$darwin" = "yes" ] ; then
+if [ "$hvf" != "no" ] ; then
   cat > $TMPC << EOF
 #include <Hypervisor/hv.h>
 int main() { return 0;}
 EOF
   if ! compile_object ""; then
+    if test "$hvf" = "yes"; then
+	error_exit "Hypervisor.framework not available"
+    fi
     hvf='no'
   else
     hvf='yes'
-    QEMU_LDFLAGS="-framework Hypervisor $QEMU_LDFLAGS"
   fi
 fi
 
-- 
2.26.2


