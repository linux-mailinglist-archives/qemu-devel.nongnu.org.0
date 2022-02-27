Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9908A4C5F7B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:40:28 +0100 (CET)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSDL-0005Tp-Kg
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:40:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8u-00069R-F4
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:52 -0500
Received: from [2607:f8b0:4864:20::832] (port=40745
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8s-00032u-Uj
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:52 -0500
Received: by mail-qt1-x832.google.com with SMTP id t28so7502156qtc.7
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FIM26iDeobdaVDOFSCZhx4ufdUObSP6716TqaQ3mxlU=;
 b=nshQHBjk4fa/+otyQzLDefnsy049mqpvhhtudGp1daoNkqJCWuW4JMOkjzBgHrWZjY
 v23PsRS+D6/JVbAE5lq9shzP8uUqkmn5F5gwhnfGusUDmITDW5s1w0gJNofS99OgfUEI
 UxyRIFxVhALluM1uJgFOwjfsB4icyle5EBB97HWMRO/mq3xYK1JlzWOCjHiHDK5iIW4n
 fh3RJ1hZeHWf1WGgVCJUfByRA2ate6z262DoY4h0wL3IlM+lKTCENAiSS+1+nuTqFT1R
 Q7IRM5QKSTNzMhhAY9g9WN0qSs4v0k5Z1Gb5UlHFiPBVP7eNn+oa0vBOmy5sR1tOhFVf
 a8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FIM26iDeobdaVDOFSCZhx4ufdUObSP6716TqaQ3mxlU=;
 b=BJGOT9K9V/YKHjuJErq33UwWTfpJdr1n7GFAfb4Nitcio9b0ok+N1MUNRet7JfNGhu
 J9fNlHghPbxIcv4LVJeE/5VHrNOdfprd0as+m6tNl7PTet7vcGp31rP2xwi3g2z0Za1M
 CXKqVViAAakDWGCPENSiM53CP92QWHAyDGD3am85NSZgsEfLxn3hrOnAgL4KxCm6vhyN
 Zry8JqjiMVne7t0+0Sgivuu64LVkjs6BML3hjuE6r7+2tjQsvD9Wkny6NawAFPw3mE6V
 Y7W4QVabX81PXyBjjCUSe9Mwwd7E7QZE7JfbaopWv1ma/7Dh8dmmlEvtQven3Zk4kb0r
 SdCg==
X-Gm-Message-State: AOAM531UcpG4PBtOYmBSGfCYeLM2C4yu9wqk1FlwKmCkMV3oDf0f5YXs
 UvHa+vQ5yQuJwuRpNd/pMcg3hMpbJFwWrA==
X-Google-Smtp-Source: ABdhPJypdz0d515MpxeuMYz2Xv7BPF80OWjQC4+PP171T6HDg4g3DZr75KEOpMr0F7VsNM8fDz2hXg==
X-Received: by 2002:ac8:24d:0:b0:2d5:e1f1:d492 with SMTP id
 o13-20020ac8024d000000b002d5e1f1d492mr14554883qtg.348.1646001349740; 
 Sun, 27 Feb 2022 14:35:49 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:49 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/11] 9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
Date: Sun, 27 Feb 2022 17:35:17 -0500
Message-Id: <20220227223522.91937-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>

Because XATTR_SIZE_MAX is not defined on Darwin,
create a cross-platform P9_XATTR_SIZE_MAX instead.

[Will Cohen: - Adjust coding style
             - Lower XATTR_SIZE_MAX to 64k
             - Add explanatory context related to XATTR_SIZE_MAX]
[Fabian Franz: - Move XATTR_SIZE_MAX reference from 9p.c to
                 P9_XATTR_SIZE_MAX in 9p.h]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
[Will Cohen: - For P9_XATTR_MAX, ensure that Linux uses
               XATTR_SIZE_MAX, Darwin uses 64k, and error
               out for undefined hosts]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p.c |  2 +-
 hw/9pfs/9p.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 14e84c3bcf..7405352c37 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -3949,7 +3949,7 @@ static void coroutine_fn v9fs_xattrcreate(void *opaque)
         rflags |= XATTR_REPLACE;
     }
 
-    if (size > XATTR_SIZE_MAX) {
+    if (size > P9_XATTR_SIZE_MAX) {
         err = -E2BIG;
         goto out_nofid;
     }
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 1567b67841..94b273b3d0 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -479,4 +479,22 @@ struct V9fsTransport {
     void        (*push_and_notify)(V9fsPDU *pdu);
 };
 
+#if defined(XATTR_SIZE_MAX)
+/* Linux */
+#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
+#elif defined(CONFIG_DARWIN)
+/*
+ * Darwin doesn't seem to define a maximum xattr size in its user
+ * space header, so manually configure it across platforms as 64k.
+ *
+ * Having no limit at all can lead to QEMU crashing during large g_malloc()
+ * calls. Because QEMU does not currently support macOS guests, the below
+ * preliminary solution only works due to its being a reflection of the limit of
+ * Linux guests.
+ */
+#define P9_XATTR_SIZE_MAX 65536
+#else
+#error Missing definition for P9_XATTR_SIZE_MAX for this host system
+#endif
+
 #endif
-- 
2.35.1


