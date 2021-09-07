Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B424028AE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:23:01 +0200 (CEST)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNa7w-0000i4-KK
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5X-0006Gr-BD
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5V-00069X-BF
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rj2SE8GC0mje5TItuVOFNMgeakkP23rxuKjkravVaug=;
 b=DClCnkf9pjG2CO4qbOeFhm9nS8ZK7BR0ZqO0OIcVYBzsLTk3FGftZnW6b1vqCSo1c0BuZ5
 p39nZAKA5cj+ovZu5Flp3el1DB3iohWSduD1BMC/DZKpN2jAOd06ig/KPq94Ieg4mGzXI3
 YcIdmPqNG856x68YMPAxn1eUz3UFn4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507--QtS-5rCOq6yeAwa03nycA-1; Tue, 07 Sep 2021 08:20:23 -0400
X-MC-Unique: -QtS-5rCOq6yeAwa03nycA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE052102CB7D
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:20:22 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1536B5D9F0;
 Tue,  7 Sep 2021 12:20:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 02/32] build-sys: add HAVE_IPPROTO_MPTCP
Date: Tue,  7 Sep 2021 16:19:13 +0400
Message-Id: <20210907121943.3498701-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The QAPI schema shouldn't rely on C system headers #define, but on
configure-time project #define, so we can express the build condition in
a C-independent way.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build         | 2 ++
 qapi/sockets.json   | 2 +-
 io/dns-resolver.c   | 2 +-
 util/qemu-sockets.c | 6 +++---
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 9e43c9b311..6e871af4d0 100644
--- a/meson.build
+++ b/meson.build
@@ -1367,6 +1367,8 @@ config_host_data.set('HAVE_OPTRESET',
                      cc.has_header_symbol('getopt.h', 'optreset'))
 config_host_data.set('HAVE_UTMPX',
                      cc.has_header_symbol('utmpx.h', 'struct utmpx'))
+config_host_data.set('HAVE_IPPROTO_MPTCP',
+                     cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
 
 # has_member
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
diff --git a/qapi/sockets.json b/qapi/sockets.json
index 7866dc27d6..c9101f937f 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -69,7 +69,7 @@
     '*ipv4': 'bool',
     '*ipv6': 'bool',
     '*keep-alive': 'bool',
-    '*mptcp': { 'type': 'bool', 'if': 'IPPROTO_MPTCP' } } }
+    '*mptcp': { 'type': 'bool', 'if': 'HAVE_IPPROTO_MPTCP' } } }
 
 ##
 # @UnixSocketAddress:
diff --git a/io/dns-resolver.c b/io/dns-resolver.c
index a5946a93bf..53b0e8407a 100644
--- a/io/dns-resolver.c
+++ b/io/dns-resolver.c
@@ -122,7 +122,7 @@ static int qio_dns_resolver_lookup_sync_inet(QIODNSResolver *resolver,
             .ipv4 = iaddr->ipv4,
             .has_ipv6 = iaddr->has_ipv6,
             .ipv6 = iaddr->ipv6,
-#ifdef IPPROTO_MPTCP
+#ifdef HAVE_IPPROTO_MPTCP
             .has_mptcp = iaddr->has_mptcp,
             .mptcp = iaddr->mptcp,
 #endif
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index f2f3676d1f..02eb2f3d34 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -278,7 +278,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
 
     /* create socket + bind/listen */
     for (e = res; e != NULL; e = e->ai_next) {
-#ifdef IPPROTO_MPTCP
+#ifdef HAVE_IPPROTO_MPTCP
         if (saddr->has_mptcp && saddr->mptcp) {
             e->ai_protocol = IPPROTO_MPTCP;
         }
@@ -462,7 +462,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
         error_free(local_err);
         local_err = NULL;
 
-#ifdef IPPROTO_MPTCP
+#ifdef HAVE_IPPROTO_MPTCP
         if (saddr->has_mptcp && saddr->mptcp) {
             e->ai_protocol = IPPROTO_MPTCP;
         }
@@ -699,7 +699,7 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
         }
         addr->has_keep_alive = true;
     }
-#ifdef IPPROTO_MPTCP
+#ifdef HAVE_IPPROTO_MPTCP
     begin = strstr(optstr, ",mptcp");
     if (begin) {
         if (inet_parse_flag("mptcp", begin + strlen(",mptcp"),
-- 
2.33.0.113.g6c40894d24


