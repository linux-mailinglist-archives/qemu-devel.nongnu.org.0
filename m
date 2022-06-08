Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9CF543286
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:27:32 +0200 (CEST)
Received: from localhost ([::1]:54180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyweh-0007vc-6q
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8Z-0002Ts-Mr
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8V-0004To-3R
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjHLQk1QaOLCjZkLQT7YZLxu3bFUU4J0uLJZnlOSmXs=;
 b=FN9oYCjDAqAXHW5t1iYrr8tW3CZxRouCLkHpzf4RHv5dB6FQzqVSYN7Zu/2NEbuz4fK9Z7
 mZdd+JGM3wEWa3w9tGBQc3CudSuIkrWpez7UxbLTgOX/rfVB7dMPs4SawLhQqhz8LybkGj
 1c3ll6Fd6U+EsszomhLu9xNHTXk/pGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-I4Al4I_fOJit0D17blraZQ-1; Wed, 08 Jun 2022 09:54:11 -0400
X-MC-Unique: I4Al4I_fOJit0D17blraZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFBC6811E7A;
 Wed,  8 Jun 2022 13:54:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CA23C28117;
 Wed,  8 Jun 2022 13:54:10 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 34/35] tests: acpi: update expected
 DSDT.tis.tpm2/DSDT.tis.tpm12 blobs
Date: Wed,  8 Jun 2022 09:53:39 -0400
Message-Id: <20220608135340.3304695-35-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

expected move of tmp-tis device description directly under
Device(ISA) node.

for tpm-tis 2.0:

  @@ -145,6 +145,189 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
           {
               Name (_ADR, 0x001F0000)  // _ADR: Address
               OperationRegion (PIRQ, PCI_Config, 0x60, 0x0C)
  +            Device (TPM)
  +            {
  +                Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
  +                Name (_STR, "TPM 2.0 Device")  // _STR: Description String
  +                Name (_UID, One)  // _UID: Unique ID
  +                Name (_STA, 0x0F)  // _STA: Status
    ...
  +            }

  @@ -3281,189 +3464,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
               Method (PCNT, 0, NotSerialized)
               {
               }
  -
  -            Device (TPM)
  -            {
  -                Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
  -                Name (_STR, "TPM 2.0 Device")  // _STR: Description String
  -                Name (_UID, One)  // _UID: Unique ID
  -                Name (_STA, 0x0F)  // _STA: Status
    ...
  -            }

for tpm-tis 1.2:

  @@ -145,6 +145,188 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
           {
               Name (_ADR, 0x001F0000)  // _ADR: Address
               OperationRegion (PIRQ, PCI_Config, 0x60, 0x0C)
  +            Device (TPM)
  +            {
  +                Name (_HID, EisaId ("PNP0C31"))  // _HID: Hardware ID
  +                Name (_UID, One)  // _UID: Unique ID
  +                Name (_STA, 0x0F)  // _STA: Status
    ...
  +            }

  @@ -3281,188 +3463,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
               Method (PCNT, 0, NotSerialized)
               {
               }
  -
  -            Device (ISA.TPM)
  -            {
  -                Name (_HID, EisaId ("PNP0C31"))  // _HID: Hardware ID
  -                Name (_UID, One)  // _UID: Unique ID
  -                Name (_STA, 0x0F)  // _STA: Status
    ...
  -            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8885 -> 8880 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8906 -> 8906 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 7b3bf9a207..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index 0b5c97fdb5da8b7b55d6b5f2af498a447fda7bf8..a97d884c50485f848054c6ac95ecfa055ff59e5b 100644
GIT binary patch
delta 89
zcmdn$y1|vpCD<iogAxM+quxfYn~XZHW_t0#PVoWGo(9oP9;Tkbj`1AvjxIqw3=HxN
r(G3BfL4izM30yqUO%AG?(-r)fHghwv%5nLz#DKI3xUo!@Qg8tPLai3C

delta 95
zcmdnsy497-CD<ios}chP<Nl3YHyJgY1@+>Co#F$WJq@Cp+yp#>9pgFT9bJNW7#QRk
vq8kD{g94ej61aFa$Fi`>ak*;6fK&_kYEI5ka^Z|_a#hs>Y1z!r<i`X6>g5>c

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 4e16b126cc1c32f2346078fa69c5261c245d15e8..1f5392919b5ea69696b49ff13aab5c37d0615919 100644
GIT binary patch
delta 85
zcmX@*ddii{CD<k8loA62<JFB^HyJhj&Gq7go#F$WJq@CpoXkCg9pgFT9bJNW7#QRk
nq8kD{g94ej61aFa$0_76ZRTcTmE-bbi2-R5aATP)rQiYpDU=p=

delta 85
zcmX@*ddii{CD<k8loA62<CBeCHyJgY1@+>Co#F$WJq@Cp+yp#>9pgFT9bJNW7#QRk
nq8kD{g94ej61aFam$R_Sad~OSfK&@OX-{rba@owyl*0r7A8!`n

-- 
2.31.1


