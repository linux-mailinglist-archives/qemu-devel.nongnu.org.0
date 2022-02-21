Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3DC4BD899
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:39:25 +0100 (CET)
Received: from localhost ([::1]:52860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5AC-0000fE-Ek
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:39:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zo-0000Ds-DM
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:45 -0500
Received: from [2a00:1450:4864:20::334] (port=50870
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-00013J-6W
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id k41so9138423wms.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6ix9Jd7ujoLN6zvd7GKMtecksWWqdBl2l3FdxLEHMeA=;
 b=npk26G5km2nutogqIgI+NiUuJjqv31bL/NVqXD4r6JfieEb+9RbsOU3mCCXoPRyvEU
 sXMCLRsyI+FJwYi3eaQ4xM3gmzDE9BjfHI194IPoVXIVkbwMMBFJvXZDZ+NqAp9npaN2
 X9dPS+z0hKQO95GVfNM0PY5d6mDW1BGnfrPo4iDIzkcW8vQb3o8qlvA2jHDxPd6KOHI+
 qpF+vSebholvYiREu8XzJ+drkiQQ+1gZc30frYcrMyhOg8xGB8myIU/uobv/CtJbunY0
 FZSrylfYd503H0ptXlSAvvL/ImNYd72ouZ53fkp6IQ7eNeUIH5UGa3B7ack194K7Afsr
 XYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ix9Jd7ujoLN6zvd7GKMtecksWWqdBl2l3FdxLEHMeA=;
 b=qSz5jiwyzBT4QLGaFxFHrK/agRILnrjtZ8X3MDj2t6+u3C113Fu3fnNL6R/BJTElzl
 xf0L7h1Z5elA8e3PhTAptNzvsFAUFFGbAqt95NpqUOL3iyjDRwgm/XaiZ9Ld2+8MELWc
 17H8hpZBYaMM3F/QYlhjZc9Bfv98pFhclORpCWbIXMhgn7jKUR7SPtH4voAOr8DRwACn
 vmguS3PFQDdrVaZa43Y9jZc3sTGQ611g2Zq5KLYN8R5lF8dDlBgk5GK5Ypm7FpM0JJdp
 tGDqUObClDYQ5JELycVn2NNjTMnKccLS3bW+4/MK4Fjpm+AZPyHpy/kgdBimGQK7gnTi
 7thw==
X-Gm-Message-State: AOAM533v6VkKiOv+XbWMQyJvUWXmPJYqbQaB5oZgc2w/h9JBkGp54ayu
 +0RKtxDcsUaluZBJXliK7ifTsOA0mmlIuw==
X-Google-Smtp-Source: ABdhPJxxeAg3hOAtIuNhzbbTsxc68V/2R4ozJXWtwAsk34KQJKRtoHDua6WiunkrgIfxWti7nHKkQA==
X-Received: by 2002:a05:600c:3512:b0:352:d502:bd0c with SMTP id
 h18-20020a05600c351200b00352d502bd0cmr20154487wmq.164.1645435699459; 
 Mon, 21 Feb 2022 01:28:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/26] MAINTAINERS: Add Akihiko Odaki to macOS-relateds
Date: Mon, 21 Feb 2022 09:27:55 +0000
Message-Id: <20220221092800.404870-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220213021215.1974-1-akihiko.odaki@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd85e27889f..c3b500345cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2416,6 +2416,7 @@ F: audio/alsaaudio.c
 Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
+R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: audio/coreaudio.c
 
@@ -2668,6 +2669,7 @@ F: util/drm.c
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
+R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: ui/cocoa.m
 
-- 
2.25.1


