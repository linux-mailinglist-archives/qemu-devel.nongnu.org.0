Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2302D21F7A8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 18:49:46 +0200 (CEST)
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvO7l-0001k2-6x
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 12:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvO1J-00015P-KE
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:43:05 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jvO1H-0006oV-Um
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 12:43:05 -0400
Received: by mail-wm1-x343.google.com with SMTP id g75so6829999wme.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 09:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2uqdg4rXwANaV6cVAKV4VhRMp7hv8Go60MYRFCgr3o4=;
 b=QGJZEMV0YV2oXUv6AOx4MA+YoAz9S/1wYuFkTAGPpUCFX6QclRLySp5SWpHgwZpXd2
 xF8btEkBO1jZVUIeVZnRfxt3eqBLefWxVJNhU8glncms+0ccUmPGpUtDb1Ek7QQbFKaY
 UXik62yCKDryq9XU2t/gpjLWFG0BRQTT155Oq7XlMpaLJz5SFLdGQ/xZFgkRKN+4/CP3
 eKdVzjvp7TiSBrSbEuf9SgTWrk8UjfyPGhHgEtf+QafFn7X49P8CpyKtwPomwnQFs5dP
 O0Ek3Cj12zC6+ILbqymS3U0727lVe5SfqMUIL3muczZOuXZqgzMfVOv/rw8nGGI/RwDL
 GFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2uqdg4rXwANaV6cVAKV4VhRMp7hv8Go60MYRFCgr3o4=;
 b=ZBqawr1gR3aOZZoM/7MwtrPTWNlDG+/Gu36xryotz70gAbE/YeGa9b6U37r4D0lfrU
 JNyHQ0o9Eq+nVykoZtSxCp+HLr0vfqICZH/kXtAUAsXFrN4QyOJMXXi58mDwCy94+8Wn
 O4IgwZTcMVk85+TDJPBSZgHNo/CbT8GmRWZf4AETe1e3ujm/fw56iWDubIwuzuNc4nae
 Tlp8xsuOVoeowLxv2Ah2j5xZINuoOCov5v1jaewdbPUvN+ngg3e1zjNKaTPzWmylwe5w
 Ds4yeDI4glZrnp7VKBHuIkJONAIv/wkZTxUqRpccy7jlG7fmdqPb4g/AnfYCxsyZcGYt
 /xXQ==
X-Gm-Message-State: AOAM533ltvuqO2XE2/MBBVSJVwXEDuKbS40ln2edalfXtNnGIJU3t6uZ
 nnW+jgBR1zJbSd/5u2cCzDzyu4fwEzo=
X-Google-Smtp-Source: ABdhPJw3DS0HT+Zm8c31wbeXSUY9nKbcAYcwTpVE4nYMPjhfBuVdSk3qHKXXzqcoIl84MD97tl4TWg==
X-Received: by 2002:a05:600c:2285:: with SMTP id
 5mr4982825wmf.78.1594744982459; 
 Tue, 14 Jul 2020 09:43:02 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 138sm6474380wmb.1.2020.07.14.09.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 09:43:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 3/4] qemu-common: Document qemu_find_file()
Date: Tue, 14 Jul 2020 18:42:56 +0200
Message-Id: <20200714164257.23330-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200714164257.23330-1-f4bug@amsat.org>
References: <20200714164257.23330-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Sarah Harris <S.E.Harris@kent.ac.uk>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document qemu_find_file(), in particular the returned
value which must be freed.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/qemu-common.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index d0142f29ac..d6a08259d3 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -110,6 +110,20 @@ const char *qemu_get_vm_name(void);
 
 #define QEMU_FILE_TYPE_BIOS   0
 #define QEMU_FILE_TYPE_KEYMAP 1
+/**
+ * qemu_find_file:
+ * @type: QEMU_FILE_TYPE_BIOS (for BIOS, VGA BIOS)
+ *        or QEMU_FILE_TYPE_KEYMAP (for keymaps).
+ * @name: File name
+ *
+ * Search for @name file in the data directories, either configured at
+ * build time (DATADIR) or registered with the -L command line option.
+ *
+ * The caller must use g_free() to free the returned data when it is
+ * no longer required.
+ *
+ * Returns: absolute path to the file or NULL on error.
+ */
 char *qemu_find_file(int type, const char *name);
 
 /* OS specific functions */
-- 
2.21.3


