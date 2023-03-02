Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CEB6A862E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlbo-0007He-2k; Thu, 02 Mar 2023 11:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbR-0006RN-Hq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbF-0000Pz-Cc
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VqQ1Aj5CQmfWpS2lVf/FOowcB863JA0C97c6Ka79wI=;
 b=Us22Y+wjaKnv6S5RtXpJJ14oD41BrRZFRXBidGc1jUU+/FOSQrkQI+FAyBt0nbVWoebuYM
 kU7QQ+T7hOI29Wrhm8vh/S7onxzeZdi9e9PerFT5TqvC74OsW5Vr8y/kFSYSJ1wjaGsxPn
 srWS1m2TAY+2bhLhXq2SMEJyirycGgY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-p6lk687rOJOhdbL-63S8mQ-1; Thu, 02 Mar 2023 11:16:05 -0500
X-MC-Unique: p6lk687rOJOhdbL-63S8mQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 329101875043
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:16:05 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FC78140EBF6;
 Thu,  2 Mar 2023 16:16:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 25/34] tests: acpi: update expected blobs
Date: Thu,  2 Mar 2023 17:15:34 +0100
Message-Id: <20230302161543.286002-26-imammedo@redhat.com>
In-Reply-To: <20230302161543.286002-1-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

in PC machine case piix3-ide and PIIX4_PM get exposed

  +            Device (S09)
  +            {
  +                Name (_ADR, 0x00010001)  // _ADR: Address
  +            }
  +
  +            Device (S0B)
  +            {
  +                Name (_ADR, 0x00010003)  // _ADR: Address
  +            }

in q35 machine case ich9-ahci gets exposed
  +            Device (SFA)
  +            {
  +                Name (_ADR, 0x001F0002)  // _ADR: Address
  +            }

and addtional pci-testdev, virtio-balloon exposed in q35 multi-bridge test case
  +            Device (S14)
  +            {
  +                Name (_ADR, 0x00020004)  // _ADR: Address
  +            }
  +
  ...
  +            Device (S22)
  +            {
  +                Name (_ADR, 0x00040002)  // _ADR: Address
  +            }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h   |  37 ------------------
 tests/data/acpi/pc/DSDT                       | Bin 6454 -> 6488 bytes
 tests/data/acpi/pc/DSDT.acpierst              | Bin 6377 -> 6411 bytes
 tests/data/acpi/pc/DSDT.acpihmat              | Bin 7779 -> 7813 bytes
 tests/data/acpi/pc/DSDT.bridge                | Bin 12581 -> 12615 bytes
 tests/data/acpi/pc/DSDT.cphp                  | Bin 6918 -> 6952 bytes
 tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8108 -> 8142 bytes
 tests/data/acpi/pc/DSDT.hpbridge              | Bin 6417 -> 6451 bytes
 tests/data/acpi/pc/DSDT.hpbrroot              | Bin 3309 -> 3343 bytes
 tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6526 -> 6560 bytes
 tests/data/acpi/pc/DSDT.memhp                 | Bin 7813 -> 7847 bytes
 tests/data/acpi/pc/DSDT.nohpet                | Bin 6312 -> 6346 bytes
 tests/data/acpi/pc/DSDT.numamem               | Bin 6460 -> 6494 bytes
 tests/data/acpi/pc/DSDT.roothp                | Bin 9839 -> 9873 bytes
 tests/data/acpi/q35/DSDT                      | Bin 8344 -> 8361 bytes
 tests/data/acpi/q35/DSDT.acpierst             | Bin 8361 -> 8378 bytes
 tests/data/acpi/q35/DSDT.acpihmat             | Bin 9669 -> 9686 bytes
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8623 -> 8640 bytes
 tests/data/acpi/q35/DSDT.applesmc             | Bin 8390 -> 8407 bytes
 tests/data/acpi/q35/DSDT.bridge               | Bin 11573 -> 11590 bytes
 tests/data/acpi/q35/DSDT.core-count2          | Bin 32484 -> 32501 bytes
 tests/data/acpi/q35/DSDT.cphp                 | Bin 8808 -> 8825 bytes
 tests/data/acpi/q35/DSDT.cxl                  | Bin 9656 -> 9673 bytes
 tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9998 -> 10015 bytes
 tests/data/acpi/q35/DSDT.ipmibt               | Bin 8419 -> 8436 bytes
 tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8432 -> 8449 bytes
 tests/data/acpi/q35/DSDT.ivrs                 | Bin 8361 -> 8378 bytes
 tests/data/acpi/q35/DSDT.memhp                | Bin 9703 -> 9720 bytes
 tests/data/acpi/q35/DSDT.mmio64               | Bin 9474 -> 9491 bytes
 tests/data/acpi/q35/DSDT.multi-bridge         | Bin 12678 -> 12729 bytes
 tests/data/acpi/q35/DSDT.noacpihp             | Bin 8188 -> 8205 bytes
 tests/data/acpi/q35/DSDT.nohpet               | Bin 8202 -> 8219 bytes
 tests/data/acpi/q35/DSDT.numamem              | Bin 8350 -> 8367 bytes
 tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8445 -> 8462 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8950 -> 8967 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8976 -> 8993 bytes
 tests/data/acpi/q35/DSDT.viot                 | Bin 9453 -> 9470 bytes
 tests/data/acpi/q35/DSDT.xapic                | Bin 35707 -> 35724 bytes
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
index 521062a756d1fcd5939683e41071d29407a45b22..32d255cfc0a207c89bf8459edaca11fad12979e9 100644
GIT binary patch
delta 72
zcmdmHbi;_tCD<h-LXv@jas5WFtK3|^7h>Xro#F*tFKm9veVS38KiI%Bo+IATC5VTS
WfsrA)2`JzM6<}sy+`N&ul^Xyg{1i$6

delta 40
wcmca%w9SaiCD<jzOp<|tv1=pORc<ctb20J3PVoZH=Qh9OKFzrK8gCOf01c`RDgXcg

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index 12b9e94bf1449995d460edffd40d1ff7b9f292cc..33e872b2fae3d974a3dc4ec0401b1f1734db313b 100644
GIT binary patch
delta 72
zcmaE9*lon+66_MfEy=*ZXuFZ?DmRzInV9%sr+5L6)0<y%pJtTj4>quj=ZJT73F2X7
WU}T7H0tz@m1(+EaH*e&%;06Hf%o7j*

delta 40
wcmeA+dTGez66_N4Qi6ejk!vH@Rc<c7lQHqZPVoY6CpW+3KFzrK8m}og01(a%@Bjb+

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 876d0184d8d56cc2fc9d4c0a619d5d449ba81687..cd84abc1b1d026e6055057f4c6170146e1921ea6 100644
GIT binary patch
delta 72
zcmaEC(`w7*66_MvD#yUUn6r_KNs!C;LQH(HQ@nudh0S7ury1q>gAFX>IpQ5%f_NAi
V7#X6QfC5fX0cHlq&G&>_xdG9V62Jfe

delta 40
wcmZp*eQd+!66_L^EXTmW=)RGQNs!C?TugkhQ@nulxy@pNrx`ah3pa5C0PMvJp#T5?

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 219ddba2713015616e41c19f66d891c63b05e4ab..69a73ea2a691de387b82bf85a7ba1a2279c01a0c 100644
GIT binary patch
delta 73
zcmZ3QbUca6CD<jz-H?HSk!>T_Rc`K1Po|joV5fM22G7l}xX&=k^9LJP#&g6wx&-ks
XGB7ekHvt8lpaRScjGH&}7AXS&{T>rr

delta 41
xcmX?}v^0s!CD<iI)sTUK@zO@FtK8h}?o2W9!A|i4eQujyai3w_e1kV%82}z|4m$t<

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 5b5b352a13947a48f98e46409b9ad9664b4de9bc..20379056b399bf1ad8b8316453eac344f604d3b6 100644
GIT binary patch
delta 72
zcmZoOTVclK66_M9A<e+RD7=wtDKD4rg_!tYr+5L^3!8WHo@SKi4>quj=ZJT73F2X7
WU}T7H0tz@m1(+EaH#hRPasvR%(-NKl

delta 40
wcmZ2s)@H`#66_MfCe6UW_--TDQeH0ab20J3PVoZH=Qi);J<Ygz8GjQu0RBM@egFUf

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index fbe755975d94e5e607820bb7acb2fb189b1105ee..435496e836939eeb767f1a524dc1471740ad917e 100644
GIT binary patch
delta 72
zcmZ2uf6kuECD<k8oIC>q<Nb|X-a=fy7h>Xro#F*tFKmt%I?X80A8cS5&k^tF62!yE
Wz{n8Y1Qc+B3NSM;ZdMm*<puy8sS|Sm

delta 40
wcmX?Szs8=+CD<iojXVPb<F1Wd-a=g7=VIc6o#F+Y&uxwuI?cG*N2G}x01wv<Qvd(}

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index 12d7daf950ba93deaeb67655d303df3960569a64..b6eafab250d508e1358ea09f81eb1b2a6d96ce32 100644
GIT binary patch
delta 72
zcmbPewAqNuCD<jzSdxK(QF9~LRc<bib20J3PVoW`=Qh9OKFui4A8cS5&k^tF62!yE
Wz{n8Y1Qc+B3NSM;Zr;e7zzqQA3KJp#

delta 40
wcmdmNG|`C5CD<iIP?CXx@#{vetK3{}XJX=mo#F-jPH%q6eVTFeHQrcm00>qN0ssI2

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index bee88c5ee815f0acf022b278876f0a212b1da84a..a4073f36d686201296455e142e3bcbb2f368bbd2 100644
GIT binary patch
delta 71
zcmaDW*)PTA66_Mf&&$BT_;w?g4HuWEPE35TQ@ntq&gKBF(~R=`!3LJ`9Py4WK|G8M
Uj119DKmjMH05b#QWC@<D0D)Ez_W%F@

delta 39
vcmeB|dMnB066_N4mWP3Xao0vJ8!j$)t(f>=r+5K>&CLN^rx_>P@>~J{=n)Io

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 3a19ce439825c2aa97adee3a965ac050dec6f2d0..06aa7bfdeca40e10ee8411eeda08486599b90e39 100644
GIT binary patch
delta 72
zcmexow7{6lCD<iofg}S1qxMFwtK3|!S7YLXo#F+2uWWwFEzBg(A8cS5&k^tF62!yE
Wz{n8Y1Qc+B3NSM;ZvM&J$_)SnsuQ^Y

delta 40
wcmZ2r{LhHXCD<jTPLhFvk!>T_Rc<cl%Q5l6PVoZXmo~rT7G~Nk$JfLS00Vstng9R*

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 8ad5c523fdf76b90286a145f797454dff6da050c..10a0e44d610976cd5f08d53ec32c7d5eda064e1c 100644
GIT binary patch
delta 71
zcmZp*U2e<e66_MPT#kW(ap6WT6+tfF3o-G*PVoY+7dBf6o@SKi4>quj=ZJT73F2X7
VU}T7H0tz@m1(+EaHwm|L0|3mt5<&m~

delta 40
wcmZ2(+iJ_@66_MvD#yUUShJB!MUcz;TugkhQ@nulxy=@Wrx`b^3O8{B0P>CuBLDyZ

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index 4fd4d38e5ffe889fed812b67d3d7b1825325e909..6905312d827502e8bb5852418cf58290eda8d86b 100644
GIT binary patch
delta 72
zcmZ2sc*>B=CD<k8lmr6<W93FJcWy4<3o-G*PVoY+7dA(8pJtTj4>quj=ZJT73F2X7
WU}T7H0tz@m1(+EaH!JhDasvSLxe~nq

delta 40
wcmX?QxWbUjCD<iog#-fwW5`A>cWy54b20J3PVoZH=Qc-kpJv?b!P~?Q0R2Y{od5s;

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 4cfb3765c5c5c7cf73732f2d3fd5bf9932399c14..59e31338eeb3a84c39ed3ae63105226ce2ad1125 100644
GIT binary patch
delta 72
zcmdmEbkB&(CD<h-PLhFvF>)i<ZEh~#3o-G*PVoY+7dF4=KFui4A8cS5&k^tF62!yE
Wz{n8Y1Qc+B3NSM;Zr;w@$_)S*rW6<e

delta 40
wcmca-w8x0cCD<jzMv{Sn(PSgnZEh~_b20J3PVoZH=Qh9RKFzrK4sR1T00>kK_y7O^

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 8b695cca83c04b4123986e1334d0c57ddb22687d..448d596cf413d7e487af114e5c80bc73311d17f9 100644
GIT binary patch
delta 73
zcmaFwGtrmJCD<ioq8bAOqt`~RtK8hZ^BH5}gPr09TIO$l#eIfRo<G>YGM*#e(Itq7
Xk%5sRx(O)Y1QlRrVBEZ!caH=BIGPl>

delta 41
xcmbQ}``(AkCD<h-UyXr*QFSBNRc`L?xr{OK!A|i4O>;ND;y%N;`3CP!2>=@34w(P|

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index 3dadeba912d9133f0ccb6e9b89a22ca7dc43f18f..720e8cbbbb10d86a458027b5cb47884bf8c5ee78 100644
GIT binary patch
delta 51
zcmbQ?xYCi!CD<ior2+#3<F}1mcjdTTrDNiQo#F+2r8a+*>tp10jOU1VbP3{NVvwI)
HsUQykodFKD

delta 39
vcmZ4KIKz?4CD<ioh5`cv<Lr%GcjdTTq+;TOo#F+2BsYJQ>tmceK|vA#@?8u-

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index 7e43fa88c39737198427744ddb8d902edd517794..f26b1f2a19529c508d53ed3f434be0083c18dbab 100644
GIT binary patch
delta 51
zcmZ4KxXY2tCD<iomjVL=<Ft)jcjdU;WMbljo#F-jq&I(*o6pGY7|#*!=n}-k#2`Pp
HOF<q0nqCgB

delta 39
vcmdnxxYCi!CD<ior2+#3qxD9vyK-Ev(lPPDPVoZ1Qky@@&1amvP(cy^@Y)PH

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 7c626642ba1ef231ee4e1353330ca9ae2955f37f..86771f17466a85e3c938e86d1a5c6cee7c0ec4b6 100644
GIT binary patch
delta 51
zcmX@=ea)N8CD<k8nkoYW<K~TATq<0y(lPPDPVoZ1Qk&&e`WU$#<2m9TU4nR+8004}
HQ<Vn*hA<7P

delta 39
vcmccSebk%FCD<k8s44>kW5h--E)^~pshId+r+5J$$<1;qeT<X$s!9R?>Szl!

diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
index 631a1048fc01a3c84aadfdea8e0eccc36c68d8a4..a894a2d16c81fff8ade2c5ddb20858a03169fd47 100644
GIT binary patch
delta 51
zcmZ4Qe88E@CD<k8fFc6}W6egcFY;Wj(lPPDPVoZ1Qkyvx`WU$#<2m9TU4nR+8005U
HP?QG%igpdo

delta 39
vcmX@$yxy71CD<ioy&?kxqvA%cFY;V2QZeztPVoXhlAAdc`WPoKSCj+*>&6RN

diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index cb117fd671effe2557a41115015b57df87d7936b..276ae1df511346ccd286216c6de03cd56db410fd 100644
GIT binary patch
delta 51
zcmX@+c-@i9CD<k8x&i|O<Fk!icjdU8<znK4o#F+&WjBA6+r!B17|#*!=n}-k#2`O;
Hxq>_ZxGN8h

delta 39
vcmccac+8Q@CD<k8m;wU>WA{d`yK-DkvN7?&PVoX>GMhij?O~j}PeBp@1)dEU

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index cdfd51ce70d7201fa827bfabfd23e413596b1094..9f8a208aaadc167135e59839eefcd5b594c2f28a 100644
GIT binary patch
delta 51
zcmdlQbu5a@CD<jzO_zazF>52&T{$lAyD{;>PVoZHcQ=2O+rrE37|#*!=n}-k#2`O;
HzRolNyG;<A

delta 39
vcmX>WwKa;%CD<jzRF{E)k$)rCT{$kVJ2COWPVoXxcQ${N+rm3}o6ZCP0o)EI

diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
index 2bf77bb4e1a433eab66d0fdd175344d4f8d6e168..2ec11fe3c36d635080af05afa32852fcc1bf10be 100644
GIT binary patch
delta 53
zcmaFzm+|XgMlP3NmyoY@3=E8d8@V)Vxm=}V;)9*y1$?D8+t&6may!Oz#5=kK@h~yS
JPd-{F4*>Eb5R3o-

delta 41
xcmezRm+{G8MlP3NmyjoQ3=E9hHgaj!a=A#w#0NXY3;0NGwyo`BoP4KF5&%+z4;KIc

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 1837442bd39f1249fb753530ea508d05e8d177f4..612c85b1b4c8e4cc642734b1d52f5d5e1e2ec4eb 100644
GIT binary patch
delta 51
zcmaFi^3#ROCD<jTQi*|qF=`{%S_Ljw>6rLnr+5Khsm%u!`WU$#<2m9TU4nR+8005=
HD#-%?l?e_9

delta 39
vcmezA^1_A7CD<h-Ly3Wb@&87ywF+D=QZeztPVoXhlA8}I^f69OP?7`y33LpS

diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
index 029a48ed4a25f5af3e96991243a5eb1064243002..f049f414f0e789324e82916cfd0aa955211408c4 100644
GIT binary patch
delta 51
zcmdntebSrDCD<k8q$&dgWA{d`+sa(-vN7?&PVoZ%GMnEkZ(!thjOU1VbP3{NVvwIa
HQ&k=Ss3i{=

delta 39
vcmX@<y~CT!CD<iohbjXDqrpb5+sa&SGBNSNPVoYM(wpBaZ(y9fK~)j}`k4%)

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index 2ad9b1c30e9a583cc43e8efbc1e276b4f221ff28..23dabeacb06b3ad4360c1ca142c06a173f82ff51 100644
GIT binary patch
delta 51
zcmeD4oA1Zv66_Kpug<{0sJf9WSe46FIwn5YDPF)=YIC}3A0xM8JV(5vOArqegZ$+8
GYVrV37YyA1

delta 39
ucmbR5*XPIO66_Mfr_R8@cxoe8uqu~}R7`xZQ@ntW<mPnMKE}yx>XHE0WeRBk

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index c552e668983198d077348a57a5b22065d01b40f1..541bb70522e72dd477f72cba2f71a336f6978de4 100644
GIT binary patch
delta 78
zcmaFt_{EXSCD<k8ivj}!qt-^QyK-C(3Ni7)PVoXB@|!=(-DK2qjOU1VbP3{NVvuKu
bZsHGibAk#m0|f+l;@tyWMcCq94Gb9ojA9e<

delta 39
vcmez3_}G!lCD<k8u>u1F<AIG_cjdVJ<znK4o#F-D<u-qmyU95Dwt^%87|spr

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 9fe6d1686a777ffddc2953420cd4838832226bad..e2d57a331873ada2fcbcdc1f0f7a244f235d7447 100644
GIT binary patch
delta 54
zcmez1*yzON66_MfsK~&;IBO%<T{$jag_!tYr+5KZh0P!3x*7TSgWVkCIpQ5%f_Ru1
K<R@1ulmh^&!w&8M

delta 39
vcmZp4`rydr66_N4L4kpR(P1OkT{$iv`Iz`%r+5Ju`OP2Yx)~?;DwF^K`=$)e

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index 7e43fa88c39737198427744ddb8d902edd517794..f26b1f2a19529c508d53ed3f434be0083c18dbab 100644
GIT binary patch
delta 51
zcmZ4KxXY2tCD<iomjVL=<Ft)jcjdU;WMbljo#F-jq&I(*o6pGY7|#*!=n}-k#2`Pp
HOF<q0nqCgB

delta 39
vcmdnxxYCi!CD<ior2+#3qxD9vyK-Ev(lPPDPVoZ1Qky@@&1amvP(cy^@Y)PH

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index a98ee8c7731c8aaf383e84fd48b90633e53ef240..809d7e2f0fc15351abc99031a118b4012822deea 100644
GIT binary patch
delta 51
zcmaFv{llBfCD<k8hbjXD<BN@4Ix1YQ(lPPDPVoZ1QkxxA`WU$#<2m9TU4nR+8006P
HP?ZM&s7DT~

delta 39
vcmez2{oI?&CD<k8xhew#WA8>T9ThGYshId+r+5J$$;}QbeT<Xut4aa@0vZf9

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index 61e994d2651e15e232d9b5930bca32a33fd0b090..ab3fe3c1b56a35d1312779412978cc1d51f05d33 100644
GIT binary patch
delta 78
zcmZqjn(W2p66_KptjfT^xOgL%nKGA~OiX;RQ@ntm^ky&R`HWhQ@f`7vE<rp@4Dt-o
bP5i-bPEY}6pnw2RynBGF2wS|Xfgu9`?2Hj)

delta 61
zcmbR2)#SzH66_Mfq{_g+=&_N@Oqt77Iwn5YDPF)=YO|N}d`3y9c#e2SmmnTy26+Yn
Qo_O~FR}r>&R|7)^0KR|?Qvd(}

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 595ab64601ae3deb12bbf18ca463e39ba0a86195..4e4b5229502000550f169948393ba8cbc7a793d5 100644
GIT binary patch
delta 92
zcmZom-kHqh66_MP(~yCI@$N>hyK>xpyo@pN!A|i4t-PB*$r&^8^9LK6#B;<ux&-mC
kFfcJ}R#uGU;W2`WFfp(&Y%bU3XX18*i^y+o&}U-;0Gh`ZV*mgE

delta 50
zcmdm)+?LGc66_MvX2`(67`Tz^t{ita7h_C(uv5H16W8WXa>h)X%@o6VHqX=LVp_aY
Gp9uhq*bim^

diff --git a/tests/data/acpi/q35/DSDT.noacpihp b/tests/data/acpi/q35/DSDT.noacpihp
index c292c2369b011b779af44d0fa6fd2f7994098b2e..1c17aa30f7f0155a81988aa43c56e2f71530b4e4 100644
GIT binary patch
delta 65
zcmexk-|N8T66_MftH8j(IA<f5i!7JFc1(P*Q@nt?_T~uL8BDT{@f`7vE<rp@4Dt-o
OP5i-bPEY}6pa1|e`43qD

delta 48
zcmeBm_+!uI66_N4N1lO!(P<->i!7I)R!n@bQ@nti*5(M=8B9D*@f`7vE<rrZ4Dt*B
DSgj05

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index be3060aa51d67c0f02c70bd0a7d5c028016641a1..becb5f7cad68361463b30be80095ab10966d7c88 100644
GIT binary patch
delta 51
zcmeBjnC-yj66_Kpt-!#*xPK#;zZ{pVbWD7(Q@nt$)aGQlK1OcGc#e2SmmnS{2KmXa
G<>dieNDU_d

delta 39
ucmbR3(B;7866_MfrNF?zn6i<}UyjQ~DkeVIDPF)wa&xj=ALC>u1xWzKnhCQ2

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 5e94a2b61f840c68d27257831cf608d41ee7c154..0cdec0b4c53b2b0e38cd019caab552f66f7728e7 100644
GIT binary patch
delta 51
zcmbQ|xZaV=CD<ioy#fOR<ARM`kL9>rrDNiQo#F+2r8a+;>tp10jOU1VbP3{NVvwI)
HuOJTql|2rF

delta 39
vcmZ4QIM0#GCD<ioo&o~{qw7Yl$8uaQQZeztPVoXhlAFKF^)XJKrXUFb?Kun%

diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index 0e609a0c48fef371f935f239ebb9620fa116b049..6a9904ec947e373520e0135a89c559cb4f57fa7d 100644
GIT binary patch
delta 51
zcmezC*yqIM66_Mfr^vv-xMCyMT{$i<#hCbDr+5J;#myh(J~MJV#&g6wx&-ksG00E8
Hryvgikk1b3

delta 39
vcmeBk`s>K$66_N4SAl_n(QhNyT{$jKg_!tYr+5KJh0P!3J~K}Ksvrpf1%wTB

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index fc6cc4585a6b1d955bc80700ec2dc2720b7e4a89..628bf628f6891f906bf872f8916692ba0ccb6877 100644
GIT binary patch
delta 51
zcmez7+U~~X66_MfuFSx|sJ4;or5u;LLri?IQ@nt`{pP=N516?f<2m9TU4nR+8005k
HSCR(+ghURd

delta 39
vcmZp7`{v5!66_N4O^Jbl@ytf9mvUTg_A&9nPVoYMcANjoJz$>vPDv5~6zvW$

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 815006e445d0ec44c2f4a7c8d30ead6616a32b32..35c6b08068d4d2fb0353802dc2460cc2912c129c 100644
GIT binary patch
delta 51
zcmbQ>w$P2sCD<iIQJH~(@xex}mvUT=PBHPpPVoYsj+_6={bJ^JjOU1VbP3{NVvwKw
HQAr*Em5L8q

delta 61
zcmZ4JHo=X{CD<iIK$(Gov2`QYOF1qF$C&tFr+5Jmhs}TGelbfr#dE|vx&-ksGsrUt
R@Wi_ZxQejFyBZiW000)M532wG

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index 6d06777fc5ed21c8aa377b3088d02bfb202f51ad..3ad4d26b7f5c183fd3e146b67ebb23662b5108eb 100644
GIT binary patch
delta 51
zcmaFs`OlNfCD<k8p9%v5<Km56@07Sa<zwQ5o#F)?<u@}aUt;8TjOU1VbP3{NVvwJF
HPDLI7x^fRb

delta 39
vcmez8`PP%mCD<k8tqKDJqsK<BcS>9yaxwA2PVoW`a+{fyFELJjsv-#h4V?_h

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 8cf5b9703d617d0a0b16d41cd713f7883c80fcfe..d4a34e23512c295f73abbe5ef1370fac7a1a06cd 100644
GIT binary patch
delta 53
zcmex8jj3lk6PHV{OGr;Q0|Volja&yhxm=}V;)9*y1$?D8U+L^)<aUhbh<9`e;$dQt
JpB&RI4*=r85SRb}

delta 41
xcmeB~&h&d46PHV{OGtG$0|R5=My>;$TrN^E@xe~<0zQ(PuXOe?PA=}21OOw$4kG{n

-- 
2.39.1


