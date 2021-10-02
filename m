Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA16841FC06
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:04:07 +0200 (CEST)
Received: from localhost ([::1]:45780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWegQ-0005GT-QN
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWH-0000kI-DX
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWD-0000bA-Ek
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxFjxneImH8t+TNgA6RwI5GC/nMw3TKiWJEHDqKeLyw=;
 b=GIsxXQila3coD21BAwndch1qqhN/M0u+nhmt0O57/tu1WDWo5q1FLnWcoHiW124u5X/3ip
 EJvJgowgtrTnDNArxVBMetVuZzXodbE6TVqqcXFbuRxuzxtnWEOJfO26BujravVvVuGSij
 yYDx3KveYxw4LqSjdmi1i8NsgYCgSsw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-imybw1HhMOqJ2RHwyHAmhg-1; Sat, 02 Oct 2021 08:53:30 -0400
X-MC-Unique: imybw1HhMOqJ2RHwyHAmhg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so6078728wma.4
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxFjxneImH8t+TNgA6RwI5GC/nMw3TKiWJEHDqKeLyw=;
 b=QQsmLK3lim7fQuCqbtzw1jzf+JzJsyTSC+uUO3v07K8zjraj1HxVc1cbllC542fJ0t
 dY2ZzHcMj07qdYOors4+e/uF3dmKFPcAJQvoQr2KGMP4Qext0kXkivO7E9F5scPjFk89
 dMkMi2R0su+pheaoKRmwzS1T3xVBngFkQQUYuoOlh6FRgDUj6aGczgslPuer72UAQNJ/
 jfWxjqfWiw2Bjn2ijrKkdC/lgrY/3GrADSSblze5Nk326o/dzBf6Lty1N+3JiFH3kKnM
 u1Tpk8tRKBFvrVoNhrbQCY01ksoBTkeHUQozUtiP4LRqyuRsaDz209AmqjQ30ud9Q9v5
 JRlQ==
X-Gm-Message-State: AOAM532ck0qBvtUt9aOSEPGHeluafuM/7ylGcH+OhRSWptJHl80K5Hw0
 pJJUqRMrtb50/jXhQek45JSaPy+rPyDRDutdRmf8/j5EtbkmMxK1g7KjDWvqL15meexYAU4kHhd
 szpubOE+p9oH4xF+++6JzitEdI32ZOwSJH6gNcBlStW4E0es8so76xfhfLOmIluFD
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr3290608wrs.58.1633179208669;
 Sat, 02 Oct 2021 05:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDVSNYXZrFwgHN4o6mFCnb6T1FU6BIRdNia2pWh+N6e4sjnaGfMzRIY8qxl27Xi1WFkhgpNw==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr3290585wrs.58.1633179208431;
 Sat, 02 Oct 2021 05:53:28 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 61sm8574908wrl.94.2021.10.02.05.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/22] qapi/misc-target: Group SEV QAPI definitions
Date: Sat,  2 Oct 2021 14:52:57 +0200
Message-Id: <20211002125317.3418648-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is already a section with various SEV commands / types,
so move the SEV guest attestation together.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/misc-target.json | 80 +++++++++++++++++++++----------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index ae5577e0390..5aa2b95b7d4 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -229,6 +229,46 @@
   'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
   'if': 'TARGET_I386' }
 
+##
+# @SevAttestationReport:
+#
+# The struct describes attestation report for a Secure Encrypted
+# Virtualization feature.
+#
+# @data:  guest attestation report (base64 encoded)
+#
+#
+# Since: 6.1
+##
+{ 'struct': 'SevAttestationReport',
+  'data': { 'data': 'str'},
+  'if': 'TARGET_I386' }
+
+##
+# @query-sev-attestation-report:
+#
+# This command is used to get the SEV attestation report, and is
+# supported on AMD X86 platforms only.
+#
+# @mnonce: a random 16 bytes value encoded in base64 (it will be
+#          included in report)
+#
+# Returns: SevAttestationReport objects.
+#
+# Since: 6.1
+#
+# Example:
+#
+# -> { "execute" : "query-sev-attestation-report",
+#                  "arguments": { "mnonce": "aaaaaaa" } }
+# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
+#
+##
+{ 'command': 'query-sev-attestation-report',
+  'data': { 'mnonce': 'str' },
+  'returns': 'SevAttestationReport',
+  'if': 'TARGET_I386' }
+
 ##
 # @dump-skeys:
 #
@@ -297,46 +337,6 @@
   'if': 'TARGET_ARM' }
 
 
-##
-# @SevAttestationReport:
-#
-# The struct describes attestation report for a Secure Encrypted
-# Virtualization feature.
-#
-# @data:  guest attestation report (base64 encoded)
-#
-#
-# Since: 6.1
-##
-{ 'struct': 'SevAttestationReport',
-  'data': { 'data': 'str'},
-  'if': 'TARGET_I386' }
-
-##
-# @query-sev-attestation-report:
-#
-# This command is used to get the SEV attestation report, and is
-# supported on AMD X86 platforms only.
-#
-# @mnonce: a random 16 bytes value encoded in base64 (it will be
-#          included in report)
-#
-# Returns: SevAttestationReport objects.
-#
-# Since: 6.1
-#
-# Example:
-#
-# -> { "execute" : "query-sev-attestation-report",
-#                  "arguments": { "mnonce": "aaaaaaa" } }
-# <- { "return" : { "data": "aaaaaaaabbbddddd"} }
-#
-##
-{ 'command': 'query-sev-attestation-report',
-  'data': { 'mnonce': 'str' },
-  'returns': 'SevAttestationReport',
-  'if': 'TARGET_I386' }
-
 ##
 # @SGXInfo:
 #
-- 
2.31.1


