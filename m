Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222D8346BCD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:11:28 +0100 (CET)
Received: from localhost ([::1]:36046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpFH-0007GK-3J
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1c-0007EE-TE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1P-0002mi-Jj
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uNYgTYQ6USoiWLOWix/fwpu6hl/EXy12kwfJPQ11HMY=;
 b=AdA78hqqpUaYiQqtYncmux/swdHd2w6jWsuWe189agnpi8/KO0XCly5wo1qOQz8vh+nPOQ
 qfuXox9h1qagnL2z8Xi7914F/xgn+OLExy5NoOShBBTx5WPs8xY7QfP2EQAbS5Qelf5BFr
 BtqrQLy08eZIefd2++1ZBVGgZH5Vt8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-mbcoIDlLM_aVQf3e1W-JlA-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: mbcoIDlLM_aVQf3e1W-JlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6607E108BD07;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31C0610027A5;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D019B11326A8; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/29] qapi/pragma: Streamline comments on
 member-name-exceptions
Date: Tue, 23 Mar 2021 22:56:49 +0100
Message-Id: <20210323215658.3840228-21-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-21-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


