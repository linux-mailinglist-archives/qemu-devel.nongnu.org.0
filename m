Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353776A1EDA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:47:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9W-0003qE-JR; Fri, 24 Feb 2023 10:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9P-0003my-TV
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9N-0006xq-Pr
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCEjonV3eSaHd627+Vh7eixQBcFOXJJHYT3tIwYuCYU=;
 b=B/5tWrS7ERDOS/2E74N1s9A1Wt7vtvU9pwl33sosLDcbZ4IEm5MhtKyCXq7Xh5I7urnOkl
 f/60CH+yI0mptlfA7cXmPYEvUewdTYVPUfkx01Ahf9q+GA3I4Js178CeOSKvvLjA2wIDC/
 IQjNh25uhahrBZYYroxRxouiJ2IaHVA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-JpCgw4OUMCCLdqyTuIv03A-1; Fri, 24 Feb 2023 10:38:17 -0500
X-MC-Unique: JpCgw4OUMCCLdqyTuIv03A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FCF93C02527;
 Fri, 24 Feb 2023 15:38:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CEFD492B12;
 Fri, 24 Feb 2023 15:38:16 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 03/33] tests: acpi: update expected blobs
Date: Fri, 24 Feb 2023 16:37:42 +0100
Message-Id: <20230224153812.4176226-4-imammedo@redhat.com>
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

expected changes:
Basically adds devices present on root bus in form:
  Device (SXX)
  {
     Name (_ADR, 0xYYYYYYYY)  // _ADR: Address
  }

On top of that For q35.noacpihp, all ACPI PCI hotplug
AML is removed and _OSC get native hotplug enabled:

                       CreateDWordField (Arg3, 0x04, CDW2)
                       CreateDWordField (Arg3, 0x08, CDW3)
                       Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
  -                    Local0 &= 0x1E
  +                    Local0 &= 0x1F
                       If ((Arg1 != One))
                       {
                           CDW1 |= 0x08
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3081 -> 3115 bytes
 tests/data/acpi/q35/DSDT.noacpihp           | Bin 8252 -> 7932 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b2c5312871..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT.noacpihp",
diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index a71ed4fbaa14be655c28a5e03e50157b4476e480..d77752960285a5afa6d0c0a04e400842f6acd2ed 100644
GIT binary patch
delta 100
zcmeB_SS`Wj66_M9&BMUJ_;DlGJx(rXm6-Tor+5Kx<;|Zse=<548N_qMJGuk`Rj@Eb
YH}MA>S-=HY!2-qz6>JazgbH>B01xpO00000

delta 66
zcmZ22(J8^@66_Mf$-}_Fcyc4xJx(r1rI`3&r+5KR#m%2Me=^D$TEuh2JGuk`RWLI|
NH}MA>8NdZt7ywGL58eO(

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index d68c472b460e4609a64ea67de3c4cebfca76164d..f35338db30a44638cc3a55d2870e0e377af4246f 100644
GIT binary patch
delta 160
zcmdnv@W+<RCD<k8j~oL7<AsS_R~Y3d-Y?y}kV#F7$x(3gNf~~|$trT`TwV$>@xe~<
z0!|8(r^?wU^9LJR#B;<ux&-ksFfcPjH}MA>8NdZtAOZ*#tY86SgbFr@073;jSil6K
Lf@AYVxj04uw-F~b

delta 485
zcmexkyT^gcCD<jzMuCBWaq2{_D~xgz@0ZpK_=xDm2Rp?FIC~mIHv~8bhcI#<;Njwk
zZWI7<oPpw@3P8d|A-W;h)hnKn`veacOLQYQh~w;J;OYgGaPspFV&uL6(FWo;JNbqB
zDg=1CL?}cvI{7$zGl-}LIJ<f=MJt1N|Nj?cfK(Jz)-z@@fDDON2Z=9X5Ycu7YQj(k
zR0T4u07N7})h38IaR#^q`|>VuVVj)AP$0<6$dFLLkhnl<(&P+5VJ?9S<|m&9n^yTw
z6o2I_dDz)^Nx}m5shM0%OA-n|mNa+dFfjN7Nk)bwpq|>vNeq*dc>V(cLv12sVr^n2
zBNsbEVnJd@0s{k3uj=G1F7^T;Rwf2spgnLCAO;j9K~!xHVN{c1@)g}&BhAm~72V{;
z65tUK#1Ze|>B1Y}7hvFMV8*}^9}40*dn$P3mlWibrYjVs7U!21C8rhx<$^;Txwtvv
zor8h}dAYdU84vIr;9-=Q+$odE<suaWiYfsg$;p3Y>^Cozjb`K(;E8t+a1~*TcQr6%
F000aMj?@4E

-- 
2.39.1


