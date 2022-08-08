Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C438E58D55B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:29:49 +0200 (CEST)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKcW-0001KC-3X
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vtjnash@gmail.com>) id 1oL86A-0003D9-Pq
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 15:07:34 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vtjnash@gmail.com>) id 1oL869-0005oe-9F
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 15:07:34 -0400
Received: by mail-qv1-xf36.google.com with SMTP id u8so7053255qvv.1
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=ezMtzJdsQt0Ofa4jcTwGnF+9OCTmlooriMBu5SWAmPA=;
 b=Jgy5MjGuj9jQZCmcdkSUQjzNgUsHsGXx+LXw7kui7bxzqtm+IG8+8Jrkkz3x4bZhzY
 PNuMRPtXmCK0qlf/MlH+E2IxCB16kcxjn5H6/ZtF+zX/nIa9gzfHpbrTGLYaPwx2pJBS
 8iDLOc/mVSSGDe1UGaw0QEd6d83EKDPCzpImrYw60JDVyPCmfc5iSa10lJcDLd7nevcu
 LD5ZgtjX1Li1MI2WROW3qTptIPHEs5vf5CpnZU1r+8FWahk4NdHh1KDOmdD5JyT8cgZ3
 xA6BWx8ZHfmFK5pqBllAbZK9TuEMBq1Eo9itjsY4w+oDAeaN0IPvesRYrTXm17NU9Ohr
 XkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=ezMtzJdsQt0Ofa4jcTwGnF+9OCTmlooriMBu5SWAmPA=;
 b=hcx10TxZ6WUZRtHxLipsWI/FjLKvQbX5RJ+wKF0iITjDAoKqeS1KDqAf0NzmZ04wfp
 2L5RJtCWxn1S39u7DBVicKhKaugxKz+1VAcFY7fT+3LoKACsoJs2snQZdK8oRdYIDYce
 sRNBzBc24KC8uo9qth9aSKoh68ooXsd+cIk1MGso4UTXV8Cx3nNlxpYNtkllBdlkrDZR
 AvhinsGDKI6ExgG42jb14az+Lrpl7tKb42xDLPCj2bcxhthYfhWu3ZAARiPkA1SBW4sQ
 vTGNOdGkBmZlRFdctR6RJsnbNFOe/Ij1L7CYeDhFtfgzH5bWcyOqzwB8aYQw7LuRyCEr
 IpCw==
X-Gm-Message-State: ACgBeo17hY0BSq0OWJ5s9p6LKoeWp/0FzLmIZ9HLb/Qw1DN/lhoTI0Bv
 HZIAkH8JktJ/mheWz3VY0BB2L6giUKhx+Q==
X-Google-Smtp-Source: AA6agR7MFqgcCJdsfUnVTCPUd8D4yJW7i4vV2qY7XcJTXdiMF/hU11ThMRtJ5Pqp7POLcDxpgOVR6w==
X-Received: by 2002:a05:6214:212d:b0:475:c30d:fa8b with SMTP id
 r13-20020a056214212d00b00475c30dfa8bmr16916584qvc.123.1659985651468; 
 Mon, 08 Aug 2022 12:07:31 -0700 (PDT)
Received: from arctic4.juliacomputing.io ([2001:550:2:2c::46:13])
 by smtp.gmail.com with ESMTPSA id
 i25-20020ac871d9000000b00342f960d26esm2405363qtp.15.2022.08.08.12.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:07:30 -0700 (PDT)
From: Jameson Nash <vtjnash@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jameson Nash <vtjnash@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user: fix readlinkat handling with magic exe symlink
Date: Mon,  8 Aug 2022 15:07:27 -0400
Message-Id: <20220808190727.875155-1-vtjnash@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=vtjnash@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Aug 2022 04:24:59 -0400
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

Exactly the same as f17f4989fa193fa8279474c5462289a3cfe69aea before was
for readlink. I suppose this was simply missed at the time.

Signed-off-by: Jameson Nash <vtjnash@gmail.com>
---
 linux-user/syscall.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ef53feb5ab..6ef4e42b21 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9894,11 +9894,22 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
             if (!p || !p2) {
                 ret = -TARGET_EFAULT;
+            } else if (!arg4) {
+                /* Short circuit this for the magic exe check. */
+                ret = -TARGET_EINVAL;
             } else if (is_proc_myself((const char *)p, "exe")) {
                 char real[PATH_MAX], *temp;
                 temp = realpath(exec_path, real);
-                ret = temp == NULL ? get_errno(-1) : strlen(real) ;
-                snprintf((char *)p2, arg4, "%s", real);
+                /* Return value is # of bytes that we wrote to the buffer. */
+                if (temp == NULL) {
+                    ret = get_errno(-1);
+                } else {
+                    /* Don't worry about sign mismatch as earlier mapping
+                     * logic would have thrown a bad address error. */
+                    ret = MIN(strlen(real), arg4);
+                    /* We cannot NUL terminate the string. */
+                    memcpy(p2, real, ret);
+                }
             } else {
                 ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
             }
-- 
2.25.1


