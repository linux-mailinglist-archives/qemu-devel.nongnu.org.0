Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F285F078A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:27:38 +0200 (CEST)
Received: from localhost ([::1]:50628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCIz-0004Tc-Qp
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeCAM-00069k-2c
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:18:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeCAK-0004o5-1n
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664529518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vL3DcFS/Wa4zcbIuz5s9bB23EyNv8kZvAbhde2brIYo=;
 b=PqVC9d4rtBuFN6xNeQwbtlfy7+YXA8Mpp7m5My3aJnksIxB16wD00jVVc0tiiR8xiuZTYs
 ow7lZvyRL78BswKTwE5lNJbZzZb7bGex1Y+Uj3dCfuORvoYlEEcSiojcqzeRF6iQ4DgUdd
 4SqOS1Pe7n1NAIodxDfnMtsIW/GQOy8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-MioKjQEdMsK8MtytEIH1rw-1; Fri, 30 Sep 2022 05:18:35 -0400
X-MC-Unique: MioKjQEdMsK8MtytEIH1rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 180D02A2AD71;
 Fri, 30 Sep 2022 09:18:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5F0C40C6EC2;
 Fri, 30 Sep 2022 09:18:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B5BC180039F; Fri, 30 Sep 2022 11:18:33 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kashyap Chamarthy <kchamart@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] docs: add firmware feature flags
Date: Fri, 30 Sep 2022 11:18:33 +0200
Message-Id: <20220930091833.1648504-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add new firmware feature flags for the recently added confidential
computing operating modes by amd and intel.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/interop/firmware.json | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 4e049b1c7ca0..657082b78b83 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -121,6 +121,15 @@
 #              related to this feature are documented in
 #              "docs/amd-memory-encryption.txt".
 #
+# @amd-sev-snp: The firmware supports running under AMD Secure Encrypted
+#               Virtualization - Secure Nested Paging, as specified in the
+#               AMD64 Architecture Programmer's Manual. QEMU command line
+#               options related to this feature are documented in
+#               "docs/amd-memory-encryption.txt".
+#
+# @intel-tdx: The firmware supports running under Intel Trust Domain
+#             Extensions (TDX).
+#
 # @enrolled-keys: The variable store (NVRAM) template associated with
 #                 the firmware binary has the UEFI Secure Boot
 #                 operational mode turned on, with certificates
@@ -185,9 +194,11 @@
 # Since: 3.0
 ##
 { 'enum' : 'FirmwareFeature',
-  'data' : [ 'acpi-s3', 'acpi-s4', 'amd-sev', 'amd-sev-es', 'enrolled-keys',
-             'requires-smm', 'secure-boot', 'verbose-dynamic',
-             'verbose-static' ] }
+  'data' : [ 'acpi-s3', 'acpi-s4',
+             'amd-sev', 'amd-sev-es', 'amd-sev-snp',
+             'intel-tdx',
+             'enrolled-keys', 'requires-smm', 'secure-boot',
+             'verbose-dynamic', 'verbose-static' ] }
 
 ##
 # @FirmwareFlashFile:
-- 
2.37.3


