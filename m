Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DEB66749F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBY-0002Yu-Gs; Thu, 12 Jan 2023 09:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBL-0002Hi-FH
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBI-000629-5r
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMcUzqTFMtCIAqM4iCWHRMb4pCN4HlQGwY2Bu5OxbjI=;
 b=cjCvLOa6CpuZNH7lFJ2IVGOyAVQ+Qa5/TDVqzwXHna8xymFEbEvGn1mYOZrj0AOaXZeDSU
 8UoqkEZAuOKt1bTKUfEduZ46v/Txu1F/wgRrqXLPO9LHktbpqFDUDtv1O8kpfsVu/SxLVW
 0cMczTHeTSQfdpwSzhAbieuIKGiZc7w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-GU7GeyP4OAyYDoQRWqe3Gg-1; Thu, 12 Jan 2023 09:03:35 -0500
X-MC-Unique: GU7GeyP4OAyYDoQRWqe3Gg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0908C3811F4C;
 Thu, 12 Jan 2023 14:03:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 782744085720;
 Thu, 12 Jan 2023 14:03:34 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 26/40] tests: acpi: update expected blobs
Date: Thu, 12 Jan 2023 15:02:58 +0100
Message-Id: <20230112140312.3096331-27-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

previous commit added endpoint devices to bridge testcases,
which exposes extra non-hotpluggable slot in DSDT on bus where
hotplug is not available.
It should look like this (numbers may vary):

+            Device (S28)
+            {
+                Name (_ADR, 0x00050000)  // _ADR: Address
+            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3064 -> 3081 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 9758 -> 9775 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11458 -> 11475 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12358 -> 12375 bytes
 5 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 571f14fd59..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index 578468f4f00a9373366c92926b512c192dd6675b..a71ed4fbaa14be655c28a5e03e50157b4476e480 100644
GIT binary patch
delta 53
zcmew%-YLQ566_Mf$-}_Fcyc4xJx(r1rI`3&r+5KR#m%2M*_Z^QoA`r`4B|QB9bJNe
Hs#q8RhyD!~

delta 35
qcmeB__#w{a66_N4gPVbYQFkNPJx(qM#hCbDr+5Jmh0UKh*_Z&l3JL`P

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index fe502ed97751950cc245d728c873065f062c76b2..d58f4d2f0adbb86f8f6403a1cf9b13e1cabed035 100644
GIT binary patch
delta 58
zcmbQ|v)+fxCD<iIUyXr*apFd<a&GR<`HV5~!A|i44f8kmaNm^_jBer&HZq9kh<9`e
O;$dK5VVIn$x)lHc9T3U@

delta 40
wcmZ4QGtY<1CD<iIPK|+q@##jca&GR9d5kgf!A|i4{c|_>aNm`jT&21d00Qm}$^ZZW

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index c38b121ad90ecb896a906a50340ad5bd7d5453f9..3a01bb196b047b875be07be28d07f3139716e82f 100644
GIT binary patch
delta 56
zcmX>Uc{!5HCD<k8vJL|SqxMFwMma8*J2COWPVoXhw>M9f^W)*?4>q)j=ZJT73F2X3
MU}o6-Q0pNh002i2`~Uy|

delta 40
wcmcZ{c_@<0CD<k8kPZU_<CKkDjdEPhw`1aio#F+&Z*86`=f|`8i`IQc042K)+W-In

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 52c1d3102b59fe3c1d10fdcfca761722d54d2c40..e6b64345e822fa632126cbc63dcdec3bf3835580 100644
GIT binary patch
delta 57
zcmX?>a6N&`CD<h-+<<|B@$E*gMmg?ACdQcfV5fM24#v&X<W}+V^9LJQ#B;<ux&-ks
NFt9Rgw$tTc1_1Q74-NnT

delta 41
xcmcbfa4dn#CD<jz&47V{F>)hUqa1ewBV$Z_uv5H1JHzH_a;x|@2kNph0{{nL3+(^^

-- 
2.31.1


