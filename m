Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764EB25B6C9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 00:57:28 +0200 (CEST)
Received: from localhost ([::1]:50610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbh1-0004U6-E5
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 18:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbVD-0004aj-2a
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbVA-00005E-Ee
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPetTMzLYz11r/Erv8tLpBN2X3ShMJWpUMu9gtOoBQg=;
 b=TVyGuQ4OKc7bnNi6Ee0tptQQVytbiabZfvlIIu0C5/NBy8Vm3jPSnIXovBKgJEduGs/ie4
 mQcL1qQ9qp4wPL6hBPKMzltrJSO6lqakfacEkZdvn/E6cJC7qGmOIyn0bvakdKF/orlKbg
 dg966WjcCg94WUDR2akYaszUpin/lIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-NZ2JxzKuOse_0AGzn29J7Q-1; Wed, 02 Sep 2020 18:45:10 -0400
X-MC-Unique: NZ2JxzKuOse_0AGzn29J7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9FA51005E66;
 Wed,  2 Sep 2020 22:45:08 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9FBD1C4;
 Wed,  2 Sep 2020 22:45:03 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 40/63] filter-rewriter: Rename FILTER_COLO_REWRITER to
 FILTER_REWRITER
Date: Wed,  2 Sep 2020 18:42:48 -0400
Message-Id: <20200902224311.1321159-41-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 berrange@redhat.com, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the type checking macro name consistent with the TYPE_*
constant.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Zhang Chen <chen.zhang@intel.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
---
 net/filter-rewriter.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index 113e293207..44f6021dd8 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -25,7 +25,7 @@
 
 #define TYPE_FILTER_REWRITER "filter-rewriter"
 typedef struct RewriterState RewriterState;
-DECLARE_INSTANCE_CHECKER(RewriterState, FILTER_COLO_REWRITER,
+DECLARE_INSTANCE_CHECKER(RewriterState, FILTER_REWRITER,
                          TYPE_FILTER_REWRITER)
 
 #define FAILOVER_MODE_ON  true
@@ -47,7 +47,7 @@ static void filter_rewriter_failover_mode(RewriterState *s)
 
 static void filter_rewriter_flush(NetFilterState *nf)
 {
-    RewriterState *s = FILTER_COLO_REWRITER(nf);
+    RewriterState *s = FILTER_REWRITER(nf);
 
     if (!qemu_net_queue_flush(s->incoming_queue)) {
         /* Unable to empty the queue, purge remaining packets */
@@ -252,7 +252,7 @@ static ssize_t colo_rewriter_receive_iov(NetFilterState *nf,
                                          int iovcnt,
                                          NetPacketSent *sent_cb)
 {
-    RewriterState *s = FILTER_COLO_REWRITER(nf);
+    RewriterState *s = FILTER_REWRITER(nf);
     Connection *conn;
     ConnectionKey key;
     Packet *pkt;
@@ -350,7 +350,7 @@ static gboolean offset_is_nonzero(gpointer key,
 static void colo_rewriter_handle_event(NetFilterState *nf, int event,
                                        Error **errp)
 {
-    RewriterState *rs = FILTER_COLO_REWRITER(nf);
+    RewriterState *rs = FILTER_REWRITER(nf);
 
     switch (event) {
     case COLO_EVENT_CHECKPOINT:
@@ -370,7 +370,7 @@ static void colo_rewriter_handle_event(NetFilterState *nf, int event,
 
 static void colo_rewriter_cleanup(NetFilterState *nf)
 {
-    RewriterState *s = FILTER_COLO_REWRITER(nf);
+    RewriterState *s = FILTER_REWRITER(nf);
 
     /* flush packets */
     if (s->incoming_queue) {
@@ -381,7 +381,7 @@ static void colo_rewriter_cleanup(NetFilterState *nf)
 
 static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
 {
-    RewriterState *s = FILTER_COLO_REWRITER(nf);
+    RewriterState *s = FILTER_REWRITER(nf);
 
     s->connection_track_table = g_hash_table_new_full(connection_key_hash,
                                                       connection_key_equal,
@@ -392,7 +392,7 @@ static void colo_rewriter_setup(NetFilterState *nf, Error **errp)
 
 static bool filter_rewriter_get_vnet_hdr(Object *obj, Error **errp)
 {
-    RewriterState *s = FILTER_COLO_REWRITER(obj);
+    RewriterState *s = FILTER_REWRITER(obj);
 
     return s->vnet_hdr;
 }
@@ -401,14 +401,14 @@ static void filter_rewriter_set_vnet_hdr(Object *obj,
                                          bool value,
                                          Error **errp)
 {
-    RewriterState *s = FILTER_COLO_REWRITER(obj);
+    RewriterState *s = FILTER_REWRITER(obj);
 
     s->vnet_hdr = value;
 }
 
 static void filter_rewriter_init(Object *obj)
 {
-    RewriterState *s = FILTER_COLO_REWRITER(obj);
+    RewriterState *s = FILTER_REWRITER(obj);
 
     s->vnet_hdr = false;
     s->failover_mode = FAILOVER_MODE_OFF;
-- 
2.26.2


