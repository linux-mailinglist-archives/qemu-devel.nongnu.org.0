Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86133B409D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:33:46 +0200 (CEST)
Received: from localhost ([::1]:57126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiDZ-0007TT-TB
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzO-0002JQ-1g
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzF-0006j1-Uw
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Yy9AzhaafDVzClQSc849pscwNeBjAseKp92nxacROk=;
 b=bcs+sSiraq8KCBpttT3JdM2eRZah17OshDtkkV2iIFh0M4099g5YVNIx9RSut9h7mMxobL
 Wa64AnPlfoszycIL19NfxHPpvR5ZkBYj0dajvUwu+2u8ApgEY6zbEgf/q0uLDia7ahTNtX
 sOdCn5gNbyxvaAOqYiS8gQem+o3IA7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-2ukSLjlYPQWwZ80u_GmbSw-1; Fri, 25 Jun 2021 05:18:48 -0400
X-MC-Unique: 2ukSLjlYPQWwZ80u_GmbSw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C848100CF6E
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:18:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 011A660C05;
 Fri, 25 Jun 2021 09:18:46 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/53] tests: acpi: arm/virt: drop redudant test_acpi_one() in
 test_acpi_virt_tcg()
Date: Fri, 25 Jun 2021 05:17:36 -0400
Message-Id: <20210625091818.1047980-13-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

follow up call test_acpi_one() with smbios options generates
the same ACPI tables, so there is no need to run smbios-less
variant at all.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 9b36a49f96..7084f0f795 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1416,9 +1416,6 @@ static void test_acpi_virt_tcg(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    test_acpi_one("-cpu cortex-a57", &data);
-    free_test_data(&data);
-
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
     test_acpi_one("-cpu cortex-a57 "
-- 
2.27.0


