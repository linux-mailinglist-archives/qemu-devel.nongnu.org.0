Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7688B2747EF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 20:04:27 +0200 (CEST)
Received: from localhost ([::1]:54230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKmeQ-0006Py-7Y
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 14:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kKmOW-0007xl-55
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 13:48:09 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kKmOL-0004KW-7m
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 13:47:56 -0400
Received: by mail-pg1-x532.google.com with SMTP id t14so12557828pgl.10
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjVvqo8ZN1svnaE4XjyeOaQhSPIhylYmlVezwsCJ1nc=;
 b=fe241jQt1CLM5drVljMaKw7BmUENOHX1OQIzxLY7Lo8knciMmnVGe3D9G9RCfEML6p
 uLKR6SUk1xc+5tmbZPHa6UBvk+68sLYhrwb007RcXobJIKmbj9Lv49o8g2DKoJP+eSJ+
 CiBFHNI2FiiUWiajDMp7/R+1am2WUZVyHrA7OkUlbr/P0m8gPo5dJWWuqOAB1JYI+jLh
 z2EPAJE/Cq3EXmSJLycmJ5W8EVrPZzUax5OGY8BBdGvgW679vfZkGhOFyLAWO9S36/iQ
 FjaEzlfSxztO//Y1rxC9FAjGpQ/7ry5MqSZzrdWxg2hHNjq+XE80xTNwRhN2m3QSX65k
 fEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjVvqo8ZN1svnaE4XjyeOaQhSPIhylYmlVezwsCJ1nc=;
 b=qFSByWRhaDtkcrolJqbaZlr2W4MFKknEOD142Afp5C4/f7smfRcWafwRqH1d+363iw
 9YnjEU8S9w1CkWJvYNOeZh4Ku55L7LB+00WAf0+x9cYwElseYZgR5tijXxKufCSLNZmU
 2LaWc8RXAliqCR+keHgGACHMrv3rymaIFaYlJ5e1iczlapuJcCktinEOy1YG5m34/XEP
 yVMqPEPm1AmMK0kp0PHJ7cPnPTwKrZ481kcAUipeGnLSGrbLF3mfwZu+DK2yJbJY7e0v
 v+N7A4gF66tSmuepo8AYWYUtSqly6pLaaRQmbXEoiK0JrFYq1c99HwnE/AnkqcA3RGIq
 pHCQ==
X-Gm-Message-State: AOAM531cINYp5PXzQcnqE8cwkQ/ntM6YQCpn3F4eSBqVN0OUu8vopH0h
 vikXax7HYFlmfdmiW23jqUHl887VbxItNA==
X-Google-Smtp-Source: ABdhPJxLgT9SV2tXvE9EG91wrJGb07wqVJtx4cgIL8tUqgRiKbZ/3re9QYmuBbwpTEAaBPdj0F2ilQ==
X-Received: by 2002:a65:4b86:: with SMTP id t6mr4197575pgq.81.1600796866879;
 Tue, 22 Sep 2020 10:47:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id r1sm14825310pgl.66.2020.09.22.10.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 10:47:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] capstone: Update to upstream "next" branch
Date: Tue, 22 Sep 2020 10:47:32 -0700
Message-Id: <20200922174741.475876-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922174741.475876-1-richard.henderson@linaro.org>
References: <20200922174741.475876-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This branch contains a number of improvements over master,
including making all of the disassembler data constant.

We are skipping past the 4.0 branchpoint, which changed
the location of the includes within the source directory.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 3 ++-
 capstone    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index f23273693d..4c92b43fe5 100644
--- a/meson.build
+++ b/meson.build
@@ -677,6 +677,7 @@ if capstone_opt == 'internal'
       'capstone/arch/X86/X86DisassemblerDecoder.c',
       'capstone/arch/X86/X86ATTInstPrinter.c',
       'capstone/arch/X86/X86IntelInstPrinter.c',
+      'capstone/arch/X86/X86InstPrinterCommon.c',
       'capstone/arch/X86/X86Mapping.c',
       'capstone/arch/X86/X86Module.c'
     )
@@ -701,7 +702,7 @@ if capstone_opt == 'internal'
                                c_args: capstone_cargs,
                                include_directories: 'capstone/include')
   capstone = declare_dependency(link_with: libcapstone,
-                                include_directories: 'capstone/include')
+                                include_directories: 'capstone/include/capstone')
 endif
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
 
diff --git a/capstone b/capstone
index 22ead3e0bf..f8b1b83301 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
+Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
-- 
2.25.1


