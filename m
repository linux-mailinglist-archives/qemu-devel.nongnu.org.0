Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074E932022E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:23:10 +0100 (CET)
Received: from localhost ([::1]:57094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG3B-0004pU-2M
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KlQwYAMKCps8E9BJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--dje.bounces.google.com>)
 id 1lDFtu-0000WJ-8q
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:34 -0500
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949]:53014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KlQwYAMKCps8E9BJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--dje.bounces.google.com>)
 id 1lDFts-0005RD-A4
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:34 -0500
Received: by mail-ua1-x949.google.com with SMTP id e15so3269758ual.19
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 16:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=GcAFtjhbn9QPq1uf+qCU9C7hm0q4Mf37g1dQhxyj2vo=;
 b=En5Yv9sgOBuU73z1U6B9Em3AWKyTYTNIVxc0Fs6oZYK6kVs517LU8WBGDCawAewGED
 +N16s8KtHz3FLsoV+BIPuzGdH8TImI1XrGr0LWVVNB47bUzl/mmZrJFrF/V3/ZkEMU0W
 FzmLONNxtX6ZQqU5Q5LWx1oWqzDE8GM6lHngkkxwbpHxm0v3ya9ZQZu3KhBsBm+3RC6U
 2njUp6tegpqoNc19CSs83B2bLv44Ka9GKaa0uRpXmL1Tl7AdUU7SWzuXr3AgdQBnb4td
 HlIpKgDpSlFf1fIKHDinMXQqqURU4AMVPfZoaOQn6N5jLUiEZK4YJfJTKBIHRNJJxs17
 lhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GcAFtjhbn9QPq1uf+qCU9C7hm0q4Mf37g1dQhxyj2vo=;
 b=aw+h6b1/k3Z5XRrRUvXAv3bYwzyKIJLvV+i1kySXjtVLvEjh5zisEbKdE1xrLDuUxE
 0Y9SjcECO4bPE8L5gxRWwonv9L4874tmjIugpTWsKuU9mUb70qN8ImI278jHrnlipNcq
 L89GrzW7zt5e6R8XgoVUKgvuh83zQjOxpk7hn2vXN0hOZ6JFUx/Yflg8U65VN82VzbFW
 kvh5JXhLkp6Wz+rWAHQFtTWAIgVaomnxjis/WN6gPktACuGkzl4XuD5uRi+/eEVItEDS
 duSAeDH3g/ga6LLKv6h2zH+eJ9lHk1jG5B80L3mLYJB+FrsHfbeG5NhGxxKBKHRYWjji
 yuRg==
X-Gm-Message-State: AOAM533+1wCWd253O+wZSyf8SCS339O8Jzk3qcaEHPMi/Utk/gJfF0s6
 ea8iB9QF6kvNnW7Vop5CTodfb2ClhBmb3aNelTMd1e7NxhIOadn6uX48nooRH4dxKupf5nfAvCw
 CYxn2rQXa0g3RHm8qmUqlE3DPQph7MRdHOdxV8qBuICHNw/WHP9kd
X-Google-Smtp-Source: ABdhPJwSNPJEN9ZAN2wQ25YqmoY6k5SWFJaRYo4H2CDMrRWLDHJ9JSaLSKsgTqig8ltIdiUV1GQwTdo=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:7d06:9b98:ec95:3f70])
 (user=dje job=sendgmr) by 2002:a67:2b84:: with SMTP id
 r126mr8456242vsr.14.1613780010521; 
 Fri, 19 Feb 2021 16:13:30 -0800 (PST)
Date: Fri, 19 Feb 2021 16:13:19 -0800
In-Reply-To: <20210220001322.1311139-1-dje@google.com>
Message-Id: <20210220001322.1311139-3-dje@google.com>
Mime-Version: 1.0
References: <20210220001322.1311139-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v5 2/5] util/qemu-sockets.c: Split host:port parsing out of
 inet_parse
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3KlQwYAMKCps8E9BJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--dje.bounces.google.com;
 helo=mail-ua1-x949.google.com
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

Changes from v4:
- move recognition of "[]:port" to separate patch
- allow passing NULL for ip_v6
- fix some formatting issues

Changes from v3:
- this patch is new in v4
  - provides new utility: inet_parse_host_and_port, updates inet_parse
    to use it

 include/qemu/sockets.h |  3 ++
 util/qemu-sockets.c    | 80 +++++++++++++++++++++++++++++++-----------
 2 files changed, 62 insertions(+), 21 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f813576..b1448cfa24 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
 
 int inet_ai_family_from_address(InetSocketAddress *addr,
                                 Error **errp);
+const char *inet_parse_host_and_port(const char *str, int terminator,
+                                     char **hostp, char **portp, bool *is_v6,
+                                     Error **errp);
 int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
 int inet_connect(const char *str, Error **errp);
 int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..3ca6a6fb3d 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -615,44 +615,82 @@ static int inet_parse_flag(const char *flagname, const char *optstr, bool *val,
     return 0;
 }
 
-int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
+/*
+ * Parse an inet host and port as "host:port<terminator>".
+ * Terminator may be '\0'.
+ * The syntax for IPv4 addresses is: address:port. "address" is optional,
+ * and may be empty (i.e., str is ":port").
+ * The syntax for IPv6 addresses is: [address]:port. Upon return the wrapping
+ * [] brackets are removed.
+ * Host names are also supported as hostname:port. It is up to the caller to
+ * distinguish host names from numeric IPv4 addresses.
+ * On success, returns a pointer to the terminator. Space for the address and
+ * port is malloced and stored in *host, *port, the caller must free.
+ * If is_v6 is non-NULL, then it is set to true if the address is an IPv6
+ * address (i.e., [address]), otherwise it is set to false.
+ * On failure NULL is returned with the error stored in *errp.
+ */
+const char *inet_parse_host_and_port(const char *str, int terminator,
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
+    if (buf[0] == ':') {
         /* no host given */
         host[0] = '\0';
-        if (sscanf(str, ":%32[^,]%n", port, &pos) != 1) {
-            error_setg(errp, "error parsing port in address '%s'", str);
-            return -1;
+        if (sscanf(buf, ":%32s", port) != 1) {
+            error_setg(errp, "error parsing port in address '%s'", buf);
+            return NULL;
         }
-    } else if (str[0] == '[') {
+    } else if (buf[0] == '[') {
         /* IPv6 addr */
-        if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) != 2) {
-            error_setg(errp, "error parsing IPv6 address '%s'", str);
-            return -1;
+        if (sscanf(buf, "[%64[^]]]:%32s", host, port) != 2) {
+            error_setg(errp, "error parsing IPv6 address '%s'", buf);
+            return NULL;
         }
     } else {
         /* hostname or IPv4 addr */
-        if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) != 2) {
-            error_setg(errp, "error parsing address '%s'", str);
-            return -1;
+        if (sscanf(buf, "%64[^:]:%32s", host, port) != 2) {
+            error_setg(errp, "error parsing address '%s'", buf);
+            return NULL;
         }
     }
 
-    addr->host = g_strdup(host);
-    addr->port = g_strdup(port);
+    *hostp = g_strdup(host);
+    *portp = g_strdup(port);
+    if (is_v6 != NULL) {
+        *is_v6 = buf[0] == '[';
+    }
+
+    return terminator_ptr;
+}
+
+int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
+{
+    const char *optstr, *h;
+    int to;
+    int pos;
+    char *begin;
+
+    memset(addr, 0, sizeof(*addr));
+
+    optstr = inet_parse_host_and_port(str, ',', &addr->host, &addr->port,
+                                      NULL, errp);
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


