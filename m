Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA3443E8F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:49:06 +0100 (CET)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBxB-0004GK-Ga
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBvZ-0001WQ-Se
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1miBud-0003ap-34
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635929184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tMbn646NxPo11ghluGX0Bj9WsBwth9tbkanSVUa4oF8=;
 b=ZSaTm6rv0UeTDhHuqpiIQ0sEFcceldkook8m91UKmdSHBBCCC6AIYMyBtxV8pihbWQOSV0
 FmYE/TwV74RxD3/JP0wF7/pInFi//zti72zdPpDl2/VcPfBQHMsBY/hnqKrPyvJk+PDf9v
 uEWm9LUHVRCjMomZcXPevSwEwpMhr3E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-Qv3KJ-jgMw63OpFHrtdgEg-1; Wed, 03 Nov 2021 04:46:23 -0400
X-MC-Unique: Qv3KJ-jgMw63OpFHrtdgEg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so281176wrj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 01:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tMbn646NxPo11ghluGX0Bj9WsBwth9tbkanSVUa4oF8=;
 b=KIICm2m8CgG/YHpSS1a2Zf6XGWijUtnTUyjBFKgHxhJpuIW2ycbkGfKu4H38gD0kt8
 lxf3Nl/COD2NzS3cMKf5sGYUhCpSRcB9oSfedROxzsgtMn94BYtj/TICri4NR2LWairP
 07YkIv0QseK8FclTZuoOgjw9i5oICixsttQ/Lvnozqliqo/GBTDcKf0TVJ+t04E2RtiL
 lbSXB0xYkce3e1s4evoXsmHy10Fidpu7NZUOfJOcknnnhVdVn3j7Tyguw9YuBSR4VVTO
 3uw7/TUrFoj/VhPJ6ZKz1daqUGNUHqu3kMC1VLbPq00xAcknMCvbQnykTIO9Rccvb0Yi
 8zDg==
X-Gm-Message-State: AOAM532ZZ+6gUK1qHnGxDcI0KK0LH9Mh+nVErWL1D/WBj2Xeda7VaHMS
 mf3YXkA1WMdnY3eBNbSQakUZIWlwCRVy4hshKrkxmio+JSpvWuTQ6ry1pWsVP1KU3zhBKpXVmE1
 plzF6kxJlIsGwHYBmR2/0lZrmwoV0vKIEDR0zaGvUsUZszqYnAKfC5pab3Lh/iRmiPqI=
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr13364574wmi.139.1635929182074; 
 Wed, 03 Nov 2021 01:46:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJDwELJIln/2VqytPZIWQP5cRt1jcKqKoWYVDRKNgjqVh4+clGHBYcqD/7a+tHEtIDdzh40Q==
X-Received: by 2002:a05:600c:4108:: with SMTP id
 j8mr13364544wmi.139.1635929181815; 
 Wed, 03 Nov 2021 01:46:21 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id r8sm1500987wrz.43.2021.11.03.01.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:46:21 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] Optimized the function of fill_connection_key.
Date: Wed,  3 Nov 2021 09:46:05 +0100
Message-Id: <20211103084605.20027-12-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103084605.20027-1-quintela@redhat.com>
References: <20211103084605.20027-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Juan Quintela <quintela@trasno.org>, "Rao,
 Lei" <lei.rao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Remove some unnecessary code to improve the performance of
the filter-rewriter module.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@trasno.org>
---
 net/colo.h            |  6 +++---
 net/colo-compare.c    |  2 +-
 net/colo.c            | 31 ++++++++++++-------------------
 net/filter-rewriter.c | 10 +---------
 4 files changed, 17 insertions(+), 32 deletions(-)

diff --git a/net/colo.h b/net/colo.h
index d91cd245c4..8b3e8d5a83 100644
--- a/net/colo.h
+++ b/net/colo.h
@@ -89,9 +89,9 @@ typedef struct Connection {
 uint32_t connection_key_hash(const void *opaque);
 int connection_key_equal(const void *opaque1, const void *opaque2);
 int parse_packet_early(Packet *pkt);
-void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key, Packet *pkt);
-void fill_connection_key(Packet *pkt, ConnectionKey *key);
-void reverse_connection_key(ConnectionKey *key);
+void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key,
+                         Packet *pkt, bool reverse);
+void fill_connection_key(Packet *pkt, ConnectionKey *key, bool reverse);
 Connection *connection_new(ConnectionKey *key);
 void connection_destroy(void *opaque);
 Connection *connection_get(GHashTable *connection_track_table,
diff --git a/net/colo-compare.c b/net/colo-compare.c
index 4a64a5d386..b8876d7fd9 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -264,7 +264,7 @@ static int packet_enqueue(CompareState *s, int mode, Connection **con)
         pkt = NULL;
         return -1;
     }
-    fill_connection_key(pkt, &key);
+    fill_connection_key(pkt, &key, false);
 
     conn = connection_get(s->connection_track_table,
                           &key,
diff --git a/net/colo.c b/net/colo.c
index 3a3e6e89a0..1f8162f59f 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -83,19 +83,26 @@ int parse_packet_early(Packet *pkt)
     return 0;
 }
 
-void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key, Packet *pkt)
+void extract_ip_and_port(uint32_t tmp_ports, ConnectionKey *key,
+                         Packet *pkt, bool reverse)
 {
+    if (reverse) {
+        key->src = pkt->ip->ip_dst;
+        key->dst = pkt->ip->ip_src;
+        key->src_port = ntohs(tmp_ports & 0xffff);
+        key->dst_port = ntohs(tmp_ports >> 16);
+    } else {
         key->src = pkt->ip->ip_src;
         key->dst = pkt->ip->ip_dst;
         key->src_port = ntohs(tmp_ports >> 16);
         key->dst_port = ntohs(tmp_ports & 0xffff);
+    }
 }
 
-void fill_connection_key(Packet *pkt, ConnectionKey *key)
+void fill_connection_key(Packet *pkt, ConnectionKey *key, bool reverse)
 {
-    uint32_t tmp_ports;
+    uint32_t tmp_ports = 0;
 
-    memset(key, 0, sizeof(*key));
     key->ip_proto = pkt->ip->ip_p;
 
     switch (key->ip_proto) {
@@ -106,29 +113,15 @@ void fill_connection_key(Packet *pkt, ConnectionKey *key)
     case IPPROTO_SCTP:
     case IPPROTO_UDPLITE:
         tmp_ports = *(uint32_t *)(pkt->transport_header);
-        extract_ip_and_port(tmp_ports, key, pkt);
         break;
     case IPPROTO_AH:
         tmp_ports = *(uint32_t *)(pkt->transport_header + 4);
-        extract_ip_and_port(tmp_ports, key, pkt);
         break;
     default:
         break;
     }
-}
 
-void reverse_connection_key(ConnectionKey *key)
-{
-    struct in_addr tmp_ip;
-    uint16_t tmp_port;
-
-    tmp_ip = key->src;
-    key->src = key->dst;
-    key->dst = tmp_ip;
-
-    tmp_port = key->src_port;
-    key->src_port = key->dst_port;
-    key->dst_port = tmp_port;
+    extract_ip_and_port(tmp_ports, key, pkt, reverse);
 }
 
 Connection *connection_new(ConnectionKey *key)
diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
index cb3a96cde1..bf05023dc3 100644
--- a/net/filter-rewriter.c
+++ b/net/filter-rewriter.c
@@ -279,15 +279,7 @@ static ssize_t colo_rewriter_receive_iov(NetFilterState *nf,
      */
     if (pkt && is_tcp_packet(pkt)) {
 
-        fill_connection_key(pkt, &key);
-
-        if (sender == nf->netdev) {
-            /*
-             * We need make tcp TX and RX packet
-             * into one connection.
-             */
-            reverse_connection_key(&key);
-        }
+        fill_connection_key(pkt, &key, sender == nf->netdev);
 
         /* After failover we needn't change new TCP packet */
         if (s->failover_mode &&
-- 
2.33.1


