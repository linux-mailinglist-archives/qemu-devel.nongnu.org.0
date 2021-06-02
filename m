Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40426398349
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:40:53 +0200 (CEST)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLUi-0008PO-AX
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQN-0008Cu-P5
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQM-0003lF-3v
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbNPMCZx+ARmv9Wv3+SeHfacacAGXYtRaEDI0RycHJ0=;
 b=ABUlvyKASzBt0KLyHzOW6I47IPiUPll0kXvm3XUu2y4mMIh6MDjMMY+okKT+Yfw2ZDDyPJ
 aqeYgidg4uYDYLK0c1av5C8x6Bd2QIC8qE0n9kGJ61puw1DNHHbN+sDn8Aw4n9TRt+YmHx
 1WJXz9FwcN+TeOikhjFyIoNoc7T1c7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-JyJHqp8KMrKIljo-4Zeitg-1; Wed, 02 Jun 2021 03:36:19 -0400
X-MC-Unique: JyJHqp8KMrKIljo-4Zeitg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9B23800D55;
 Wed,  2 Jun 2021 07:36:18 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8082A5C729;
 Wed,  2 Jun 2021 07:36:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/17] docs: fix references to docs/specs/tpm.rst
Date: Wed,  2 Jun 2021 09:35:53 +0200
Message-Id: <20210602073606.338994-5-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 6e8a3ff6ed ("docs/specs/tpm: reST-ify TPM documentation")
converted docs/specs/tpm.txt to docs/specs/tpm.rst.

We still have several references to the old file, so let's fix them
with the following command:

  sed -i s/tpm.txt/tpm.rst/ $(git grep -l docs/specs/tpm.txt)

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210517151702.109066-5-sgarzare@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/acpi/tpm.c    | 2 +-
 hw/tpm/tpm_ppi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/tpm.c b/hw/acpi/tpm.c
index b96459e45b..cdc0227536 100644
--- a/hw/acpi/tpm.c
+++ b/hw/acpi/tpm.c
@@ -57,7 +57,7 @@ void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev)
                aml_operation_region(
                    "TPP3", AML_SYSTEM_MEMORY,
                    aml_int(TPM_PPI_ADDR_BASE +
-                           0x15a /* movv, docs/specs/tpm.txt */),
+                           0x15a /* movv, docs/specs/tpm.rst */),
                            0x1));
     field = aml_field("TPP3", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
     aml_append(field, aml_named_field("MOVV", 8));
diff --git a/hw/tpm/tpm_ppi.c b/hw/tpm/tpm_ppi.c
index 72d7a3d926..362edcc5c9 100644
--- a/hw/tpm/tpm_ppi.c
+++ b/hw/tpm/tpm_ppi.c
@@ -23,7 +23,7 @@
 
 void tpm_ppi_reset(TPMPPI *tpmppi)
 {
-    if (tpmppi->buf[0x15a /* movv, docs/specs/tpm.txt */] & 0x1) {
+    if (tpmppi->buf[0x15a /* movv, docs/specs/tpm.rst */] & 0x1) {
         GuestPhysBlockList guest_phys_blocks;
         GuestPhysBlock *block;
 
-- 
2.27.0


