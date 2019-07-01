Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4035C4EC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 23:20:58 +0200 (CEST)
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi3jM-0005j9-71
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 17:20:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45833)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3FR-0002RV-N0
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:50:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3FN-0002HZ-Jy
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:49:59 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:50956)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi3FN-0002Cr-BY
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 16:49:57 -0400
Received: by mail-wm1-f51.google.com with SMTP id n9so838463wmi.0
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 13:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+7unfHKTxn3c2hGaVv4Q2qP6l53QsTHsGlRUyP5LU9c=;
 b=JNkzR0iGBGjjf6e8ygg+wjGKfO3n3XNjfWA//2X/iZj9L5xnYBe1q1WxphqrM2moCO
 kWYIoKVj0Uu8YRIINd4nC0uIpyiadDK7D0BYgIMHiSQRMNm3rQHZ9Nrpdq+yan3lBaPa
 ENuW/sPBQD6X3N8xiSY285kt2ZERkf3D6NEOhTG4iLvMe5Q80TKkRWmZxAupb5Ck+hUF
 IzmvvNzfxHLQnPpyK6SGDlpMsnOZ3NF1P0HnXF3w9LSuaUgGJ29oKnYqri2cw47oouQU
 hobZ9pssvW+V4RxKSNKTLbCZuw+ksB2+Qvpog2BU34rr5a4vP3gWm/f8BlnVWMaZmcqs
 9aXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+7unfHKTxn3c2hGaVv4Q2qP6l53QsTHsGlRUyP5LU9c=;
 b=CXjHFuwWEA2c2uNPpAgI66NwpNYETy7518+n+c3EOMBlDdN9S0/j4l4QWyaCXWl0/N
 DXDNd6YTXyEFJ8sR8MjsAZyvMzo1jZ9wHteuIq4dyVxxz3GC1a/30o1Cg3ENwqvMD0KW
 ToT8IPMkGn3vuOwExkNjSv8n0bcaBkjIVmnKaDxLMyiUwmdFuSTINiMIQYq7zIBmpJXp
 k9dEQ2Mlj+6J5aPQPmraJOphsf86z4JNXkQB7pE+iSP93FYlYIjjwS07TOdXiPGk/1nA
 aiy4ovkqNZf1pZVNOxlYc4BzJWdMciWJLMoAoMMKH7d4IO8wFXL+Ya/6aVCLRndreWHP
 n0cg==
X-Gm-Message-State: APjAAAUFWMMad0FlpJxwYEOKMkeq52UXtVofzOeREJBOrdIrBmiTsQn8
 GvPVCw4LP8CiKs8LLCmxV/RnnexNizm3AQ==
X-Google-Smtp-Source: APXvYqyNf3bw12HSw7FLP1cc3DdxCj3oA68IVlM4Lcq9TZNifUN/kk8GU3FWIa45RScAnWZ7bKOjEw==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr145598wmf.60.1561999186444;
 Mon, 01 Jul 2019 09:39:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o6sm26573508wra.27.2019.07.01.09.39.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:39:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 17:38:58 +0100
Message-Id: <20190701163943.22313-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701163943.22313-1-peter.maydell@linaro.org>
References: <20190701163943.22313-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.51
Subject: [Qemu-devel] [PULL 01/46] hw/arm/boot: fix direct kernel boot with
 initrd
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

Fix the condition used to check whether the initrd fits
into RAM; in some cases if an initrd was also passed on
the command line we would get an error stating that it
was too big to fit into RAM after the kernel. Despite the
error the loader continued anyway, though, so also add an
exit(1) when the initrd is actually too big.

Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
DTB off the end of RAM")
Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190618125844.4863-1-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index b2f93f6beff..1fb24fbef27 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1109,10 +1109,11 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
                              info->initrd_filename);
                 exit(1);
             }
-            if (info->initrd_start + initrd_size > info->ram_size) {
+            if (info->initrd_start + initrd_size > ram_end) {
                 error_report("could not load initrd '%s': "
                              "too big to fit into RAM after the kernel",
                              info->initrd_filename);
+                exit(1);
             }
         } else {
             initrd_size = 0;
-- 
2.20.1


