Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285204D0830
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:14:53 +0100 (CET)
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJkq-000715-6Z
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <332UmYgYKClwNCNOMLAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--titusr.bounces.google.com>)
 id 1nRJjg-0005nR-8z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:13:40 -0500
Received: from [2607:f8b0:4864:20::114a] (port=41104
 helo=mail-yw1-x114a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <332UmYgYKClwNCNOMLAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--titusr.bounces.google.com>)
 id 1nRJje-0006zX-R3
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:13:40 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-2d07ae11462so142279847b3.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=lIRfi2f2amHB6ihbKUdscawcMADEbKCKME61okDpwFk=;
 b=VPWHY7L8yT3cUqhLgnAFNFePpCoP6cZloGIjY4e19s75M3rID2Zx24ewRKOqsMmtJf
 mSUnjpyePv6M32WcRqqQzINr1vEaH5P2KRezLa5nAZ/nusST9T1lJCXIEzFVYOHYrmf8
 CzXbMZileBNdylJMRilytxVNyXxqYZBv8hulUdAveJ8ss88erwoLKJiG7jPOcp0RezwT
 57imJ2P5kf/1UGE40uSOj4EWmpUT8T630AVix2T/hkuJ0DLN4QNR4NG2LIhYfxeR5+Hk
 VCV18RsoKUutwR/a9cQb+NReWX8tI3Q5M575tP20F8Bh/M2uKo4e6SBWal8ZwmAR6+sw
 PqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=lIRfi2f2amHB6ihbKUdscawcMADEbKCKME61okDpwFk=;
 b=ux6K0jqOzPQGWtjqmK9fvmGMt7CAxDd0h9r4KJWetluWuX+m++jHv/kFfYUwReoPOA
 /kx4fRH1NZDwmO7zTvmmcsSyepgjxDI78SKWFuJgN4cgbaryCpXNrcrYkfrw0zdG02NP
 QDIOLdUDrwmaoCCg73IQRSFCHV0OrBc352jbgAwU/r3SImFhJAbKfO909xF9KZUTIDjo
 oYNWvuFrisMQNhF3VmdnA5gMmxLgC8GFZeiHTJcsMzDqPFi0yplgOWA9bsGLeLzbiftJ
 ROXBBd30VaZmvNC7lm+cyqJ0pAE0A7oPEvJeiNtpcn/UftNjWoHs+Yl8ZKRc7MG1amuI
 creA==
X-Gm-Message-State: AOAM532K3jUWNwAI2iKOAaDY798rM4rQDuYW46eA0/wPRX0EdBYX5jqR
 Oo7Pzyf8/tkwaRblgqPRe82RTPpiEeQ=
X-Google-Smtp-Source: ABdhPJw9EFOzQ0aQ5l5raO8i62JoB0YJDvsO+xVr+3VvPtC81LhjQJiIn/KXKDgZuj96icdCciSi/W3Xxi8=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr8293718ybg.85.1646683615214; Mon, 07
 Mar 2022 12:06:55 -0800 (PST)
Date: Mon,  7 Mar 2022 12:06:00 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-5-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 4/9] hw/i2c: pmbus: refactor uint handling
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
 envelope-from=332UmYgYKClwNCNOMLAIIAF8.6IGK8GO-78P8FHIHAHO.ILA@flex--titusr.bounces.google.com;
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

This change cleans up the inputs to pmbus_receive uint, the length of
received data is contained in PMBusDevice state and doesn't need to be
passed around.

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index ff644c1d4a..8cb9db0f80 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -89,16 +89,16 @@ void pmbus_send_string(PMBusDevice *pmdev, const char *=
data)
 }
=20
=20
-static uint64_t pmbus_receive_uint(const uint8_t *buf, uint8_t len)
+static uint64_t pmbus_receive_uint(PMBusDevice *pmdev)
 {
     uint64_t ret =3D 0;
=20
     /* Exclude command code from return value */
-    buf++;
-    len--;
+    pmdev->in_buf++;
+    pmdev->in_buf_len--;
=20
-    for (int i =3D len - 1; i >=3D 0; i--) {
-        ret =3D ret << 8 | buf[i];
+    for (int i =3D pmdev->in_buf_len - 1; i >=3D 0; i--) {
+        ret =3D ret << 8 | pmdev->in_buf[i];
     }
     return ret;
 }
@@ -110,7 +110,7 @@ uint8_t pmbus_receive8(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 1 byte, got %d bytes\=
n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint16_t pmbus_receive16(PMBusDevice *pmdev)
@@ -120,7 +120,7 @@ uint16_t pmbus_receive16(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 2 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint32_t pmbus_receive32(PMBusDevice *pmdev)
@@ -130,7 +130,7 @@ uint32_t pmbus_receive32(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 4 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 uint64_t pmbus_receive64(PMBusDevice *pmdev)
@@ -140,7 +140,7 @@ uint64_t pmbus_receive64(PMBusDevice *pmdev)
                       "%s: length mismatch. Expected 8 bytes, got %d bytes=
\n",
                       __func__, pmdev->in_buf_len - 1);
     }
-    return pmbus_receive_uint(pmdev->in_buf, pmdev->in_buf_len);
+    return pmbus_receive_uint(pmdev);
 }
=20
 static uint8_t pmbus_out_buf_pop(PMBusDevice *pmdev)
--=20
2.35.1.616.g0bdcbb4464-goog


