Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FB047B53E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:32:09 +0100 (CET)
Received: from localhost ([::1]:44820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQGO-0001r6-LZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:32:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <35fPAYQcKCuQbKTZaXKMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--venture.bounces.google.com>)
 id 1mzQCF-00054F-Nk
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:27:53 -0500
Received: from [2607:f8b0:4864:20::249] (port=34407
 helo=mail-oi1-x249.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <35fPAYQcKCuQbKTZaXKMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--venture.bounces.google.com>)
 id 1mzQCE-0000mX-Ae
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:27:51 -0500
Received: by mail-oi1-x249.google.com with SMTP id
 w131-20020acac689000000b002a813c6e600so7072074oif.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=C3iISVTfuPhQOVMoTKTUJfvnrGbpmNUM9lPsEFgLTJw=;
 b=JEAyBdz3Onfauxq1uUqXgs1MI4rXtNjJXVWEeBGOiO4iTwlS5NnNcyvyDgF+NodtZi
 nMfq+HD5VEvSu10VA9haPq6rakXhi2XpCKwkf8cFk9BqLQKbWyHAoGh3ZpcqY266BZxe
 c3mu/m1cmK1wE3EG0YFjpX7K6SkuAppN0pgN1pNj6Kn65ShTclJjmJKdVS/6QCvENf0W
 fu7+Nhr3Yag1OmoRpoOj18TIBr+/HJ2hEAcuECd5sVgSBy9boPBQffLtk9OxhFzOcfrE
 jQMp9mdH0ghNxmQ/GfpnLuYRpb7jfm3Bs0tudw9skvdEAoPgzCIWlwugW/gborVagKwe
 FoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
 :content-transfer-encoding;
 bh=C3iISVTfuPhQOVMoTKTUJfvnrGbpmNUM9lPsEFgLTJw=;
 b=cbB5k8fhEi6mdVWBV+9LnIJKRf/J3K3L1oCrk1U6RWZ/EiFei9pArR76vE94zByImM
 X3bJOp1OfMuNZ3O4JH7yrXRyC56nRm+vb72PRfRlu/gWmxaGefJMJJ8gDPdC+CTMk73N
 gpoENsUDSRMUj5UWL/AFTRLn0rlJNg7xD83Zuea9GQFIkIipJ4sasaxHFxpkhNKRKtuY
 rDQAC8lqpk37RahkidzhRGjioPft7oqoN4M0h+OxEql1486722ZNvdwTSPKXuI+FYYcK
 8B1nJC+YkFkUAjQ61FfcVW2Nnfy7hjTCZNYKPOtwdjM/CsBbav3/0CmhrZJzcygyrRF+
 qFlQ==
X-Gm-Message-State: AOAM530xs6razEgJKEVjZCkuiwq8jvXLR06Nps4b8KNPiHGis9zTV/wS
 N8mFTV8Wg4zTkScRZDR27qL4iKaMwhIN
X-Google-Smtp-Source: ABdhPJwrH7n9igXgVw7woBFPse8QGmza+2yVSn5Z63aiUXtHO4gdeIGVY1xWQG+M0kyp6iK1uamPbEZhZg+u
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:fda:6d9e:a1ca:256c])
 (user=venture job=sendgmr) by 2002:a25:aa83:: with SMTP id
 t3mr106912ybi.356.1640035301019; Mon, 20 Dec 2021 13:21:41 -0800 (PST)
Date: Mon, 20 Dec 2021 13:21:37 -0800
Message-Id: <20211220212137.1244511-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [PATCH v2] hw/nvram: at24 return 0xff if 1 byte address
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::249
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::249;
 envelope-from=35fPAYQcKCuQbKTZaXKMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--venture.bounces.google.com;
 helo=mail-oi1-x249.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

The at24 eeproms are 2 byte devices that return 0xff when they are read
from with a partial (1-byte) address written.  This distinction was
found comparing model behavior to real hardware testing.

Tested: `i2ctransfer -f -y 45 w1@85 0 r1` returns 0xff instead of next
byte

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Reordered the event switch to remove explicit branch and use fallthroug=
h.
---
 hw/nvram/eeprom_at24c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index af6f5dbb99..b956b8e2b2 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -58,9 +58,10 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event=
)
=20
     switch (event) {
     case I2C_START_SEND:
-    case I2C_START_RECV:
     case I2C_FINISH:
         ee->haveaddr =3D 0;
+        /* fallthrough */
+    case I2C_START_RECV:
         DPRINTK("clear\n");
         if (ee->blk && ee->changed) {
             int len =3D blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
@@ -84,6 +85,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee =3D AT24C_EE(s);
     uint8_t ret;
=20
+    if (ee->haveaddr =3D=3D 1) {
+        return 0xff;
+    }
+
     ret =3D ee->mem[ee->cur];
=20
     ee->cur =3D (ee->cur + 1u) % ee->rsize;
--=20
2.34.1.307.g9b7440fafd-goog


