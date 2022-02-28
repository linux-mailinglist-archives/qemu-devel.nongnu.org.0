Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB94C776A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:17:26 +0100 (CET)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkaM-0001Kx-0I
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:17:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUr-0007uA-QU
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:46 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=46777
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUq-0006XA-AV
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:45 -0500
Received: by mail-io1-xd2f.google.com with SMTP id d62so15629366iog.13
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KqQIGuilfSiZo5D0/DJJljqcgNhY6dZ6uWFUPpHnygI=;
 b=Iud3rKZ3jXNOjefzGtIiizg0u0Dn2vO/42fUkBazA/Mq9h+2pTHkCcp5wzAAZxRsfc
 EqY04X4Xb5SB3pv/U5nfxQjaD+PbP23DDzOQ9hlwqFJlRcolHF82cI8DvnjvKy0raJmI
 md4dAPUYV1PKxJBJsjetKpQNiGCQqNCggajhg+QoaWL8MwHt3IzUTGELNQ5bmnPTnefj
 gpxEo+mq8PU0a6MCJYxNTlDfIuXnSEvUXDpdvLfZ7ZuWroYmi6/vZVdADxbZ8noob6k2
 ZIGX9dvvG32LL781sbpqSTlmZeZCr5ucdRldutmvQzq5q8zu356hmsUWJcvy9DNdC85S
 /qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KqQIGuilfSiZo5D0/DJJljqcgNhY6dZ6uWFUPpHnygI=;
 b=CQTMKs4SzErEwBKZZ0z0zybJUbNgyksBgfL4RplzqZAdZjk1E27HJnwtEzBS2nQYb4
 aolFbUrotljBczBi5IQTiwR2+N/hvG+YLQwhw5cXcDd5V91inM9Fbl+CoJQ91MrjGdsP
 UZROWv7lvQvsOG6JjMB8qW2Z+gDe5J+jdiLsturVg00FYGF1YDTq3IuY8tptlH6cTga6
 ZtaFW5lAA4ogYkJPyOpDBeTfj+a1YKM/iH5aNMl3OkzNm3QZOQkUhbWi+ld3qFREc/zt
 lDyT/1qJ4NoUYt3AKxxie0iW2Jx06BNJBUPlziRFAaQ1qOqf8ZH/gLsNBZFG1o8aACJX
 LGXQ==
X-Gm-Message-State: AOAM531YbDQkFFW3TZxpdYeaBkNgWiwYm5JmQyFzLA75wbBj2jkLY0xM
 Dw0qxqOCqwAR3kVXgzR9jSoWzvi4ljzhag==
X-Google-Smtp-Source: ABdhPJx+rC29UiyO0iH922TdNzlyLPJZ4bZwtnFBhXVWGYDDKDAwf7eLkM6kq7D24VueisOUeogwog==
X-Received: by 2002:a02:2725:0:b0:314:44cd:897d with SMTP id
 g37-20020a022725000000b0031444cd897dmr17582298jaa.135.1646071902419; 
 Mon, 28 Feb 2022 10:11:42 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:42 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] bsd-user/main.c: Drop syscall flavor arg -bsd
Date: Mon, 28 Feb 2022 11:11:59 -0700
Message-Id: <20220228181214.2602-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've not realistically been able to actually run any bsd program on any
other bsd program. They are too diverged to do this easily. The current
code is setup to do it, but implementing it is hard. Stop pretending
that we can do this.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index f1d58e905e7..bddb830e99b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -164,7 +164,6 @@ static void usage(void)
            "-E var=value      sets/modifies targets environment variable(s)\n"
            "-U var            unsets targets environment variable(s)\n"
            "-B address        set guest_base address to address\n"
-           "-bsd type         select emulated BSD type FreeBSD/NetBSD/OpenBSD (default)\n"
            "\n"
            "Debug options:\n"
            "-d item1[,...]    enable logging of specified items\n"
@@ -392,17 +391,6 @@ int main(int argc, char **argv)
             have_guest_base = true;
         } else if (!strcmp(r, "drop-ld-preload")) {
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
-        } else if (!strcmp(r, "bsd")) {
-            if (!strcasecmp(argv[optind], "freebsd")) {
-                bsd_type = target_freebsd;
-            } else if (!strcasecmp(argv[optind], "netbsd")) {
-                bsd_type = target_netbsd;
-            } else if (!strcasecmp(argv[optind], "openbsd")) {
-                bsd_type = target_openbsd;
-            } else {
-                usage();
-            }
-            optind++;
         } else if (!strcmp(r, "seed")) {
             seed_optarg = optarg;
         } else if (!strcmp(r, "singlestep")) {
-- 
2.33.1


