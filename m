Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12EC82154
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 18:10:06 +0200 (CEST)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hufYk-0002qu-3G
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 12:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58269)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPY-00008I-C6
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 12:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hufPX-0002o4-1t
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 12:00:36 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43797)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hufPW-0002nL-D1; Mon, 05 Aug 2019 12:00:34 -0400
Received: by mail-pf1-x441.google.com with SMTP id i189so39874490pfg.10;
 Mon, 05 Aug 2019 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=J+FSR7kaTD5GzuWyaFknCwoH3gLRZsoDrFhbtu7tIKs=;
 b=HWU91Y8BBqc29LgCg6RsnNnUL18w+9cZyCNbGDScpU6yRH6yh7uj2svXYGXIGxiMbQ
 8NmkksGg356cygBZa5cSRRXbHeHZgKalzlgWZ7qZySy6g7uxDsem11Hyx+GfHJ3BaG5C
 zYsqzWYingO6Fzcr+52Qv4DgH2TdyApLuDGQfXXPZYyZsIoEUmvUsRmXDc9+mXAYKDsy
 6qUZxq0sDgTJpqzdCjySB0pUp/UBGy5GAQH/9ShuUP4mZr+QjdDIuguHua0y3QtTh4ZF
 pTfOnvyW+sYBYxCiXMuAKY8QyUskxwscPMlGezZH/wpHoMrvPmFS2vLHZeOIO3ljSGV0
 MK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=J+FSR7kaTD5GzuWyaFknCwoH3gLRZsoDrFhbtu7tIKs=;
 b=BWpXeYELc7R+LznQs61XDYcmfFjFBitLeMRNHRkuZPZFEbTdNEJIT5s3o4X71QHkQf
 gF/qMi+bkIpO3uCGveDf7jPF5EqI0pH3HHyBJiSS5jEgHqlzek1j6kPgFqV8h0al1zIL
 +omLBCcb2Ic1sIT2OqTQgF0FxGePVsn0/M9gXi7/tKuZZwc7gRH7hpSifzZ06GFFd9zl
 PayqyzSw/FwDa0FOE+9Lpq3L/7rfYAiTkh5Nl9YIxw4HlgiGqBXdskyp5PGWXUT0fDVz
 yYWJj6yUrNYSQcARJc5Qah+LY6dFp4VQXaZGTMOcKEMykZYCeCcriRz3DIb5Wc9c7I9a
 PspQ==
X-Gm-Message-State: APjAAAVvAdoUhQO3HVtbXKprXqwhg2+S2x03imOBllGkm/VFfDMOXFRV
 7hm2zpTsv8tQKpeJnEL3NZE=
X-Google-Smtp-Source: APXvYqyvG1orG0YXOhtB0CmeQFZ5m6o3Tjb7sqzVnySNJ/dNFyvx/YulroAjPSDVLpxSgBM0he1KSg==
X-Received: by 2002:a17:90a:a407:: with SMTP id
 y7mr16207470pjp.97.1565020833621; 
 Mon, 05 Aug 2019 09:00:33 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id d18sm47728793pgi.40.2019.08.05.09.00.32
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 05 Aug 2019 09:00:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Mon,  5 Aug 2019 09:00:00 -0700
Message-Id: <1565020823-24223-6-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020823-24223-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH 05/28] riscv: hart: Support heterogeneous harts
 population
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

At present we only allow symmetric harts to be created. In order to
support heterogeneous harts like SiFive FU540, update hart array's
"cpu-type" property to allow cpu type to be set per hart, separated
by delimiter ",". The frist cpu type before the delimiter is assigned
to hart 0, and the second cpu type before delimiter is assigned to
hart 1, and so on.

If the total number of cpu types supplied in "cpu-type" property is
less than number of maximum harts, the last cpu type in the property
will be used to populate remaining harts.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/riscv_hart.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 3dd1c6a..27093e0 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -58,13 +58,55 @@ static void riscv_hart_realize(RISCVHartArrayState *s, int hart,
 static void riscv_harts_realize(DeviceState *dev, Error **errp)
 {
     RISCVHartArrayState *s = RISCV_HART_ARRAY(dev);
-    int n;
+    char *cpu_types;
+    char *first_type, *last_type, *tmp_type;
+    int n = 0;
 
     s->harts = g_new0(RISCVCPU, s->num_harts);
 
-    for (n = 0; n < s->num_harts; n++) {
-        riscv_hart_realize(s, n, s->cpu_type, errp);
+    /* we should not touch the original s->cpu_type */
+    cpu_types = g_strdup(s->cpu_type);
+
+    /*
+     * Expect s->cpu_type property was initialized this way:
+     *
+     * "cpu-type-a": symmetric harts
+     * "cpu-type-a,cpu-type-b,cpu-type-c": heterogeneous harts
+     *
+     * For heterogeneous harts, hart cpu types are separated by delimiter ",".
+     * The frist cpu type before the delimiter is assigned to hart 0, and the
+     * second cpu type before delimiter is assigned to hart 1, and so on.
+     *
+     * If the total number of cpu types is less than s->num_harts, the last
+     * cpu type in s->cpu_type will be used to populate remaining harts.
+     */
+
+    first_type = strtok(cpu_types, ",");
+    riscv_hart_realize(s, n++, first_type, errp);
+    tmp_type = strtok(NULL, ",");
+    if (!tmp_type) {
+        /* symmetric harts */
+        for (; n < s->num_harts; n++) {
+            riscv_hart_realize(s, n, first_type, errp);
+       }
+    } else {
+        /* heterogeneous harts */
+        while (tmp_type) {
+            if (n >= s->num_harts) {
+                break;
+            }
+            riscv_hart_realize(s, n++, tmp_type, errp);
+            last_type = tmp_type;
+            tmp_type = strtok(NULL, ",");
+        }
+
+        /* populate remaining harts using the last cpu type in s->cpu_type */
+        for (; n < s->num_harts; n++) {
+            riscv_hart_realize(s, n, last_type, errp);
+        }
     }
+
+    g_free(cpu_types);
 }
 
 static void riscv_harts_class_init(ObjectClass *klass, void *data)
-- 
2.7.4


