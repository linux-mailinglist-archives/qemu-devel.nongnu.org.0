Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D6F458979
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 07:53:55 +0100 (CET)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp3D8-00045F-3s
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 01:53:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=953023fde=alistair.francis@opensource.wdc.com>)
 id 1mp3Bp-0002jn-NJ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 01:52:33 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:25837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=953023fde=alistair.francis@opensource.wdc.com>)
 id 1mp3Bo-0000Vo-2V
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 01:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637563951; x=1669099951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J4RVaIXiZlC88P0KMhxzAepJviOnkaBhT2olHvuWdpo=;
 b=pTv4RZv1LjQRghJW1TGPjH6GUEZY6qWK2mLzluOj3YW+RL4mecpQTxRq
 tdeHE3tjZOb2SQXOI5YRqClEO9MxSqZ4DEaPZRi7bD27y8GTkX/i1aEEW
 sCCXGc4tJsAfrgkVR2Bou1chohcu1+RaqO3nzHGo3Z290P+HkrVSBPrB9
 CyTLt8T7J2AnFy0j0sbHjszpbO5smV+KHL1IulqCrLQBiak/661pEtVVk
 W/yp2VXDJktq5md0/64H95mziFUU1eoQggjzWckRdzuWvMNmGtn4xCGNA
 +9BVPJta2ymiS8zS9Xhc3tyEuzvS6qBk+6iT2BScew39gYKcl2COyJCyc g==;
X-IronPort-AV: E=Sophos;i="5.87,254,1631548800"; d="scan'208";a="298113496"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2021 14:52:29 +0800
IronPort-SDR: kjDXD1TZgEU4Ho6CSZ8V3ja5a2+/X5e8G32rrzYrji+UuJab9miUqE/JfQkhFiqnj/rwUy9Hg0
 +MB2cF9tV53x29SHqqt2Mr0pLVHxP5+hC1SbaTzGAnCblxGu5TAXgK6XEgpjJITQbGj05x/PTj
 axMM04EK/u85JsL61uzkyIhnFgxNu7FArQ5/HqIVafh9zMysf8gAXUVVNqNH2xZWpwEobHmRxP
 KsdfQUng8hsC1QmcWeSvqJnCWmxzSH3SCDsRG6xrb70u9nXq9i49OuM5EhRdkbGTkRFLeicBFr
 PDWReGLd7ZY/vwf57G6oRVYW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 22:25:53 -0800
IronPort-SDR: DQzxJCb83O1tOnu6PFOs/lH7OnzjHQwxIsVKD6jNWHPGO0LQi9gQtDztMgo/unOoiOrST49nD+
 CuCdR5vByk0CBKBCwv7g+ILPwhQi647FQjEw9IX1cu4QFV4Nd9U6gywgaOu6HpRFu7KVDfvAdw
 DHyijHnVlewccuNQROzR90ggb2g/yyWYs4ujfUin5yQPpWKftzFrPtWMCnXm3c7+XLM2Y1h5id
 2bVkjj/D8CuYWowOjk5Q/CCSRr1xPV15xcLQWCXRncD6+mtXuMv1WjzJmS5oQVdSwtZCBe1h4A
 rMY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 22:52:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HyHyP5Mq6z1RtVn
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 22:52:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1637563949; x=1640155950; bh=J4RVaIX
 iZlC88P0KMhxzAepJviOnkaBhT2olHvuWdpo=; b=ekYr7c986b+UhFLIhB4wBPr
 XMRVbnWhhpfmmGuzepHjaHrFAWL0JgmwsSf4vKsvwMcgFIv4Sjt4aBwPYkG+R3aB
 gfYRVD9K7XdFll6YJE70TzC0ddYPsBWW/UEBJdfuEOxUrfzpyvijS+RP/QWClX/O
 1KodMfuTWOn1BfBRFuACzM7VtnYIJAm/ahmmUSm+7SiDgkPSCxrZlSW6xSiXunZp
 WDTanbJ10ixaK1lu+gLKyF31oTr4ThyESPDNhIAP4Z2ybar8imWjjj6CE3JMgFDF
 KBKTiKcMvp2qgwGxt+dTuFOBaPDayVMFMfWQo3zSUVGGW+A91kiujetNkU/E0Cg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id G8bmjMhgkn_O for <qemu-devel@nongnu.org>;
 Sun, 21 Nov 2021 22:52:29 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.60])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HyHyK3x3Jz1RtVl;
 Sun, 21 Nov 2021 22:52:25 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 1/2] hw/misc/sifive_u_otp: Use IF_PFLASH for the OTP device
 instead of IF_NONE
Date: Mon, 22 Nov 2021 16:52:05 +1000
Message-Id: <20211122065206.83544-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122065206.83544-1-alistair.francis@opensource.wdc.com>
References: <20211122065206.83544-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=953023fde=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Configuring a drive with "if=3Dnone" is meant for creation of a backend
only, it should not get automatically assigned to a device frontend.
Use "if=3Dpflash" for the One-Time-Programmable device instead (like
it is e.g. also done for the efuse device in hw/arm/xlnx-zcu102.c).

Since the old way of configuring the device has already been published
with the previous QEMU versions, we cannot remove this immediately, but
have to deprecate it and support it for at least two more releases.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211119102549.217755-1-thuth@redhat.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/about/deprecated.rst | 6 ++++++
 hw/misc/sifive_u_otp.c    | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index c03fcf951f..ff7488cb63 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -192,6 +192,12 @@ as short-form boolean values, and passed to plugins =
as ``arg_name=3Don``.
 However, short-form booleans are deprecated and full explicit ``arg_name=
=3Don``
 form is preferred.
=20
+``-drive if=3Dnone`` for the sifive_u OTP device (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Using ``-drive if=3Dnone`` to configure the OTP device of the sifive_u
+RISC-V machine is deprecated. Use ``-drive if=3Dpflash`` instead.
+
=20
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 18aa0bd55d..cf6098ff2c 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -209,7 +209,14 @@ static void sifive_u_otp_realize(DeviceState *dev, E=
rror **errp)
                           TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
=20
-    dinfo =3D drive_get_next(IF_NONE);
+    dinfo =3D drive_get_next(IF_PFLASH);
+    if (!dinfo) {
+        dinfo =3D drive_get_next(IF_NONE);
+        if (dinfo) {
+            warn_report("using \"-drive if=3Dnone\" for the OTP is depre=
cated, "
+                        "use \"-drive if=3Dpflash\" instead.");
+        }
+    }
     if (dinfo) {
         int ret;
         uint64_t perm;
--=20
2.31.1


