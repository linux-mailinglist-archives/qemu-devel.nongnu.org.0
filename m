Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2354A7CB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:22:31 +0200 (CEST)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0y4T-0006E2-Sx
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y26-0003Rd-65
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:02 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:38575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y24-0001dK-MF
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:01 -0400
Received: by mail-il1-x12c.google.com with SMTP id f7so5761472ilr.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hArKZ9FFGMf88kVfdfvsuQyXRHILT3Hqc9FQtOYlbzA=;
 b=gzAY/em6B7QXT+P1qUduqrEVvPteFSLVjSYN3pd3FD5NsPEdnK74+ytGck6wrhrnjL
 UrzAkNS/rRXAdjsCLkCwGE/6PWugezpN2zCy+HpxOkJBnAFEipq1QT+WCwaiPhq00S0x
 KO/H1soVo3kQP9yS4JqSsRGNiIWU/h0RaP6sJLLa83D2FlJMs9cVI+9XomYw6B2gpjtg
 qixBiAu3l+SNYMIYxwbRv4Fb6WBw0Ucf0jKhFsAy8tUnfE0RRQoa/ahpYlRYlwzg31Pg
 5bCwxkBJ7gwpcx9OUUvnafE3XHbRSz0rn/9v3e54rWVAmfHih+Y2N4h5Eo77a04ZM25k
 BjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hArKZ9FFGMf88kVfdfvsuQyXRHILT3Hqc9FQtOYlbzA=;
 b=cU9NArC6uizV+PDRH2w2PTtgwVnCwewKe3//hRqdMprXjVyJ3eiC8ckmGi52BUjsxb
 FimhX701PFZ3gaoj+6tsrvgqmds6L065wfobfjKDjRX9LgLQGFw6s0HpOFa9vMEKaLV7
 4Z5UAmpsgMMaFxUhlF1xF25OetLZa1W3FQtOAPQt5MaX1KaFuH9FugGDvUTqVKxoTYec
 jp++4DMr9gzD1vhikKsJO8xiFyZGf4kZ2cJtHaWRwW9eKCsolWZ6jNsVYMhXOmxJSXRk
 9Z8d24e/6eWbkxVR6VVu7Nf3R4fl5fK16jecofXEz2nUoUkYueQyKWH/C4ZmM/zHNT8U
 H3Gg==
X-Gm-Message-State: AJIora/ycnEl9rYWiOtf4UMuQU3eI0K7CKND7u+nNlHuqHHB/17/4kT9
 YBpT7aEpDdARvoIVq+KZRBMHGBVVvYRJfQ==
X-Google-Smtp-Source: AGRyM1tbKd4Yn9x8gCqzCx8nEFvoASb+THLlLq/D4CQ09RUdvV6WhRexBrikH1as8ae5ME1AF1PRlw==
X-Received: by 2002:a05:6e02:18ce:b0:2d3:f970:fc8b with SMTP id
 s14-20020a056e0218ce00b002d3f970fc8bmr1815574ilu.285.1655180399174; 
 Mon, 13 Jun 2022 21:19:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:19:58 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH v2 02/11] bsd-user: Implement fdatasync, fsync and close_from
Date: Mon, 13 Jun 2022 22:20:01 -0600
Message-Id: <20220614042010.40327-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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

Implement fdatasync(2), fsync(2) and close_from(2).

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 19 +++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 2bd312f8e18..94eb03df62e 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -239,4 +239,23 @@ static inline abi_long do_bsd_close(abi_long arg1)
     return get_errno(close(arg1));
 }
 
+/* fdatasync(2) */
+static abi_long do_bsd_fdatasync(abi_long arg1)
+{
+    return get_errno(fdatasync(arg1));
+}
+
+/* fsync(2) */
+static abi_long do_bsd_fsync(abi_long arg1)
+{
+    return get_errno(fsync(arg1));
+}
+
+/* closefrom(2) */
+static abi_long do_bsd_closefrom(abi_long arg1)
+{
+    closefrom(arg1);  /* returns void */
+    return get_errno(0);
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index a824785fee8..f7d09909925 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -273,6 +273,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_close(arg1);
         break;
 
+    case TARGET_FREEBSD_NR_fdatasync: /* fdatasync(2) */
+        ret = do_bsd_fdatasync(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_fsync: /* fsync(2) */
+        ret = do_bsd_fsync(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_freebsd12_closefrom: /* closefrom(2) */
+        ret = do_bsd_closefrom(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


