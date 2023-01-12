Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230EC6674BA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:12:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBJ-0002Eo-1z; Thu, 12 Jan 2023 09:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB9-000273-N9
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB2-0005sk-TS
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8zmrmc32GvvD5ia8ras46y5O0Gvn/kMw2o+PKdoHVSY=;
 b=GX3QCPR5wBNkYlASFk6h6zm3dNGqvU4idwyBJcZ/ksYwT0P8TSGSxwkczMtDbXCT6NMWdR
 pMRlPltAMZRJX/dMKM24L0BATQnXoPutjdHMIV+bKCUfXvAlbNCyPHtcqW2r0ajvevPWMy
 7eTDktUNF1IpHeA50oVLFKQ4BChcK8k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-kySwdgXFOnGw7x82ed7wlg-1; Thu, 12 Jan 2023 09:03:21 -0500
X-MC-Unique: kySwdgXFOnGw7x82ed7wlg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C631985C093;
 Thu, 12 Jan 2023 14:03:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 412114085721;
 Thu, 12 Jan 2023 14:03:18 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 05/40] tests: acpi: update expected blobs
Date: Thu, 12 Jan 2023 15:02:37 +0100
Message-Id: <20230112140312.3096331-6-imammedo@redhat.com>
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

add extra nested bridges/root ports to blobs so it would be
posible to check how follow up patches would affect it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 tests/data/acpi/pc/DSDT.bridge              | Bin 9532 -> 12608 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6656 -> 9732 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8630 -> 12301 bytes
 4 files changed, 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 2602a57c9b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbridge",
diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 75016fd4b72aae544658e51c06a2940da31c81da..d1b019754bb03fa7d815ab57304ddb2376a4c8af 100644
GIT binary patch
delta 153
zcmdnvbs&k$CD<jz!H|K0am7Zia&DgfaHg2}V5fM2ws5A+z1-PM%x$fVlYjBHF*zTd
ze1_YIo5LyC)rX5Iy2+De@+@w>$rprJH)ru3<W^7!aP|vfDBxmp@(cBK3G)jHaP|yk
zgfd*Xm^Yv0tLJ2Noa`$hzPV6h7bBzQWF09vt~kA51B-Z&-p%>^cR4nzD~mD#0L(Zn
ArT_o{

delta 67
zcmV-J0KEUeV!TQUL{mgmJS6}C0c5cXcMA-QmjPT~Q$k-5f|miajSFi60z$=;`wfP(
Z2@k6a2p>>GPE-JJ0h8Y_7qd<#@(RdT6?p&v

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index 545512adfa0f9af81a7fafd353679f64f75e501e..14473ab4c91d68af88fff45e703f572c387d0af7 100644
GIT binary patch
delta 137
zcmZoLY4PE533dr#QDb0W{I-#+oSUb431duruv5H1*J8%a-Q3?9nfsd<C%5n>GC3Zd
z{G8XA)hXE3hjH@^-v8VZj81-`zAj;YApy>wp^Q+53m5ZdBfff0K}T7T2-5=Y>I_DP
jwqOH;&F94rGBRpTo+v5D6{i<$U=bhS>=!b5y<{K&C!r|o

delta 55
zcmZqiX)xh(33dr#kYZq9WZ%eD&dufjI3_;WDPF++@#bFc?~F{ohbFi4CT`B>+r&M2
LqN>E?&8mR_$Sx8n

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 3dba4d84369f1f2850fbdc771072519d34f58072..f045438b4e794406316418074c6d319261bfcd9e 100644
GIT binary patch
delta 2396
zcmZ|R&2rLU6b9fV1R4UAzqCLp368Fuu|nw&UD+1sqAFH{Zt66SE8MwtSb!{WTy({_
z?=3jacm?j<cnjWum(cN?oRgf|@!N6oeh)7J@+IGUmv8L8-yh{#nx+@O+8^EQ+|geL
z{&7(FT-KLg+((s@wBK$8R&dmRk<~OqvyT126Faq>c|p2))*Ftr_b@&8YT?Q@uhip}
z#y=|!SlLK#^D1Nc+r7+mcuHu-@`LxOKKSLg590SpaAV?pe)@Cy$9-srAHY1HKl_1W
zDjbv0^0<0Fe`@-zE?YP!%{ua54)x`=d-s9vl!C!&OF!!kPSFIAz?+!2P7i@?pxCkv
zC6NyJd?85?NvO!Se2FF#lZdG#(voD7B$8B-j<lqhq==-HL|RsutPojIksWEVm{>$C
zC6SgilQfaEitI{@&BP{RD~YsZm}H1#RAf(DvP`l>vPvQ?IVL$GIThKLmQ^OJL{^nV
zTJlWtMDi-qm6igN0+E7}NK27Pkw{TR4y2{Tq(r2oB+^o5QYKPXkt1nwm^efnC6Sgj
zCTm32RODD%)|spmSyvKisW7P!si;U#TB=N{M5;<6Ej1=JA~hB1OUnk64I&##A}w_$
zbs}{Y8A!_}lT9L<N+K-{CJiDD6*-X>mx)WnRT63On0QF0w)Y?63>*Dd!;x{7nT&O9
z;kR1ByQ}PEY#TUqc`#vsyB{SM4pCBo0k(8Xnm9zsAq=n$Q!>*QQ@?{zZZgim4Qb)S
z=E)OQ?Zg>&!IsAvmhHwFw!ucl8P@H^8TP^U!Wk6$`<Ue?W4K@Inl@edurEXh3=I}^
zWr2w^T+vZ(g|p-ZoZ(uG@@6<oeuy(%MNvKrXUR2v3Jc%@h!((u0n9fR;CaJeH_q|Q
z`!{ktclguAc@yUw`60~kcZu^E&X7C&bYj>^c<87UomBXPJNNma#l)lai!J==@zCu&
gfw?XDw`=c0zt;^l9Bp?(g|D{bSMBiC^6j0`U&gLNmH+?%

delta 97
zcmeB8*yhaT66_MPO_70t@xex}Mma8Ty_oo5r+5Kpy~)$%?8RI-gAEPhIpQ5%f_NAh
wm>4*mf?a(WC%=`8pIoh=%54diVq{>Ryjr1sv!z}PBb!u!vtJ0q<emB<02sg;9smFU

-- 
2.31.1


