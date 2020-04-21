Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0C01B25DC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 14:23:28 +0200 (CEST)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQrvz-0006Y5-Ak
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 08:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpT-00056G-V0
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 08:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpT-0006Bu-JI
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 08:16:43 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jQrpT-00069A-6A; Tue, 21 Apr 2020 08:16:43 -0400
Received: by mail-wm1-x342.google.com with SMTP id e26so3290533wmk.5;
 Tue, 21 Apr 2020 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L0eadFJUGQPJ4p4rN6pAFYs/4hrk+ggDCEiPyRFZ3fs=;
 b=V2sTdJ8Tb37chI9F3dE++ub2orQiMllJDR1o05Ueg0Ql7e+sWM8vo+ROoHCDzZ2DOe
 2Cqa7vEghztIt/NI9YubWKI01VU2DpqxxgwAY4oJ4qe50yypxop2vUibq3si4FcvDyoK
 O5is9FVXUF58y4VOqsMNUGKA6IBE6fE0hsgxVrnx3ewFAUNbeELRJjk7JUfY0xd9y8wu
 XNjRnK/LzZMwC9IrfDFbktebVjSkIG2DqcMTzd3smbQLaeE/cHPkCsO9eESNIry/H6Iq
 FDjW5W0ZANoMlnLgN5+/bTlVfBI8GOe0oBRdkIF4P1aQXTocUiX74ZTHC9I5TlrbbXkt
 Xn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L0eadFJUGQPJ4p4rN6pAFYs/4hrk+ggDCEiPyRFZ3fs=;
 b=hA3rhZ0k+Dg62w79BhUWlF0ROCxUN4jYgtut7Ig7b+FRmm5cXa2sJ2ZdLKfEMxAQRm
 TZUjnMhQnUJQ0Ww2OjAXQ8hUyqv7qnn2D6GMHMrbLkI+P/GdCkAKzvPHRef7uiqdEw8p
 qsc453HqjRESD0ko0RZuugWCC0OjwOo61CGVeEylWJe5cAvfwEtHVaTnpj53m2qfB27q
 GMzUBfXOLTHPM8ZmSYrnxRBHwZqbLkbcM8WriwHeuLNttJ0OZEeCI8OZgmxP+vYpsqvk
 ap6XWvIbCwoih89DuhWSsf4rDT4Ibxex+CB/VuvNl3cqHi3KzQqlVAYzI+PHfF1D2zgY
 GfTg==
X-Gm-Message-State: AGi0PuY/DmUFKG4N73v3YQgzZvOiNl8mzhew8GZSw/4nFO72jeNi5trE
 VufurHgTIwOgWCNj2nhBri8ZkejriVo=
X-Google-Smtp-Source: APiQypILiESmN6xnZD4uLGd565+6Js0iVZ+JOAISP4gSIJ27+lG3N0rTt3yHP2OiD3cZMLzDfAz06Q==
X-Received: by 2002:a1c:2457:: with SMTP id k84mr4367293wmk.96.1587471400256; 
 Tue, 21 Apr 2020 05:16:40 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id z76sm3761140wmc.9.2020.04.21.05.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:16:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/17] hw/misc/tmp421: Add definition for SENSORS_COUNT
Date: Tue, 21 Apr 2020 14:16:15 +0200
Message-Id: <20200421121626.23791-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421121626.23791-1-f4bug@amsat.org>
References: <20200421121626.23791-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a definition instead of a magic value.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/tmp421.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index c0bc150bca..04c3b3ca6e 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -37,6 +37,8 @@
 #define TMP422_DEVICE_ID                0x22
 #define TMP423_DEVICE_ID                0x23
 
+#define SENSORS_COUNT       4
+
 typedef struct DeviceInfo {
     int model;
     const char *name;
@@ -53,7 +55,7 @@ typedef struct TMP421State {
     I2CSlave i2c;
     /*< public >*/
 
-    int16_t temperature[4];
+    int16_t temperature[SENSORS_COUNT];
 
     uint8_t status;
     uint8_t config[2];
@@ -124,7 +126,7 @@ static void tmp421_get_temperature(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (tempid >= 4 || tempid < 0) {
+    if (tempid >= SENSORS_COUNT || tempid < 0) {
         error_setg(errp, "error reading %s", name);
         return;
     }
@@ -164,7 +166,7 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (tempid >= 4 || tempid < 0) {
+    if (tempid >= SENSORS_COUNT || tempid < 0) {
         error_setg(errp, "error reading %s", name);
         return;
     }
-- 
2.21.1


