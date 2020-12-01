Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA22CA078
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:53:39 +0100 (CET)
Received: from localhost ([::1]:48766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3Hu-0002L9-CB
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30T-0002Yl-7W
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30A-0003sD-Vn
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FsWZNmQMTzP45CGKAZDRB7a8dvrSmV62DmBnscUAZg=;
 b=TOx8XkaMB4LsX1ASujVWfiT/OVznXFBr0um+RPRxA2nrrfLWfdoUjJGbEeO6c7vlp83/m6
 lhc8yE1tNHkBcts+cn545CimNNAbJEgSdWL3/aG+SyruvHDwnZCLGP8VMXmj3fQRobbjgJ
 b+9Gj9Ps9uQGNaQITdVSc1tAIXk9Xa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-MTPvBqRaP9GrgmKIRd-VxA-1; Tue, 01 Dec 2020 05:35:16 -0500
X-MC-Unique: MTPvBqRaP9GrgmKIRd-VxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 240FB8558E9;
 Tue,  1 Dec 2020 10:35:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D192B10013C1;
 Tue,  1 Dec 2020 10:35:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/32] scripts: kernel-doc: fix typedef parsing
Date: Tue,  1 Dec 2020 05:34:58 -0500
Message-Id: <20201201103502.4024573-29-pbonzini@redhat.com>
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The include/linux/genalloc.h file defined this typedef:

	typedef unsigned long (*genpool_algo_t)(unsigned long *map,unsigned long size,unsigned long start,unsigned int nr,void *data, struct gen_pool *pool, unsigned long start_addr);

Because it has a type composite of two words (unsigned long),
the parser gets the typedef name wrong:

.. c:macro:: long

   **Typedef**: Allocation callback function type definition

Fix the regex in order to accept composite types when
defining a typedef for a function pointer.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/328e8018041cc44f7a1684e57f8d111230761c4f.1603792384.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-28-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index d3a289628c..862b77686e 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1434,13 +1434,14 @@ sub dump_typedef($$) {
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
     # Parse function prototypes
-    if ($x =~ /typedef\s+(\w+)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
-	$x =~ /typedef\s+(\w+)\s*(\w\S+)\s*\s*\((.*)\);/) {
+    if ($x =~ /typedef((?:\s+[\w\*]+){1,8})\s*\(\*?\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
+	$x =~ /typedef((?:\s+[\w\*]+\s+){1,8})\s*\*?(\w\S+)\s*\s*\((.*)\);/) {
 
 	# Function typedefs
 	$return_type = $1;
 	$declaration_name = $2;
 	my $args = $3;
+	$return_type =~ s/^\s+//;
 
 	create_parameterlist($args, ',', $file, $declaration_name);
 
-- 
2.26.2



