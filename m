Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A87B330555
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 01:30:36 +0100 (CET)
Received: from localhost ([::1]:46652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ3n8-0001NQ-Kz
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 19:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37W9FYAMKCuoPVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com>)
 id 1lJ3mD-0000wl-Vl
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 19:29:37 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:52122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37W9FYAMKCuoPVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com>)
 id 1lJ3mC-0006lM-Bn
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 19:29:37 -0500
Received: by mail-yb1-xb49.google.com with SMTP id o9so10714409yba.18
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 16:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=C6wUsjLEV/lhW2Y+AbRh7qDPAog0COKkLT65fqrayyk=;
 b=a8q98zn1gF1SB72eR+HoyO+1m3/VazwZSLEe842HS4i6mKgcsnw0l4WMPWyg5BNAUA
 eGOTK0HUlJjtW2d47M9paZoJ7GWlkHktncNe105ExS67dDvHQ4kEeSmIsRTBymFZfoEp
 mAG9++GF4fRTUyZPjKhH6VQhZwxxVorROz+Ej5oMg77mvskoO61ff20uZbgsxV0UFf7Q
 VeU5nnfOWkdRxE00w6Cfq+UAwW4XnIuzLL/BXAViaA9FNvMty2IobVpB9IHFErnbu/0l
 iuXjFcAKiwBcl1gvGrh6OzH0wqjYkG/7UuvBPYVYF648RZFPgQayxGR3WyovDftbbr0C
 f7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=C6wUsjLEV/lhW2Y+AbRh7qDPAog0COKkLT65fqrayyk=;
 b=GMc9ozweIBfmiFV9FCS/S0cPSjfr4D3LCwfesAxbF39bzxVeU1yybkMU6WQl8Emb3u
 eP7vPd3z8Bb9iT+hazvD5nQLd4SjN/Jm+O4il8DsVQYZ3LMX+0NV/FnBKLZWhkwvpM0m
 H/7jrmSp2nql3q6sRf45ozUAlZxUa95KjUT91sou2WZ0eEJ+uwjQiWE0gLuqPauwjYr+
 gKveVVxH+jB6VSeL8oENYYzuQS9aTfCSaQoCHvwrPfctKbpZYF071ks+x+Wecfn/aNvO
 Ss5LYmKtW+z/YTqpC1t7IhF9BQTM/AyfGEUw7UT4oOapfaJVscojMfdswZln4XmpGC4s
 W7Sg==
X-Gm-Message-State: AOAM53022Ogphix4C2Ii9oc5/gyLtkcXi29s3cPrLm6lunbydWViDwaO
 8gKdNQExO8pTBxpVX/5kfEIYGAZ8fd+9xpa/YBbkZW3oBhutFT7XlASOUCeyG964sSibpqQz4gP
 42LnPeenh1WG0ji2xa3ufjncvkvRcyLxSM2tghhEdud0hKuf5pEoN
X-Google-Smtp-Source: ABdhPJxZBcFAxlOT3hELEa3N20664C0aBlAjNSXfQ7rkDQf17dkN6k6p/UH6+/rySI7u1aDQusRoPr8=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:fd29:8915:b96a:bb7f])
 (user=dje job=sendgmr) by 2002:a25:58c5:: with SMTP id
 m188mr29951437ybb.286.1615163373605; 
 Sun, 07 Mar 2021 16:29:33 -0800 (PST)
Date: Sun,  7 Mar 2021 16:29:28 -0800
Message-Id: <20210308002928.3385275-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH] inet_parse: Clarify IPv6 comment and error message
To: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=" <berrange@redhat.com>
Cc: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=37W9FYAMKCuoPVQSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--dje.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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

Wrapping an IP address in square brackets does not necessarily
mean the address is an IPv6 address. The wrapping is just an aid
to parsing since IPv6 addresses have colons, but does not provide
semantic information.
E.g., [127.0.0.1] is a valid way to write 127.0.0.1.

Signed-off-by: Doug Evans <dje@google.com>
---
 util/qemu-sockets.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 8af0278f15..0c41d372c0 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -635,9 +635,12 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
             return -1;
         }
     } else if (str[0] == '[') {
-        /* IPv6 addr */
+        /*
+         * Probably, but not necessarily, an IPv6 addr.
+         * Note that [127.0.0.1] is also valid.
+         */
         if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) != 2) {
-            error_setg(errp, "error parsing IPv6 address '%s'", str);
+            error_setg(errp, "error parsing address '%s'", str);
             return -1;
         }
     } else {
-- 
2.30.1.766.gb4fecdf3b7-goog


