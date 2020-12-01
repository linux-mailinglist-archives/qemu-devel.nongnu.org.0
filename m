Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F522CA07A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:54:33 +0100 (CET)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3Im-0003ir-V5
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30G-0002NW-MI
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk304-0003pt-OZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eg1UCSP6TBFRjWh8o362r/gExEhG9FGt2zB8v+faRZc=;
 b=Kf1aGm+UkQC7Y+e2G9z6zA/JMiroctTRJbr5Zo8Qyzjjmar9OY0raq134aN7rxBRKfgSfi
 blSMpulH2af2wmdxDyE+zvyFvMpiDeq31drWuP6dBIRQMogCxo8Vw9pij430z4uQT7PVlw
 ZhZ3fpydDXx+AAQXZh9Em38hJrQDbLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-AMG37k7NM7KFW4YgbGAxQA-1; Tue, 01 Dec 2020 05:35:09 -0500
X-MC-Unique: AMG37k7NM7KFW4YgbGAxQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEEC58558EB;
 Tue,  1 Dec 2020 10:35:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99A7310023B1;
 Tue,  1 Dec 2020 10:35:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/32] scripts: kernel-doc: add support for typedef enum
Date: Tue,  1 Dec 2020 05:34:44 -0500
Message-Id: <20201201103502.4024573-15-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The PHY kernel-doc markup has gained support for documenting
a typedef enum.

However, right now the parser was not prepared for it.

So, add support for parsing it.

Fixes: 4069a572d423 ("net: phy: Document core PHY structures")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-14-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index c4c5640ded..073f72c7da 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1295,14 +1295,22 @@ sub show_warnings($$) {
 sub dump_enum($$) {
     my $x = shift;
     my $file = shift;
+    my $members;
+
 
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
     # strip #define macros inside enums
     $x =~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
 
-    if ($x =~ /enum\s+(\w*)\s*\{(.*)\}/) {
+    if ($x =~ /typedef\s+enum\s*\{(.*)\}\s*(\w*)\s*;/) {
+	$declaration_name = $2;
+	$members = $1;
+    } elsif ($x =~ /enum\s+(\w*)\s*\{(.*)\}/) {
 	$declaration_name = $1;
-	my $members = $2;
+	$members = $2;
+    }
+
+    if ($declaration_name) {
 	my %_members;
 
 	$members =~ s/\s+$//;
@@ -1337,8 +1345,7 @@ sub dump_enum($$) {
 			    'sections' => \%sections,
 			    'purpose' => $declaration_purpose
 			   });
-    }
-    else {
+    } else {
 	print STDERR "${file}:$.: error: Cannot parse enum!\n";
 	++$errors;
     }
-- 
2.26.2



