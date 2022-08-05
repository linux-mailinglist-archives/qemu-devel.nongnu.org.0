Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607F958ACC4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 16:59:00 +0200 (CEST)
Received: from localhost ([::1]:54598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJymx-00007z-HI
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 10:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oJykV-0005RT-KB; Fri, 05 Aug 2022 10:56:27 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oJykU-0003W2-A8; Fri, 05 Aug 2022 10:56:27 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso3069571pjd.3; 
 Fri, 05 Aug 2022 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JCf8BpsoGS5qqjGfLu/HY6lWex7KsOE/xca4FpD4SY0=;
 b=MsT6Ao39JkeGMyqg8pd306nlMPbRKJm33PccBY/OUjaEzBTmdkTmAWzlB/ye3tze3Z
 Dedb6n1KKW5nfLh9R/zXk5/0iTW74j5dMFu5autU1k1JEWY4JvyJPO22eIySgJZXBtdI
 8YHP/z5qlvmjYAAE4xw+bD3pIW12gRwZEw/qJ3iq1FW0T9tYl5AKTWt3KDGDWx2h/yCZ
 Yb1lYCV6n4kD7OC8eP+FQWvqFtZb1YQr2+mV/z/MDUOCxfGoGm/A8eBcNT5soiD4z1VP
 k1vLMM9HdjCCshW4ArSe4XwzqrUYU/958zSOrsZerVSGqi96l3mGi4mnptwPX2xzOB9z
 qghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JCf8BpsoGS5qqjGfLu/HY6lWex7KsOE/xca4FpD4SY0=;
 b=uGs29aSS7mg9v/k0McO285CDZrgAFzY9SmizNyRozxCvy+uespBsDrfoY+GqLeS36L
 qCk4Pl9md/u1sg9ZMwXHaThzn4X6WadRfxc/e3snAlNTis19p0syZwUxRg4b4hHHwRPo
 SU2B+mflvjsSF1DIRDEq8XrpND/Nfba+0MxoethennYOeDBibJPpgO/EDttKAsFuoDdY
 z2y61C5+OV6OCFTZKuWGhhm+zdyj+Hgu6pOWHTHS4eeWZm4PXwyxdnpWqnG8bk42ZIuY
 IRFlD69FjCaIpdFDDl8UDO4cVzxRpHJFfDB1lUFsI0rGLKBZITQLx41eRXLAC/8yrz8p
 T5pQ==
X-Gm-Message-State: ACgBeo2eH5fztgGAegxJdXMcH1XS8od5XknPeUvW3h14ITWNdiIBvZaz
 e2ebLXegU9jPWBx28bxYCEHKsDWL+CM=
X-Google-Smtp-Source: AA6agR6n97o+BSt0ro2OuRjZoYCbtck5wqOeClah+MAfg4r48RmelX2Diht9+idO2gUvZy3soTlRkQ==
X-Received: by 2002:a17:90b:4d91:b0:1f5:2073:6cfd with SMTP id
 oj17-20020a17090b4d9100b001f520736cfdmr16288936pjb.175.1659711384374; 
 Fri, 05 Aug 2022 07:56:24 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a170902d49200b0016bfafffa0esm3166814plg.227.2022.08.05.07.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 07:56:24 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-block@nongnu.org
Subject: [PATCH 2/2] util/aio-win32: Correct the event array size in aio_poll()
Date: Fri,  5 Aug 2022 22:56:17 +0800
Message-Id: <20220805145617.952881-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805145617.952881-1-bmeng.cn@gmail.com>
References: <20220805145617.952881-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
object handles. Correct the event array size in aio_poll() and
add a assert() to ensure it does not cause out of bound access.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 util/aio-win32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/aio-win32.c b/util/aio-win32.c
index 44003d645e..8cf5779567 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -326,7 +326,7 @@ void aio_dispatch(AioContext *ctx)
 bool aio_poll(AioContext *ctx, bool blocking)
 {
     AioHandler *node;
-    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
+    HANDLE events[MAXIMUM_WAIT_OBJECTS];
     bool progress, have_select_revents, first;
     int count;
     int timeout;
@@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
     QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
         if (!node->deleted && node->io_notify
             && aio_node_check(ctx, node->is_external)) {
+            assert(count < MAXIMUM_WAIT_OBJECTS);
             events[count++] = event_notifier_get_handle(node->e);
         }
     }
-- 
2.34.1


