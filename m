Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBC5F0C9A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:42:35 +0200 (CEST)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGHg-00062g-QH
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeG7z-0006Ud-PM
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:32:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124]:56089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeG7v-0005yS-0Q
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664544744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ngF6sWh1u7k641vVqdDTTSsxphkySaSPjKFhJWyYpbs=;
 b=FMoQMOzOGZ1lv/uzGYNuhiBGi94uD80LoLdEOogjyqVXUpVJg01mJx0QHJ3WGxPXRnYE+z
 gK84zYp4DOjv6VGWaikOOb0zskdcLv1sfgoUrByRGsUpzscCfkOwosbJeC0umSl1ZmU06L
 nZ7LmJyu8znaBPBPwtVErRXu59mH4WE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-HvMhouFzMI6lzCDzIF3hYw-1; Fri, 30 Sep 2022 09:32:23 -0400
X-MC-Unique: HvMhouFzMI6lzCDzIF3hYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E76E6185A7AE;
 Fri, 30 Sep 2022 13:32:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB2F740C6EC2;
 Fri, 30 Sep 2022 13:32:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E81A1180039F; Fri, 30 Sep 2022 15:32:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 libvir-list@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2] docs: add firmware feature flags
Date: Fri, 30 Sep 2022 15:32:20 +0200
Message-Id: <20220930133220.1771336-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=kraxel@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_FAIL=0.001, SPF_HELO_NONE=0.001 autolearn=no autolearn_force=no
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

While being at it also fix the path to the amd sev documentation.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/interop/firmware.json | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 4e049b1c7ca0..56814f02b3c0 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -113,13 +113,22 @@
 #           Virtualization, as specified in the AMD64 Architecture
 #           Programmer's Manual. QEMU command line options related to
 #           this feature are documented in
-#           "docs/amd-memory-encryption.txt".
+#           "docs/system/i386/amd-memory-encryption.rst".
 #
 # @amd-sev-es: The firmware supports running under AMD Secure Encrypted
 #              Virtualization - Encrypted State, as specified in the AMD64
 #              Architecture Programmer's Manual. QEMU command line options
 #              related to this feature are documented in
-#              "docs/amd-memory-encryption.txt".
+#              "docs/system/i386/amd-memory-encryption.rst".
+#
+# @amd-sev-snp: The firmware supports running under AMD Secure Encrypted
+#               Virtualization - Secure Nested Paging, as specified in the
+#               AMD64 Architecture Programmer's Manual. QEMU command line
+#               options related to this feature are documented in
+#               "docs/system/i386/amd-memory-encryption.rst".
+#
+# @intel-tdx: The firmware supports running under Intel Trust Domain
+#             Extensions (TDX).
 #
 # @enrolled-keys: The variable store (NVRAM) template associated with
 #                 the firmware binary has the UEFI Secure Boot
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


