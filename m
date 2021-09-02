Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1713FF822
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:57:12 +0200 (CEST)
Received: from localhost ([::1]:33328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwZz-0003et-J2
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR0-0006R7-Av
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:54 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQw-0002rl-2L
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:52 -0400
Received: by mail-il1-x131.google.com with SMTP id i13so3575150ilm.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lv7qzc+bwvqvCUY7KRQHdm4K9UxT525dj3NdW6F5N3A=;
 b=gB0oKhkH/qYy84CM5DsJY7ITJBc2abnaYQMX4PMBpZUtLuft8B4dzUuXx2euimA2vP
 WclEOONnBOzdXE45Ny/+voftXrS1P/nl5K0gul3WmgBWiBsJo11aZWWzpgz8JZttFkNV
 7N6q3MugC6IaezUWQ4g1KqfobZE3Fs4VGVMusaJQYcaxHhR4rslZruKSGDOeCEwyMts3
 vrNV6FJ2pVpNoM7wzc/+KkrazDdyA1CPmCeXXs/XBY+jkYukeAnIxJ7Qn+vrcmxS5/DK
 YE5vVc1f6X9NggWWtXGpeol+BQDxkWIlxs5cDVUXJDI6zukNS578/mwbQ3bCtrj8fI5Q
 wqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lv7qzc+bwvqvCUY7KRQHdm4K9UxT525dj3NdW6F5N3A=;
 b=S2/LyDkn6NTgtWTgi4v/cMwUX+HxwMVuCdg4+FA+ZXPn/BjbAkz52acI8BMWwrhsjH
 duqqd3SoyyH1/lhdQT25pyNpohubAec+445nU6Fzc6XKuK8jOjV/N9dktUW/pDulXUMd
 0SJnCYvM3kZ6r4qULqSQnPNytGK0oP53JwPQs10KnNfON72ZVsmOyULBUk4+IyX4zoUy
 2bwuZ/i/zYtbEEfu0CPgpzRA1bSG4HgUOkyEDc8/ndhxpUqXXlqytRSVc8wyJtQL2A36
 G87phsnxPur41lF05i2h7xSjq8Vdxe9HhAhKallK6PYtqQEMc6+ywdbN6aynZmqyzwxv
 JLUg==
X-Gm-Message-State: AOAM533bul0NQdyzkHmm3dQ59tEOuaHkYc9hBeEdFgG6SfYIwo4ZEJBB
 D19Faz2v5DMADzTw4fMPRU+Ns+zqs1KpYg==
X-Google-Smtp-Source: ABdhPJx2i64kwHxXGtjWHTGp2Fd+g78KfKO3qlCfPLb9UPQ+7Zh08kJtYBCc/DWHrryc2m/uJiD/7A==
X-Received: by 2002:a92:4453:: with SMTP id a19mr498513ilm.221.1630626468709; 
 Thu, 02 Sep 2021 16:47:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:48 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/43] bsd-user: add license to bsdload.c
Date: Thu,  2 Sep 2021 17:46:50 -0600
Message-Id: <20210902234729.76141-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Pull in the license statement at the top of the bsdload.c file
from the bsd-user fork version of this file. No functional changes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 8d83f21eda..0ade58b9e2 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -1,4 +1,19 @@
-/* Code for loading BSD executables.  Mostly linux kernel code.  */
+/*
+ *  Load BSD executables.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
 
 #include "qemu/osdep.h"
 
-- 
2.32.0


