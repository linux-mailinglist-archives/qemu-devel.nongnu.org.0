Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235568AE46
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:31:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWfS-0007AJ-K2; Sat, 04 Feb 2023 23:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfN-00079r-DT
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:14 -0500
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWfK-00069J-Gc
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:30:13 -0500
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 260003470
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8Q6yc66u6h8sFaKvoejR2wxRtIbFchMFZxGqfqrLsTDasY5as4F+v
 jZNCGjVOaqDZDfxeIslPInk/UsPu8TSzYAwSVZrqSlnEysa+MHIO4+lIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlA4gRlDRx2lAS2e0c9Xcp3yZ6ZciOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDX4pZkc/HKbitq/0Te5p0G2M80Mi+7vdkoc+dZk
 72hvbToIesg0zaldO41CnG0GAknVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kvDZNF4dhKUVh31
 t0+LQk2MRGjpeOflefTpulE3qzPLeHuNYIb/2h8lHTXVKd2B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2MxNFKZMk0n1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYviOC1a4aKIrRmQ+1/oHaBp
 37i31ikOUAlEYKbkgCD6EKj07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe0r6BXuQICsD1u3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:fKsSWqjBd9Ly29XcEsbv23LNXXBQXgwji2hC6mlwRA09TyVXrb
 HLoB19726JtN91YhsdcL+7Sc+9qB/nhPxICMwqTMyftWrdyRaVxf9ZnPLfKlTbckWUh41gPO
 VbAtJD4bXLbWSS5vyKhzVQfexQpeWvweSDqd2b4U1QbTxHXYld0iYRMHflLqS0fmV77FgCea
 Z0KvAom9PZQwVuUi1zPBZlY9T+
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:30:05 -0500
Received: by mail-qt1-f198.google.com with SMTP id
 j26-20020ac84c9a000000b003b9b7c60108so4743681qtv.16
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Phruv42ZKb1BU23VxmFonsl7gM9IzscXi8foTIsObgU=;
 b=MdcKjUtf60G5KJp/fXO5GsQHDqKViTdAZB87QqX/qrPcI1YcAgKGm29Yt8JAmdKA5z
 Ex4kKxi3AYdyMUxIKq0fp4lBuSBZkj/c4YqkiMTFFX4JYs6+BTfdJcqNERa573icB4nS
 HI+DcKkMB3NnzKrIlP43yaT+oIdwsHmMMRBSQSotj1Cm0qLt9P1iZV7fV2g8rOMFnZ9N
 4zFqysG+Q5GYd0XRDvvOS4slhcYX2AQh9rUjnWzwwEiakBpAGef3REzXleI/Asbx0s72
 SDeszPwpL39Bi7cR3DNvtRziSwQSq30q4EDDc8PqdN1fdKHJ5DO1HqIUaczqPyCjYhrL
 97hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Phruv42ZKb1BU23VxmFonsl7gM9IzscXi8foTIsObgU=;
 b=dkeBlB/6Xs++wNaPKdnzw12p8hImzeRakRozYBOBT2rya9UShbZdHtEVMPsFC5Vmww
 rsSL6aglvMtpm9eJ5YA5ln9sIJ+tgXlpS4FlV3dhM+LIEHwFJwXQlk2hI/DGchd18zYO
 g89xgE5li1snF4oivze1nM3ArmdJjSsNJpuHpvF9Em8AtKZoLKdw7bwn9VoaDFd1cArM
 ivUeUbSojVLi91QTkAeXWCmrMETlhJHBMyoL8Wa+Lt20ck+8Dt9Sln6/Es+Kw2NKBPiK
 3WCbeK/xM/h2mZMLCMmwF9LeS9CbERZpxhItReIxXPhEBlMrWEsVWT5ls4DcNAXYUalr
 2pkw==
X-Gm-Message-State: AO0yUKVqK3wk3cVFQdI1R8mr2w0di9I1AqnuX2Q3R4AAx/thnEi2gqYS
 9ppdjrVy//hWipDacHCOReQfQKGOxAnxsMM4x+WIJMZHQjXGMrxYpxpKhfkHTWjgckHviTsx01i
 3lChU9H5ZcVVZr2SOzvDk7s+maomdeQ==
X-Received: by 2002:ac8:5f52:0:b0:3b9:bdb0:7aa1 with SMTP id
 y18-20020ac85f52000000b003b9bdb07aa1mr28072530qta.41.1675571404808; 
 Sat, 04 Feb 2023 20:30:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8ywUuA2A/LIjn4OJAPaGx4Xwk54qZ8CSWlQ92v3JmokmwwpjVzoZamTBzPt2AlV86ToTJLTA==
X-Received: by 2002:ac8:5f52:0:b0:3b9:bdb0:7aa1 with SMTP id
 y18-20020ac85f52000000b003b9bdb07aa1mr28072509qta.41.1675571404542; 
 Sat, 04 Feb 2023 20:30:04 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 x8-20020ae9e908000000b0072526a43ef7sm4845104qkf.120.2023.02.04.20.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:30:04 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: [PATCH 01/10] hw/sparse-mem: clear memory on reset
Date: Sat,  4 Feb 2023 23:29:42 -0500
Message-Id: <20230205042951.3570008-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We use sparse-mem for fuzzing. For long-running fuzzing processes, we
eventually end up with many allocated sparse-mem pages. To avoid this,
clear the allocated pages on system-reset.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/mem/sparse-mem.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
index e6640eb8e7..72f038d47d 100644
--- a/hw/mem/sparse-mem.c
+++ b/hw/mem/sparse-mem.c
@@ -77,6 +77,13 @@ static void sparse_mem_write(void *opaque, hwaddr addr, uint64_t v,
 
 }
 
+static void sparse_mem_enter_reset(Object *obj, ResetType type)
+{
+    SparseMemState *s = SPARSE_MEM(obj);
+    g_hash_table_remove_all(s->mapped);
+    return;
+}
+
 static const MemoryRegionOps sparse_mem_ops = {
     .read = sparse_mem_read,
     .write = sparse_mem_write,
@@ -123,7 +130,8 @@ static void sparse_mem_realize(DeviceState *dev, Error **errp)
 
     assert(s->baseaddr + s->length > s->baseaddr);
 
-    s->mapped = g_hash_table_new(NULL, NULL);
+    s->mapped = g_hash_table_new_full(NULL, NULL, NULL,
+                                      (GDestroyNotify)g_free);
     memory_region_init_io(&s->mmio, OBJECT(s), &sparse_mem_ops, s,
                           "sparse-mem", s->length);
     sysbus_init_mmio(sbd, &s->mmio);
@@ -131,12 +139,15 @@ static void sparse_mem_realize(DeviceState *dev, Error **errp)
 
 static void sparse_mem_class_init(ObjectClass *klass, void *data)
 {
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, sparse_mem_properties);
 
     dc->desc = "Sparse Memory Device";
     dc->realize = sparse_mem_realize;
+
+    rc->phases.enter = sparse_mem_enter_reset;
 }
 
 static const TypeInfo sparse_mem_types[] = {
-- 
2.39.0


