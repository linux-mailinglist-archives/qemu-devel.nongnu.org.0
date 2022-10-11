Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AD45FB21C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 14:09:48 +0200 (CEST)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiE4v-0000uK-3r
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 08:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCmo-0008LJ-EB
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCml-0000Jy-9S
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665485214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7qv2GTUg6QEcdO8tL3iFRveohL/iPQWYr0IAI2CxpHY=;
 b=gTkKTPRrdcAPt8QEFEeG/1MZ2fhydAkCzRXA0+KgRNh402RnLHggUATzLChyQTlBNisZPJ
 A+/gjfoD9BXTkn/UBzUAUxcHkeVJhRSjIiTmUKT+RRUKT82Cta32wPl28zsOeeXcPhn1Wb
 Ljuf6tvMbBS4gQvkEqyNHrvIuTz5k5g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-651-PvBEMok2MmqVg8e-ihHstg-1; Tue, 11 Oct 2022 06:46:53 -0400
X-MC-Unique: PvBEMok2MmqVg8e-ihHstg-1
Received: by mail-ed1-f71.google.com with SMTP id
 z16-20020a05640235d000b0045c0360bfcfso4498526edc.14
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7qv2GTUg6QEcdO8tL3iFRveohL/iPQWYr0IAI2CxpHY=;
 b=TkwZzK6hmgEOHwIFdvitN9O3SEhm79aU3qy4tY97sf6Tdks/Zt37U7GtXK6vgjHZBQ
 gvIoaGEapr30dkdhz3IUT/HtiOiL1v/bCLza5QMeQgmNk+D7FHa6mTurP4mS2G5xXyIz
 luOGqJXvxUz0XglGhZupApFOZJ4zc6Nt3TpLIpKFD3sgCqRj3aDLc868pruXfEjSCfsR
 tZ9Ipij9zoBn1YkrjLS+iWWodpcpg2Lnx9i4s+UmRcD08pt5Cc0bV29uv63QsIPI6IrA
 jpfiJjWi6LDDEXbwx9Ke84DH7B2jC6ppZbjsNz5hhZw0X5+xf7eQu2QrVpMQcobcVEJO
 wnFg==
X-Gm-Message-State: ACrzQf0JgTxAQGPXR6sB/2a1KLbk0Kcj/32+pw7nrRDaaLAytFwir+SZ
 BXB2YJVbccieSRiOEOAxa5UraAP5PN42QTXQ2HFZSDoPiOVSIHHy8oXn3ZP4ytifWuRxWy8hvUL
 fT7xA/I+PIgER+Qi4kO3r8K11cajPlkxYKTQdTMQNFmHVI49bTd3vkJVmEgoQKZtdTck=
X-Received: by 2002:a05:6402:2793:b0:45c:21f4:35a3 with SMTP id
 b19-20020a056402279300b0045c21f435a3mr8570408ede.345.1665485212179; 
 Tue, 11 Oct 2022 03:46:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NZm+cRAj4ZoFsM+8zHRWh/xHE6uyPW51KGHi65LUn7YADc52iWZldLYSwBfysy6LcIqnJWQ==
X-Received: by 2002:a05:6402:2793:b0:45c:21f4:35a3 with SMTP id
 b19-20020a056402279300b0045c21f435a3mr8570385ede.345.1665485211884; 
 Tue, 11 Oct 2022 03:46:51 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 vx12-20020a170907a78c00b00770880dfc4fsm755377ejc.29.2022.10.11.03.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:46:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: eesposit@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH] qgraph: implement stack as a linked list
Date: Tue, 11 Oct 2022 12:46:49 +0200
Message-Id: <20221011104649.324963-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The stack used to visit the graph is implemented as a fixed-size array,
and the array is sized according to the maximum anticipated length of
a path on the graph.  However, the worst case for a depth-first search
is to push all nodes on the graph, and in fact stack overflows have
been observed in the past depending on the ordering of the constructors.

To fix the problem once and for all, use a QSLIST instead of the array,
allocating QOSStackElements from the heap.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqos/qgraph.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index 0a2dddfafa..2433e6ea4b 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -52,6 +52,7 @@ struct QOSStackElement {
     QOSStackElement *parent;
     QOSGraphEdge *parent_edge;
     int length;
+    QSLIST_ENTRY(QOSStackElement) next;
 };
 
 /* Each enty in these hash table will consist of <string, node/edge> pair. */
@@ -59,8 +60,7 @@ static GHashTable *edge_table;
 static GHashTable *node_table;
 
 /* stack used by the DFS algorithm to store the path from machine to test */
-static QOSStackElement qos_node_stack[QOS_PATH_MAX_ELEMENT_SIZE];
-static int qos_node_tos;
+static QSLIST_HEAD(, QOSStackElement) qos_node_stack;
 
 /**
  * add_edge(): creates an edge of type @type
@@ -325,40 +325,27 @@ static void qos_print_cb(QOSGraphNode *path, int length)
 static void qos_push(QOSGraphNode *el, QOSStackElement *parent,
                      QOSGraphEdge *e)
 {
+    QOSStackElement *elem = g_new0(QOSStackElement, 1);
     int len = 0; /* root is not counted */
-    if (qos_node_tos == QOS_PATH_MAX_ELEMENT_SIZE) {
-        g_printerr("QOSStack: full stack, cannot push");
-        abort();
-    }
-
     if (parent) {
         len = parent->length + 1;
     }
-    qos_node_stack[qos_node_tos++] = (QOSStackElement) {
+    *elem = (QOSStackElement) {
         .node = el,
         .parent = parent,
         .parent_edge = e,
         .length = len,
     };
-}
-
-/* qos_tos(): returns the top of stack, without popping */
-static QOSStackElement *qos_tos(void)
-{
-    return &qos_node_stack[qos_node_tos - 1];
+    QSLIST_INSERT_HEAD(qos_node_stack, elem, next);
 }
 
 /* qos_pop(): pops an element from the tos, setting it unvisited*/
-static QOSStackElement *qos_pop(void)
+static void qos_pop(void)
 {
-    if (qos_node_tos == 0) {
-        g_printerr("QOSStack: empty stack, cannot pop");
-        abort();
-    }
-    QOSStackElement *e = qos_tos();
+    QOSStackElement *e = QSLIST_FIRST(qos_node_stack);
     e->node->visited = false;
-    qos_node_tos--;
-    return e;
+    QSLIST_REMOVE_HEAD(qos_node_stack, next);
+    g_free(e);
 }
 
 /**
@@ -400,8 +387,8 @@ static void qos_traverse_graph(QOSGraphNode *root, QOSTestCallback callback)
 
     qos_push(root, NULL, NULL);
 
-    while (qos_node_tos > 0) {
-        s_el = qos_tos();
+    while (!QSLIST_EMPTY(qos_node_stack)) {
+        s_el = QSLIST_HEAD(qos_node_stack);
         v = s_el->node;
         if (v->visited) {
             qos_pop();
-- 
2.37.3


