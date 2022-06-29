Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93255FB73
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:13:12 +0200 (CEST)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Tl1-0004V0-99
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th0-0000fu-MV; Wed, 29 Jun 2022 05:09:10 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Tgy-0003XC-8M; Wed, 29 Jun 2022 05:09:02 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Ml72g-1nLM9z0irc-00lSDb; Wed, 29
 Jun 2022 11:08:55 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/11] util: Return void on iova_tree_remove
Date: Wed, 29 Jun 2022 11:08:41 +0200
Message-Id: <20220629090849.1350227-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:THIGnkSvYpEWKX1yZONqBqij9GZ9aV8mn/ItZHV48iVMivPp6+k
 ZUFtZYyLdMTuUB+2B1U2xI075ofW/k+tq3KgLFfS0aN1GhawXu/2eEhAVpdDwCeOkOjzopQ
 975/7wdWes79B1yP+KEX8XqvHWWygLXSdOXnFWnkHdiKwC1O6FXOg0OB1StkSjHrqw7tBCY
 EiA9A4ZbJanAh+sny5fGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MU3bVoj9NwQ=:JmyAcmmfAVM9X7pjUfcY2O
 Pstqj1W+kPH8vM3qkiB6lt0vaDcClRSdrJwv+opXxVWghOadsWudRGooyGbhjZFJA/Gqx4LyX
 XgM72bZvYZr6zBBmSexSxhW0NWIeC2weae7pKMiSbh6oBoDJwRskf5/Q6R6hQCnI9J1TClyBg
 Alvj+9AsmJLKNy/b1n3/llrvlIZsG3snEUkjKnTi6KNkpZYthFa4Ey6bmhLEgX6tyAjilKIJa
 8gq8uVH1jIABeV18FGW9m5pz3DiIJEYYdY1qCMwl6v8wbZswdz0GTBfD+Fx6CBJSTsReZjO6q
 AaRM6xeB8ANEYktJc//shDXWTjW/AIZhkF8l8Jq2oHgDU/u+WZC0RznVlvlCDKQwZ+25YL6CH
 YIj5A+FO5Qi5HGuc3lMJj3Ir0Jv8UoztQnSXmUfLV34kSwR+ErkKSZwYiZ3qIJHWQpXWcEeSs
 Pfm96u6fVtxLQl0H8HitVltB8YoCR7Q+lIAAou3N6FJ9qRjOY+NLBu5MFpXHRS0+Dmss654NZ
 2mWctkkr41B8JZo2bCJ3U5Ej/w8YTpCLnZoE44iRmA0joyL6HpgajUuDcsv5rd9Okz7Debi6P
 46TQVsmmhgpeUDTC0pVQ6rnQfO2thlYX6ZzPD9SjRzhlzx2E41sm3a2LyoTmxLpSetAbymlf+
 aUN7Tn/Idv3H8maKVjDZQ6To9G2s/sus3Z8oKifzxnLWHYjvxKxwlq+nldJ5k+V6PJQn+c+f6
 ZyEACiYMqzPS+LiBzIuMFojronQxWvzO25wthQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Eugenio Pérez <eperezma@redhat.com>

It always returns IOVA_OK so nobody uses it.

Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220427154931.3166388-1-eperezma@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qemu/iova-tree.h | 4 +---
 util/iova-tree.c         | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/qemu/iova-tree.h b/include/qemu/iova-tree.h
index c938fb07933a..16bbfdf5f8d7 100644
--- a/include/qemu/iova-tree.h
+++ b/include/qemu/iova-tree.h
@@ -72,10 +72,8 @@ int iova_tree_insert(IOVATree *tree, const DMAMap *map);
  * provided.  The range does not need to be exactly what has inserted,
  * all the mappings that are included in the provided range will be
  * removed from the tree.  Here map->translated_addr is meaningless.
- *
- * Return: 0 if succeeded, or <0 if error.
  */
-int iova_tree_remove(IOVATree *tree, const DMAMap *map);
+void iova_tree_remove(IOVATree *tree, const DMAMap *map);
 
 /**
  * iova_tree_find:
diff --git a/util/iova-tree.c b/util/iova-tree.c
index 6dff29c1f62d..fee530a57919 100644
--- a/util/iova-tree.c
+++ b/util/iova-tree.c
@@ -164,15 +164,13 @@ void iova_tree_foreach(IOVATree *tree, iova_tree_iterator iterator)
     g_tree_foreach(tree->tree, iova_tree_traverse, iterator);
 }
 
-int iova_tree_remove(IOVATree *tree, const DMAMap *map)
+void iova_tree_remove(IOVATree *tree, const DMAMap *map)
 {
     const DMAMap *overlap;
 
     while ((overlap = iova_tree_find(tree, map))) {
         g_tree_remove(tree->tree, overlap);
     }
-
-    return IOVA_OK;
 }
 
 /**
-- 
2.36.1


