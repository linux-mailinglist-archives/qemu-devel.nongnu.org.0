Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B414A5B68
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:46:48 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErcV-0007X4-EZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:46:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nErJR-0004xv-Ic; Tue, 01 Feb 2022 06:27:05 -0500
Received: from [2a00:1450:4864:20::434] (port=33646
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nErJP-0005rO-Vb; Tue, 01 Feb 2022 06:27:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id e8so31423602wrc.0;
 Tue, 01 Feb 2022 03:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/sKypw+AJdF8fRX/xejxpmznIU3PSTyhL7bbZhNB2s=;
 b=S4v+BgiqUWZDbKw1ctq7qluCNZxU3RhL92rzd3CklpoQKLBKW7IFnooKDDsUuluZsV
 eJLvQqI+K5GVaUtMFtCzuwQe4dwSoAtllqREPGeclD4GL169QcbTr3xuK3hCGmKEuPUJ
 VIDjad7H2aJm+7Mwgcks62sTl/Pun4KUEgb9wyv26V5sUOdKeJ7QZxKs6EWeeecTDywr
 VXKC8sxANBVwLt8LZpsWqJNxmqaGEXmGic2VGfr45eZLJZIcI6LP5RDV+1ABAO7Qp8j7
 leRGMNs5pQNswpLfE4vGAobXBHIdhykB1pEqvSzn15RxkfQuy16xu/sXe8rnx/WSNw99
 YOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A/sKypw+AJdF8fRX/xejxpmznIU3PSTyhL7bbZhNB2s=;
 b=uA6C+GLNQycoAclFrilI1WtPe0rEsGldqZ1jE+2J9cs5wCwOh/aFC99ZVXsoUchaYf
 JlzBFv/KcqV7VT8ui4J+2xxEqi4t2MSQ2fHZFIotQl1XPs2hrxFT7rtCkigPBjwjsUZU
 82u9juUHpXknaAV18/6rOmYcK705aTYqDCFMkO/K2RAJZwfCmuWkOroG756ebmXH8aI/
 EKjbuj7gPu3QYkZ8ms3mb0DSZRPGN9OoC4YQ5x+oSlkOYLoB+xyMd1jn+ZYiDscoz095
 fGDvKiGUNjqXB4gdWZGPuzNKKDp/LOt8FBzNt46NThhKxr4hL7//FOepIF2Ifz1prdDO
 pbUw==
X-Gm-Message-State: AOAM530smmtyrMkxuLqKJiUVBPXv0H2tUxSNsCsYka2MmcWjyqm7cRyL
 //MpmlGjugSGFpQAwzmiClkDWEFl2K0=
X-Google-Smtp-Source: ABdhPJzkII3hVvbYhYCwphyKtT/5bnK14WpYi/DWtGUJe4N6M73AqNLildnUl0C8Qqiw7Syi4K7mVQ==
X-Received: by 2002:adf:f8c2:: with SMTP id f2mr21674001wrq.150.1643714822249; 
 Tue, 01 Feb 2022 03:27:02 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 t5sm14870691wrw.92.2022.02.01.03.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:27:01 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Hanna Reitz <hreitz@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 1/2] block/export/fuse: Rearrange if-else-if ladder in
 fuse_fallocate()
Date: Tue,  1 Feb 2022 12:26:54 +0100
Message-Id: <20220201112655.344373-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201112655.344373-1-f4bug@amsat.org>
References: <20220201112655.344373-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

In order to safely maintain a mixture of #ifdef'ry with if-else-if
ladder, rearrange the last statement (!mode) first. Since it is
mutually exclusive with the other conditions, checking it first
doesn't make any logical difference, but allows to add #ifdef'ry
around in a more cleanly way.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

One minor checkpatch error:

 ERROR: else should follow close brace '}'
 #29: FILE: block/export/fuse.c:651:
 +    }
 +    else if (mode & FALLOC_FL_PUNCH_HOLE) {
---
 block/export/fuse.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 6710d8aed86..d25e478c0a2 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -629,7 +629,26 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         length = MIN(length, blk_len - offset);
     }
 
-    if (mode & FALLOC_FL_PUNCH_HOLE) {
+    if (!mode) {
+        /* We can only fallocate at the EOF with a truncate */
+        if (offset < blk_len) {
+            fuse_reply_err(req, EOPNOTSUPP);
+            return;
+        }
+
+        if (offset > blk_len) {
+            /* No preallocation needed here */
+            ret = fuse_do_truncate(exp, offset, true, PREALLOC_MODE_OFF);
+            if (ret < 0) {
+                fuse_reply_err(req, -ret);
+                return;
+            }
+        }
+
+        ret = fuse_do_truncate(exp, offset + length, true,
+                               PREALLOC_MODE_FALLOC);
+    }
+    else if (mode & FALLOC_FL_PUNCH_HOLE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE)) {
             fuse_reply_err(req, EINVAL);
             return;
@@ -665,25 +684,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         } while (ret == 0 && length > 0);
     }
 #endif /* CONFIG_FALLOCATE_ZERO_RANGE */
-    else if (!mode) {
-        /* We can only fallocate at the EOF with a truncate */
-        if (offset < blk_len) {
-            fuse_reply_err(req, EOPNOTSUPP);
-            return;
-        }
-
-        if (offset > blk_len) {
-            /* No preallocation needed here */
-            ret = fuse_do_truncate(exp, offset, true, PREALLOC_MODE_OFF);
-            if (ret < 0) {
-                fuse_reply_err(req, -ret);
-                return;
-            }
-        }
-
-        ret = fuse_do_truncate(exp, offset + length, true,
-                               PREALLOC_MODE_FALLOC);
-    } else {
+    else {
         ret = -EOPNOTSUPP;
     }
 
-- 
2.34.1


