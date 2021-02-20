Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A1320228
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:20:24 +0100 (CET)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG0V-0000Oh-4g
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LFQwYAMKCp0AGBDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--dje.bounces.google.com>)
 id 1lDFtx-0000Xa-6x
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:37 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:43090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LFQwYAMKCp0AGBDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--dje.bounces.google.com>)
 id 1lDFtu-0005Rj-TO
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:36 -0500
Received: by mail-pl1-x64a.google.com with SMTP id 42so4625740plb.10
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 16:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=iWai+KPSZ1OZ7yfodHOcvAbIn7VnVw8PFEon7KOtbLs=;
 b=hL7R97jHeq1eOo3yWX4KZfVb86gmwbDYYGXpGb/2kkLd7X7f/cNSuJYSLsZ4T4QANu
 c4VC4VCZXwq4tSkXQMJl6p+TjSuiy4yLDUURrUMEpzpKnd2VT0uySI3KuC5HWQ2IxbsP
 1fmukBbQ/Y0mKU1Qaiwpd0iKB+pv8GW1zDTXQWTFBDH2KIdnB6WORKcSVUclL62ou1hI
 K7G9GfFypKxfclA0YjaU8dZyeW6+v+U/EuzOXVO17sSaMKnbhiscXMWwXFvgtbeWlagR
 4CHnbbk2j3HPbXgBSQBCIXe8+WAthz0FOepCS3qne9fEJCyImxWXG+1P2z9q9N/oERO7
 RWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iWai+KPSZ1OZ7yfodHOcvAbIn7VnVw8PFEon7KOtbLs=;
 b=ZZI0z4yckkMSrvvcrfRXaRMtKU5T76QKbR8Zn71rG0nHV1g25kc/snQVMjoxElpI63
 H0BHNxKF38FuLifQkyzMP93qNUAYxc9HoaKghrxKkTf/SXTIl5eA20Z0mvGLSMwdFpAW
 dBhSX6FdpDie1Lc7NSD4/hs5a2reKYxxKeSnxCz2FWcloKtoNZy2xVlcgfr9uO8uagrT
 kv2fm9tUnblv7Dpe8GoRJdlBvP7H5B6Fthb4gOeNkE7EBfqJBdKrvYeEGWwruyy4hsnA
 8mFj7SF7Y5KPBB/kGk80FbhndFwGdhgexmJs20j/MS+beDW04jx+2UIdnw23vZRqKzu9
 VM9w==
X-Gm-Message-State: AOAM532xYiDMfNtMdxL3WGXy7+v7y2BcRl2qjHEkQLvRFuXdtYHkrDKd
 57UJe2Dpka60V+Lkf/+82iDhnUmW/I/f828/YqNgXmhkBWFSPhxrenmk5KLeTB/9x8SDerTKoW7
 wNKgWpcBvnIrjY612ZONCj4RhzChJXS+4CKHocp+lS9JreqTRlAVN
X-Google-Smtp-Source: ABdhPJzNUX1J6EwqZLJlLvoLD0Y+Po9MNIzCynsPJ58AUp7RPz0Gd9FUZ/w2vYPHMX9qgw3uqYMRvas=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:7d06:9b98:ec95:3f70])
 (user=dje job=sendgmr) by 2002:a17:90a:4dc1:: with SMTP id
 r1mr11668818pjl.12.1613780012934; Fri, 19 Feb 2021 16:13:32 -0800 (PST)
Date: Fri, 19 Feb 2021 16:13:20 -0800
In-Reply-To: <20210220001322.1311139-1-dje@google.com>
Message-Id: <20210220001322.1311139-4-dje@google.com>
Mime-Version: 1.0
References: <20210220001322.1311139-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v5 3/5] inet_parse_host_and_addr: Recognize []:port (empty
 ipv6 address)
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3LFQwYAMKCp0AGBDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--dje.bounces.google.com;
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

Some callers need to distinguish empty ipv4 addresses from ipv6.

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v4:
- new in this patchset revision

 util/qemu-sockets.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 3ca6a6fb3d..062f0eb074 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -620,7 +620,8 @@ static int inet_parse_flag(const char *flagname, const char *optstr, bool *val,
  * Terminator may be '\0'.
  * The syntax for IPv4 addresses is: address:port. "address" is optional,
  * and may be empty (i.e., str is ":port").
- * The syntax for IPv6 addresses is: [address]:port. Upon return the wrapping
+ * The syntax for IPv6 addresses is: [address]:port. "address" is optional,
+ * and may be empty (i.e., str is "[]:port"). Upon return the wrapping
  * [] brackets are removed.
  * Host names are also supported as hostname:port. It is up to the caller to
  * distinguish host names from numeric IPv4 addresses.
@@ -654,7 +655,10 @@ const char *inet_parse_host_and_port(const char *str, int terminator,
         }
     } else if (buf[0] == '[') {
         /* IPv6 addr */
-        if (sscanf(buf, "[%64[^]]]:%32s", host, port) != 2) {
+        /* Note: sscanf %[ doesn't recognize empty contents. */
+        if (sscanf(buf, "[]:%32s", port) == 1) {
+            host[0] = '\0';
+        } else if (sscanf(buf, "[%64[^]]]:%32s", host, port) != 2) {
             error_setg(errp, "error parsing IPv6 address '%s'", buf);
             return NULL;
         }
-- 
2.30.0.617.g56c4b15f3c-goog


