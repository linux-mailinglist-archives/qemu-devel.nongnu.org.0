Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280B541B51E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:26:47 +0200 (CEST)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGsQ-0004u3-3Z
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGno-000063-Ta
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:22:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGnn-0002ZR-4j
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632849718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPdfTMlaMuk9d9Ijq67wsLpRT/EbUWoG5Mhud5MiHOs=;
 b=fulD5attHxKm1TkCj5919zadEOdY9AfGpOqcJ3yvM1lR33M1MvWL7ec18SR9p7511EPK5v
 dr46iDdr9mUbL29D4otmuGZRvvB6amKhBlboV25AoUb65qUBldYOuJLHg9IJgaOI9WnLii
 ElU3l9tm6ErsPNJRkqykgkb8aQPNRKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Rpt53DPaOTSBc0XwW4YsKw-1; Tue, 28 Sep 2021 13:21:57 -0400
X-MC-Unique: Rpt53DPaOTSBc0XwW4YsKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B71441006AA2;
 Tue, 28 Sep 2021 17:21:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50D825C25A;
 Tue, 28 Sep 2021 17:21:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [PATCH 3/3] tests/acpi: Generate reference blob for IORT rev E.b
Date: Tue, 28 Sep 2021 19:21:33 +0200
Message-Id: <20210928172133.79665-4-eric.auger@redhat.com>
In-Reply-To: <20210928172133.79665-1-eric.auger@redhat.com>
References: <20210928172133.79665-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: philmd@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/IORT                   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp             | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem           | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb               | Bin 124 -> 128 bytes
 5 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 9a5a923d6b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/IORT",
diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
index 521acefe9ba66706c5607321a82d330586f3f280..7ab4fd8107628902a8f05746fb954a8d6af00431 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0;N<V@5v<@85#X!<1dKp25F11@0kHuPgMkDCGmHtMLGmELWWm4;
YQU~IzKxrTaSL*=efWZI%5E^D40Ar&H0RR91

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
index 521acefe9ba66706c5607321a82d330586f3f280..7ab4fd8107628902a8f05746fb954a8d6af00431 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0;N<V@5v<@85#X!<1dKp25F11@0kHuPgMkDCGmHtMLGmELWWm4;
YQU~IzKxrTaSL*=efWZI%5E^D40Ar&H0RR91

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
index 521acefe9ba66706c5607321a82d330586f3f280..7ab4fd8107628902a8f05746fb954a8d6af00431 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0;N<V@5v<@85#X!<1dKp25F11@0kHuPgMkDCGmHtMLGmELWWm4;
YQU~IzKxrTaSL*=efWZI%5E^D40Ar&H0RR91

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
index 521acefe9ba66706c5607321a82d330586f3f280..7ab4fd8107628902a8f05746fb954a8d6af00431 100644
GIT binary patch
literal 128
zcmebD4+?2uU|?Y0;N<V@5v<@85#X!<1dKp25F11@0kHuPgMkDCGmHtMLGmELWWm4;
YQU~IzKxrTaSL*=efWZI%5E^D40Ar&H0RR91

literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

-- 
2.26.3


