Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268A437895
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:59:35 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv54-0002T0-Gn
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunI-0002pl-9n
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:12 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunB-0001jp-CL
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910064; x=1666446064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OIRNQEuTsAzhuizridf3dL2aLX8GN/u3fr6aSFULvKk=;
 b=GSCVLix3EvN//q9yIxHIQOdWD+Ku4mEwj83D0jOVbIS/0/M9Q70x7wLd
 vaw/FgYPZmvR5awgbU7hA/LeYGHTFSAhClAJo6N0WbsctQ0k2+RG56reL
 qLM2QoyNqDal7xdJKdCFhDEZAWD90c7VecMEgkzC/yrd+R/mRtm4xMklN
 m9BZazbwE8PmrI+5gnFdovU1VFS5sUX8P/RX7I24QFv2MRifLMXPBa1le
 ksY7Z1nQgJ5lu99vJ4wXuN4NrsOXW2xioykCTRdXBxYeXygQKu5kONo8r
 zjBrnoi7JNdd7BW4ySvOqaNDP3AUnDVmZiq9Rf68onl7wjfN+BeSQFA7t A==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="183617911"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:45 +0800
IronPort-SDR: pmWjmbzUsWfSK+/uEskYhA8yovuuSIIpx6xzgmTUUOC4E1YJUjHBWJ1siTAI/R9+8HFakJEGyp
 1FFPJZJJrGKsFhtSF8bk8zwQL0tzxZUPDHvwBbY9b2y+OhEOhCjM3srHFsoWDrK4MfPwCqJxXb
 Ulrac98RWsepRdaAL1XMIOaQJO7Hfkukh78R/PkGPR/3JZuCdEO8cV55NxmxKQp6om9Df3pAKC
 kGzmyL9k1eDxzgY+cn6PGcICawKLRyQQRrGDdPGejJHowaSOop4VMUEDvD0j+zHKkGiVeKNk6I
 dFomXEoOVmyjUL5BFPQR1cRP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:20 -0700
IronPort-SDR: 2VZBxA/QC/wAwuXixHaoru2IRYGP6HDpxzZkqvWfUoeybq9z8gc/sOY0Sw8JyP9jMF77fcM+uK
 oRHceSNnIRTy564zqLVpHW5tXaMimY9PxCQe7M9KFBg/v+fepx8KSRy5cPydp5Rvi8pBy5E5Cn
 ZyHRUAsSyPCNdwQ8d2lEqTpH4nucYUHln9c9140qE02fnqhxLNJCopvzZ+rGQNkwDp6EnfCp6a
 jjFBKzb1xHptsyuOoRIEWfUVVaKBmzxnSBw/stU6g2YzYIXUq8lKO1ttNzLMNEWoGNr9Auk14/
 eKQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:46 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQTn48WXz1RtVp
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910045; x=1637502046; bh=OIRNQEuTsAzhuizrid
 f3dL2aLX8GN/u3fr6aSFULvKk=; b=uleJMEWMEU7brhYBDkm21u3neHCxY1R59l
 VQTpFOUp4bjb9BG8nZHF/dATy53IP8QLEN9nWDLJwtEpHmdLiFCPB2kp4H7sYr3s
 OytMK/pi2qgxD5/tMmFLjos0s7+ztvYVPIdMX2R3JdcXF5tGoIpEx1H5BX5v0a01
 56919O1QFmUM8red6Pbz2nWNU36eYMqBEnIGtb9iDItZvYcAxE97kgi3gdj2ZWsZ
 zokbIHRn0FhtRmYxVmeqeT7p4IEN2wRCYHlB2xeS05O/M6LwucJiQ8F+2ZIS51Pz
 qBs75CZP2zSO0ov6S3iil0Zu0zDrkIMEl3HNX4MT39wV9iixsJBQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id MbHyydkavQNw for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:45 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQTj4qg4z1RtVm;
 Fri, 22 Oct 2021 06:40:41 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 25/33] hw/intc: sifive_plic: Move the properties
Date: Fri, 22 Oct 2021 23:38:04 +1000
Message-Id: <20211022133812.3972903-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 3c125e27c49a4969df82bf8b197535ccd1996939.1634524691.git.alist=
air.francis@wdc.com
---
 hw/intc/sifive_plic.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 9ba36dc0b3..f0e2799efc 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -355,21 +355,6 @@ static const MemoryRegionOps sifive_plic_ops =3D {
     }
 };
=20
-static Property sifive_plic_properties[] =3D {
-    DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
-    DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
-    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
-    DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
-    DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
-    DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
-    DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
-    DEFINE_PROP_UINT32("enable-stride", SiFivePLICState, enable_stride, =
0),
-    DEFINE_PROP_UINT32("context-base", SiFivePLICState, context_base, 0)=
,
-    DEFINE_PROP_UINT32("context-stride", SiFivePLICState, context_stride=
, 0),
-    DEFINE_PROP_UINT32("aperture-size", SiFivePLICState, aperture_size, =
0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 /*
  * parse PLIC hart/mode address offset config
  *
@@ -496,6 +481,21 @@ static const VMStateDescription vmstate_sifive_plic =
=3D {
         }
 };
=20
+static Property sifive_plic_properties[] =3D {
+    DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
+    DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
+    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
+    DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
+    DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
+    DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
+    DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
+    DEFINE_PROP_UINT32("enable-stride", SiFivePLICState, enable_stride, =
0),
+    DEFINE_PROP_UINT32("context-base", SiFivePLICState, context_base, 0)=
,
+    DEFINE_PROP_UINT32("context-stride", SiFivePLICState, context_stride=
, 0),
+    DEFINE_PROP_UINT32("aperture-size", SiFivePLICState, aperture_size, =
0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void sifive_plic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
--=20
2.31.1


