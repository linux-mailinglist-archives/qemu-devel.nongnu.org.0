Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA1225B614
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 23:44:21 +0200 (CEST)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDaYG-000878-0R
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 17:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kDaWr-0006TR-6E
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 17:42:53 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kDaWo-0001SH-Jz
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 17:42:52 -0400
Received: by mail-pf1-x434.google.com with SMTP id d22so452787pfn.5
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 14:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ytnCKH3zjpA9j+WbW1oeATTOhg+ZlkmXF4eIToZEPdI=;
 b=BZYAkrIt3VKBXbFgtmdSPJDa3MjYLicotmA8mYu6CnGNEkXDjr8XhkZHI6I9/PkQsq
 YQycG5RAMaA/HmIlREWYPWl4KIRjo8Bsi75BTQu8ikx8K2JntTDGZCLD1+3Fzp/7JaPK
 YjPwKeXd5Y/bCSgfKQSsdik5Ap8x2SexHcqctsYOaiEBYudtDsyQ5Kl0ERsL6OVz85ch
 f8myIUc7mokb6cK4JmvNsyiJIHJPp1Nv8K7ZmIajeaWvqN4fYmUNnsM30hCuDyi7ixcx
 u8igzvEtv2XCYIOQepN93RdvCF20M6bNzoIdo29CduJYGNa+d+2NjbHmoG9G85RPuzaa
 G4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ytnCKH3zjpA9j+WbW1oeATTOhg+ZlkmXF4eIToZEPdI=;
 b=FmAVQpBklOFJwCU3oPDkSYDoYWozGdxlJDexLbcHB7sYE2N481qFBlzTkUfyweW8WX
 Mi9WnB8q74gjp0IDC/Tjr2uuK1hnG2naGWaw+ORuBBcKRPK+UgB/6eL+MVn2Jy1MlymP
 zcyc27eEXdT5Ra8X58yjx+U5PxHd9j335J61XzasHt4rowy3z6Ch+CCnc9cRaO4mJ+s0
 HQcfMIu9jeGWhzHwyEUeu3OpUevEID/6PW0+VG5n/xYuFYBRewnzgVcqq/vsTMveF0oQ
 x7sFsv88bWPZgZr4ski0C6HuPcupTZ7+jpdpp8mTRvpdSpge4NNrNsdiDAt+iZZH+qd+
 VxNw==
X-Gm-Message-State: AOAM533f5uMfQnWSzNs6KiK6ih3eGXr3yx9l2bAXbOgrnVUAlFY9TwcA
 j9XKRDkTQEHefKI8AOUVIZ9plbbFmdk5gg==
X-Google-Smtp-Source: ABdhPJxanKvL5oYZx1mpPsdYzX4laWN3nZellftQ/w6H2f/8Nc9gDKJV9J4pZguo1TrME0oKtu7eNw==
X-Received: by 2002:a17:902:a412:: with SMTP id p18mr375152plq.3.1599082968646; 
 Wed, 02 Sep 2020 14:42:48 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id x12sm328863pjq.43.2020.09.02.14.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:42:47 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] osdep: These function are only available on Non-Win32
 system.
Date: Thu,  3 Sep 2020 05:42:09 +0800
Message-Id: <20200902214211.337-8-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20200902214211.337-1-luoyonggang@gmail.com>
References: <20200902214211.337-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
int qemu_unlock_fd(int fd, int64_t start, int64_t len);
int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
bool qemu_has_ofd_lock(void);

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 412962d91a..e80fddd1e8 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -502,11 +502,11 @@ int qemu_close(int fd);
 int qemu_unlink(const char *name);
 #ifndef _WIN32
 int qemu_dup(int fd);
-#endif
 int qemu_lock_fd(int fd, int64_t start, int64_t len, bool exclusive);
 int qemu_unlock_fd(int fd, int64_t start, int64_t len);
 int qemu_lock_fd_test(int fd, int64_t start, int64_t len, bool exclusive);
 bool qemu_has_ofd_lock(void);
+#endif
 
 #if defined(__HAIKU__) && defined(__i386__)
 #define FMT_pid "%ld"
-- 
2.27.0.windows.1


