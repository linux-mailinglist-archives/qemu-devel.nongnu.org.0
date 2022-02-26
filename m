Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC204C5710
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:15:50 +0100 (CET)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0fd-0005h0-TS
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:15:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XX-0008KM-3N
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:28 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=45767
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XR-0000QM-QB
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:26 -0500
Received: by mail-io1-xd2e.google.com with SMTP id c14so10146964ioa.12
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TkBhosKWDfacU7putxgRWL5fb9CqDgt1oqt0mYy2nvk=;
 b=uC0+kSJPkiHRAJ1KlA6x+zXp7L7WQxLLZgmA8Knh28GgpnlO1Qt1bqNQ7cyfOslHBW
 NsbO1lAtqHcX6znbx6O5xMu5TMrPn6LocPB8fWtXf2a48A16CNlxR14k5yqEnBZ7oTvs
 aBh/ns6MHSCvxmUauQyRe7Yo5bGKJyahsxQTDEeYcp8J113+5mMUrCrdeXAC2hyL5YpY
 tZD23A6c0ByGCp84pb0xuy5KZnxN+zWrpLLIS3p7q7WRxeGySG1IUrCRN7NYMBSz+m4U
 x0pWwGrna7HK3F8lO873ANLb5GZEnUHQiIV0twL1doul1mIw2RQdt00ZssPWddmCc8Iv
 o/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkBhosKWDfacU7putxgRWL5fb9CqDgt1oqt0mYy2nvk=;
 b=vBIDayAUdeZKPo0o1EspQB8s8/1dIDgmQZ1z4oyeESS23Jw2iumTivq4GegjFnOmic
 dWEew+ee8AuCUTeRlui3ZcThegXbeR0OEFvxCn4lXugDb2WURkQG90gIjJ6uTLszYxD8
 yOCCd2pG+OHrwMXuXugNw/v/bU57RNwkmh9a6uM9BQpGffBWTk17o+k86C0VwZwOl6IL
 DZjtlwEolcXqukvAuHxqYpS+DqtP5v3DO/QC/zncuHi6EIpXjKk0vc8X4gsirq4udahX
 76f0+ZuVjonc/n+1X9EL/oUJaISmK+xuU7+k08XNjE4qfRUNRs1ypjNrjkNbX8A4aJvA
 Fz5w==
X-Gm-Message-State: AOAM530R+3waklNmR+SSLzWkeZ20icRmis3U7hmtxz5Hg6E9lwHrKxZO
 R/vx+4AAw9JlAlpdm68209qH8mp56UauTA==
X-Google-Smtp-Source: ABdhPJy2tA575ErjWZQl7A4e/3JmNG2PpWH5e2S5aVghYmgJAqC4JI/AK3j7+CbctanHtQhswn3EPg==
X-Received: by 2002:a6b:7417:0:b0:640:a379:c950 with SMTP id
 s23-20020a6b7417000000b00640a379c950mr9102816iog.38.1645895240562; 
 Sat, 26 Feb 2022 09:07:20 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:20 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/16] bsd-user: Remove bsd_type
Date: Sat, 26 Feb 2022 10:07:36 -0700
Message-Id: <20220226170744.76615-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove keeping track of which type of bsd we're running on. It's no
longer referenced in the code. Building bsd-user on NetBSD or OpenBSD
isn't possible, let alone running that code. Stop pretending that we can
do the cross BSD thing since there's been a large divergence since 2000
that makes this nearly impossible between FreeBSD and {Net,Open}BSD and
at least quite difficult between NetBSD and OpenBSD.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 2 --
 bsd-user/qemu.h | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index bddb830e99b..88d347d05eb 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -96,7 +96,6 @@ unsigned long reserved_va;
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
-enum BSDType bsd_type;
 char qemu_proc_pathname[PATH_MAX];  /* full path to exeutable */
 
 unsigned long target_maxtsiz = TARGET_MAXTSIZ;   /* max text size */
@@ -284,7 +283,6 @@ int main(int argc, char **argv)
     const char *gdbstub = NULL;
     char **target_environ, **wrk;
     envlist_t *envlist = NULL;
-    bsd_type = HOST_DEFAULT_BSD_TYPE;
     char *argv0 = NULL;
 
     adjust_ssize();
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 02921ac8b3b..e5742bd6c03 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -29,13 +29,6 @@
 
 extern char **environ;
 
-enum BSDType {
-    target_freebsd,
-    target_netbsd,
-    target_openbsd,
-};
-extern enum BSDType bsd_type;
-
 #include "exec/user/thunk.h"
 #include "target_arch.h"
 #include "syscall_defs.h"
-- 
2.33.1


