Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B30301326
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 06:00:21 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B24-0003ia-1b
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 00:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Ayb-0006xO-Dw
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:47 -0500
Received: from mail-pf1-f177.google.com ([209.85.210.177]:37125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3Aya-0005rE-6X
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 23:56:45 -0500
Received: by mail-pf1-f177.google.com with SMTP id 11so5182840pfu.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 20:56:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M6Dkfzz2uwZnsdtAWpa/2Lp0RFHpqr85gTbmXPeFpZw=;
 b=mh+1VcYXvJdDL99Eyo3vK/P0EFt1t0Nct6OCXW22MJjdC7Kg0SGnIkKxQ9JmaPqElD
 +hG5wy0yd0DlqgbZ6eOIrtXcQqyo7Tg5GPk3h4pJxAC0JsD4pIRsiOmCTVdlEobmSO9g
 GMOXTEByoRYFw5/l2lJTzE7+DA3AroRoMHJNDOJhXFFAZiu6urio3JT2C0dYNlt1lF7t
 bVFe8Iy4q0Qz1SDvwh2rbJFPmaftz3uyXtHS6rIMXuchnqvjNk23oxkVKtEcFtaLgZEr
 I1lvkYwSuxVYOVKH0zUTqTfgENeZbRcWdRTAwH8110LhZRvDY0Ov5ElmXQV4Eri9itUW
 3XQg==
X-Gm-Message-State: AOAM530rI77qqrGG04s0pDDtwxz02Kl8KVyHOpwIf1EAdIAmmG0mveJz
 pa/MXkus9lgvy46mhJ+Il1iAn18/KFM=
X-Google-Smtp-Source: ABdhPJxSghe+GMlCMuaick6kbpp9bYbykFMH7jvZER4T0OYvKcOzyOWck78K7q7HZ3GOgDu00NiMhg==
X-Received: by 2002:a62:52cc:0:b029:1bd:e13a:fc1b with SMTP id
 g195-20020a6252cc0000b02901bde13afc1bmr5306670pfb.46.1611377802921; 
 Fri, 22 Jan 2021 20:56:42 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:42 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/11] darwin: remove redundant dependency declaration
Date: Fri, 22 Jan 2021 20:56:27 -0800
Message-Id: <20210123045632.18482-7-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.210.177;
 envelope-from=osy86github@gmail.com; helo=mail-pf1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson will find CoreFoundation, IOKit, and Cocoa as needed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index de7487a0c7..0fd3f14c5e 100755
--- a/configure
+++ b/configure
@@ -781,7 +781,6 @@ Darwin)
   fi
   audio_drv_list="coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
-  QEMU_LDFLAGS="-framework CoreFoundation -framework IOKit $QEMU_LDFLAGS"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
-- 
2.28.0


