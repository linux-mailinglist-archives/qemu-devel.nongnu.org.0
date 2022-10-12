Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93385FC2D3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:16:03 +0200 (CEST)
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXqM-0004lr-N3
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiXjb-0007vh-Ea
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:09:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiXjZ-0001BH-6h
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665565740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EVxpKTNee62t5SKdMs1YcNhNJkpVpWYDm3dWA8552i8=;
 b=HZxcitbCyP5/McSi+j3gcm/b4QC8QDwcGWgNZTBSTksk6/QbEbJ8riTJ0yzzQZSr9ltMIT
 ESy22IrqLK9oVvVxO3mIaIV2yLS1Y1eHbtLoaO9bJtOkNCr7tTsPvIBSix9XjCU7CevENn
 x5iEErcFyG5vPO1lqFT1lmi1Jqh/rG4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-373-xUHcPwPUM4uPJA-y1IriEg-1; Wed, 12 Oct 2022 05:08:53 -0400
X-MC-Unique: xUHcPwPUM4uPJA-y1IriEg-1
Received: by mail-ej1-f69.google.com with SMTP id
 nb9-20020a1709071c8900b0078d858f15c1so4909235ejc.1
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 02:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EVxpKTNee62t5SKdMs1YcNhNJkpVpWYDm3dWA8552i8=;
 b=vOj0dQIrdqENLzxQDQcbBuwv/qcN2NDUrU3kUhf5xfEhAr5RKCF1yAadRpbl2+8mvE
 /FvrcSqL1BqxJkuTSBVM0VJpvb8F4gDJXgfmBWd/f+k9onkCyBOjomjIHQ5NHXgNe1gB
 tIt0YrU7bpvKw0e2aGFH3Bz4F1mQiu9N2YH3kyK7h1fZ69+TRJGPXae8IbXPEaiwz1Qe
 T2zsIbSBOuoDgOriRcti2aFWix3Yr2KyMtsFKOJaLoJMaEWhq7jgoKqY8X1bZgZ4eOtc
 1Otk687WKrmpVWYZO1aGEEgJ5hJVFjiImzzC6jwjfpH1vXBxhUptNWJUfes+I8oWw1XN
 ozpw==
X-Gm-Message-State: ACrzQf3IdBvok2wfHOEQNhOFDEP4L3c3SGOacm8yENVl0UNzc3jreYCc
 KFLM8HQICcmnrXx4AbUmc4JhTPY85n9TjDxFk96JbJLZRqrOtpYa/9PYU43xDnzcUGLUqEkZb3/
 EqRLnLRVsaal6cGGWL7gCOD/y2yUg047rKSqmob33qK67O2IJdQd/Z2iHEEBcqs4H7pY=
X-Received: by 2002:a05:6402:5510:b0:459:5ea:9bc0 with SMTP id
 fi16-20020a056402551000b0045905ea9bc0mr25617807edb.152.1665565731562; 
 Wed, 12 Oct 2022 02:08:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7EpjGjXahO9uwBu9cA4wa1qanD8XgNxvIc8s7TlFZok8R47j/Iqf+vbLm18bxG/DDGIW1Czw==
X-Received: by 2002:a05:6402:5510:b0:459:5ea:9bc0 with SMTP id
 fi16-20020a056402551000b0045905ea9bc0mr25617782edb.152.1665565731248; 
 Wed, 12 Oct 2022 02:08:51 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a50d0d0000000b00458a243df3esm10827260edf.65.2022.10.12.02.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 02:08:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] qgraph: implement stack as a linked list
Date: Wed, 12 Oct 2022 11:08:48 +0200
Message-Id: <20221012090848.359764-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqos/qgraph.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index 0a2dddfafa..ff9d389f12 100644
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
+    QOSStackElement *elem = g_new(QOSStackElement, 1);
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


