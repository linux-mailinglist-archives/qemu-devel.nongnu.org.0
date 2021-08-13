Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CD73EBED9
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:46:49 +0200 (CEST)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgsy-0005O8-Et
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33gMXYQMKClEw2xz77z4x.v759x5D-wxEx4676z6D.7Az@flex--dje.bounces.google.com>)
 id 1mEgqn-0003FP-VK
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:44:33 -0400
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:35578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33gMXYQMKClEw2xz77z4x.v759x5D-wxEx4676z6D.7Az@flex--dje.bounces.google.com>)
 id 1mEgqm-0003kx-DC
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:44:33 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id
 t3-20020a0cf9830000b0290359840930bdso4909740qvn.2
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=QslOfOKGscIgx3K5boBWQYg/0chahCptrQjLmfipCMg=;
 b=n2GRCYvJFG5W3FCeCNKQCMkO+BolD7kaByFO8Eip0lZsfAV6T1+mYneyXTASf6iiXI
 6ekv+FQ7HK3G5TgkZiPsEd0vU3hVcAcePUhaOuwtuErUOeX7CBOrONJD9ERjEJuXH6jB
 EqJ76f5f8UkKQnIhg4Madtcy8T9up+QuTTJ2MOQI2e/J9vwJvCz2MaPQmVLW7iSqw2OJ
 ewAiMqmyjRkLTuzIanIhtqWgULEtB033F3SbZsvVuxPkBCZA3VJHKxKD/Xy3jpqNUS1q
 S2+7uVAvV6Beos94titq0zrZEOBVINUmP14Mn0j1hB1WP+AIuSFKthU6Wgn/0l5WyQ+4
 vJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=QslOfOKGscIgx3K5boBWQYg/0chahCptrQjLmfipCMg=;
 b=LB1mRGIrRChGmMuOVGwMqu6+V93L6gyrqwAPq2GG/3bdatwBiBLCes9OGVn/lyGiyz
 h/t5Mjz5xTjhuyESqLjuxNXZsEgteuHIFhCBc/Glk/aDRxB6OVr+6YCWpp9KJZHyLpNV
 3n+tBIrhTCp24EjMd5Lph8dhr4k8C1Fvh06GxdXcExnCcQ7ovNnaQFo4KD1hakRCyrew
 EADszj5+Ly25qLzGWgQaBDcH0/J0LHa3dXEk+WCqmTvVwvGDtxLWTokUzOIHvdGssmik
 P2Ieit1qwjv4NE4P+LLUjb1PvPZLkNcPJHvPl/R31VGusP+P27BxEa+Cq8w//a0Qwd76
 TxuA==
X-Gm-Message-State: AOAM532MazeQkAisYyw24YAtoD9MGdfVU11jmrjx2xR5Ldgz7fUMjjk9
 zjfMv2MtruZH0gmalaQH1WZMU4rug6jp3qMVIJ/TAUDYTYpMwWn4A6UF8YpjSIP2lgdP0LiLC2L
 7N0IVrOMyMvrhjrUxrAwrdtWcz7WZhKm9P25Eq5UJnkbTIT6+nK3o
X-Google-Smtp-Source: ABdhPJwfkMAt3tasYkozIxtcssmae32BzONHVnHRnzQ0rh+TF0YEgu9+vpxaUHLjkBISCgK/tIsHf/Q=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:94ae:6a1e:bc04:4f63])
 (user=dje job=sendgmr) by 2002:a0c:e885:: with SMTP id
 b5mr5164588qvo.48.1628898270663; 
 Fri, 13 Aug 2021 16:44:30 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:44:22 -0700
In-Reply-To: <20210813234424.2029019-1-dje@google.com>
Message-Id: <20210813234424.2029019-2-dje@google.com>
Mime-Version: 1.0
References: <20210813234424.2029019-1-dje@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH v8 1/3] util/qemu-sockets.c: Split host:port parsing out of
 inet_parse
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@redhat.com>,
 Doug Evans <dje@google.com>, 
 "=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=" <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=33gMXYQMKClEw2xz77z4x.v759x5D-wxEx4676z6D.7Az@flex--dje.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
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
Also split out is ipv4=3Dflag, ipv6=3Dflag processing into inet_parse_ipv46=
.
This is done in preparation for using these functions in net/slirp.c.

Signed-off-by: Doug Evans <dje@google.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---

Changes from v7:

No changes.

Changes from v6:

No changes.

Changes from v5:

Also split out parsing of ipv4=3Don|off, ipv6=3Don|off

 include/qemu/sockets.h |  3 ++
 util/qemu-sockets.c    | 65 +++++++++++++++++++++++++++++-------------
 2 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 0c34bf2398..7b2d06ff6e 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
=20
 int inet_ai_family_from_address(InetSocketAddress *addr,
                                 Error **errp);
+const char *inet_parse_host_port(InetSocketAddress *addr,
+                                 const char *str, Error **errp);
+int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error **=
errp);
 int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
 int inet_connect(const char *str, Error **errp);
 int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index f2f3676d1f..085b057c18 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -627,14 +627,12 @@ static int inet_parse_flag(const char *flagname, cons=
t char *optstr, bool *val,
     return 0;
 }
=20
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
=20
     memset(addr, 0, sizeof(*addr));
=20
@@ -644,38 +642,32 @@ int inet_parse(InetSocketAddress *addr, const char *s=
tr, Error **errp)
         host[0] =3D '\0';
         if (sscanf(str, ":%32[^,]%n", port, &pos) !=3D 1) {
             error_setg(errp, "error parsing port in address '%s'", str);
-            return -1;
+            return NULL;
         }
     } else if (str[0] =3D=3D '[') {
         /* IPv6 addr */
         if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) !=3D 2) {
             error_setg(errp, "error parsing IPv6 address '%s'", str);
-            return -1;
+            return NULL;
         }
     } else {
         /* hostname or IPv4 addr */
         if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) !=3D 2) {
             error_setg(errp, "error parsing address '%s'", str);
-            return -1;
+            return NULL;
         }
     }
=20
     addr->host =3D g_strdup(host);
     addr->port =3D g_strdup(port);
=20
-    /* parse options */
-    optstr =3D str + pos;
-    h =3D strstr(optstr, ",to=3D");
-    if (h) {
-        h +=3D 4;
-        if (sscanf(h, "%d%n", &to, &pos) !=3D 1 ||
-            (h[pos] !=3D '\0' && h[pos] !=3D ',')) {
-            error_setg(errp, "error parsing to=3D argument");
-            return -1;
-        }
-        addr->has_to =3D true;
-        addr->to =3D to;
-    }
+    return str + pos;
+}
+
+int inet_parse_ipv46(InetSocketAddress *addr, const char *optstr, Error **=
errp)
+{
+    char *begin;
+
     begin =3D strstr(optstr, ",ipv4");
     if (begin) {
         if (inet_parse_flag("ipv4", begin + 5, &addr->ipv4, errp) < 0) {
@@ -690,6 +682,39 @@ int inet_parse(InetSocketAddress *addr, const char *st=
r, Error **errp)
         }
         addr->has_ipv6 =3D true;
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
+    optstr =3D inet_parse_host_port(addr, str, errp);
+    if (optstr =3D=3D NULL) {
+        return -1;
+    }
+
+    /* parse options */
+
+    if (inet_parse_ipv46(addr, optstr, errp) < 0) {
+        return -1;
+    }
+
+    h =3D strstr(optstr, ",to=3D");
+    if (h) {
+        h +=3D 4;
+        if (sscanf(h, "%d%n", &to, &pos) !=3D 1 ||
+            (h[pos] !=3D '\0' && h[pos] !=3D ',')) {
+            error_setg(errp, "error parsing to=3D argument");
+            return -1;
+        }
+        addr->has_to =3D true;
+        addr->to =3D to;
+    }
     begin =3D strstr(optstr, ",keep-alive");
     if (begin) {
         if (inet_parse_flag("keep-alive", begin + strlen(",keep-alive"),
--=20
2.33.0.rc1.237.g0d66db33f3-goog


