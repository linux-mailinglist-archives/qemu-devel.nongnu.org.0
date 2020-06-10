Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2EC1F5E32
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 00:15:49 +0200 (CEST)
Received: from localhost ([::1]:45858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj90e-0005uN-LC
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 18:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jj8uN-0005iu-OZ; Wed, 10 Jun 2020 18:09:19 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38213)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jj8uJ-0008HP-M8; Wed, 10 Jun 2020 18:09:19 -0400
Received: by mail-wr1-x444.google.com with SMTP id e1so4053753wrt.5;
 Wed, 10 Jun 2020 15:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBjzsNa4br6YumlfhI/fK7AgE0UF45xJ7sQ/A8EHTBU=;
 b=LtlR1hq9hyShIjGg6UqyGCFjsIlQcNj1+k02YeKzo9XIU1VjgUymBr1+lh8TlvoULT
 XzWkr9LIn1ekJlRfvvL6wvMWSDRAX/KGIV045cuWgH3B+Jd20xPMxRRaJAVsijYtYo1p
 vpmYU+VUMysFcS1xduY39DMvbyU+q9Pjuga+Iv6H0WGr8RZbVU45WXintjFIEOIquqJ8
 t4NbxyruK01kvYzz0jLigrZiRSJjBcE7X5bRtzD8ik+RxliN2yn54xfuutG0qCTCRjC/
 bTH93pirU9XIHZCGdU+nmiv+Djw4Wvn7BUCeVB2boVsFhbWbN5CTdA4EaSuuHV7VRzCn
 S3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vBjzsNa4br6YumlfhI/fK7AgE0UF45xJ7sQ/A8EHTBU=;
 b=gnaCzDZw93SudCFkpkhQjiTWOxT1wazpYByFerfwk+OqHlfbeX7GOGIfn5ofSQvZ0Z
 oDSrXo18L6TTbd736kh1ergBb6xLDBuzxCBEn2ve4qfExlQ7evmcWbxLcJ0ogzSJHlcZ
 /sCA2I5ozlwgFy4gt67LAL1KSKS/Qpj9hO/+50FA3WgOs95ZTOAF+w0lhmoj25reJNdi
 2ydX1E8qnkuXvTmdSxtAfjNHVP6EDiAaFi5fLzFmmL2S2FwNsTGPBHjdytjaA/tnJHd8
 Er52pgYFAwBfYzkyXNyAa0ga4GCgIVEOs0WgHd0hqOFDx11M6fCvVnLJpIOEXlVtGdFg
 itGw==
X-Gm-Message-State: AOAM533XoiyoZ+EzFejXFHFTkmlgz+q0R+7jSxcchiUHVxv2WtWD61l7
 cx3FHon8VZRuiXXUMcaeQliDdTr6
X-Google-Smtp-Source: ABdhPJw655xtBKAdqpnMfcNXFHnJRtD4xeIzXquo4lLrm1eAVx0+Pstusx//u63CWxjAlh6Ft220mA==
X-Received: by 2002:a5d:4bc5:: with SMTP id l5mr6066165wrt.104.1591826941748; 
 Wed, 10 Jun 2020 15:09:01 -0700 (PDT)
Received: from x1w.redhat.com (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id 40sm1819354wrc.15.2020.06.10.15.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 15:09:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/11] MAINTAINERS: Cover 'hw/sh4/sh_intc.h' with the R2D
 machine
Date: Thu, 11 Jun 2020 00:08:46 +0200
Message-Id: <20200610220853.8558-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200610220853.8558-1-f4bug@amsat.org>
References: <20200610220853.8558-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 81527b94ad added hw/intc/sh_intc.c, complete by
adding its corresponding header.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4e27acd26..653fca1da8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1255,6 +1255,7 @@ S: Odd Fixes
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
 F: hw/timer/sh_timer.c
+F: include/hw/sh4/sh_intc.h
 
 Shix
 S: Orphan
-- 
2.21.3


