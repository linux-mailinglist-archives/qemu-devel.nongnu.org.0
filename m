Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080C04B38E3
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:14:06 +0100 (CET)
Received: from localhost ([::1]:39842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4Oq-0000Xh-RO
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:14:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4NJ-0007rz-Ct
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:12:29 -0500
Received: from [2607:f8b0:4864:20::634] (port=41885
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4NG-0006O2-93
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:12:28 -0500
Received: by mail-pl1-x634.google.com with SMTP id j4so7779787plj.8
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQd95tEk1d6xpxWj8DwBPzcLSrmupoSBm9XKi4UKwOk=;
 b=I0ALXLTTnBxjA3J/8wnv6YPzYgJ8/bRvzW+qQEmvDUoYUUEOwJGfQloH6sw6dmTdKu
 mo4ORNBpe9zQojZ8lb9/lJ+XjIlHTmbuoXdgCo/JMe7aTdcKzSBJcxhPvxdarrfuMeYa
 onEbDErpQ/AbkIVJ5OaelVPOZduy+xHT7sTUksNMRG3DsmM/oD7kOLu/m+7reALT989h
 vBiu3Kda11q8b2jfLjaEEG/Q848AVF0SHTdd12fJDfnx6bf2RJ/JjxmB504ogmJaXlqB
 3bwXo4QqJcyhoJLgc/hKTE5+hgZGbP7y2WxKI8cp8hBAmKwg+pxM7clZ0FTffaskOu0Q
 uOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQd95tEk1d6xpxWj8DwBPzcLSrmupoSBm9XKi4UKwOk=;
 b=HWEbfEo8PHGaqo2S874K6nf+0FV49Tqu1u8mITvWBLd5dernYTZwWO/J5UPDK/zXBv
 cbeK9G5miSXxpyQoox9q7WJ9SFo0F5HVkpzhLnLhkNHPLwzGQJ4G8nBBo1Mp9w0Hnbxa
 dxDdMLzltOBnrIITmW+kZLWNgX+8AcB95kh7vQCWDhzvsUWTrRTioQanM42Gg+IiLyrL
 NQUm12oCf9M6g2eDtcOPUNY0tm6BMc05mrftKebyLBYijGeXk2NQ/Mcln1MqEbm7Q3x/
 Ly8OEw/MybpPV69vkCcTzS11JQ3a9Zy4mSgv+FC/mk/9/5QIOJAePFOVG38Z/8hKZtGM
 DvYA==
X-Gm-Message-State: AOAM530Si8C2BKI6eRcfPLQT+xjpyT8dlPl9FN2/Z4p8v2rZV6KhyMIc
 VI+/v/5ghOckNjt4LeLF7O255AFNny8=
X-Google-Smtp-Source: ABdhPJyoLySqm0CL3p3kFw65ZXqlF0naeaBfAQOPJsch7b4GOAkTNC1G2fy0dLHHQRYdvoxhEiqxpw==
X-Received: by 2002:a17:903:40ca:: with SMTP id
 t10mr8032988pld.121.1644718344905; 
 Sat, 12 Feb 2022 18:12:24 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id y10sm395339pfa.132.2022.02.12.18.12.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:12:24 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] MAINTAINERS: Add Akihiko Odaki to macOS-relateds
Date: Sun, 13 Feb 2022 11:12:15 +0900
Message-Id: <20220213021215.1974-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fd74c46426..5aefb5b431a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2333,6 +2333,7 @@ F: audio/alsaaudio.c
 Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
+R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: audio/coreaudio.c
 
@@ -2585,6 +2586,7 @@ F: util/drm.c
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
+R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: ui/cocoa.m
 
-- 
2.32.0 (Apple Git-132)


