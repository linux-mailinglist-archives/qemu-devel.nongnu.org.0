Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414067E6E0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 01:48:45 +0200 (CEST)
Received: from localhost ([::1]:59808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htKoO-0000eZ-G7
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 19:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60875)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mehta.aaru20@gmail.com>) id 1htKiI-0007Fc-2S
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 19:42:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mehta.aaru20@gmail.com>) id 1htKiF-0003Qe-TE
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 19:42:25 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34290)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mehta.aaru20@gmail.com>)
 id 1htKiF-0003Nb-80; Thu, 01 Aug 2019 19:42:23 -0400
Received: by mail-pg1-x541.google.com with SMTP id n9so28827867pgc.1;
 Thu, 01 Aug 2019 16:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ipr3iNyxvPc1pw+FEpkLWVBnB0CK9mROZwdZiLP7cbc=;
 b=uXTtlLmyGtz4fEhRzAS/eMc/qy91v4szRv/kL3zIGmtRzUbQP5zRAn2IDQdZC6j+2R
 wlb+/cE6XICk3UgTU5HSWCzaKtHtUIgs9gIISKqxyC5gQ+RgXUcHk0Ddz+ATKuRL27tT
 ofEs+F62yqBccHr1qn40g6Yd6Fm8xZkLOqoqiUkL0++jquiwhwCjlHaYT1pwS34A3A3Z
 nGRRWx+fvyElReTzBCIGoCvDwbgn05nrRy7sJf6165Juaa31W09DIbR5XlqvlsErb9p/
 mAHj/zNSpWgZdvnGzyeev/fj/kyxctZ7Ip037bxucSEFw5uM00sXTh9wmIw2KKy0CH4v
 Pj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ipr3iNyxvPc1pw+FEpkLWVBnB0CK9mROZwdZiLP7cbc=;
 b=LhAzsvgxeEPIKjUz+y1bsvigEhLbBflLMUrvZZcSitsE9ANsX5iWftRbbqYfuQQSVC
 Ln45ZKL4XkLrcZHn/zjB2LxH9s73lSClxdjFGQfIUalg0WuvWT2YNnqVJsOI51by2z64
 W4c181NZwAtzcxMNbcFXwncTe06DZHmOYwtXvPcZxiZN25KYfmROt7zBlu/FUWIg8aHd
 Gi8aUFT75Mynlpgn05lnNqJUiM59Uyp4ZInTeMpCw6GbrZXE+nsysy1GlT4Z0jqVuygc
 edoW2kjZrXxPnIrSsfD7LJkI1xDkenOk0DowRcL5wjbxxfJVNI5HWyfCKi7plPCJfNU8
 nN0w==
X-Gm-Message-State: APjAAAVDLpXOWHj1stCDB90dfmCgKudAuEjXOvgxSARCYxnw7S/tR3tW
 gI7WynrET+AgFWnA9e/DU/TdRodGOnQAUQ==
X-Google-Smtp-Source: APXvYqwyGgFMmkRY/U1ruYLuWPo7DAdILhS2Odyq/LqYjxPf5K7wJ9niiU4ZxWBFLSK20+WSy+xnBg==
X-Received: by 2002:a65:64c4:: with SMTP id t4mr82477311pgv.298.1564702937553; 
 Thu, 01 Aug 2019 16:42:17 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:572:3de5:765:cb16:92cd:ee3e])
 by smtp.gmail.com with ESMTPSA id
 g18sm117975426pgm.9.2019.08.01.16.42.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 16:42:16 -0700 (PDT)
From: Aarushi Mehta <mehta.aaru20@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri,  2 Aug 2019 05:10:25 +0530
Message-Id: <20190801234031.29561-12-mehta.aaru20@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190801234031.29561-1-mehta.aaru20@gmail.com>
References: <20190801234031.29561-1-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH v9 11/17] qemu-io: adds option to use aio engine
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 saket.sinha89@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefan@redhat.com>, Julia Suvorova <jusual@mail.ru>,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
---
 qemu-io.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/qemu-io.c b/qemu-io.c
index f64eca6940..0abb4af134 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -130,7 +130,8 @@ static void open_help(void)
 " -C, -- use copy-on-read\n"
 " -n, -- disable host cache, short for -t none\n"
 " -U, -- force shared permissions\n"
-" -k, -- use kernel AIO implementation (on Linux only)\n"
+" -k, -- use kernel AIO implementation (Linux only, prefer use of -i)\n"
+" -i, -- use AIO mode (threads, native or io_uring)\n"
 " -t, -- use the given cache mode for the image\n"
 " -d, -- use the given discard mode for the image\n"
 " -o, -- options to be given to the block driver"
@@ -172,7 +173,7 @@ static int open_f(BlockBackend *blk, int argc, char **argv)
     QDict *opts;
     bool force_share = false;
 
-    while ((c = getopt(argc, argv, "snCro:kt:d:U")) != -1) {
+    while ((c = getopt(argc, argv, "snCro:ki:t:d:U")) != -1) {
         switch (c) {
         case 's':
             flags |= BDRV_O_SNAPSHOT;
@@ -204,6 +205,13 @@ static int open_f(BlockBackend *blk, int argc, char **argv)
                 return -EINVAL;
             }
             break;
+        case 'i':
+            if (bdrv_parse_aio(optarg, &flags) < 0) {
+                error_report("Invalid aio option: %s", optarg);
+                qemu_opts_reset(&empty_opts);
+                return -EINVAL;
+            }
+            break;
         case 'o':
             if (imageOpts) {
                 printf("--image-opts and 'open -o' are mutually exclusive\n");
@@ -291,7 +299,9 @@ static void usage(const char *name)
 "  -n, --nocache        disable host cache, short for -t none\n"
 "  -C, --copy-on-read   enable copy-on-read\n"
 "  -m, --misalign       misalign allocations for O_DIRECT\n"
-"  -k, --native-aio     use kernel AIO implementation (on Linux only)\n"
+"  -k, --native-aio     use kernel AIO implementation\n"
+"                       (Linux only, prefer use of -i)\n"
+"  -i, --aio=MODE       use AIO mode (threads, native or io_uring)\n"
 "  -t, --cache=MODE     use the given cache mode for the image\n"
 "  -d, --discard=MODE   use the given discard mode for the image\n"
 "  -T, --trace [[enable=]<pattern>][,events=<file>][,file=<file>]\n"
@@ -489,7 +499,7 @@ static QemuOptsList file_opts = {
 int main(int argc, char **argv)
 {
     int readonly = 0;
-    const char *sopt = "hVc:d:f:rsnCmkt:T:U";
+    const char *sopt = "hVc:d:f:rsnCmki:t:T:U";
     const struct option lopt[] = {
         { "help", no_argument, NULL, 'h' },
         { "version", no_argument, NULL, 'V' },
@@ -501,6 +511,7 @@ int main(int argc, char **argv)
         { "copy-on-read", no_argument, NULL, 'C' },
         { "misalign", no_argument, NULL, 'm' },
         { "native-aio", no_argument, NULL, 'k' },
+        { "aio", required_argument, NULL, 'i' },
         { "discard", required_argument, NULL, 'd' },
         { "cache", required_argument, NULL, 't' },
         { "trace", required_argument, NULL, 'T' },
@@ -568,6 +579,12 @@ int main(int argc, char **argv)
         case 'k':
             flags |= BDRV_O_NATIVE_AIO;
             break;
+        case 'i':
+            if (bdrv_parse_aio(optarg, &flags) < 0) {
+                error_report("Invalid aio option: %s", optarg);
+                exit(1);
+            }
+            break;
         case 't':
             if (bdrv_parse_cache_mode(optarg, &flags, &writethrough) < 0) {
                 error_report("Invalid cache option: %s", optarg);
-- 
2.21.0


