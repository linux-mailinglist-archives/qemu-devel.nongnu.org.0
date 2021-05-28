Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4260394963
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 01:56:00 +0200 (CEST)
Received: from localhost ([::1]:47802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmmKd-0001A4-U3
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 19:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3iYKxYAMKCmABHCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--dje.bounces.google.com>)
 id 1lmmIZ-0006pt-4k
 for qemu-devel@nongnu.org; Fri, 28 May 2021 19:53:51 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:55255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3iYKxYAMKCmABHCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--dje.bounces.google.com>)
 id 1lmmIV-0007cG-72
 for qemu-devel@nongnu.org; Fri, 28 May 2021 19:53:50 -0400
Received: by mail-qv1-xf49.google.com with SMTP id
 b5-20020a0cc9850000b02901eece87073bso3747425qvk.21
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 16:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=g75G9nzfdsGcprDSWEEutXj8kTbcMPgEVXd8OwbePoQ=;
 b=ulAAxh3OwcXWqWrznAFby8kPZQDL4q/EEQUJEHgR8QgFazMMmzzut61iFQZbNbomFW
 rbOafvTBQsyzYkYR7Oa4lgxC91vhikP4BKpDvlXkdxdYJP9OoiNEaNqfHR++AkXsTfvn
 jDdPFa86MmTifnrwFER1IEyiQtAhDV/I0C9MKk3QdsAKX4dZoDrzTDWdeMfR118wnuHM
 MeURIelDoOOP4QR6ZyTW6gSvp+KWiI5UKHzQ71wB8UbOuibwBRZxI2ftlVKLHmnx0mYK
 HhxbqBhwbhjQ2wfKwIi/x105+pvQkHOrhWP2y5anbmk9BpcwLr+5xEXV5AL8NovIU2/u
 rfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=g75G9nzfdsGcprDSWEEutXj8kTbcMPgEVXd8OwbePoQ=;
 b=hLHoovQRoHqZS15GUqaAa+FaYxPJ0NPVME10biIx9Ppgo5gLDcAFU+n/lNjqs6z1VC
 eyqiMkPtbmyr25N46Osr0iEM0NVhfHvDAYGy/rjRFb4FzQ8Ue4X1LrT1aBw52wNdshky
 FlKc9u2DFLHz1skBJ05QLwlvb8Ef3/4hqdT3YzTeT/VqLHEBCypt+SSn8hje3BEl3ctR
 lQnDyGBHB42ZPRU/4X4WGTG59b2tOZzq4riEq1xWmxq8Tg+a/wQktGjhknmedxUKTtfw
 cBMgnTstUBqNBKvMeLqmoqq4AMx+2B+uc6lSyZu2BKj1yOlBiZoiWLMFOMuefEcNT1RU
 a1VA==
X-Gm-Message-State: AOAM531r1h8ox1BX6oDoUP5Kv1vK8V9hKHtrxnx0zdbjwbaMgqFwQXda
 LGRtUhvDDSHN7h/FzVI2R1F8avAiJxMN7uwEDiGGnbou+m4JxoJ92L86DX6RjH9c4mPYM1cU4J5
 vrND+IbC1IiRSJWsf0m7zywpdEdAsI4j0DTIzpC6jiLrbqN4dU4yb
X-Google-Smtp-Source: ABdhPJxCi4dvhwawlVQOkaWJoIGlOXXngK0+27uV61GkjkXiTjRkBfA4UYL0HBAL8AglNmuHri2uosA=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:da9a:e3bd:2fe6:1f1b])
 (user=dje job=sendgmr) by 2002:a0c:c481:: with SMTP id
 u1mr6541487qvi.48.1622246025092; 
 Fri, 28 May 2021 16:53:45 -0700 (PDT)
Date: Fri, 28 May 2021 16:53:29 -0700
In-Reply-To: <20210528235331.3727583-1-dje@google.com>
Message-Id: <20210528235331.3727583-3-dje@google.com>
Mime-Version: 1.0
References: <20210528235331.3727583-1-dje@google.com>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH v7 2/4] util/qemu-sockets.c: Split host:port parsing out of
 inet_parse
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>, 
 "=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=" <marcandre.lureau@redhat.com>,
 Maxim Samoylov <max7255@yandex-team.ru>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3iYKxYAMKCmABHCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--dje.bounces.google.com;
 helo=mail-qv1-xf49.google.com
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

Changes from v6:

No changes.

Changes from v5:

Also split out parsing of ipv4=3Don|off, ipv6=3Don|off

 include/qemu/sockets.h |  3 ++
 util/qemu-sockets.c    | 65 +++++++++++++++++++++++++++++-------------
 2 files changed, 48 insertions(+), 20 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 7d1f813576..94f4e8de83 100644
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
index 2463c49773..aa883eb84f 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -615,14 +615,12 @@ static int inet_parse_flag(const char *flagname, cons=
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
@@ -632,38 +630,32 @@ int inet_parse(InetSocketAddress *addr, const char *s=
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
@@ -678,6 +670,39 @@ int inet_parse(InetSocketAddress *addr, const char *st=
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
2.32.0.rc0.204.g9fa02ecfa5-goog


