Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24A2454ACC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:18:41 +0100 (CET)
Received: from localhost ([::1]:45600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNdw-0001BC-Ka
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:18:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQS-0000kJ-1F
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:44 -0500
Received: from [2a00:1450:4864:20::434] (port=36481
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQQ-00035H-JF
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:43 -0500
Received: by mail-wr1-x434.google.com with SMTP id s13so5688590wrb.3
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/A8dNepwkmZQUjVDq9nLnqwpFSL4s0WWo1frLw06AU=;
 b=qAzw3ecy+t2yzm5NexeiUorhWCkC7lXo96CEMAs4YRRKaod0/A1T3gDtJZ24ru/tcu
 Qthrcq6NKXP2gdvj6lCIWewby+sDP23yRQHKoQWp2THK208ddUygkvXUAveXab4Y1gWU
 0+LISYQZJss3Db24DBypYW9/NOMsxgqp2d/RESB68SDTLeR70k5pzeTgjgg+RCtpSO+n
 cHLBYRK10lgY5BlkabMdPDBX+w3xPEQ3W9WHTjXs7Op+y9CFhOhDsR+XLBWxhhZP/GRo
 L0cORfS4cmRz5ZuHlPm3Teq6+RGM9DeJtlG6Eg4PO4Bmf8D5303Qvr8C/Kevgf+I/0pj
 o8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/A8dNepwkmZQUjVDq9nLnqwpFSL4s0WWo1frLw06AU=;
 b=8DJhNnecoy8Gk2D1IPl9CPWlgbSCa82x9p5Y8F+TZRz0fSlukVgWPJMnsihV4SVlUT
 qZkCSFrAVMifYXEwsqaKW6yuR4tMHceScUFxDOxwicruqexuzAD0KB+IhPo+cYD/1aVP
 DxBDuSLApohfpECRHEr5DVWgIj5tuUwA6rgYKwYJD25T7YroRwtw3ZFDn7wV4T8z5WRM
 Tp0BbrlvMTVcGFT3ViZQ05hoHuWBmc8/btT5xmz1GyH0Vdc4f/xmifRlDENaL4fe/ILz
 yPDlnknrT5RTGnCCiFNE2yz9hAT6n0n5j1/R2BtDcGRgy1FVlasY/tkFA69KCmZHBA+M
 mpsQ==
X-Gm-Message-State: AOAM533qMC8gBFozMPYu+2FouTXy1v+PCBOldVVTkUQ/MxAoJLp4fJWK
 pgVW5HJM5nGcgLaRc1FEXlW/sJZZ01NZVytpZLQ=
X-Google-Smtp-Source: ABdhPJyh0W2j9NtENvfUG2cokkbuqAdN4GpaS1aViHGzofYrTlAeaXJ3FjB8xhG2jCljyRQxGr9kqg==
X-Received: by 2002:adf:a2de:: with SMTP id t30mr21353133wra.58.1637165081296; 
 Wed, 17 Nov 2021 08:04:41 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/17] meson: Move linux_user_ss to linux-user/
Date: Wed, 17 Nov 2021 17:04:11 +0100
Message-Id: <20211117160412.71563-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have no need to reference linux_user_ss outside of linux-user.
Go ahead and merge it directly into specific_ss.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build            | 3 ---
 linux-user/meson.build | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 9f59c57909..ecc181ea13 100644
--- a/meson.build
+++ b/meson.build
@@ -2363,7 +2363,6 @@ common_user_ss = ss.source_set()
 crypto_ss = ss.source_set()
 hwcore_ss = ss.source_set()
 io_ss = ss.source_set()
-linux_user_ss = ss.source_set()
 qmp_ss = ss.source_set()
 qom_ss = ss.source_set()
 softmmu_ss = ss.source_set()
@@ -2614,8 +2613,6 @@ subdir('linux-user')
 
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
-
 common_user_ss = common_user_ss.apply(config_all, strict: false)
 common_user = static_library('common-user',
                              sources: common_user_ss.sources(),
diff --git a/linux-user/meson.build b/linux-user/meson.build
index fcf7d40f23..b89534c49c 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -2,6 +2,8 @@ if not have_linux_user
    subdir_done()
 endif
 
+linux_user_ss = ss.source_set()
+
 common_user_inc += include_directories('host/' / config_host['ARCH'])
 common_user_inc += include_directories('.')
 
@@ -42,3 +44,5 @@ subdir('sh4')
 subdir('sparc')
 subdir('x86_64')
 subdir('xtensa')
+
+specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
-- 
2.25.1


