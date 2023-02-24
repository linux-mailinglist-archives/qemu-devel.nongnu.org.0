Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F66A1EAE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:39:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9p-0004A8-Ce; Fri, 24 Feb 2023 10:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9j-00041C-UN
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9h-0007Yh-P8
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mkZvl3K3aI4mRh24Jvs4zW7sj46GolRfUae2UG012Ro=;
 b=HLyFyjGcVu36x2uM7R3AsqgPCdi2qHg7E32Vh8mzJIhnFPwS4Kq3JHzpp6Ot529vvvVNh1
 Y0Rt7d55tmNVUaLZqyde3VZ7I3o6KpYWfR+jRZCdWv3e6O5TV78nuU0G6JnrQeOgjR7ffJ
 Zn9oPS815yHYxXFtdnq4M/ugihUQvNQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-luWADcN6PZSZIsTEd4d8vw-1; Fri, 24 Feb 2023 10:38:33 -0500
X-MC-Unique: luWADcN6PZSZIsTEd4d8vw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE8F13806102;
 Fri, 24 Feb 2023 15:38:32 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F8E8492B12;
 Fri, 24 Feb 2023 15:38:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 21/33] tests: acpi: update expected blobs
Date: Fri, 24 Feb 2023 16:38:00 +0100
Message-Id: <20230224153812.4176226-22-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

the only chenge is addition of _DSM- > EDSM method
on non-hotpluggable devices with configured acpi-index.
Something like:

  +                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  +                {
  +                    Local0 = Package (0x01)
  +                        {
  +                            0x65
  +                        }
  +                    Return (EDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  +                }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3260 -> 3309 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 12637 -> 12678 bytes
 tests/data/acpi/q35/DSDT.noacpihp           | Bin 8114 -> 8188 bytes
 4 files changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 70244976c9..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.noacpihp",
diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index bfe0bf37180c0f0521d264d3e35b5f51feff2630..bee88c5ee815f0acf022b278876f0a212b1da84a 100644
GIT binary patch
delta 134
zcmdlZ`Bsw4CD<k8Ee`_&<F1WdHe6ipS~2m#PVoZ%nwtZ-teKM3gN+U1IpQ5%f`Dq+
z7(~S5U4ngi3WQh~xl$9BxB@vDnOWHh(M^`Y#ujje><rOO8o>q#0Y(N938+q1Ms8h3
GB&`7G*&wt4

delta 85
zcmaDWxkr-ACD<io4-W$aqyI)O8!j$4^_cizr+5KBwao!s)=Y-{!Nvyh9Py4WK|nQZ
X4AD&r!NwMF0d}AOf3N{UfRO<Jc*7Ed

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 1240cede1a2fedc902b9dc71687880b73170e81b..595ab64601ae3deb12bbf18ca463e39ba0a86195 100644
GIT binary patch
delta 81
zcmcbc)RxTU66_MvX2`(67`Tz^t{ita7h_C(uv5H16W8WXax(nt>cQp~@f`7vE<rpD
j4Ezit;_)uQzB~m&ER0;K2}@jooQ%w@?1arcdV$OUo6Hrb

delta 41
xcmZomzMI7566_KZYskRBxM(BST{-S14#t@HV5fM2PWH{8<Yf3ao9p>A0{{}H42A#z

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index 44ee5e74c533f2c7554885b73adb947ed74b421f..c292c2369b011b779af44d0fa6fd2f7994098b2e 100644
GIT binary patch
delta 199
zcmdmF|Hq!oCD<k8k30hdqtiw%7g;Vpt(f>=r+5K3t;rFx_Uh`vh8FQ0@s2J*JPZuX
z3?kz3F2TM$1wt&0T&W35T!Ea7%&hE$$;)I_EG>hL5NcT&qMI~=4G;p13?dRx&8&>v
lx{S!WU&$(%ng$yq6te?$s{|VuK&(d5`4w5`W;MAUMgVo#G5-Jn

delta 125
zcmexkzsa7<CD<iolRN_hW86kA7g;VBwV3!|r+5J$)yWaE_Wb<8h8FQ0@s2J*JPZuX
z43qcCswgM~8zID48KRr`gAEV@j0}^d<rHLOf{hVk>_A1_!3G8plNdG^$n`J+09-yC
ANdN!<

-- 
2.39.1


