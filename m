Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BA131F0E7
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:22:39 +0100 (CET)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpos-0001YP-81
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <39souYAMKCk8u0vx55x2v.t537v3B-uvCv2454x4B.58x@flex--dje.bounces.google.com>)
 id 1lCpiY-0005Sd-N4
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:06 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:37103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <39souYAMKCk8u0vx55x2v.t537v3B-uvCv2454x4B.58x@flex--dje.bounces.google.com>)
 id 1lCpiW-0000LO-Gn
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:06 -0500
Received: by mail-pl1-x64a.google.com with SMTP id z13so1757081plo.4
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Wax/a3VaZb54CLBLZw5wXNlH+RrfzxckLggQU0wtnXE=;
 b=GpfbYNFgFpteZx7RTikcpDDNJSvveUHI7kIEws76/9EbtVXFPyGS87b4gEUPVKBVCl
 +YsLxxVXIAS6towDaYfwZPo+SWOCYcfk2/Yf9vpDzGaaDFSM+IMg3/ySzT3BE+QuBZkM
 M9eucOutbhnd66ZBwMNJ4MTO9kTI3EOiLFcn8wdCCD1OIANCcHIeiqjmKSa5/YGMHP5c
 s0RPyJp5KiUTCossjV6ft0Pve87BlHGJKYOZGcLdq5NyKBa9aPxJwWFjCS5Lj37/ZGBL
 r+iTxlXyGXxSN5QaGPq8QZuU6pNiWAqvN1cobcak7QIV5P+HsoHdkfjqMUQRFEBxKIQV
 Tuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Wax/a3VaZb54CLBLZw5wXNlH+RrfzxckLggQU0wtnXE=;
 b=HAdYpgkJdYbFNXSCkFPHoRxJRv5djHIXMQoSS63WszdcTV24xddKjRrPEWsAC8bWCv
 gzpHRsBs7MvLK+1+MtS4V/KNYrDmgkVnzyUePFyUc+2cQCMYT2FA1x2vTzKIS42qknSP
 93UgtoYZ+7T2PLOy1W+60WnR39DR85hYbLQz1Lc3D8tCmVAkE3olXb0GIQo7OSUUTM1W
 ZNq63Wv9pdwqRg58Sxid0WizUMgZHeyhVq2tlNT1W1eyj+h2GxYnqRzCoW7Nvey8rXIU
 3HXZjJitxBu49bJ4RE4zCSRYYd5TGfeZmfclUslTJciiFJHZ8TsrEx1h+tO45n9cTnBU
 CX7g==
X-Gm-Message-State: AOAM530lXfBq86PlNThvFUeswLLLKjmuDVL46SLA5j23GbH8k5a1QHym
 iHjtGD/PwS+0N0kw0H+NdTtKHzPu7F4iKN1lG3VCpvmYrfV3jShugFSuOudI6z1Fs9qkvLcXnXp
 COxD8oSKTBVJ8igjuscL9N10Pql+ZRpfK3NwWy19RPR1JgVW7/KJb
X-Google-Smtp-Source: ABdhPJz85xWvqeL2yHFaak4y+nJ/xEVkUlLvlLAoAdtoHAOEELzn1QIgkgrscr98M/mnEpIprJyJKkM=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4cc1:c5e:b49d:b16f])
 (user=dje job=sendgmr) by 2002:a63:504e:: with SMTP id
 q14mr5389608pgl.306.1613679350404; 
 Thu, 18 Feb 2021 12:15:50 -0800 (PST)
Date: Thu, 18 Feb 2021 12:15:36 -0800
In-Reply-To: <20210218201538.701509-1-dje@google.com>
Message-Id: <20210218201538.701509-3-dje@google.com>
Mime-Version: 1.0
References: <20210218201538.701509-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out of
 inet_parse
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=39souYAMKCk8u0vx55x2v.t537v3B-uvCv2454x4B.58x@flex--dje.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

The parsing is moved into new function inet_parse_host_and_port.
This is done in preparation for using the function in net/slirp.c.

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v3:
- this patch is new in v4
  - provides new utility: inet_parse_host_and_port, updates inet_parse
    to use it

 include/qemu/sockets.h |  3 ++
 util/qemu-sockets.c    | 94 +++++++++++++++++++++++++++++++-----------
 2 files changed, 72 insertions(+), 25 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f813576..f720378a6b 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
 
 int inet_ai_family_from_address(InetSocketAddress *addr,
                                 Error **errp);
+const char* inet_parse_host_and_port(const char* str, int terminator,
+                                     char **addr, char **port, bool *is_v6,
+                                     Error **errp);
 int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
 int inet_connect(const char *str, Error **errp);
 int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..9fca7d9212 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -615,44 +615,88 @@ static int inet_parse_flag(const char *flagname, const char *optstr, bool *val,
     return 0;
 }
 
-int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
+/*
+ * Parse an inet host and port as "host:port<terminator>".
+ * Terminator may be '\0'.
+ * The syntax for ipv4 addresses is: address:port.
+ * The syntax for ipv6 addresses is: [address]:port.
+ * On success, returns a pointer to the terminator. Space for the address and
+ * port is malloced and stored in *host, *port, the caller must free.
+ * *is_v6 indicates whether the address is ipv4 or ipv6. If ipv6 then the
+ * surrounding [] brackets are removed.
+ * On failure NULL is returned with the error stored in *errp.
+ */
+const char* inet_parse_host_and_port(const char* str, int terminator,
+                                     char **hostp, char **portp, bool *is_v6,
+                                     Error **errp)
 {
-    const char *optstr, *h;
+    const char *terminator_ptr = strchr(str, terminator);
+    g_autofree char *buf = NULL;
     char host[65];
     char port[33];
-    int to;
-    int pos;
-    char *begin;
 
-    memset(addr, 0, sizeof(*addr));
+    if (terminator_ptr == NULL) {
+        /* If the terminator isn't found then use the entire string. */
+        terminator_ptr = str + strlen(str);
+    }
+    buf = g_strndup(str, terminator_ptr - str);
 
-    /* parse address */
-    if (str[0] == ':') {
-        /* no host given */
-        host[0] = '\0';
-        if (sscanf(str, ":%32[^,]%n", port, &pos) != 1) {
-            error_setg(errp, "error parsing port in address '%s'", str);
-            return -1;
-        }
-    } else if (str[0] == '[') {
+    if (buf[0] == '[') {
         /* IPv6 addr */
-        if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) != 2) {
-            error_setg(errp, "error parsing IPv6 address '%s'", str);
-            return -1;
+        if (buf[1] == ']') {
+            /* sscanf %[ doesn't recognize empty contents. */
+            host[0] = '\0';
+            if (sscanf(buf, "[]:%32s", port) != 1) {
+                error_setg(errp, "error parsing IPv6 host:port '%s'", buf);
+                return NULL;
+            }
+        } else {
+            if (sscanf(buf, "[%64[^]]]:%32s", host, port) != 2) {
+                error_setg(errp, "error parsing IPv6 host:port '%s'", buf);
+                return NULL;
+            }
         }
     } else {
-        /* hostname or IPv4 addr */
-        if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) != 2) {
-            error_setg(errp, "error parsing address '%s'", str);
-            return -1;
+        if (buf[0] == ':') {
+            /* no host given */
+            host[0] = '\0';
+            if (sscanf(buf, ":%32s", port) != 1) {
+                error_setg(errp, "error parsing host:port '%s'", buf);
+                return NULL;
+            }
+        } else {
+            /* hostname or IPv4 addr */
+            if (sscanf(buf, "%64[^:]:%32s", host, port) != 2) {
+                error_setg(errp, "error parsing host:port '%s'", buf);
+                return NULL;
+            }
         }
     }
 
-    addr->host = g_strdup(host);
-    addr->port = g_strdup(port);
+    *hostp = g_strdup(host);
+    *portp = g_strdup(port);
+    *is_v6 = buf[0] == '[';
+
+    return terminator_ptr;
+}
+
+int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
+{
+    const char *optstr, *h;
+    bool is_v6;
+    int to;
+    int pos;
+    char *begin;
+
+    memset(addr, 0, sizeof(*addr));
+
+    optstr = inet_parse_host_and_port(str, ',', &addr->host, &addr->port,
+                                      &is_v6, errp);
+    if (optstr == NULL) {
+        return -1;
+    }
 
     /* parse options */
-    optstr = str + pos;
     h = strstr(optstr, ",to=");
     if (h) {
         h += 4;
-- 
2.30.0.617.g56c4b15f3c-goog


