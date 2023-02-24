Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BDC6A1ED3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:45:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9c-0003vS-Ga; Fri, 24 Feb 2023 10:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9a-0003u8-Gp
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9X-0007VM-Qu
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoLRKsNhaHoP0w8AQgHGciNL6FtnrEIF576F40o7UIQ=;
 b=WVUPtrAmaB31ZIxFtIq5udIQ1CKSywZIQr9rW7m07+5PaGg1KglX1/JhrfUJCvUHD/RL2T
 rCWWb2oQrzcJhZJvzlVJ559ike1DA/73Y01bVgiubIUMvYJMuRSjNFruSAZHWayw0xTqSF
 UzpX8ZDpYau3wqqotbD3vfVkMcK2O7Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-Vr634pOOO16_Mgd6YcR8xA-1; Fri, 24 Feb 2023 10:38:29 -0500
X-MC-Unique: Vr634pOOO16_Mgd6YcR8xA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CD49811E6E;
 Fri, 24 Feb 2023 15:38:29 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A89EB492B12;
 Fri, 24 Feb 2023 15:38:28 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 17/33] tests: acpi: update expected blobs
Date: Fri, 24 Feb 2023 16:37:56 +0100
Message-Id: <20230224153812.4176226-18-imammedo@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h   |  37 ------------------
 tests/data/acpi/pc/DSDT                       | Bin 6360 -> 6454 bytes
 tests/data/acpi/pc/DSDT.acpierst              | Bin 6283 -> 6377 bytes
 tests/data/acpi/pc/DSDT.acpihmat              | Bin 7685 -> 7779 bytes
 tests/data/acpi/pc/DSDT.bridge                | Bin 12487 -> 12581 bytes
 tests/data/acpi/pc/DSDT.cphp                  | Bin 6824 -> 6918 bytes
 tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8014 -> 8108 bytes
 tests/data/acpi/pc/DSDT.hpbridge              | Bin 6323 -> 6417 bytes
 tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3166 -> 3260 bytes
 tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6432 -> 6526 bytes
 tests/data/acpi/pc/DSDT.memhp                 | Bin 7719 -> 7813 bytes
 tests/data/acpi/pc/DSDT.nohpet                | Bin 6218 -> 6312 bytes
 tests/data/acpi/pc/DSDT.numamem               | Bin 6366 -> 6460 bytes
 tests/data/acpi/pc/DSDT.roothp                | Bin 9745 -> 9839 bytes
 tests/data/acpi/q35/DSDT                      | Bin 8252 -> 8344 bytes
 tests/data/acpi/q35/DSDT.acpierst             | Bin 8269 -> 8361 bytes
 tests/data/acpi/q35/DSDT.acpihmat             | Bin 9577 -> 9669 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8531 -> 8623 bytes
 tests/data/acpi/q35/DSDT.applesmc             | Bin 8298 -> 8390 bytes
 tests/data/acpi/q35/DSDT.bridge               | Bin 11481 -> 11573 bytes
 tests/data/acpi/q35/DSDT.core-count2          | Bin 32392 -> 32484 bytes
 tests/data/acpi/q35/DSDT.cphp                 | Bin 8716 -> 8808 bytes
 tests/data/acpi/q35/DSDT.cxl                  | Bin 9578 -> 9670 bytes
 tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9906 -> 9998 bytes
 tests/data/acpi/q35/DSDT.ipmibt               | Bin 8327 -> 8419 bytes
 tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8340 -> 8432 bytes
 tests/data/acpi/q35/DSDT.ivrs                 | Bin 8269 -> 8361 bytes
 tests/data/acpi/q35/DSDT.memhp                | Bin 9611 -> 9703 bytes
 tests/data/acpi/q35/DSDT.mmio64               | Bin 9382 -> 9474 bytes
 tests/data/acpi/q35/DSDT.multi-bridge         | Bin 12545 -> 12637 bytes
 tests/data/acpi/q35/DSDT.noacpihp             | Bin 8022 -> 8114 bytes
 tests/data/acpi/q35/DSDT.nohpet               | Bin 8110 -> 8202 bytes
 tests/data/acpi/q35/DSDT.numamem              | Bin 8258 -> 8350 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8353 -> 8445 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8858 -> 8950 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8884 -> 8976 bytes
 tests/data/acpi/q35/DSDT.viot                 | Bin 9377 -> 9469 bytes
 tests/data/acpi/q35/DSDT.xapic                | Bin 35615 -> 35707 bytes
 38 files changed, 37 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8911b10650..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,38 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
-"tests/data/acpi/q35/DSDT.applesmc",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.core-count2",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.cxl",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.ipmismbus",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.noacpihp",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.pvpanic-isa",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/DSDT.xapic",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index ec133a6d3aabcfd22b7b46019338db2de255da70..521062a756d1fcd5939683e41071d29407a45b22 100644
GIT binary patch
delta 111
zcmca%xXp;mCD<jzOp<|tv1=k%s-6Q!e6Uk|bdv{rfU~CoN4$rp3y<RkE@qB+N0%T5
zj`&bd7X}e;R#%r`U)}{~lfxKwRk<2F5*QekBrK4boW;dnAjHbVz{`+O(A<&3z>rvw
L2$9@4(Om)nP{SR3

delta 57
zcmdmHbi<I#CD<k8h6Dox<GG1ksY*)m!A|kfP0|6*o(3H89-b~dju*I?IpQ5%f*3gB
NLp@y>HokY4008b%5ODwi

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index 2b4b7f31919f360e038e37de713639da753f13aa..12b9e94bf1449995d460edffd40d1ff7b9f292cc 100644
GIT binary patch
delta 111
zcmeA+d}+w#66_N4Qi6ejk!vDXs-6Q!e6Uk|bdv{rfU~CoN4$rp3y<RkE@qB+N0%T5
zj`&bd7X}e;R#%r`U)}{~lfxKwRk<2F5*QekBrK4boW;dnAjHbVz{`+O(A<&3z>rvw
L2$9@4@s~INTzwuz

delta 57
zcmaE9*loz=66_MvEy2LR=sS@sRY@s6*eO1`NjkvU(|{x1!_$Sw@d6h!N4%p;5Ccbi
MsHY3V#`nL(0md{CIsgCw

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 714a123e7a500cf0f862ff6c4e9a3f50a96af056..876d0184d8d56cc2fc9d4c0a619d5d449ba81687 100644
GIT binary patch
delta 111
zcmZp*d2GYw66_L^EXTmW=suAvRnLJVKG-Qfy2*n*z}eG)Bi_T)g~#y%7c)n^qe~D2
zM|`NK3xkL^tE)?}FYf}g$zhDTs$7j72@DKN5*Elz&f;P(5MpIw;AKcCXzs{iU`Q-T
Lgh+0jSRxAmL&P17

delta 57
zcmaEC(`v)z66_MfD#yUU*fo(WRY@s6*eO1`NjkvU(|{x1!_$Sw@d6h!N4%p;5Ccbi
MsHY3V#`h(%0J(t=fdBvi

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 6c0543cf75ad3e02468ed4925fd3369a183e9b45..219ddba2713015616e41c19f66d891c63b05e4ab 100644
GIT binary patch
delta 111
zcmX?}xHO5&CD<iI)sTUK@zO-DR6Pfd_+Y2_=q3;L0B27Fj(87G7aqq8T+AHtjxIqA
z9Py!^E({{xtgbG>zPt;}CWkTVs&X}UBrq^6Nmw8=Ig5+EK!}xzftMknpt&Q5fg!OV
L5hA&9qL~2zi1!{4

delta 57
zcmZ3QbUcyECD<k8xB&wLqu4~QR3)YOV5j)#Cg}iYPXms44^I~!#|vD{9Py4WK@1%6
Np`I=b8{eB5007;{5Cs4L

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index e1bcb0a4f3ee1269bdd5e949206b40d0e3c076e6..5b5b352a13947a48f98e46409b9ad9664b4de9bc 100644
GIT binary patch
delta 111
zcmZ2s+GfV(66_MfCe6UW_--Oss-6Q!e6Uk|bdv{rfU~CoN4$rp3y<RkE@qB+N0%T5
zj`&bd7X}e;R#%r`U)}{~lfxKwRk<2F5*QekBrK4boW;dnAjHbVz{`+O(A<&3z>rvw
L2$9@4QCtcDJ{uh@

delta 57
zcmZoOTVcxO66_MPLW+Tb(P$!9s*+NCuv2_=lXQTyrvXR2ho=jV;{`5ej(A6xAO?>3
MP)`?zjqk;!0Jqi;ApigX

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index 1c90e119c5d3dc7e86d04942114e5cfe40de6039..fbe755975d94e5e607820bb7acb2fb189b1105ee 100644
GIT binary patch
delta 111
zcmX?Sx5l2!CD<iojXVPb<F1KZsd^3^@xe~<(M=xg0nVNV9Pu8WE<BDGxR^QO9bJML
zIO0P+T^K~XSzTR%eR&s{O%7w!Rpn~zNMK-ClCVH#auyeRfe<Sb1202DL32kA14Cj#
LB1CfI#JzF=m%$#Y

delta 57
zcmZ2uf6k7}CD<jzPo9B+@$W>gR3)YOV5j)#Cg}iYPXms44^I~!#|vD{9Py4WK@1%6
Np`I=b8{hAh0|4L15T5`5

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 04e1c20f63be7c6c574e72590332707ca410852a..12d7daf950ba93deaeb67655d303df3960569a64 100644
GIT binary patch
delta 111
zcmdmNIMIm9CD<iIP?CXx@#{pcR6Pfd_+Y2_=q3;L0B27Fj(87G7aqq8T+AHtjxIqA
z9Py!^E({{xtgbG>zPt;}CWkTVs&X}UBrq^6Nmw8=Ig5+EK!}xzftMknpt&Q5fg!OV
L5hA&9qLKsvN_rhr

delta 57
zcmbPewAql$CD<iovjhVJqvb@dR3)YOV5j)#Cg}iYPXms44^I~!#|vD{9Py4WK@1%6
Np`I=b8{aEQ006z=4@dw2

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index 893ab221c2cca1829937a4c26152680313633df4..bfe0bf37180c0f0521d264d3e35b5f51feff2630 100644
GIT binary patch
delta 152
zcmca7u}6~2CD<io4-W$aqyI#%)OrVw_+Y2_=q3;L0B27Fj(87G7aqq8T+AHtjxIqA
z9Py!^E({{xtgbG>zPt;}CTB4e2r@G=BrK4cG&w_1m`mV-`N^ljrd7TZ#b5bK9(ML!
zlCXe%Y9<%cl7s@T#*PFA2B3h<<SZ`s0wGo=2404Qg657K28P6fM6e`d!p4bbxdG~5
BEdl@l

delta 57
zcmdlZc~64NCD<h-j)#GPaneMtR3)YOV5j)#Cg}iYPXms44^I~!#|vD{9Py4WK@1%6
Np`I=b8{ePh1^~nh5CQ-I

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 3c2aba132f10b5e4a9931877533a9d8f260b7381..3a19ce439825c2aa97adee3a965ac050dec6f2d0 100644
GIT binary patch
delta 111
zcmZ2r^v{UPCD<jTPLhFvk!>PZs-6Q!e6Uk|bdv{rfU~CoN4$rp3y<RkE@qB+N0%T5
zj`&bd7X}e;R#%r`U)}{~lfxKwRk<2F5*QekBrK4boW;dnAjHbVz{`+O(A<&3z>rvw
L2$9@4v0nlJLd_kS

delta 57
zcmexow7`hVCD<iIL6U)i(Q_hKs*+NCuv2_=lXQTyrvXR2ho=jV;{`5ej(A6xAO?>3
MP)`?zjqm#<0J?AwjsO4v

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 811965f42d97adadde6e9ec6d6153e767041bc6d..8ad5c523fdf76b90286a145f797454dff6da050c 100644
GIT binary patch
delta 111
zcmZ2((`w7*66_MvD#yUUSTm6;RnLJVKG-Qfy2*n*z}eG)Bi_T)g~#y%7c)n^qe~D2
zM|`NK3xkL^tE)?}FYf}g$zhDTs$7j72@DKN5*Elz&f;P(5MpIw;AKcCXzs{iU`Q-T
Lgh+0jI87D+OwAq2

delta 57
zcmZp*U2enW66_M9F2}&YxPKy7s*+NCuv2_=lXQTyrvXR2ho=jV;{`5ej(A6xAO?>3
NP)`?zjqj()0sy<D55E8a

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index bbf73023ade329770ff9f9ac5c897218764182b5..4fd4d38e5ffe889fed812b67d3d7b1825325e909 100644
GIT binary patch
delta 111
zcmX?Qu)>hbCD<iog#-fwW5`6VR6Pfd_+Y2_=q3;L0B27Fj(87G7aqq8T+AHtjxIqA
z9Py!^E({{xtgbG>zPt;}CWkTVs&X}UBrq^6Nmw8=Ig5+EK!}xzftMknpt&Q5fg!OV
L5hA&9;!be@T~!_m

delta 57
zcmZ2sc*=mwCD<jzOM-!car#8AR3)YOV5j)#Cg}iYPXms44^I~!#|vD{9Py4WK@1%6
Np`I=b8{h8~2LQy%5B~rF

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index c5d93366a417ad1a92c01659f1db9c159caa7132..4cfb3765c5c5c7cf73732f2d3fd5bf9932399c14 100644
GIT binary patch
delta 111
zcmca-xW|agCD<jzMv{Sn(PSc5s-6Q!e6Uk|bdv{rfU~CoN4$rp3y<RkE@qB+N0%T5
zj`&bd7X}e;R#%r`U)}{~lfxKwRk<2F5*QekBrK4boW;dnAjHbVz{`+O(A<&3z>rvw
L2$9@4(N_WhH^m)3

delta 57
zcmdmEbkC5>CD<k8o&*B}W5q<SR3)YOV5j)#Cg}iYPXms44^I~!#|vD{9Py4WK@1%6
Np`I=b8{hj%0085x5HkP(

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 9e3d482366bd800cf987044801eebc814629b15b..8b695cca83c04b4123986e1334d0c57ddb22687d 100644
GIT binary patch
delta 111
zcmbQ}^WKNcCD<h-UyXr*QFS6$s-6Q!e6Uk|bdv{rfU~CoN4$rp3y<RkE@qB+N0%T5
zj`&bd7X}e;R#%r`U)}{~lfxKwRk<2F5*QekBrK4boW;dnAjHbVz{`+O(A<&3z>rvw
L2$9@4u|X98R^lDX

delta 57
zcmaFwGtr03CD<iIP>q3sF=HZEs*+NCuv2_=lXQTyrvXR2ho=jV;{`5ej(A6xAO?>3
MP)`?zjqe*&0mH)&zW@LL

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index c304e15e366d7317fd0e9db0a144f02e0437d7a1..3dadeba912d9133f0ccb6e9b89a22ca7dc43f18f 100644
GIT binary patch
delta 90
zcmdnvFvF3{CD<ioh5`cv<LrrCsa%dC@xe~<(M|sR6Dt>TiFmWRx&-_3E-;%c$)u~w
q)!321z_27?fz0GAF7^T;Rwf2shJ=FVjvNMt#DYYK<Yp;GC3ygdD;U54

delta 37
tcmbQ?xW|FZCD<jzMuCBWaq2{_R4!M(_+Y2_=q6{biIodCmoX~I0|3iS3h@8{

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index 3aa5c4b3193d32bb8263a1fe06c05b714541c532..7e43fa88c39737198427744ddb8d902edd517794 100644
GIT binary patch
delta 90
zcmX@>u+ovsCD<ior2+#3qxD3tR4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<depu{;2M02rhI

delta 37
scmZ4Kc-Dc-CD<jzSAl_n(R3nLDwiu?e6Uk|bdxjJ#L9)6%NUL20m*X;)c^nh

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 3ffbf8f83f64144ace17ff5f06bcb4fec9df33d9..7c626642ba1ef231ee4e1353330ca9ae2955f37f 100644
GIT binary patch
delta 90
zcmaFqb<~^7CD<k8s44>kW5h(RR4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<depzX|}Vof%I6

delta 37
scmX@={nCreCD<h-Q<Z^%F=!%JDwiu?e6Uk|bdxjJ#L9)6%NYGt0NQ>FfB*mh

diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
index ebec32b575d310f98937fe9208f0c60349ca753d..631a1048fc01a3c84aadfdea8e0eccc36c68d8a4 100644
GIT binary patch
delta 90
zcmccYwBDJ^CD<ioy&?kxqvAxaR4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<depr2+tb7Z|7j

delta 37
scmZ4QeA$W1CD<h-SdoE&QF<a*Dwiu?e6Uk|bdxjJ#L9)6%NQ*c0Lm!}*#H0l

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index b0994644ec811b962e80f49e36e122967f5af1d1..cb117fd671effe2557a41115015b57df87d7936b 100644
GIT binary patch
delta 90
zcmaFmaLkd*CD<k8m;wU>WA{X^R4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<dd;fII-QQ5k3e

delta 37
scmX@+_{xFHCD<h-OM!ubv2`L>Dwiu?e6Uk|bdxjJ#L9)6%NPUX0o*YQnE(I)

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 8e11b8ea4862c8ec27376703c9c43e9895ca60eb..cdfd51ce70d7201fa827bfabfd23e413596b1094 100644
GIT binary patch
delta 90
zcmcZ^xiyN*CD<jzRF{E)k$)mrDwm^3e6Uk|bdx{-#L9(SBHpa7F2TOM3(O`<GU=*v
qHFhL0Ff2(}ATv3Oi@iXIm5G6uA)%nTBZq+@u^<s5xmk*Fzcv7A_!#p5

delta 37
tcmdlQbu*I7CD<k8rVaxGBiBT(R4!M(_+Y2_=q6{biIodCmoe_w1_0rN3?u*m

diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
index a895599c3c53c0cd0888ec166a30d6c036d26b93..2bf77bb4e1a433eab66d0fdd175344d4f8d6e168 100644
GIT binary patch
delta 92
zcmeD9%lPCkBbQ6COURQt1_s7$6S-2k97W=To#LaL{P`zVF60vNW_5K5_T^n*Hd&HM
sSCy-=BY}ZoNx}k|$yr?N1wyP$47>~p1<f5f3=D|{i4e)nQjB@E09CIW!T<mO

delta 39
vcmaFzm$Bn7BbQ6COGrl@0|VoRiCn2%u6*&qPVv!A&Ri2K7j7<N%&P?e9rF$I

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 725998cb587c02ac963f290bac5c14d665bc85e9..1837442bd39f1249fb753530ea508d05e8d177f4 100644
GIT binary patch
delta 90
zcmeBidEvt466_L^p~S$z_<tf-Dwm^3e6Uk|bdx{-#L9(SBHpa7F2TOM3(O`<GU=*v
qHFhL0Ff2(}ATv3Oi@iXIm5G6uA)%nTBZq+@u^<s5xmk+wlL7#x^%?E}

delta 37
tcmaFi(&NJA66_Mfqr||#_;VsxDwiu?e6Uk|bdxjJ#L9)6%NRc?007q13?Bdh

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index 04c2c66a25536854b4305787c8e0b41e96c3c133..023da0665f9123943e23fd771725f4b8eb937135 100644
GIT binary patch
delta 90
zcmaFmb<CT~CD<k8m?{GU<CKY9sa%dC@xe~<(M|sR6Dt>TiFmWRx&-_3E-;%c$)u~w
q)!321z_27?fz0GAF7^T;Rwf2shJ=FVjvNMt#DYYK<Yp<x02Kheav6^R

delta 37
scmX@+{mP5WCD<h-OO=6vv2P+*Dwiu?e6Uk|bdxjJ#L9)6%NPSx0N_XqzyJUM

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index ef643b4ee02cacb9a55f89b8e7f05524125515a1..2ad9b1c30e9a583cc43e8efbc1e276b4f221ff28 100644
GIT binary patch
delta 90
zcmdnw+vmsS66_Mfr_R8@cxob7Dwm^3e6Uk|bdx{-#L9(SBHpa7F2TOM3(O`<GU=*v
qHFhL0Ff2(}ATv3Oi@iXIm5G6uA)%nTBZq+@u^<s5xmk*FhAIGWlNjy*

delta 37
tcmeD4+vLmT66_MPNsWPl@#sXZR4!M(_+Y2_=q6{biIodCmod&z1pwaH3?Bdh

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index b136aea961c89a97db09db9b68809979564d8faf..c552e668983198d077348a57a5b22065d01b40f1 100644
GIT binary patch
delta 90
zcmZp7eC){O66_N4Sb>3o@xVl`R4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<dd;t~>y;_ZgA^

delta 37
scmaFt*zU;X66_MvuE4;+xN9O;Dwiu?e6Uk|bdxjJ#L9)6%NTRz0ox=C!vFvP

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 0970dbd5896fc0038b1369dbbcc982ead7736ae6..9fe6d1686a777ffddc2953420cd4838832226bad 100644
GIT binary patch
delta 90
zcmbQ@_`#9OCD<k8g8~Bsqr*h5R4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<dd;l{^5NI2lF&

delta 37
tcmez1IK`36CD<ioiUI=zqt!&NR4!M(_+Y2_=q6{biIodCmoZk!0|3<03wHnj

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index 3aa5c4b3193d32bb8263a1fe06c05b714541c532..7e43fa88c39737198427744ddb8d902edd517794 100644
GIT binary patch
delta 90
zcmX@>u+ovsCD<ior2+#3qxD3tR4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<depu{;2M02rhI

delta 37
scmZ4Kc-Dc-CD<jzSAl_n(R3nLDwiu?e6Uk|bdxjJ#L9)6%NUL20m*X;)c^nh

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 9709e5a7a7edcb7509954b553f7bf29a424033db..a98ee8c7731c8aaf383e84fd48b90633e53ef240 100644
GIT binary patch
delta 90
zcmeD7e(ufX66_N4T$O==v3DX@Dwm^3e6Uk|bdx{-#L9(SBHpa7F2TOM3(O`<GU=*v
qHFhL0Ff2(}ATv3Oi@iXIm5G6uA)%nTBZq+@u^<s5xmk*_Pz3<6Tp5i3

delta 37
scmaFv-R;fg66_Mvt;)c_*glafmCKbcKG-Qfy2+VqV&%fkWsHR?0NZa1z5oCK

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index e1cd01f2349bb8c2f7f8badad11441ffe6d57acc..61e994d2651e15e232d9b5930bca32a33fd0b090 100644
GIT binary patch
delta 90
zcmZ4H+2qCL66_Mfq{_g+=rNHimCI2iKG-Qfy2+n^V&y_E5pPykmtbGs1!j{anRHdT
q8aomg7?va~keQst#a<x9%EZ9SkWkRvk;A}{Sda*j+$_b|qYMB!T^KL`

delta 37
scmZqjTIR{+66_MPOof4g(Rm_QDwiu?e6Uk|bdxjJ#L9)6%NTo<0nHH$VE_OC

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 3b9dffb565833cc87bbf08dadfc1f31ac858e93b..1240cede1a2fedc902b9dc71687880b73170e81b 100644
GIT binary patch
delta 90
zcmZonx|_u166_KZYskRBxM(6*Dwm^3e6Uk|bdx{-#L9(SBHpa7F2TOM3(O`<GU=*v
qHFhL0Ff2(}ATv3Oi@iXIm5G6uA)%nTBZq+@u^<s5xmk+wxjq1xff>I5

delta 37
tcmcbc)R@HO66_MfXvo08IA<bPDwiu?e6Uk|bdxjJ#L9)6%NU>Q0|3+S3-AB{

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index 4ea982de2df3cf7cd89cb3b4467a350eaf8f5d29..44ee5e74c533f2c7554885b73adb947ed74b421f 100644
GIT binary patch
delta 130
zcmca+x5=K%CD<iolRN_hW86fpR4zx6_+Y2_=q7*uiIoduM7&vDU4ngi7nn`XVki(~
zW@JcMAT?=nhM+K)zy<S@PlHXXd?$*(@|8U7?7Jjk0sGWUE~X_31ze3C2@DKC0h!5J
eT<irxtV|5N3<(9z9XSjPi3N!e$<0!XHgW)B)hHGK

delta 37
scmdmFf6b1|CD<h-OrC*(F=8TDDwiu?e6Uk|bdxjJ#L9)6%NT9s0MCXC761SM

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index 2cf7f6db0fd8de357278f942a4082e714804dca9..be3060aa51d67c0f02c70bd0a7d5c028016641a1 100644
GIT binary patch
delta 90
zcmZ2y-{rvN66_MfrNF?zm@<(omCI2iKG-Qfy2+n^V&y_E5pPykmtbGs1!j{anRHdT
q8aomg7?va~keQst#a<x9%EZ9SkWkRvk;A}{Sda*j+$_a7MGgQ#U>HsS

delta 37
tcmeBjSZB}W66_MPPM(2*F@7RfDwiu?e6Uk|bdxjJ#L9)6%NVD~0RYc^3x5Cr

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 310e3d5053b90863f96c29dd69a514b4999b4a19..5e94a2b61f840c68d27257831cf608d41ee7c154 100644
GIT binary patch
delta 90
zcmX@)Fwc?8CD<ioo&o~{qw7SjR4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<dephCBdt!5D%7

delta 37
scmbQ|c*udvCD<jzNr8cZ(S9OVDwiu?e6Uk|bdxjJ#L9)6%NRA}0mb(Uvj6}9

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index 6672b6fa05c8ee30a8ea4ab0931d59c1315a4e9c..0e609a0c48fef371f935f239ebb9620fa116b049 100644
GIT binary patch
delta 90
zcmZ4J_}7ukCD<k8uL1)Dqu)fXR4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<dd;yF37^p&5t(

delta 37
tcmezCxX_WyCD<iop#lQ~qsK(9R4!M(_+Y2_=q6{biIodCmoc`>0|47X3%LLQ

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index eae2dc599331516e11632356f05d7831d1fa1e6a..fc6cc4585a6b1d955bc80700ec2dc2720b7e4a89 100644
GIT binary patch
delta 90
zcmbQ``puQgCD<k8n-T*9<C%$Esa%dC@xe~<(M|sR6Dt>TiFmWRx&-_3E-;%c$)u~w
q)!321z_27?fz0GAF7^T;Rwf2shJ=FVjvNMt#DYYK<Yp<x21NkPNE!A3

delta 37
tcmez7I?I*ICD<iomJ$O4<FSccsa&pn@xe~<(M`@=6Dt>PE@Ny^1OVk43?~2p

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 68c6a7d244cfc78efa6b9cd1385f2134ca149ad7..815006e445d0ec44c2f4a7c8d30ead6616a32b32 100644
GIT binary patch
delta 90
zcmdnuI>C+0CD<iIK$(Gov2`L>Dwm^3e6Uk|bdx{-#L9(SBHpa7F2TOM3(O`<GU=*v
qHFhL0Ff2(}ATv3Oi@iXIm5G6uA)%nTBZq+@u^<s5xmk*FmLdRFT^N}F

delta 37
tcmbQ>w#AjpCD<ioixL9^W5YzQR4!M(_+Y2_=q6{biIodCmod&#1OV313(5ch

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index 4d2937a87c4a39993eaa756f02d59ef35a08f1c2..a53b3135c85b0908a794f93c7f2e5d3720b79a7d 100644
GIT binary patch
delta 90
zcmZ4J`PY-nCD<k8uL=VLBilr-R4zx6_+Y2_=q7*uiIoevM7&vDU4ngi7nn_!WYSgT
qYV1g0U|5o{KxT3l7khyaD-#1RLqb7wM-Br+VnHHAa<dd;yD|Ws1sPZX

delta 44
zcmezCxzLl#CD<iop$Y>7Bf~_lR9;uU_+Y2_=q6{b0B6t1{<5MICw6WwV{BIj04Q7y
Ad;kCd

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index e9b4881bdc72eb7c59dcf258c1a98363b46bfbcd..8cf5b9703d617d0a0b16d41cd713f7883c80fcfe 100644
GIT binary patch
delta 92
zcmbO~jp_F^CN7s?myqgi1_s8!iCn2%jw12FPVv!A{`?aw7jlVsv%0zj`|>U@n=Hws
stIE~bk-)&PBw>Nf<SZ`s0wGo=2404Qg657K28P6fM2O^ODMr>V0OF+@2LJ#7

delta 39
vcmex8jcNWgCN7s?mk{}G1_nm&iCn2%u6*&qPVv!A&Ri2K7j7<NWbFa~^OOuY

-- 
2.39.1


