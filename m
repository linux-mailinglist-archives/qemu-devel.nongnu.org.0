Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200382CB90A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:38:57 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkObA-0003uI-45
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDU-0004Ag-Dt
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCh-0003t4-1q
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHV1Bw2XcvB86SinjjcaViQAYlGKdlvYVGUfC9qwTiU=;
 b=DI640nlvFgH3512dbnta5guDvN4kJrbvt1BvxjXDsmbuTDa+qBPucwq4gQ15CBEX9nD7PL
 JulYdky4OLWtZNrmCSTrb7mFJvYKP4VOCqNcKmgLBNNCOcvBKpz3xMDqhHMfBJj3t7MrU7
 BINBNt30YYMiIlV+lfJ7lKgQI6OQ920=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-1fRmO03YPWO_wKOqhbH9fw-1; Wed, 02 Dec 2020 03:09:32 -0500
X-MC-Unique: 1fRmO03YPWO_wKOqhbH9fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD84F185E48B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72D4F60C17
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 110/113] scripts: kernel-doc: split typedef complex regex
Date: Wed,  2 Dec 2020 03:08:46 -0500
Message-Id: <20201202080849.4125477-111-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The typedef regex for function prototypes are very complex.
Split them into 3 separate regex and then join them using
qr.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/3a4af999a0d62d4ab9dfae1cdefdfcad93383356.1603792384.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-29-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 862b77686e..524fc626ed 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1427,17 +1427,21 @@ sub dump_enum($$) {
     }
 }
 
+my $typedef_type = qr { ((?:\s+[\w\*]+){1,8})\s* }x;
+my $typedef_ident = qr { \*?\s*(\w\S+)\s* }x;
+my $typedef_args = qr { \s*\((.*)\); }x;
+
+my $typedef1 = qr { typedef$typedef_type\($typedef_ident\)$typedef_args }x;
+my $typedef2 = qr { typedef$typedef_type$typedef_ident$typedef_args }x;
+
 sub dump_typedef($$) {
     my $x = shift;
     my $file = shift;
 
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
-    # Parse function prototypes
-    if ($x =~ /typedef((?:\s+[\w\*]+){1,8})\s*\(\*?\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
-	$x =~ /typedef((?:\s+[\w\*]+\s+){1,8})\s*\*?(\w\S+)\s*\s*\((.*)\);/) {
-
-	# Function typedefs
+    # Parse function typedef prototypes
+    if ($x =~ $typedef1 || $x =~ $typedef2) {
 	$return_type = $1;
 	$declaration_name = $2;
 	my $args = $3;
-- 
2.26.2



