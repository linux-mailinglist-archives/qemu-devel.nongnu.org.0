Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270CC6A8624
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:19:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlbr-0007RU-Fo; Thu, 02 Mar 2023 11:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbR-0006Qn-Cs
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbF-0000Rf-OF
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWozl3fRDw+sHO0eaUL4d6WIVgazc1XcEhSLN47yQ6A=;
 b=Igxo7v2wwKkZnYDoyBXw0IsSbOKluNsss+1kLASkTEZ3aJzySgYqidqgKGze1IWft+Ybo3
 77/Gltbs6C9cpgtp3Ncal9QXeM3JFhdfbcocJp0giwYs6UBUx6x/wzwbFcgddZetmG4ytT
 yS7KVac8ScMFY4Iwgb2GaSNi6mOmUpA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-CelEIqkYNFqgTHdZKwgf1g-1; Thu, 02 Mar 2023 11:16:07 -0500
X-MC-Unique: CelEIqkYNFqgTHdZKwgf1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B7B080D101
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:16:07 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9E6F140EBF6;
 Thu,  2 Mar 2023 16:16:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 28/34] tests: acpi: update expected blobs
Date: Thu,  2 Mar 2023 17:15:37 +0100
Message-Id: <20230302161543.286002-29-imammedo@redhat.com>
In-Reply-To: <20230302161543.286002-1-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

an extra devices at non-zero function address with static
_DSM method get exposed, ex:

  +            Device (S15)
  +            {
  +                Name (_ADR, 0x00020005)  // _ADR: Address
  +                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  +                {
  +                    Local0 = Package (0x01)
  +                        {
  +                            0x66
  +                        }
  +                    Return (EDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  +                }
  +            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12729 -> 12770 bytes
 tests/data/acpi/q35/DSDT.noacpihp           | Bin 8205 -> 8248 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index ad2b429de8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.noacpihp",
diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 4e4b5229502000550f169948393ba8cbc7a793d5..9ae8ee0b41738bd8951b9449abcfc67c293fdce1 100644
GIT binary patch
delta 81
zcmdm){3w~rCD<k8ks$*E<D89LcjdU-1sG%EgPr09`uI10l5=5FR}VHcjpvAWbP3{N
kWnf|u5s!BX_T?!MVqxS;OIYFx<YZ)KWhZPlQEU|e0OA}M0RR91

delta 41
xcmaEqyfc~0CD<iory&Ca<K2y1cjdVIco}2jgPr09T6s5rl5=6&9Ix0c001!W4d4I(

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index 1c17aa30f7f0155a81988aa43c56e2f71530b4e4..6ab1f0e52543fcb7f84a7fd1327fe5aa42010565 100644
GIT binary patch
delta 99
zcmeBm*x|tC66_LUp}@ev=(Ul{MV8A;FD5?NDPF)yZ*zpK6r+^~Yp{tyJV(5vOArqO
v0|!HNlSZ(KAyj}7C?Fyc?-K0GQy|33$Q{X)u*4O}%gD^iPT1Ti*TV<^dqx+F

delta 56
zcmdnt(CfhE66_MftH8j(IA<f5i!7JFc1(P*Q@nt?_T~s#DMo(XU=xFQj(A6xARYz=
L4u;KZ<a!tZl4uQ!

-- 
2.39.1


