Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA8360095
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 05:42:31 +0200 (CEST)
Received: from localhost ([::1]:53284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWsti-0001l8-UW
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 23:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3j7V3YAMKCuIHNIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--dje.bounces.google.com>)
 id 1lWsrL-0000LI-IA
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:40:03 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:35341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3j7V3YAMKCuIHNIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--dje.bounces.google.com>)
 id 1lWsrJ-0004lD-LX
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:40:03 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 t17-20020a056a001391b02902472d81c024so2040767pfg.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 20:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=BF27c8tCK2QEDJ0jFvx+k383ni9FkfA0jQaGoYxDeIY=;
 b=clFPWOHNKhujnFRdU/t+88+NgMso048nAD1SlNs0WfA7HJCvWKjZu97tbXwf/UvL2G
 wc7K8HxM9meW2D4aF5qEFKQBowSkTrTv+IIh2W6sZhtsVQlCeK6NXNLf9DEoObdqffdc
 DaPXziTJyG6upTP22bjvVMCC+BL8+i7aeW1Ui+yFq/E1qbwkmOsBels3BeDVQoA8hXgE
 QJ+k2b5MO5FFXLCeDl2N4mFnGH6yqIogfWl29VxTyyStz06fki1OVKvGObFk6uf7ttx1
 F5qRGSp8qPfrw+OVoLmxK4MUW7jdM1bydrf+fLnrdsl7XUEhsJX1z/Cy9z3A4+azVQlP
 CC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BF27c8tCK2QEDJ0jFvx+k383ni9FkfA0jQaGoYxDeIY=;
 b=J948d5Bn5Ky4Khu0mjLfSBVTZaQ+Kn74mZ8MY5CRAQuW/RRITWPO09c7po7aFu+wkl
 ZmdMEgAqdCW1RyVhlBCyzy/VNR5IH4kiuDsbqG9M4Vr+dga8lFu4nmC9h0AZn57c6SNx
 h6dtORc5T3iPoPir3s9cN6hi7HC7VAjXLxMshIs7vVqHxdBrErEEcLUMU9rLc2MO1SiG
 4yXMgshfaMWHWeSJxNjHikjZ5X6dlFc1xUGbLSW2Hqx4N+xs6B/ws+Hl4RPIw+6lCl/g
 qe8Pu+VYSj8ykcZhkDreXxXz/0Gdx+N09eHuw3dZ8Q6ZkLFhTpXId5lZ5YOkxKvcvndQ
 qHLA==
X-Gm-Message-State: AOAM533vCR5lkt3WijaeuCGhPXsZOABzqjOycwoi6UNav1x5Ro7Aj+og
 uH2QwyjmGLZDolhp4lC2J3+xvUbS7/hhV9dPyaolvGPjqyZqXGYtLA0pAnf9JlKyyvdE+AKG0U8
 AxJUaquX9OGrgqULXI5lGdmQyuJksNu7uaMb/MYczVidXOx05/FI4
X-Google-Smtp-Source: ABdhPJyWiKzY49vGSFhN7KgtC9KEkqD9stqrp38G/uFr5LyejhAI+MucLs1OLQih9+dPiepoeZ7FKmk=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:83d5:e012:e680:1449])
 (user=dje job=sendgmr) by 2002:a63:5807:: with SMTP id
 m7mr1535438pgb.73.1618457999316; 
 Wed, 14 Apr 2021 20:39:59 -0700 (PDT)
Date: Wed, 14 Apr 2021 20:39:23 -0700
In-Reply-To: <20210415033925.1290401-1-dje@google.com>
Message-Id: <20210415033925.1290401-3-dje@google.com>
Mime-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v6 2/4] util/qemu-sockets.c: Split host:port parsing out of
 inet_parse
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3j7V3YAMKCuIHNIKSSKPI.GSQUIQY-HIZIPRSRKRY.SVK@flex--dje.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The parsing is moved into new function inet_parse_host_port.
Also split out is ipv4=flag, ipv6=flag processing into inet_parse_ipv46.
This is done in preparation for using these functions in net/slirp.c.

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v5:

Also split out parsing of ipv4=on|off, ipv6=on|off

 include/qemu/sockets.h |  3 ++
 util/qemu-sockets.c    | 65 +++++++++++++++++++++++++++++-------------
 2 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f813576..94f4e8de83 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
 
 int inet_ai_family_from_address(InetSocketAddress *addr,
                                 Error **errp);
+const char *inet_parse_host_port(InetSocketAddress *addr,
+                                 const char *str, Error **errp);
+int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error **errp);
 int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
 int inet_connect(const char *str, Error **errp);
 int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..c0069f2565 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -615,14 +615,12 @@ static int inet_parse_flag(const char *flagname, const char *optstr, bool *val,
     return 0;
 }
 
-int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
+const char *inet_parse_host_port(InetSocketAddress *addr, const char *str,
+                                 Error **errp)
 {
-    const char *optstr, *h;
     char host[65];
     char port[33];
-    int to;
     int pos;
-    char *begin;
 
     memset(addr, 0, sizeof(*addr));
 
@@ -632,38 +630,32 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
         host[0] = '\0';
         if (sscanf(str, ":%32[^,]%n", port, &pos) != 1) {
             error_setg(errp, "error parsing port in address '%s'", str);
-            return -1;
+            return NULL;
         }
     } else if (str[0] == '[') {
         /* IPv6 addr */
         if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) != 2) {
             error_setg(errp, "error parsing IPv6 address '%s'", str);
-            return -1;
+            return NULL;
         }
     } else {
         /* hostname or IPv4 addr */
         if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) != 2) {
             error_setg(errp, "error parsing address '%s'", str);
-            return -1;
+            return NULL;
         }
     }
 
     addr->host = g_strdup(host);
     addr->port = g_strdup(port);
 
-    /* parse options */
-    optstr = str + pos;
-    h = strstr(optstr, ",to=");
-    if (h) {
-        h += 4;
-        if (sscanf(h, "%d%n", &to, &pos) != 1 ||
-            (h[pos] != '\0' && h[pos] != ',')) {
-            error_setg(errp, "error parsing to= argument");
-            return -1;
-        }
-        addr->has_to = true;
-        addr->to = to;
-    }
+    return str + pos;
+}
+
+int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error **errp)
+{
+    char *begin;
+
     begin = strstr(optstr, ",ipv4");
     if (begin) {
         if (inet_parse_flag("ipv4", begin + 5, &addr->ipv4, errp) < 0) {
@@ -678,6 +670,39 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
         }
         addr->has_ipv6 = true;
     }
+
+    return 0;
+}
+
+int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
+{
+    const char *optstr, *h;
+    int to;
+    int pos;
+    char *begin;
+
+    optstr = inet_parse_host_port(addr, str, errp);
+    if (optstr == NULL) {
+        return -1;
+    }
+
+    /* parse options */
+
+    if (inet_parse_ipv46(addr, optstr, errp) < 0) {
+        return -1;
+    }
+
+    h = strstr(optstr, ",to=");
+    if (h) {
+        h += 4;
+        if (sscanf(h, "%d%n", &to, &pos) != 1 ||
+            (h[pos] != '\0' && h[pos] != ',')) {
+            error_setg(errp, "error parsing to= argument");
+            return -1;
+        }
+        addr->has_to = true;
+        addr->to = to;
+    }
     begin = strstr(optstr, ",keep-alive");
     if (begin) {
         if (inet_parse_flag("keep-alive", begin + strlen(",keep-alive"),
-- 
2.31.1.295.g9ea45b61b8-goog


