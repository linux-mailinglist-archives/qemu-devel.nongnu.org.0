Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C757E806
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:09:45 +0200 (CEST)
Received: from localhost ([::1]:35582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEyy0-0000hW-Gq
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp6-0003Bt-9E
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:32 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyp4-0005D4-Js
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:00:31 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so7547917fac.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDH8WQM1CcrQ7MWlTwywWT5aGC6JfLPqlVYbl6HwG28=;
 b=WUm0Ny22YPMID7ejz/czDudkXkIMyInJtINW8CWFgaLKok35tCNd9KdGD3Q+U7wVpP
 U8dVniq7Ar0dxg7c9AmVeL6bIEJPPtc+jGyQ7m9UUiRMYB8icM6RLEdtObq4WxIThfj3
 9YjmX6n8o3Y+j2jLvdod2uoJrZTUrJfA6bQVIzpIhbN/aI8t/hFtTVXkYZ1azi2pQvdH
 ZZsZiw16uS4TmT5QPhbRy4rTC7UhzVbPm1MqWF+teHBRnHpGq4jiZhtKVN3VHvwgISTq
 ikVH1uZeh+Tl4XDlZptH9Nvu1QwwbX7hmvvqGFBHa/nLbe9+C2DHtxGQVVa9186k69oI
 9vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDH8WQM1CcrQ7MWlTwywWT5aGC6JfLPqlVYbl6HwG28=;
 b=PUAopAkRnSwTaHasKWbspnP+G2sK6TGVgdCF/vduLZzjUIHsWvmkXCsOdvN5WA8N9y
 ClepN5SjVsGH1Gecnq7H1PQvv4Lx8+uDQERW0qPbfoaMqXFilcppjX1wAXaTDsYAE2e1
 TP0W1lPfYkhQQDdr+CcDr7W9oVm9ZbB8XntGvE+7rQosMk38ZvbWAcNb+bQ36c+aNffs
 jFnfjDDQkeKl43ychzRK6dnTM4O0t0jOQDY0w+JzmlF1LhUSWs6mNk3+wZsy9Wk6vbMX
 KkU8EGnA6inMUHuuS8GGCw+Q1hlqPAUJxaMOBTWdXm5xk5vELUX1O6M7DAWvdDGyle4y
 THlA==
X-Gm-Message-State: AJIora/AhF/pY77bLJbdw25L48q7tqxKjS2Td9l5ygl/r5eKgpChdXus
 dup0SrPStkf+oVnxMoB/QBwx7ylQQk0=
X-Google-Smtp-Source: AGRyM1ts8tbC6RKHpn7A52qWkYuoJKDYKc5QwcX+HZ1zq85shA3rdqvIXcU4ka4IONoAg2GFaFWk4w==
X-Received: by 2002:a05:6870:1601:b0:108:2d92:5494 with SMTP id
 b1-20020a056870160100b001082d925494mr8760499oae.109.1658520029910; 
 Fri, 22 Jul 2022 13:00:29 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 09/10] device_tree.c: add fdt_print_property() helper
Date: Fri, 22 Jul 2022 17:00:06 -0300
Message-Id: <20220722200007.1602174-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We want to be able to also print properties with 'info fdt'.

Create a helper to print properties based on the already existing code
from fdt_print_node().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 softmmu/device_tree.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 88b6a0c902..e41894fbef 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -721,6 +721,23 @@ static void fdt_prop_print_val(const char *propname, const void *data,
     qemu_printf("]\n");
 }
 
+static void fdt_print_property(const char *propname, const void *data,
+                               int prop_size, int padding)
+{
+    if (prop_size == 0) {
+        qemu_printf("%*s%s;\n", padding, "", propname);
+        return;
+    }
+
+    if (fdt_prop_is_string(data, prop_size)) {
+        qemu_printf("%*s%s = '%s'\n", padding, "", propname, (char *)data);
+    } else if (fdt_prop_is_uint32_array(prop_size)) {
+        fdt_prop_print_uint32_array(propname, data, prop_size, padding);
+    } else {
+        fdt_prop_print_val(propname, data, prop_size, padding);
+    }
+}
+
 static void fdt_print_node(int node, int depth, const char *fullpath)
 {
     const struct fdt_property *prop = NULL;
@@ -746,20 +763,7 @@ static void fdt_print_node(int node, int depth, const char *fullpath)
         prop = fdt_get_property_by_offset(fdt, property, &prop_size);
         propname = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
 
-        if (prop_size == 0) {
-            qemu_printf("%*s%s;\n", padding, "", propname);
-            continue;
-        }
-
-        if (fdt_prop_is_string(prop->data, prop_size)) {
-            qemu_printf("%*s%s = '%s'\n", padding, "",
-                        propname, (char *)prop->data);
-        } else if (fdt_prop_is_uint32_array(prop_size)) {
-            fdt_prop_print_uint32_array(propname, prop->data, prop_size,
-                                        padding);
-        } else {
-            fdt_prop_print_val(propname, prop->data, prop_size, padding);
-        }
+        fdt_print_property(propname, prop->data, prop_size, padding);
     }
 
     fdt_for_each_subnode(node, fdt, parent) {
-- 
2.36.1


