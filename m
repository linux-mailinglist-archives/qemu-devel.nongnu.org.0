Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200512F7DEC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:17:29 +0100 (CET)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Puq-0002NG-6U
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEW-00017n-JB
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:44 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PET-00084z-Ed
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id e15so1221666wme.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZE5uaIwLZldq7vEhz62Qdeapora369YG0j9BYJ0Rp8=;
 b=n4EoICc9z8Y/ZjPva6YEEFmJydxGhq3xJ2lMq0QJ56E3Y+TnLj9amK4CyqNgRHX5+B
 bsUdDdD/ZZAZ90yD2OPTc0dt5EP5ViZLC2GxZMsxd6EnmE9ot8WahPuwuVbGS6S1RqdO
 HKL4hWDqvH8U+loxmLnWRNzTmzC7zNt5fpje9okCkOwjkCKLomOE33ui9D1954Da+cvj
 fgPLqMoQnUFqf50o32boTft2vm4xwiEh9xL6BaYjkdae9xeigTOMHGEFy7L8hjEgLRr3
 rUlJi+Jys7r0xmW5V6HqPlNzbyRyAoUQ9qgF+ilGr05rT2KwCUnLsQD8koxrMcfomphS
 3zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZE5uaIwLZldq7vEhz62Qdeapora369YG0j9BYJ0Rp8=;
 b=ZJodVy4irbTERt1Y8rnF3KHGezj3c2V2orJ/qxoCWbr3z++VB/d+u5n0dNnYyCN0Qz
 iKJpGeSHGq3f9d6gBWTYIxUR9qBs+LKhuhHrKdO3Lese7APVZlt4viHaJX99B7OSWgiV
 rtoLXfLuuMdlNfm/yvAXqMTcO0Cpeo1QM1Sho3BOx3JP1BkCn2kPaSCi7DGyQrXhTYrV
 lIH7W6bskcdJe0mxaCK1GT5HT8dh1ncD3YTzMDrNFubJhm/on6Afd8zxWAUZ7+XiwNE9
 +L5JRHk6RGCiqpduEFgrhVkkR56q8sDPnFMbD/4hTZRBrM2axX7uVZ9Im1lWCpGVYsN0
 P2tA==
X-Gm-Message-State: AOAM532f8ObeuYV2BdecmxOtBzqCmG5b/kLjL4/1hf6ifvAspP6DxYej
 GnrP3EKCmYpH5l90PNRPH2oQ3g==
X-Google-Smtp-Source: ABdhPJwKVJDsaCcgfd5dUrPycUYvVhEtGLujiL22rjezGTjTLRssjFjYuDgfGffIbCSko/KERfayag==
X-Received: by 2002:a1c:9ece:: with SMTP id h197mr3054045wme.76.1610717619674; 
 Fri, 15 Jan 2021 05:33:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c4sm12625486wmf.19.2021.01.15.05.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A5361FFA9;
 Fri, 15 Jan 2021 13:08:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 20/30] gdbstub: ensure we clean-up when terminated
Date: Fri, 15 Jan 2021 13:08:18 +0000
Message-Id: <20210115130828.23968-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you kill the inferior from GDB we end up leaving our socket lying
around. Fix this by calling gdb_exit() first.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210108224256.2321-10-alex.bennee@linaro.org>

diff --git a/gdbstub.c b/gdbstub.c
index bab8476357..8c301edf32 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1978,6 +1978,7 @@ static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
     /* Kill the target */
     put_packet("OK");
     error_report("QEMU: Terminated via GDBstub");
+    gdb_exit(0);
     exit(0);
 }
 
@@ -2539,6 +2540,7 @@ static int gdb_handle_packet(const char *line_buf)
     case 'k':
         /* Kill the target */
         error_report("QEMU: Terminated via GDBstub");
+        gdb_exit(0);
         exit(0);
     case 'D':
         {
-- 
2.20.1


