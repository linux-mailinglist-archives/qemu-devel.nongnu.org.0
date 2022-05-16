Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0FB52892E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:50:29 +0200 (CEST)
Received: from localhost ([::1]:38850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqczM-00069T-5u
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccH-0003z0-Cz
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccF-0006GE-T5
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptFUpuIkr5Kyb0YUhh7l1chPE7ecpkCUFV48TCbwp9Q=;
 b=Q+nFhFsF0bhVeS6W3veXzzbNXqGnpPaTcd0d7IDWIQ8b3lhAB/8rErF9H0/PpKzChvAtMG
 ZxWdYPALgYFvyxSlDSJdmsImPCiQueTvhzVB32EFpWkrbrUJMAdCYzgrICfS1U6wpqfcC3
 j9km3hsDump3tykVaQjszKBdsPsJ3vM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-f6ElIx74NbW-faLVyNi7cA-1; Mon, 16 May 2022 11:26:34 -0400
X-MC-Unique: f6ElIx74NbW-faLVyNi7cA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5EAE85A5A8;
 Mon, 16 May 2022 15:26:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3E35492C14;
 Mon, 16 May 2022 15:26:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 14/35] tests: acpi: update expected DSDT.ipmismbus blob
Date: Mon, 16 May 2022 11:25:49 -0400
Message-Id: <20220516152610.1963435-15-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

expected AML change:
         Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
         {
            I2cSerialBusV2 (0x0000, ControllerInitiated, 0x000186A0,
    -           AddressingMode7Bit, "\\_SB.PCI0.SMB0",
    +           AddressingMode7Bit, "^",
                0x00, ResourceProducer, , Exclusive,
                )
          })

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8391 -> 8378 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b4687d1cc8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.ipmismbus",
diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 07ba873b79caadd73ed9721fcbeee84c57676e2a..415fe08a407690c0e118743d872de79d22f01a4c 100644
GIT binary patch
delta 85
zcmX@^xXY2tCD<iomjVL=W93G!vyzG~?0WIRPVoWGo(9oP?rg!nP6izDjxIqw%nb4j
k(M_(blYdBRi%D{c^$9XC0wGW%8^eM&5F>80n^Yqk0Lq6G-v9sr

delta 98
zcmdnxc-)c8CD<k8xB>$M<Nb|XXC)OKIrQR#o#F$WJq@CpT-bwsoeVhQ9bJNWm>J|5
sqMMx9CjXGsR#xLu?vrC+1VW%jHiiXlAVv&OqaH}39!S?_OQ}XS01jdo-v9sr

-- 
2.31.1


