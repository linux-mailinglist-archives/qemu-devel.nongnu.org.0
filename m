Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757DF3E375F
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:13:34 +0200 (CEST)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUZR-0002Ew-Hm
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:13:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6a-0000S8-5R
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:44 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6X-0005WJ-Ck
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:43 -0400
Received: by mail-io1-xd2b.google.com with SMTP id h1so19883018iol.9
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+a7UQ8owCmGXtyzDU3U40GIDHEJl71xOx4FAs8OqMA=;
 b=DDPtkXkx5v6T1EP45z2hwLUjNPOy/2PrkgOs+KAC3uECbFD2rkHv2DSuDKNcGbbt4d
 Y0MUNFq+0TOPmQq7tveSfj7sXYuf7+WC1ycMNPP0Rx5IdoAX93WjWeq1nS7v3UCX+2bb
 ciT8n/ysVLNpULS0fMnPQbRzGOhsYo/i41erR0PIiSZt3a8Rg2lTPKRw38ItLzLp1XJT
 3YBi5qsYR2gSvWJH7dt/O78+4p0q+DvNYoHSh1QdJCXA1Y0ypK169EyQL7OlQGGfdPz6
 SCwM2aeXtdMMgzx1QAdiLCDtu2Tys8qE30TDNz2HqEH90ogr5XTs3j1KRJEzc9k0DJtT
 pY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+a7UQ8owCmGXtyzDU3U40GIDHEJl71xOx4FAs8OqMA=;
 b=aZfxks/bfaHo5WyvzX/Dgkjskj5XvOcI3nqp9bACqcTKYxhzqiSctTeTpJfSbMQlz2
 5g/uSoos8Lzelat7+s5R04p3Oe/vZNfoY/bg73tQln/RmnaSEJwLWJj7B0PNskurNuzP
 Nofd6HNTXC2B9MbW9XAcm+Xpb8hL4pFFkrU5fOQh0ILprinf5sfz43/L/fH0+UEyRblk
 kKcFXOLkCEhmV4V9AocHp3j8jkqxujB8aqgHCv9lSJiai3hGjwpwTYCJWeMymXSGjgtU
 2U/AkL5PwVEMVDFJg+q1kIb0qqZtV8Jc/TwYWnwG6BuML2m6IV2GDqqd2HCmXLyvSkbi
 USTw==
X-Gm-Message-State: AOAM5337k4SRsjwNtSOewKiKbu8EYCAgfWEyDtlgyCYNf2gOHhFKSrfS
 e4LzAbhQ6ES0CLIv/Yx/zPT/bNJCiD9Yrj2w
X-Google-Smtp-Source: ABdhPJzhyQ2vYSVCJaYzjPi7xG9T2z9NNVyYuiJ08PnXKnpEQa2NQTOU5rJOGAbnmDeR1LxfZliLrA==
X-Received: by 2002:a05:6e02:2147:: with SMTP id
 d7mr91494ilv.179.1628372620043; 
 Sat, 07 Aug 2021 14:43:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:39 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 49/49] bsd-user: Add '-0 argv0' option to
 bsd-user/main.c
Date: Sat,  7 Aug 2021 15:42:42 -0600
Message-Id: <20210807214242.82385-50-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Colin Percival <cperciva@tarsnap.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Colin Percival <cperciva@tarsnap.com>

Previously it was impossible to emulate a program with a file name
different from its argv[0].  With this change, you can run
    qemu -0 fakename realname args
which runs the program "realname" with an argv of "fakename args".

Signed-off-by: Colin Percival <cperciva@tarsnap.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 1de5dc189b..c3ecdaf824 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -284,6 +284,7 @@ int main(int argc, char **argv)
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
     bsd_type = HOST_DEFAULT_BSD_TYPE;
+    char * argv0 = NULL;
 
     adjust_ssize();
 
@@ -405,6 +406,8 @@ int main(int argc, char **argv)
             do_strace = 1;
         } else if (!strcmp(r, "trace")) {
             trace_opt_parse(optarg);
+        } else if (!strcmp(r, "0")) {
+            argv0 = argv[optind++];
         } else {
             usage();
         }
@@ -428,6 +431,8 @@ int main(int argc, char **argv)
         usage();
     }
     filename = argv[optind];
+    if (argv0)
+        argv[optind] = argv0;
 
     if (!trace_init_backends()) {
         exit(1);
-- 
2.32.0


