Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D870C303153
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:33:51 +0100 (CET)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DEs-000367-Tg
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6V-0005ev-BB
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:13 -0500
Received: from mail-pj1-f43.google.com ([209.85.216.43]:53227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6S-0006AT-Qz
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:25:10 -0500
Received: by mail-pj1-f43.google.com with SMTP id kx7so714350pjb.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 17:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9j7Jyu3wauLM62/41PRZiedCHY3SfQgNILuQd61JwcM=;
 b=ijBS+iWqvfB6EDU0UfAHTwks//Rt5wZ4h97z2l7Jf1SFF1N48ItYvMXTcguhiHExzn
 Y9nvqvILZyb/NTCi6NnaMs2wMX9wkTxthFzOLo3iPSd2xTsz66doV4OGYtXbcdktAWly
 xCegxjb7RFQ88K//dpePzZO9i1xmpj10aeTV/OKoiKD0TxPvonO4SXqVPEaNcLb/iYlZ
 oUIYgmKqMhBhLd8lrqqbNyLBR5Jn5deB8B4Jri8dSilm2MlmBxxkx70P5Yeqo6sC2l5u
 AT0zLTmdiyha/Xj3UptbvRtliLGkyRSHxszbKIq7kSFGEwad5cYk26OrWW+h3pgWG4zN
 h6TQ==
X-Gm-Message-State: AOAM532AzkRfkHWum4sA4FuPcG6/DP9lolpzv+KT36zVtxKOIq54T9d7
 cx+l5RDis71YhESxUz3nbPpCnDNb1XM=
X-Google-Smtp-Source: ABdhPJzXFID/qf+AAHrsFCvuVeAbAdqS6Z54hy0eDPl8BiY1RoJ0cKnscDV03wibVvc1Wne56201Rg==
X-Received: by 2002:a17:90a:f98c:: with SMTP id
 cq12mr3073749pjb.191.1611624305563; 
 Mon, 25 Jan 2021 17:25:05 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:05 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/11] darwin: remove redundant dependency declaration
Date: Mon, 25 Jan 2021 17:24:52 -0800
Message-Id: <20210126012457.39046-7-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.43; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index d72ab22da5..1b2fc502ea 100755
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


