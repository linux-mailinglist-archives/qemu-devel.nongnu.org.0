Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C970376734
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:48:30 +0200 (CEST)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1mH-0001hY-8V
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hb-0007fF-Ft
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hZ-0000eg-PD
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+bUpux/oO0InwS7O+3v+yDI8KzcveNX4OlpMmGvtIA=;
 b=RqX2sDCfg/Ljhm8GoECKUtCPfVD7QowQQvshscBbcNqkS8tur9nyvA9DQdgrraVGpg/SnK
 mIsmB2olNwGeypF4Yxb89AW/2hBs+4Wn/eV9ru0PoXs30q6HWVTIx17i/7r15XapUY0Mjo
 qr7AlCerfwL/lBr75CScD36rU9yVGRc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-g4VYKLy-MLea2A4Lfs7MyQ-1; Fri, 07 May 2021 10:43:33 -0400
X-MC-Unique: g4VYKLy-MLea2A4Lfs7MyQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 y193-20020a1c32ca0000b029014cbf30c3f2so3952033wmy.1
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+bUpux/oO0InwS7O+3v+yDI8KzcveNX4OlpMmGvtIA=;
 b=oalzdU8pfJdbMdMNzkcnNzMp5VXvQSfAI1P+FlO5G2n5sWhmzCFT3/KAAVDrwi9RrE
 X/HTJ2n+J/WNIgQxJ8Y7lRzo1c1OkyG7s6faLeMeNv9CnVGZlsqcHXkaSPugxuUm9WsO
 HY8alPqHlhmihRgaT8W/2ikfgSNOhGYBK5PLc4ZphxXeMqYHEss3q1JiZDZbUMNaEhSf
 VlEGSZaAtqWjuRgjFxLHFW1RohVHNqq82OVDV4H50HPIraRUGdWZ2If/P22CQ+z/Ojcv
 +REQ2IsBF+BkxdWoBVUo60Uw16Z8psLuoVZIejtZsMzREkhMvw0xcY7J8xuDB6sYCspM
 GV7Q==
X-Gm-Message-State: AOAM532W+MCOwzheaT5yi80kgaxdwbjjCua/tE9vgkilWh/j6hb80HM+
 y2B7Im5MdBPKE5oTIBjzydW+lA+EIFybDjT7pyWEnpfbZv233BuhzosF/nLO1rCt+aBJ8k/NPd3
 UYGP9TGSv+RSTr7O///kLlmwRf+U5Be8Vty3/xIOdUqHlQk2T37WTUogaEEkjBkMf
X-Received: by 2002:a05:600c:89a:: with SMTP id
 l26mr21147126wmp.18.1620398612199; 
 Fri, 07 May 2021 07:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTDpcS06ZVNaty9w4yRm1eFVAUeaEhTHfn0l9iOi64at9nD5MlVi8qUE4UwL2wbZeJV4QBHA==
X-Received: by 2002:a05:600c:89a:: with SMTP id
 l26mr21147100wmp.18.1620398611969; 
 Fri, 07 May 2021 07:43:31 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id f7sm10176565wrg.34.2021.05.07.07.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/17] linux-user/syscall: Replace alloca() by g_try_new()
Date: Fri,  7 May 2021 16:43:01 +0200
Message-Id: <20210507144315.1994337-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95d79ddc437..08ab4cee805 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11417,10 +11417,12 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             target_id *target_grouplist;
-            gid_t *grouplist;
+            g_autofree gid_t *grouplist = g_try_new(gid_t, gidsetsize);
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
+            if (!grouplist) {
+                return -TARGET_ENOMEM;
+            }
             ret = get_errno(getgroups(gidsetsize, grouplist));
             if (gidsetsize == 0)
                 return ret;
@@ -11438,10 +11440,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             target_id *target_grouplist;
-            gid_t *grouplist = NULL;
+            g_autofree gid_t *grouplist = NULL;
             int i;
             if (gidsetsize) {
-                grouplist = alloca(gidsetsize * sizeof(gid_t));
+                grouplist = g_try_new(gid_t, gidsetsize);
+                if (!grouplist) {
+                    return -TARGET_ENOMEM;
+                }
                 target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * sizeof(target_id), 1);
                 if (!target_grouplist) {
                     return -TARGET_EFAULT;
@@ -11736,10 +11741,12 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             uint32_t *target_grouplist;
-            gid_t *grouplist;
+            g_autofree gid_t *grouplist = g_try_new(gid_t, gidsetsize);
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
+            if (!grouplist) {
+                return -TARGET_ENOMEM;
+            }
             ret = get_errno(getgroups(gidsetsize, grouplist));
             if (gidsetsize == 0)
                 return ret;
@@ -11760,10 +11767,12 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         {
             int gidsetsize = arg1;
             uint32_t *target_grouplist;
-            gid_t *grouplist;
+            g_autofree gid_t *grouplist = g_try_new(gid_t, gidsetsize);
             int i;
 
-            grouplist = alloca(gidsetsize * sizeof(gid_t));
+            if (!grouplist) {
+                return -TARGET_ENOMEM;
+            }
             target_grouplist = lock_user(VERIFY_READ, arg2, gidsetsize * 4, 1);
             if (!target_grouplist) {
                 return -TARGET_EFAULT;
-- 
2.26.3


