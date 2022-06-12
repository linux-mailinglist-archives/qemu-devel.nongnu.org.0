Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFDE547C1C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:56:12 +0200 (CEST)
Received: from localhost ([::1]:36266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0Ud1-00035s-9z
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVv-0005nD-Mx
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:51 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVu-00008O-AK
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:51 -0400
Received: by mail-io1-xd2e.google.com with SMTP id r5so4309992iod.5
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ERo6fPriI1UFvIxjwkCbe1K6cPmR6dzyqUXBVyEFgsg=;
 b=xbFY/qSZnyE9kL0QimzqThi85+85V6ZfhhgzKmd7eM7w2ZGN/76R3XNsA8JpVFw6/2
 u36/r2ctJy3niMp3GfJfvo6n2BAXNZW0J78Kdl/SfijyyCPVsiYyQp6y7IA+mQoR9OER
 twmo+gOJEFY+rLk1m6vbHrvWKs5D3w/YVrz7tpY0A51ozSIfILhY8e7ZqE3Yq5L/GsLo
 qWhfjB9MngFZvRZmKgE2yc6SO6L/+31y812CG9U0Wxbzbwf2+pOtaTS4z5qmYwOfHhbE
 oPwm13ox5yNWG29lz+HkiIbtE6kMqdzzzWnH4LffRmPWqdL2Zw24lBfCo913KTznU0Gu
 N6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERo6fPriI1UFvIxjwkCbe1K6cPmR6dzyqUXBVyEFgsg=;
 b=bNVY0SDWNxXgx64t9ol2odpwJ+gDd8w2B/Df329lmppCPx0NNRRxvUDrxnviHan7d3
 TSab00fCXFWlGE2R1C6NfSd2KQYYpHxmV5sroK//iQyp40DUhxWXdpdJNgpWpSlAgKm7
 r3lbVnubwEP0NxphS8kTineutDMTrJTBxRGQJsGT3wgtVEz2KRTReXkk455pWen5G0PE
 2Qz/elBaTW5fqcPqDXcgP7uZJYei/h805525jqcn+8cJCNz9uhj6ySTHlinK1dP9H6fN
 hbbRAhCOgSs4LndRXRMTTFh/7lX29qJ+oq2epkpGJFBZU9lYIFNxtgtv3HIOqnPivAfh
 CQIQ==
X-Gm-Message-State: AOAM530ow3QBOETgGVRFurfIVaPxQti3P2nNi+V1JyampFM2YCtuyTOn
 byqyfPODl5tIEtKFY44upIV9C4C8cLW4DA==
X-Google-Smtp-Source: ABdhPJyALc6uibcT9e9rbkReEVDgsLNzaXi6K4H8s6tJoUdfFJ2c9WCVJb2L+7hv4FojDWjS95LAOw==
X-Received: by 2002:a05:6602:c3:b0:64f:d28f:a62c with SMTP id
 z3-20020a05660200c300b0064fd28fa62cmr26238845ioe.212.1655066929094; 
 Sun, 12 Jun 2022 13:48:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 11/11] bsd-user: Implement acct and sync
Date: Sun, 12 Jun 2022 14:48:51 -0600
Message-Id: <20220612204851.19914-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 24 ++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 32 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index ccfa65ec5e9..6b20442ecdc 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -535,4 +535,28 @@ static abi_long do_bsd_ftruncate(void *cpu_env, abi_long arg1,
     return get_errno(ftruncate(arg1, target_arg64(arg2, arg3)));
 }
 
+/* acct(2) */
+static abi_long do_bsd_acct(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    if (arg1 == 0) {
+        ret = get_errno(acct(NULL));
+    } else {
+        LOCK_PATH(p, arg1);
+        ret = get_errno(acct(path(p)));
+        UNLOCK_PATH(p, arg1);
+    }
+    return ret;
+}
+
+/* sync(2) */
+static abi_long do_bsd_sync(void)
+{
+
+    sync();
+    return 0;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 3c8f6cad0e8..2623caf8007 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -365,6 +365,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_ftruncate(cpu_env, arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_acct: /* acct(2) */
+        ret = do_bsd_acct(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_sync: /* sync(2) */
+        ret = do_bsd_sync();
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


