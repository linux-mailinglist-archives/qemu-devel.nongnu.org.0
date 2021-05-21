Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D038C893
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:45:58 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5TR-0004Mo-HW
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk5Rx-0003LT-5I
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:44:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk5Rv-00077Y-GC
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:44:24 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v12so21132258wrq.6
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJ9A8NSOMHlWWLTXVU0zVnALuS6z/ApiFuTPwQSqqso=;
 b=y0Fu++nEBK2wfWPVDdeDuuKVBl0SkVo6yYad13q4G1jMivkvwIISUwTLJUvmZw5GhQ
 FdAk7gVhcQRGfcBMCBW+R6EKOvsMTJwAn6/zbn39pcP1SOU97IeKSyuI9I+PCyzg4i+c
 dZdp72gl7NOrtp+rX4BXoqbnzknhVBp+lc25WFCmjQY7ZsLfclJrtIFyocASjW2EGq/f
 94Ew94k43LcsddEsof8pqjgDZZX1gSiOYL6NU6D3iWuPLNf7MIl3qd/rqbP5n+vD6U2M
 8pKCsGB6/YACkQF5UKTdoDaJXXB9K48/qf7Ec+gcpOEqL7uV047jZP/OGJm4wHvGCWfz
 ysWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJ9A8NSOMHlWWLTXVU0zVnALuS6z/ApiFuTPwQSqqso=;
 b=qDxsmMD6qy5BLnxV7AXy/tX9Cb+iq0HUBbB3fevkJZuuwNH6Duxdq+kGrpwTLUX+v4
 nliQH51FlybKVakzWX5lCy1f0/lxxgN9vfn1hHZ4ngOz5nkkC6NGhqR9MHlyqs9H0tw/
 xfyyazfzhNw2bS5DfLg+k4OwtV1vMbkJP6Q/+xF6HWzdmFY9PDdRCfciFu9Z2wKNwymr
 6+3l1qE1xFZtXxbTDx1pUPTZk83n3QLTbyzCkMWQcO+5Cj/uC2nMsv6TAIs9mSX4D64T
 VLRjhj0d/gw1ziBAbgoE0Xc32Zoheek8xGlrYucpNZfEltMnFKzpvUH/yBMggN/LCiPj
 gQvQ==
X-Gm-Message-State: AOAM533WrFyareNmFVCzeqXFC60/bjPuEEChkjkv7nnsw53F05XS+Yam
 cjUsyOj3hpciuYvJzp8vH4E9lA==
X-Google-Smtp-Source: ABdhPJwZWNbEegLNRpFfgry+Ukb5eGqKku5XKUJLNlVMUAlO4TNUDeyFPrH/hDcyWjD8InTNdzf/IQ==
X-Received: by 2002:a5d:658f:: with SMTP id q15mr9540618wru.399.1621604661515; 
 Fri, 21 May 2021 06:44:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v18sm2717927wro.18.2021.05.21.06.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 06:44:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D27FD1FF7E;
 Fri, 21 May 2021 14:44:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] meson.build: fix cosmetics of compiler display
Date: Fri, 21 May 2021 14:44:11 +0100
Message-Id: <20210521134411.31658-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you specify something like --cc="ccache gcc" on your configure line
the summary output misses the rest of the cmd_array. Do some string
joining to make it complete.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 1559e8d873..ca65552f31 100644
--- a/meson.build
+++ b/meson.build
@@ -2510,15 +2510,15 @@ summary(summary_info, bool_yn: true, section: 'Configurable features')
 summary_info = {}
 summary_info += {'host CPU':          cpu}
 summary_info += {'host endianness':   build_machine.endian()}
-summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
-summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
+summary_info += {'C compiler':        ' '.join(meson.get_compiler('c').cmd_array())}
+summary_info += {'Host C compiler':   ' '.join(meson.get_compiler('c', native: true).cmd_array())}
 if link_language == 'cpp'
-  summary_info += {'C++ compiler':      meson.get_compiler('cpp').cmd_array()[0]}
+  summary_info += {'C++ compiler':    ' '.join(meson.get_compiler('cpp').cmd_array())}
 else
   summary_info += {'C++ compiler':      false}
 endif
 if targetos == 'darwin'
-  summary_info += {'Objective-C compiler': meson.get_compiler('objc').cmd_array()[0]}
+  summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
 endif
 if targetos == 'windows'
   if 'WIN_SDK' in config_host
-- 
2.20.1


