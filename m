Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE0A1F6700
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 13:45:57 +0200 (CEST)
Received: from localhost ([::1]:56412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjLee-0004HJ-AL
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 07:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjLcP-0001uT-3A; Thu, 11 Jun 2020 07:43:37 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40763)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jjLcM-0001pV-S9; Thu, 11 Jun 2020 07:43:36 -0400
Received: by mail-wm1-x342.google.com with SMTP id r15so4724578wmh.5;
 Thu, 11 Jun 2020 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80floXzvgIJhTS63719Lyq+p7spo/IICK3QTBWax2dQ=;
 b=lfnfqaMCiRIzbgO7NXHPqomug6LPShyPgqR8Ygi/adgYrWU4e8JCx67CJZYDj2pPhM
 KfQYSPY9DuZU7ZpKQwRblMiTTLPa9qnA50sjYMwMJ6CurjYSgmUoqSjM3h24IgwIKAAy
 AWILwarJJZv6Yz0z9M/hceDT7tAqqh7YOQX4GaKTiVPpAiCJ1v5iUoQZP9HHH/W1yPn1
 RgPmHznOFsDnlpfslc3OlBAYL7PUvouvIJtkyvJuQ6pLCUVYkK4VnvRflEoHqipw32xZ
 1ksvkOh5SZSy7tiSKW2kSMyunZnNzkBpyDebPX0xwpvzKuw//+awT/Djw3zXhrKNoQcO
 UF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=80floXzvgIJhTS63719Lyq+p7spo/IICK3QTBWax2dQ=;
 b=MGoC4oGQt3f10d6qcU5KWEwo2AJuZRwUnb4uH1Cl+HuapRMc7ulN/UiqGB24yzaGOq
 dBzYiTN9v+pByuaBm47wgfADX86dQNQqqF21YyuEBi/GmqDwz4akcl7d6LdmoGnsU7A5
 QFehaLpBudAjcZIGsMpTTTMgRAQRjVjObVcT6yMNReEFxpOBdALHWvNZFxRW+RMeetJa
 7WEal2gkUwBHOkqMo32adyOogWqDs6c3KeZ8t/adzZ8kOg4yTTNyi2EypZWdmSYdt7NA
 qN8Kmu+BvCKqGNAUBn6rvU/+hg7wdkO0cL2HRu1jBkIiW4UlDKUNvtojrCB2KZ71VeYa
 VZsQ==
X-Gm-Message-State: AOAM531aTbB8XoZkF9cleH3VXwDs/4XQv565mYOfmZzwrVOaT1cpaGmz
 bLqUjwHlaCtrXjf8ZCJ6NIMP/Gnu
X-Google-Smtp-Source: ABdhPJwjFomuE15rMOEiqO+H/XcwhbxpmXHH3qVCyeuW7ALKPfLyyniudI5iSTmNRPhMCc+sUL6IQA==
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr8244114wme.65.1591875802327; 
 Thu, 11 Jun 2020 04:43:22 -0700 (PDT)
Received: from x1w.redhat.com (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h29sm4832863wrc.78.2020.06.11.04.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 04:43:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/7] MAINTAINERS: Cover 'hw/sh4/sh_intc.h' with the R2D
 machine
Date: Thu, 11 Jun 2020 13:43:11 +0200
Message-Id: <20200611114317.13044-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200611114317.13044-1-f4bug@amsat.org>
References: <20200611114317.13044-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 81527b94ad added hw/intc/sh_intc.c, complete by
adding its corresponding header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 13711aafe8..87ceca7ff1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1257,6 +1257,7 @@ S: Maintained
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
 F: hw/timer/sh_timer.c
+F: include/hw/sh4/sh_intc.h
 
 Shix
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
-- 
2.21.3


