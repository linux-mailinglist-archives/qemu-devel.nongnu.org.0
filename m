Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD92BB84D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:29:01 +0100 (CET)
Received: from localhost ([::1]:55972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDxk-0005jU-Ha
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDgM-0004yE-JT
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:11:03 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:37501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDgK-0004XF-IS
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:11:01 -0500
Received: by mail-wm1-x330.google.com with SMTP id h21so11258076wmb.2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7PprWlplgZYOuiiRh5VgMSfZy377w8BTxZUiTVT7Smk=;
 b=LVu0Vm/K2vvoEBLiQtlg4V4b8l4yNikQd9R2Y0bW+hBS0HTsUQ210ZzUiyWKvh7lGq
 tCS5ICFeFvKVAOqgDXp6uM/z2IGZJLPaaVWcR6VU+YFo4NdQe2ZTgBMHaxfZpBk3/cl3
 k+Q9VktMJdKrw7uuqL/U43Wbzml0yreiuqDq/0e8K5s37ASVqa4j5RHZk1PGVat2Mw8K
 oBau/6smcTtEgOjuLu9b9oIPnQSm1mWxHUOSX6PA/4qplMr7peiAZfPKiVhPbFTGaXuF
 Q1hHtwBO9e4wbzEfuzAX+XrgZOGpkqiQyAXxdkSulKkF8Rw8YctU1u4pAjSZ+7BDS9KM
 ofXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7PprWlplgZYOuiiRh5VgMSfZy377w8BTxZUiTVT7Smk=;
 b=qLxVRrwoLBsFyAUoOVIQQpNbT/ZsA9gnIOWpfP4jDC/UMIGyi35j9E8yJbl/yn39va
 Fn8rlg5MWZpuzaOTj8lCVUN50VWGw8QgywyBiESfXBQ3pAn12xiFUfzt2+OBOj81Go3O
 OK1miVKh6QOeFJuabAVzkgJxqJqUfaKjn5W4Eb3TCwsaEYzF4laxhRH3JrWCQuaXfgkI
 LteK0UgMea4ZCaK3PT5aUyJYrcOz8WHHk62p2RnMz1VdOvSDoMw+tykxLCW7CDFYtkKf
 /uJj2EGkZUwBYVTwKZp6pbhTJXkgfYRSpUFL2elmQNUxJ4APQs2aXVVE0th5753TpgeZ
 3zMw==
X-Gm-Message-State: AOAM530ntTUwfu2AqFyTd6i0pd1so7dqYfAaGwyb7XlcHYjEeOiIL26B
 Nd935Ywmg6ZUEA6IC9WELcIe35g9WQ0=
X-Google-Smtp-Source: ABdhPJwPI/tOfENRXAENKeqrhxDcFjjPqz1B/h8IzBpm9yO9zAUQApImySp+byfrDEE/5NW0R228FA==
X-Received: by 2002:a1c:e455:: with SMTP id b82mr11979232wmh.117.1605906658886; 
 Fri, 20 Nov 2020 13:10:58 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p3sm6270483wrs.50.2020.11.20.13.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/26] MAINTAINERS: Add entry for MIPS Ingenic Xburst TCG
Date: Fri, 20 Nov 2020 22:08:43 +0100
Message-Id: <20201120210844.2625602-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add an entry for the TCG core related to Ingenic Xburst.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Adding Craig Janeczek in case he wants to be notified of changes,
patch conditional to his approval.
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index be42b56300f..b6d98b95c47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -247,6 +247,12 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Odd Fixes
 F: target/mips/vendor-loong*
 
+MIPS TCG CPUs (Ingenic Xburst)
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Craig Janeczek <jancraig@amazon.com>
+S: Odd Fixes
+F: target/mips/vendor-xburst*
+
 MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
 F: disas/nanomips.*
-- 
2.26.2


