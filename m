Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555C33B084
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:00:36 +0100 (CET)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkxd-0001Xi-CI
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLkvu-0000Gn-66
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:58:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLkvs-00035U-DM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:58:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id w11so8412868wrr.10
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLRHiNpkcTmo6+f9Ptw2jEnPaJLV4SaZu1YpyKV8U/U=;
 b=A2x7L9hm+jeuQRBd9UaW+ovqOOdPN/AEnTi/GQHA8hQ54jA+qN2GljjEHc7NFbF4gA
 DEToSoXZTRSmcD5iJW+tSH5oDxSvYjnavNa5XBQu92lAOQSJkwh8PjjmnbUGljT/Bdui
 BnwZ5lNOjDbf5DHt94YxKVuohQJ1kbkKwvhkdI7s9UHDNtKC6tsexQxQYeglM9sqy9mU
 MmKlI3/1Wj6018O1f3tQpX7QKY5+WZfvcQcQGu6REbsYmcSqlGb5PDTrxZHLH90w4k8s
 RFZUYeANacT8QQMguRhW3gbgwNzdC/2S4c3+FYWnIrhP2RMe6U38D+q1ODOpzxojTkVt
 Ko9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLRHiNpkcTmo6+f9Ptw2jEnPaJLV4SaZu1YpyKV8U/U=;
 b=WXV+4gvkTDNkXlLMuZR/AVZ/f9Hr7KdHpokdxXGrMjoBJACU/zOhVnehv8HtnCB+LH
 mXj6BtnHAbzEXI11tZDuSlDUBvSfpqVKlkDAv8+xHn3dSaWGp4Jq06mnjXNPqJM3VkPQ
 CtSUO8skh4NG7GzbQrDRmjUxE9yGFjdrn8f5dUkc+i2glglGJz7sYqS1ITVO+DHt+MA1
 swo6koSa+oY7eC60AnDR4M7xFbHaOBEoK1l8WRF4PEVjZN/9CyNJDQ/xMyuIw2YyY5BH
 9n2m2GhasqoeJFubfMQshAv6vpItKXUWptmYhLJOa6Y89gtKacir3wTGYQ+KPDEZ9a9L
 JFmA==
X-Gm-Message-State: AOAM532xRXYKyhC1KOGi4AeSs0EhbrQ0JbPdtsg/5NSPDV79DNOajQRy
 Rg60jwLzJfZxMLdqeuf468jWSYsweAo=
X-Google-Smtp-Source: ABdhPJyStcIT/5BpezBJdd/CRT0NOjo6zGnWnQqLFC5upXNRQhsvQSZ/4bHrJJaCv6SZvtY6QpQqNg==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr27698474wrw.235.1615805922588; 
 Mon, 15 Mar 2021 03:58:42 -0700 (PDT)
Received: from localhost.localdomain ([197.61.219.7])
 by smtp.googlemail.com with ESMTPSA id r11sm18538747wrm.26.2021.03.15.03.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 03:58:42 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] util/compatfd.c: Fixed style issues
Date: Mon, 15 Mar 2021 12:58:13 +0200
Message-Id: <20210315105814.5188-2-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315105814.5188-1-ma.mandourr@gmail.com>
References: <20210315105814.5188-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed two styling issues that caused checkpatch.pl errors.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 util/compatfd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/util/compatfd.c b/util/compatfd.c
index ee47dd8089..174f394533 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -20,8 +20,7 @@
 #include <sys/syscall.h>
 #endif
 
-struct sigfd_compat_info
-{
+struct sigfd_compat_info {
     sigset_t mask;
     int fd;
 };
@@ -53,8 +52,9 @@ static void *sigwait_compat(void *opaque)
 
                 len = write(info->fd, (char *)&buffer + offset,
                             sizeof(buffer) - offset);
-                if (len == -1 && errno == EINTR)
+                if (len == -1 && errno == EINTR) {
                     continue;
+                }
 
                 if (len <= 0) {
                     return NULL;
-- 
2.25.1


