Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F24C7798
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:24:40 +0100 (CET)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkhL-0005zP-Tf
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:24:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkV0-0008Pb-8k
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:54 -0500
Received: from [2607:f8b0:4864:20::131] (port=45602
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUy-0006aU-Q5
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:53 -0500
Received: by mail-il1-x131.google.com with SMTP id x14so5521988ill.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hy2bdjFp84wHHa+MT23SEu6EAim31NmTv5svUlwzfpY=;
 b=pdjDWR0fAl5AkIHlaP4FRIXu4adlhUbCej6k/5yBIOsugsbTSXp2stxJN8b0UvdV/j
 3I7WvNsovpP1rrXQbkm9kQMITN1bywaFgJxhdA++NlZgtLEsg9ttCazjUPucT0SXfCBh
 F7p7HupNl9yqK2T7CLUBVCh97BjLOJC3JxAIgcJhVGfG8JokS1mIdHn5fxz+TFOjafjp
 FZiAog7BId9SxtUgf85jSSPo/FTRyrYku3+dg6/kOUcozNyWr0dXH9wuI5Khg3nUCzXa
 CYZLJ/R71q1duBgKUOv19czcrQ6/jlP4QP9Jpclapt+M5ZteAvlAQESXNUvR26dhOI/c
 kYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hy2bdjFp84wHHa+MT23SEu6EAim31NmTv5svUlwzfpY=;
 b=M0T8poygUGlhXQZYsul/VvQx6QrnH0ObVAnVNv6F6AicgxmiV1wsNdW7YEA5LQJ7nl
 abI7ulMfFRxb+u3kP6/c1nlZ2qvK4tQJZuiwsRjl9xfvpjMlMh3AmoqggF2aXnTlhErQ
 xv/nKkK/ICBoCCwl1yANBjCxOOvnM0/FUCZALN5gxcyCfwnhvyy7O2OwLwQ9dqM3fafS
 eWxTAPaTIsRTlBv7E0e7XTF94Ag27GegxH5bB5hj0LTBkvdNPdNQorQIKwDNKmGZKFuH
 pgegbtvVYZdgZTbkHsG3xyHUrS56khtXZ38IpdhTVrXBmLp4igu+NopIQ/6wbbS0uI3I
 5jiQ==
X-Gm-Message-State: AOAM533W+tOpbsHGdjaC9vMQPe49i5GUBQnaNMXAmjg7YTR2A33gm5UP
 +NwfjbD4cVVAO9NNN9kKjUakb0k8hN/r6A==
X-Google-Smtp-Source: ABdhPJyekrIvbPBIkuBoG920SUXlWCbMsawArl9VyQKAXLGSPdIRIaoBV4S7V4RLffrIrziRy5l+jA==
X-Received: by 2002:a05:6e02:b29:b0:2c1:a90c:ea6b with SMTP id
 e9-20020a056e020b2900b002c1a90cea6bmr19513262ilu.175.1646071911562; 
 Mon, 28 Feb 2022 10:11:51 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/16] bsd-user: Move system call building to os-syscall.c
Date: Mon, 28 Feb 2022 11:12:08 -0700
Message-Id: <20220228181214.2602-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/meson.build | 1 +
 bsd-user/meson.build         | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/meson.build b/bsd-user/freebsd/meson.build
index 4b69cca7b90..f87c788e846 100644
--- a/bsd-user/freebsd/meson.build
+++ b/bsd-user/freebsd/meson.build
@@ -1,3 +1,4 @@
 bsd_user_ss.add(files(
   'os-sys.c',
+  'os-syscall.c',
 ))
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 8380fa44c25..5243122fc56 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -13,7 +13,6 @@ bsd_user_ss.add(files(
   'mmap.c',
   'signal.c',
   'strace.c',
-  'syscall.c',
   'uaccess.c',
 ))
 
-- 
2.33.1


