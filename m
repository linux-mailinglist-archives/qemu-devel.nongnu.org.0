Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D033320B12
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:48:03 +0100 (CET)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq1i-0004Ri-8M
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppn-0006bA-5L
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:43 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppl-0002mk-9M
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:42 -0500
Received: by mail-wr1-x436.google.com with SMTP id h98so11532391wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7FzUWgPpmSJZkPTExnEQPI5szq/O1dFay0LjvrSkVU=;
 b=TyTM35sLXK7H5jAQKkF/oCNmWOsxKzEqrtX27C3DQId3bXtHe9FLIxkZDdNWpVNazd
 lRquG3izleNP7A7e3wzitOa1AR7GCyf2ojaf5fzx3HSRUXaEJkGbb6bIUSiSsUEW5Euq
 jWH17i/1RdmAjhAb+OD35yAFnCpfLJNFG6LWkawIeJxTYWJ34ZkHGTidXi3tZKmzePcv
 VBgzAlkg3V6Pqg9+R7xnqsl1FATTSr2QsoH0r7sGuPknlHv7yDRgRFVxXcJJUXCLyAbu
 5vyU9CQRWyutM7FlsK6uNn657gDO4/boI37rA8Qga1LKCwgcHS5LeAWa29ml+Ypv1Z6V
 VGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I7FzUWgPpmSJZkPTExnEQPI5szq/O1dFay0LjvrSkVU=;
 b=gl5lYZS/bjbuydvePwNmsV8/jJ15UnCKQuaHqUsPXpm7cC0maQlDt0nk+nrPkWV+C3
 VZhUxW440Co4TxWbbizCrcx2smLniplAhQeJj24RMhCjIVpYEQ4wewubp5xQeBKq6HZg
 RNlODZm95mZ1M4k9SmxcO/zSmlJdO3+hSysbvGUmT9olTAGfXKpWUfnAKUJsNvrU9Xjb
 SKFwx7J4Ypg7TMAErVz/dULnlckp/zykevZ3Vaw8Re+Y5seLBwF97osWq5Du5ojkNMP/
 R5xAvwOYuExJze/DcDNkp6VgiddVmu4aWzMkZnUk8wB/UCUYsK5PKtTZhgfaXhMV2sk0
 I3sg==
X-Gm-Message-State: AOAM533avsHuM3E/WJhgKuCPpV9+AeqApssKKswhokuMRsutpBpJO1oc
 0DJ16bgIgBOWP6+vIiUntYx64l5/PRY=
X-Google-Smtp-Source: ABdhPJxbbfFoS0byAptYvE4PCbKlzhAhaiEU6iVpv5ggkHJUEdHA/+0AtFaP/PZ+xTCxUyglVu7XGQ==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr17107623wrs.206.1613918139126; 
 Sun, 21 Feb 2021 06:35:39 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l7sm25547127wrn.11.2021.02.21.06.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/43] target/mips: Remove unused MMU definitions
Date: Sun, 21 Feb 2021 15:34:02 +0100
Message-Id: <20210221143432.2468220-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove these confusing and unused definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-6-f4bug@amsat.org>
---
 target/mips/cpu.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index b9e227a30e9..9e6028f8e63 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1220,22 +1220,6 @@ typedef MIPSCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-/*
- * Memory access type :
- * may be needed for precise access rights control and precise exceptions.
- */
-enum {
-    /* 1 bit to define user level / supervisor access */
-    ACCESS_USER  = 0x00,
-    ACCESS_SUPER = 0x01,
-    /* 1 bit to indicate direction */
-    ACCESS_STORE = 0x02,
-    /* Type of instruction that generated the access */
-    ACCESS_CODE  = 0x10, /* Code fetch access                */
-    ACCESS_INT   = 0x20, /* Integer load/store access        */
-    ACCESS_FLOAT = 0x30, /* floating point load/store access */
-};
-
 /* Exceptions */
 enum {
     EXCP_NONE          = -1,
-- 
2.26.2


