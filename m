Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1056208CF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 06:13:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osGtw-0003OF-2M; Tue, 08 Nov 2022 00:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nyoro.gachu@gmail.com>)
 id 1osGts-0003Nt-Vm
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 00:11:53 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nyoro.gachu@gmail.com>)
 id 1osGtq-0003Vt-3g
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 00:11:52 -0500
Received: by mail-ed1-x52f.google.com with SMTP id z18so20756031edb.9
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 21:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0fLV6R1I/jpug63/adGab44NdvlXkByr+mMlSe4CT/0=;
 b=WrihF0BG/MiP4jPdHBHLr+Ffy+elBvr4oAlNGtP2SQgXMXdcz/UOGZli7KxPYG630d
 dOvctsDGEimNREM0pdx5b04GdblKqSc7tmE1pbK3tYyM0Jx+7P3R2mjaZb2fByELVya0
 zswF29lXMSvXUflZmfkKr5JUmRj92MV/wF5V71dgKyZDPTIomYYgHev8ULDBysra9agf
 rO4SGovWfgL6MnWIy7ANx8n4bfTTUHdyv6R2/fnY3fpqs/0edWryH9IB0xopVrjG68bE
 nMQw2GpsB3QjXF2hN3+tOE3i4voExJ3WcxEo3EBAT6sXRkfRrwrGMcTG16bzOXR5y7dY
 gJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0fLV6R1I/jpug63/adGab44NdvlXkByr+mMlSe4CT/0=;
 b=DpBfaLKhZxvIMWpmYYFJnC0VtuEVGHT6yhO2c3Lx/p4qmHR5fIhAJ7fKm0yonXGzxA
 /8zj2NFOADxWooPrCuE+vwhupJ24Zkjyd/9rJa1aFbbRIXKGMErgkIhtaA0NLc/zz4K0
 TdHhSjkKBtOTkfVGFs8qpTXsQb2R0J6s+Mt6CrIhEgnkbT4K/76u7zkI1XR3zwasqSxc
 KIc3PREdo+E9F0ux7S15VYwJptGDGHPF8LSHrX36o+0YjrACANo28r2HnCNdiegg/h8D
 iIkMO0dcogMDp1gPVwg7frFGokAPbJ7cpfDoOk6FOGxDIq3aEOZAOPW6PzvV8lHkpa0b
 zRMQ==
X-Gm-Message-State: ACrzQf1Z74FpKe80SgwjeR/TnF5aINu5OuPhNnMuAiKJeAUZorTE+y4/
 25XMP+ZdKW/3J7MBAlx8pj9T4lsvryV0gg==
X-Google-Smtp-Source: AMsMyM4HC2cTcrnkCAwE+KLxnQ8r7exNsdxpIeYRmE0XF1S7PDO3auzO9hztyU96VCRXTOTJvnyF7w==
X-Received: by 2002:a05:6402:b6b:b0:461:b9b2:6d58 with SMTP id
 cb11-20020a0564020b6b00b00461b9b26d58mr54497497edb.186.1667884307080; 
 Mon, 07 Nov 2022 21:11:47 -0800 (PST)
Received: from localhost.localdomain ([197.156.137.144])
 by smtp.gmail.com with ESMTPSA id
 kv3-20020a17090778c300b0077a11b79b9bsm4187342ejc.133.2022.11.07.21.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 21:11:46 -0800 (PST)
From: nyoro.gachu@gmail.com
X-Google-Original-From: nyoro.martin@gmail.com
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, samkergachu@gmail.com, Samker <nyoro.martin@gmail.com>
Subject: [PATCH] LOCK GUARDS: replace manual lock()/unlock() calls to
 QEMU_LOCK_GUARD()
Date: Tue,  8 Nov 2022 08:11:20 +0300
Message-Id: <20221108051120.6859-1-nyoro.martin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=nyoro.gachu@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Samker <nyoro.martin@gmail.com>

This is patch replaces WITH_QEMU_LOCK_GUARD() call with the
QEMU_LOCK_GUARD()

Signed-off-by: Samker <nyoro.martin@gmail.com>
---
 softmmu/physmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index fb00596777..907491ae17 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3115,7 +3115,7 @@ void cpu_register_map_client(QEMUBH *bh)
 {
     MapClient *client = g_malloc(sizeof(*client));
 
-    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);
+    QEMU_LOCK_GUARD(&map_client_list_lock);
     client->bh = bh;
     QLIST_INSERT_HEAD(&map_client_list, client, link);
     if (!qatomic_read(&bounce.in_use)) {
@@ -3143,7 +3143,7 @@ void cpu_unregister_map_client(QEMUBH *bh)
 {
     MapClient *client;
 
-    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);
+    QEMU_LOCK_GUARD(&map_client_list_lock);
     QLIST_FOREACH(client, &map_client_list, link) {
         if (client->bh == bh) {
             cpu_unregister_map_client_do(client);
-- 
2.25.1


