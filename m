Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC114589A3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 08:08:13 +0100 (CET)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp3Qx-0001Dc-Ma
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 02:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=953023fde=alistair.francis@opensource.wdc.com>)
 id 1mp3Pk-0000WX-7P
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 02:06:56 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:48086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=953023fde=alistair.francis@opensource.wdc.com>)
 id 1mp3Ph-0002Rl-7p
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 02:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637564813; x=1669100813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B8XLaqe/EnhVUtAn4n7SKkuQvnkv7yQ5WRmzqO99/C8=;
 b=hEWVnBzsmILF2cBEBR4D49SVw/ae0beFv5GriFsyWuhkkGoQJ5ASE0Vp
 +rjy9PKXWEuCVUUMi2Uaci0Lo5fKOrTRWnvtlylJlqz990QtOX655EYiE
 K3J6RQx0VLGfWqxA70Bvyp+NFCQbqsBKwvH7bWqMy5fP1Gvqt9DEZ+Y2g
 kb6EUijEWeVjOlBbNrMXW2q8NSyh5QK9hazMJCPoHnuExe3etcKHsdYu4
 uOv1R/4Vx2ukrcmkYYOA19vBmQn+4RR/ZaK0mNCvumIlBYj6ne5SKQ+XJ
 BcKjIwQSQdZbLSk+bEOxXE401xrAPocFTdO2/EfyDOlWITj5pXwXkvRyV A==;
X-IronPort-AV: E=Sophos;i="5.87,254,1631548800"; d="scan'208";a="290218412"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2021 15:06:51 +0800
IronPort-SDR: Y2JqrLtb/EG9Hy8T1mI8JPJWCy3HK3lR76XB4Z1fyTiKrgEMr6C6CrfkquOFweKgiTwJEIam2d
 7767GP66P5AiojAUT5J/BfUAMrV8NK9hyk04N/WUuxlpJlOMWmSFRgO6dl+AOVOB/EiUtJ7yoH
 UuHVkcY0vp7Skb3jbXdL+wfpMtENBgeCvWe5DJ3RrDhJogWqfTvfusQ97Dbv62Zg4O9jTFmcHw
 FCP5tPxTE/PqRMZLuaILUtwc+bvjgc/2baq2BFu57wy5JMhU75bbmIa6vzugrlLYc0UPv8wfFJ
 yqJ5vHNLeRHn9gpZJpV8pNuq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 22:41:47 -0800
IronPort-SDR: pxROdnzy3fNpWZiM0ylw5csIaNme6V7dwPRzwssVVft2bvyxzHITS3n63GRKVRCKZOukHTLLqL
 Ap6VkLh1/RLNpF8c8P2ZA5EFqAxdSKGabEM3M7sso23k/wLo5AfWzRByyFxbQ1HVLXD2zuYVkF
 nrm8xmf3iinmkZOure/rN1NrKiv+IEFlAP1mb+R2gT5eKIc6/K95OlnDqZ7MeiXr1SpiSNMlLn
 NRLhBrWjHrgr8a7lAMlKW6dsLbC342zI14VdHAeVgZ7wyS/Tc46bVEPX0yFU6w2EO+te19PzXn
 ZlI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 23:06:52 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HyHyY4QVWz1RtVm
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 22:52:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1637563957; x=1640155958; bh=B8XLaqe
 /EnhVUtAn4n7SKkuQvnkv7yQ5WRmzqO99/C8=; b=lhXQAvebcoDu3Ux+BBf1DhL
 WAKOz/83uPWix3vyEN/dg5i8Wq6BKlg5TfQ4f+DDy+FuiU5O2IvGEIzegqUGZlpO
 db1CKDtWYSZyqXD+Mm0CbVfAWbpQS2/6JYKMl+51OiG1xJcO01r6Me9elLixammJ
 vJjXtchaFw+z7RtFbJy6My50cAAS2JQ/MG1sIBFTG5sB0ScW4lnRM9eADUkfc5zD
 8wmMar3Y4oD3KnSiWLhrr04rT/hMFuLKq2HLCsaNyxcG2Hx2pUG1jXvEg3O6Cyp6
 dfFX1pjm62iUCGRA/DAkZqVgctPhJWYsoAJyqlUrcFV5eKK/muElroNxDCd87/w=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kLaJmbuqyatm for <qemu-devel@nongnu.org>;
 Sun, 21 Nov 2021 22:52:37 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.60])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HyHyV2dQrz1RtVl;
 Sun, 21 Nov 2021 22:52:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 2/2] hw/misc/sifive_u_otp: Do not reset OTP content on hardware
 reset
Date: Mon, 22 Nov 2021 16:52:06 +1000
Message-Id: <20211122065206.83544-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122065206.83544-1-alistair.francis@opensource.wdc.com>
References: <20211122065206.83544-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=953023fde=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Once a "One Time Programmable" is programmed, it shouldn't be reset.

Do not re-initialize the OTP content in the DeviceReset handler,
initialize it once in the DeviceRealize one.

Fixes: 9fb45c62ae8 ("riscv: sifive: Implement a model for SiFive FU540 OT=
P")
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211119104757.331579-1-f4bug@amsat.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/misc/sifive_u_otp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index cf6098ff2c..52fdb750c0 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -242,14 +242,10 @@ static void sifive_u_otp_realize(DeviceState *dev, =
Error **errp)
=20
             if (blk_pread(s->blk, 0, s->fuse, filesize) !=3D filesize) {
                 error_setg(errp, "failed to read the initial flash conte=
nt");
+                return;
             }
         }
     }
-}
-
-static void sifive_u_otp_reset(DeviceState *dev)
-{
-    SiFiveUOTPState *s =3D SIFIVE_U_OTP(dev);
=20
     /* Initialize all fuses' initial value to 0xFFs */
     memset(s->fuse, 0xff, sizeof(s->fuse));
@@ -266,13 +262,15 @@ static void sifive_u_otp_reset(DeviceState *dev)
         serial_data =3D s->serial;
         if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            error_report("write error index<%d>", index);
+            error_setg(errp, "failed to write index<%d>", index);
+            return;
         }
=20
         serial_data =3D ~(s->serial);
         if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            error_report("write error index<%d>", index + 1);
+            error_setg(errp, "failed to write index<%d>", index + 1);
+            return;
         }
     }
=20
@@ -286,7 +284,6 @@ static void sifive_u_otp_class_init(ObjectClass *klas=
s, void *data)
=20
     device_class_set_props(dc, sifive_u_otp_properties);
     dc->realize =3D sifive_u_otp_realize;
-    dc->reset =3D sifive_u_otp_reset;
 }
=20
 static const TypeInfo sifive_u_otp_info =3D {
--=20
2.31.1


