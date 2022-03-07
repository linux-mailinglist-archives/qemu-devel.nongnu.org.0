Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CD44D0837
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:17:39 +0100 (CET)
Received: from localhost ([::1]:55944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJnW-0003ZF-Jp
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:17:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <312UmYgYKClQF4FGED2AA270.yA8C08G-z0H079A929G.AD2@flex--titusr.bounces.google.com>)
 id 1nRJjj-0005qq-R8
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:13:43 -0500
Received: from [2607:f8b0:4864:20::114a] (port=44780
 helo=mail-yw1-x114a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <312UmYgYKClQF4FGED2AA270.yA8C08G-z0H079A929G.AD2@flex--titusr.bounces.google.com>)
 id 1nRJji-0006zs-91
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:13:43 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2dbda4f6331so141480427b3.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=DFLEp4Au2YK6sqW100Dvh40Za2h5jBDX8hDsOCFY3nA=;
 b=sah0XZFobUuI+nX7oWDSHtPpbC3WUTm1yejcvByzYxPLm8tCzcfpacwSqkCuU66+z8
 HfTjD/NP7nmx13dMulblEpR332F9FtXkY4i81MrKdruDxu+BSXR5tgofhCGJq6c004V9
 NT4PBavuN08AyRz11Pmybbj2aiU9rQ8EaClclpD5UJboecgkW9emN+Ulz3sPwtp1j01F
 5OwQ9HbWdBSqgNNtiQYMitQdvh/mAwYOTRsf6vV/9VHanPFALOkiu7PeT1CTpCCbRl96
 NQHV0ZPBNaQEVax7q6YVFVzEuVVYDmH1QIYVANxDmjul17BDLq1589cRCvMAkUotlFu8
 0VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=DFLEp4Au2YK6sqW100Dvh40Za2h5jBDX8hDsOCFY3nA=;
 b=UuDr4yVEdDVtcVSX2T67XiL4QflCFQTrMQKSdo6zKlR9uu3N1i4sh4R96mne+USWKF
 A3VyG8796ttEqzQVYd6C/M7DZ12T5Eda38B9L97CX6KSkAgaQrBY7BOulq3R+WPxJxWZ
 /9Cz3QP6RbYCZ+83+eHC4bMhBxlQyOu99QRsIEb3xW+bYEtG35gPl2ibcosYpSE7MvqK
 Ai1G8t9bU1KjiuZHw+by55tJVSu9ynuYhLjy9bKS9tzSyjldkALezja2ZwODaxNwQrfh
 BvhdOa2Zub11znp5tskxm8G6JlvuBhAvXZAza9cF5WBDYa91+xj3rqLSViIafuiPk6aa
 zwag==
X-Gm-Message-State: AOAM532cR3ry2WY9tfxq3ybvY1am9tm4Z3XZQxywgMGR8nhezqE2mA2g
 AaUU5ecoyadOjzWSmpQHCnh/M+NfN58=
X-Google-Smtp-Source: ABdhPJwzZZWT6pSifp0jy4tmxheRbQ58qhVZeeKK2J2/NvCLYeWaNnOZ8r0hYqUu7clnPtNuMMObcNiLx2I=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a81:5dd5:0:b0:2dc:19cf:17ac with SMTP id
 r204-20020a815dd5000000b002dc19cf17acmr9940903ywb.312.1646683607906; Mon, 07
 Mar 2022 12:06:47 -0800 (PST)
Date: Mon,  7 Mar 2022 12:05:57 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-2-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 1/9] hw/i2c: pmbus: add registers
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::114a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=312UmYgYKClQF4FGED2AA270.yA8C08G-z0H079A929G.AD2@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

   - add the VOUT_MIN and STATUS_MFR registers

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c         | 24 ++++++++++++++++++++++++
 include/hw/i2c/pmbus_device.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 24f8f522d9..07a45c99f9 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -368,6 +368,14 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         }
         break;
=20
+    case PMBUS_VOUT_MIN:        /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmbus_send16(pmdev, pmdev->pages[index].vout_min);
+        } else {
+            goto passthough;
+        }
+        break;
+
     /* TODO: implement coefficients support */
=20
     case PMBUS_POUT_MAX:                  /* R/W word */
@@ -708,6 +716,10 @@ static uint8_t pmbus_receive_byte(SMBusDevice *smd)
         pmbus_send8(pmdev, pmdev->pages[index].status_other);
         break;
=20
+    case PMBUS_STATUS_MFR_SPECIFIC:       /* R/W byte */
+        pmbus_send8(pmdev, pmdev->pages[index].status_mfr_specific);
+        break;
+
     case PMBUS_READ_EIN:                  /* Read-Only block 5 bytes */
         if (pmdev->pages[index].page_flags & PB_HAS_EIN) {
             pmbus_send(pmdev, pmdev->pages[index].read_ein, 5);
@@ -1149,6 +1161,14 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_=
t *buf, uint8_t len)
         }
         break;
=20
+    case PMBUS_VOUT_MIN:                  /* R/W word */
+        if (pmdev->pages[index].page_flags & PB_HAS_VOUT_RATING) {
+            pmdev->pages[index].vout_min =3D pmbus_receive16(pmdev);
+        } else {
+            goto passthrough;
+        }
+        break;
+
     case PMBUS_POUT_MAX:                  /* R/W word */
         if (pmdev->pages[index].page_flags & PB_HAS_VOUT) {
             pmdev->pages[index].pout_max =3D pmbus_receive16(pmdev);
@@ -1482,6 +1502,10 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_=
t *buf, uint8_t len)
         pmdev->pages[index].status_other =3D pmbus_receive8(pmdev);
         break;
=20
+    case PMBUS_STATUS_MFR_SPECIFIC:        /* R/W byte */
+        pmdev->pages[index].status_mfr_specific =3D pmbus_receive8(pmdev);
+        break;
+
     case PMBUS_PAGE_PLUS_READ:            /* Block Read-only */
     case PMBUS_CAPABILITY:                /* Read-Only byte */
     case PMBUS_COEFFICIENTS:              /* Read-only block 5 bytes */
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 62bd38c83f..72c0483149 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -43,6 +43,7 @@ enum pmbus_registers {
     PMBUS_VOUT_DROOP                =3D 0x28, /* R/W word */
     PMBUS_VOUT_SCALE_LOOP           =3D 0x29, /* R/W word */
     PMBUS_VOUT_SCALE_MONITOR        =3D 0x2A, /* R/W word */
+    PMBUS_VOUT_MIN                  =3D 0x2B, /* R/W word */
     PMBUS_COEFFICIENTS              =3D 0x30, /* Read-only block 5 bytes *=
/
     PMBUS_POUT_MAX                  =3D 0x31, /* R/W word */
     PMBUS_MAX_DUTY                  =3D 0x32, /* R/W word */
@@ -255,6 +256,7 @@ OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
 #define PB_HAS_TEMP3               BIT_ULL(42)
 #define PB_HAS_TEMP_RATING         BIT_ULL(43)
 #define PB_HAS_MFR_INFO            BIT_ULL(50)
+#define PB_HAS_STATUS_MFR_SPECIFIC BIT_ULL(51)
=20
 struct PMBusDeviceClass {
     SMBusDeviceClass parent_class;
@@ -295,6 +297,7 @@ typedef struct PMBusPage {
     uint16_t vout_droop;               /* R/W word */
     uint16_t vout_scale_loop;          /* R/W word */
     uint16_t vout_scale_monitor;       /* R/W word */
+    uint16_t vout_min;                 /* R/W word */
     uint8_t coefficients[5];           /* Read-only block 5 bytes */
     uint16_t pout_max;                 /* R/W word */
     uint16_t max_duty;                 /* R/W word */
--=20
2.35.1.616.g0bdcbb4464-goog


