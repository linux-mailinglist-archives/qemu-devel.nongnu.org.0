Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C474D0827
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:08:44 +0100 (CET)
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJet-0000Zy-7X
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:08:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32mUmYgYKClcI7IJHG5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--titusr.bounces.google.com>)
 id 1nRJd9-0006vY-GS
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:06:55 -0500
Received: from [2607:f8b0:4864:20::b49] (port=48702
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32mUmYgYKClcI7IJHG5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--titusr.bounces.google.com>)
 id 1nRJd6-0006AT-Jq
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:06:53 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 d188-20020a2568c5000000b00628bf187056so12140588ybc.15
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=LmkK4SXfDRNuRPe3ZKObdFF0Km6E7sEH0eHOXH04xZo=;
 b=JhIGoqF7KZ2I49WpgN6u5nUMfluxIe6PIRAI6v/SNXExsAfSQ/ajsoTXBCoeEYjFUn
 E3lXEcGBVY92XeVAkXhF675MuDbVdxBnaXuoySFgK63PkHY59Q/uX9D24pJBuelx0kTR
 wi5/9d0/TlsWIjRN6fOyFJn/3UbdXuLzwlHobrhJtnizyKgXXjVwajTnnK0tnV+6+ijo
 OhylTlx3p9CsLuPZ/i/EvNiRcyb2hfU3+e7J7AMW5OqSESh+CFAYcmbjARXI4+0X61/8
 xThLYPfNxet0/18Cm3RPfZ2nhmGrgk0liyA/ESV56sBsCCYobQxDBZ+TE5bJNwPVzoPA
 HIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=LmkK4SXfDRNuRPe3ZKObdFF0Km6E7sEH0eHOXH04xZo=;
 b=P4QaN4tn3uDu0a148d44LwmOSiWio/52PLysQlu9GQDeulUxBJCckU9RxvCLWTcVR2
 ExJ3S7V2k1WepFytK04q5Fx/O6x4EPfi3W7Dqt+c3Qy2CbXwPY61MQ62jmAPakjDRLpR
 GilNK1g1M5n9xjJ2q1B25V9WKJ0akBbNiydlfLpIsZYzrk6QEmP02sjffiH0G2SyyEWF
 BQP+rTcSVd6xwXk8fS0KG8hJqOlkATACcuUxwzC6NXhMkASDNxd84lFNBjcnBqmGdB+G
 1T9IMC3ct4fE4NsYH0+XclWApBOlX8Rr1qm/VCTDiTFcqIU+8yq6wjMNp8VbBSIVveYB
 MNXg==
X-Gm-Message-State: AOAM531iiCS/g2gQ1jDlOY32VwtYnFACSmAdfi7U41DEyarDEpx+n0qf
 mkUUPXRquh0wk6JsCXJGP6NbVUCZLlI=
X-Google-Smtp-Source: ABdhPJz7lYj5mDNdNzDjC7fzTvCM1ISAihgtx2v3nY0Zg7imS/EXw+2gn0Be3HGNleCFKuNhHkmwB+t+aOs=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:3482:0:b0:628:c004:56a8 with SMTP id
 b124-20020a253482000000b00628c00456a8mr9686697yba.637.1646683610222; Mon, 07
 Mar 2022 12:06:50 -0800 (PST)
Date: Mon,  7 Mar 2022 12:05:58 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-3-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 2/9] hw/i2c: pmbus: fix error returns and guard against out
 of range accesses
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=32mUmYgYKClcI7IJHG5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c         | 47 ++++++++++++++++++++++++++++++++---
 include/hw/i2c/pmbus_device.h |  2 ++
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 07a45c99f9..c7ec8e5499 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -149,7 +149,7 @@ static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: tried to read from empty buffer",
                       __func__);
-        return 0xFF;
+        return PMBUS_ERR_BYTE;
     }
     uint8_t data =3D pmdev->out_buf[pmdev->out_buf_len - 1];
     pmdev->out_buf_len--;
@@ -243,18 +243,47 @@ void pmbus_check_limits(PMBusDevice *pmdev)
     }
 }
=20
+/* assert the status_cml error upon receipt of malformed command */
+static void pmbus_cml_error(PMBusDevice *pmdev)
+{
+    for (int i =3D 0; i < pmdev->num_pages; i++) {
+        pmdev->pages[i].status_word |=3D PMBUS_STATUS_CML;
+        pmdev->pages[i].status_cml |=3D PB_CML_FAULT_INVALID_CMD;
+    }
+}
+
 static uint8_t pmbus_receive_byte(SMBusDevice *smd)
 {
     PMBusDevice *pmdev =3D PMBUS_DEVICE(smd);
     PMBusDeviceClass *pmdc =3D PMBUS_DEVICE_GET_CLASS(pmdev);
-    uint8_t ret =3D 0xFF;
-    uint8_t index =3D pmdev->page;
+    uint8_t ret =3D PMBUS_ERR_BYTE;
+    uint8_t index;
=20
     if (pmdev->out_buf_len !=3D 0) {
         ret =3D pmbus_out_buf_pop(pmdev);
         return ret;
     }
=20
+    /*
+     * Reading from all pages will return the value from page 0,
+     * this is unspecified behaviour in general.
+     */
+    if (pmdev->page =3D=3D PB_ALL_PAGES) {
+        index =3D 0;
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: tried to read from all pages\n",
+                      __func__);
+        pmbus_cml_error(pmdev);
+    } else if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: page %d is out of range\n",
+                      __func__, pmdev->page);
+        pmbus_cml_error(pmdev);
+        return PMBUS_ERR_BYTE;
+    } else {
+        index =3D pmdev->page;
+    }
+
     switch (pmdev->code) {
     case PMBUS_PAGE:
         pmbus_send8(pmdev, pmdev->page);
@@ -1019,7 +1048,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t=
 *buf, uint8_t len)
=20
     if (len =3D=3D 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func_=
_);
-        return -1;
+        return PMBUS_ERR_BYTE;
     }
=20
     if (!pmdev->pages) { /* allocate memory for pages on first use */
@@ -1038,6 +1067,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_t=
 *buf, uint8_t len)
         pmdev->page =3D pmbus_receive8(pmdev);
         return 0;
     }
+
     /* loop through all the pages when 0xFF is received */
     if (pmdev->page =3D=3D PB_ALL_PAGES) {
         for (int i =3D 0; i < pmdev->num_pages; i++) {
@@ -1048,6 +1078,15 @@ static int pmbus_write_data(SMBusDevice *smd, uint8_=
t *buf, uint8_t len)
         return 0;
     }
=20
+    if (pmdev->page > pmdev->num_pages - 1) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                        "%s: page %u is out of range\n",
+                        __func__, pmdev->page);
+        pmdev->page =3D 0; /* undefined behaviour - reset to page 0 */
+        pmbus_cml_error(pmdev);
+        return PMBUS_ERR_BYTE;
+    }
+
     index =3D pmdev->page;
=20
     switch (pmdev->code) {
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 72c0483149..bab4526734 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -228,6 +228,8 @@ enum pmbus_registers {
 #define PB_MAX_PAGES            0x1F
 #define PB_ALL_PAGES            0xFF
=20
+#define PMBUS_ERR_BYTE          0xFF
+
 #define TYPE_PMBUS_DEVICE "pmbus-device"
 OBJECT_DECLARE_TYPE(PMBusDevice, PMBusDeviceClass,
                     PMBUS_DEVICE)
--=20
2.35.1.616.g0bdcbb4464-goog


