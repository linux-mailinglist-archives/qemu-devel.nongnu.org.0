Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0EF546089
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:53:36 +0200 (CEST)
Received: from localhost ([::1]:39492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaOb-0005aU-BS
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXd-0001bQ-Kc
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXc-0006LT-0p
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IqZ5IuzJUm/KcyZwG3GKfjeGMTTz/V/nC2C5EKqQZDY=;
 b=XTh6OsWV2gDnHeusarLlAMv8/yRiy1GShPs1Vjm+ureBc0n30WON73em0axM8aNQ72ybMf
 6rqgzwj5n4q7LjNC0VbGYSR778NrVgKz1QTFrRMB/JAe1tHE0/AGPSkJx69deK7aJkuoeH
 KbI1v7iRp/2aw4SMq29adHDpGJ/PL6Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-SIX9UxUgMb6teJ4vxK-c4w-1; Fri, 10 Jun 2022 03:58:46 -0400
X-MC-Unique: SIX9UxUgMb6teJ4vxK-c4w-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay28-20020a05600c1e1c00b0039c5cbe76c1so954061wmb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IqZ5IuzJUm/KcyZwG3GKfjeGMTTz/V/nC2C5EKqQZDY=;
 b=0RlD36dk7raxzSuPYzW9oIpPbLvE4MjWgOMo1uCglfliayqcNEqS/2bTYMMPzkpJV6
 Xd5vPeW1YVY6gqD3niuMFe0qdVNrWvAjMoMdj2Ewyy9+JRtIMbSflEtn3rOhZs6qD/hN
 T9lckQtIS+CxMWr+3p2PnGmGUfg0Adg7NZpH7fIYEPCqUvFjEDkwxl7I2HVAw/jHgWJr
 l9LM1Cppq1gqHduAE79CvzK0X0vpf+5Lr+7Kzh+l/B15vjJy9S+/aVyZtHEbrpkozj5z
 PLkyaaw6yzqHxggHxIJB8Br0e8ywQBMvpIt4d8zNg0jEkHijcqIRWcRufNIepzPK7Kmy
 uw5Q==
X-Gm-Message-State: AOAM530lCs03eqvfqkX7Uo41OFB7DjTYJG5ODn+Q2NereVN4NpqRchDa
 WveSfBx9HFyVuyCq8BqG0YxCAhuzB/rw1muI4e0D+UOet9V7Yoipip1LqIluDWoQNi4rwflhefk
 JZ2KLeXSKUUL2GB2cAx9hRMi+nWgMb4hRsIVSb43AEkb0bFsUTlULP+BCHe0K
X-Received: by 2002:a05:600c:3552:b0:398:3e9c:30f4 with SMTP id
 i18-20020a05600c355200b003983e9c30f4mr7507747wmq.37.1654847924935; 
 Fri, 10 Jun 2022 00:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypD5xJUKwzjo/Px3juscx6ktuoPGs0q1NVOmHDwxHloDBqKLvx21i2cQfUFkdudo9W3snIfA==
X-Received: by 2002:a05:600c:3552:b0:398:3e9c:30f4 with SMTP id
 i18-20020a05600c355200b003983e9c30f4mr7507722wmq.37.1654847924593; 
 Fri, 10 Jun 2022 00:58:44 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 m2-20020a7bca42000000b0039c693a54ecsm2400059wml.23.2022.06.10.00.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:44 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 34/54] tests: acpi: update expected
 DSDT.tis.tpm2/DSDT.tis.tpm12 blobs
Message-ID: <20220610075631.367501-35-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

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
Message-Id: <20220608135340.3304695-35-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


