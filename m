Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553033B1FFC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 20:04:01 +0200 (CEST)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw7EG-0000t4-D4
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 14:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BQ-0006Be-KR; Wed, 23 Jun 2021 14:01:04 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw7BO-0003GG-3v; Wed, 23 Jun 2021 14:01:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso4551874wmg.2; 
 Wed, 23 Jun 2021 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=38tjkOtpDj7Jt+1SzgW66IDc7xTuH2HVLPQ4omiT2BM=;
 b=HrsUhm5mySjSRzOLuc5DZV89rEq3nWfDdB8P+wP95W0zOaO1XLojGrtWkIJWyjztOg
 Jb4I+tCf1ZCMLmkthklTJs18A/lehQUnANStF8b8YJqcSBbY0qetmLvBTJX6xLgewHYx
 fX1VJ40mZoE01ZxY7dBlyqOl+GjPvMhXtpRKuN5qqH41jOXWzPmF4df0I5miFW3OL6J3
 smYkouHkvOHrELpByFkEQOb6NPOhQVcJ7mh+zOG6mwnPQPqh07YIp5eC+sjkq9WNbJs4
 Gb2H3B2u7lKvJkHmBytgw143fAlZWexbRQ3lr7E84INUZaXVCcYCFN0BNm8Gc707pi//
 zaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=38tjkOtpDj7Jt+1SzgW66IDc7xTuH2HVLPQ4omiT2BM=;
 b=p8O2FQ48QB7m8zeUVhoEYizgU4D45215aDA0rpr4SHR6bOoT9WHpzJpTsm86OLwYI1
 tfVYbQj7OGnjEC1iWD1dLF02FbKx57VCaeMCh74fXZAQsb3FqaDeyRRxksGQ5UVcnMp9
 EqsLOtA/cfzdlqoU4fRfDG2JLhOhn6RuX4157yFYufZ1uSN7w1Pzus8tIQAdibWofLpA
 sXp1JjfoWjNU0MvGuz3J8GrhNCONEajyQWoBlr/P1SOF3n3K0J59OpHSv37xBkA+Abqw
 4Fdwb8ssrTrIryTlMdn2b+Q9PgTvrLDfVjyzyNK7iuMX6qImrwGqXEFZvMmuIuLfg4wS
 rFiw==
X-Gm-Message-State: AOAM532P75whPHtKZThRpeBLCH+uCpNIZzIfXmlw5LS+liF9US4WSzrJ
 VwqAgltd74d272d5/IAq2pHrq0qBl+JHtA==
X-Google-Smtp-Source: ABdhPJyir63VglhgSkJ/SWM38Soz/fCKo2XbTNHw+888qwTskB3AQeittkwWbB85Vo+H5XTa+GvXRA==
X-Received: by 2002:a05:600c:2d45:: with SMTP id
 a5mr1042451wmg.161.1624471259654; 
 Wed, 23 Jun 2021 11:00:59 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y13sm625799wmj.18.2021.06.23.11.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 11:00:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 7/9] tests/acceptance: Do not expand SD card image in
 test_arm_orangepi_sd
Date: Wed, 23 Jun 2021 20:00:19 +0200
Message-Id: <20210623180021.898286-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623180021.898286-1-f4bug@amsat.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Tom Yan <tom.ty89@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

XXX it seems to work...

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index c4c0f0b393d..48c0ba09117 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -783,7 +783,6 @@ def test_arm_orangepi_sd(self):
         rootfs_path_xz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
         rootfs_path = os.path.join(self.workdir, 'rootfs.cpio')
         archive.lzma_uncompress(rootfs_path_xz, rootfs_path)
-        image_pow2ceil_expand(rootfs_path)
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
-- 
2.31.1


