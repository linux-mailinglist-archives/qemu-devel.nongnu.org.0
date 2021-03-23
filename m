Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE90345B2C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:44:07 +0100 (CET)
Received: from localhost ([::1]:60036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOda2-0006Tq-BH
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWh-0001K9-Vh
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWf-0001zx-2a
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9oExSr2Xe2oTRt6Ev19uzrK9GO83rm5DB90jbzDzXI=;
 b=Y5A6mye48Wr4s+rS3CT7n900vO+sljaNVruaeqHOwv2fvBJYRJxdJq/PP1Q/byGWE43x3G
 439Xt/RD16Mb86XOPS54S4INz8bMHt9Q2dkaMJ7k3gtK1cNnmiJnWNdswQzv0up1tFjoud
 gJsg7bOfppE0gF8jfkF8vJkK+a8/RwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-rB_2V5AqN7G1wPamjVslBw-1; Tue, 23 Mar 2021 05:40:34 -0400
X-MC-Unique: rB_2V5AqN7G1wPamjVslBw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84F4A100747A;
 Tue, 23 Mar 2021 09:40:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50EB310016FB;
 Tue, 23 Mar 2021 09:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 037B211326A8; Tue, 23 Mar 2021 10:40:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/28] qapi/pragma: Streamline comments on
 member-name-exceptions
Date: Tue, 23 Mar 2021 10:40:17 +0100
Message-Id: <20210323094025.3569441-21-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/pragma.json | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/qapi/pragma.json b/qapi/pragma.json
index 4895848c5e..4c47c802d1 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -10,11 +10,13 @@
         'query-tpm-models',
         'query-tpm-types',
         'ringbuf-read' ],
-    'member-name-exceptions': [
-        'ACPISlotType',             # DIMM, visible through query-acpi-ospm-status
-        'BlockdevVmdkSubformat',    # all members, to match VMDK spec spellings
-        'BlockdevVmdkAdapterType',  # legacyESX, to match VMDK spec spellings
-        'QapiErrorClass',           # all members, visible through errors
-        'UuidInfo',                 # UUID, visible through query-uuid
-        'X86CPURegister32'          # all members, visible indirectly through qom-get
+    # Externally visible types whose member names may use uppercase
+    'member-name-exceptions': [     # visible in:
+        'ACPISlotType',             # query-acpi-ospm-status
+        'BlockdevVmdkAdapterType',  # blockdev-create (to match VMDK spec)
+        'BlockdevVmdkSubformat',    # blockdev-create (to match VMDK spec)
+        'QapiErrorClass',           # QMP error replies
+        'UuidInfo',                 # query-uuid
+        'X86CPURegister32'          # qom-get of x86 CPU properties
+                                    # feature-words, filtered-features
     ] } }
-- 
2.26.3


