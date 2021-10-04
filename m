Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C1B4208AB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:48:21 +0200 (CEST)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKa4-00032K-Q6
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKDt-0000Rz-P2
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mXKDs-00080o-7l
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:25:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so8452601wmj.2
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DxPtNE3Tuzufhip5hJRWdfwpvAvV92ozuvRKPT6awaQ=;
 b=UrxQnePqb/2+a3QR8TjDMPjmnoiNk5rs5AD4nBw5/fdEhcYFmjUWgmel6KZ/QcudyK
 lvs1g+fKghj4TXEXYjaqdn0EXczMWo3fEndhQExe7NLspL8OyiiiirP7VVOvzT/UrE4b
 ukCUTBwb9D0YWNvRlPKRBHwpTXDbNDH75NbOzRj5lkEzN4DwHQSssfFTMi1UhLaUZZgg
 CHdwV0L+D/o1aPlTG/TpkEIfeHkDao6MWKIdPohXjmuln8nfSjqJ2d0bcHVE7RxbGZ75
 +/02DGSsNLL7fTcxxxLoG3Z0GZJafr/Vo2nAuLbfS+KXyhlrkFeSzS7nA2bWAQYN7eme
 g7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DxPtNE3Tuzufhip5hJRWdfwpvAvV92ozuvRKPT6awaQ=;
 b=ybFBERKgrqD0721aEIABEi4VV/f3hz7+pOCl32VY1M+beRAgVgcDXTUVVZ14YOKaov
 h96CGFgT56SUOGHAGe0AgrZybaRSSr7ZmnmJ/fhP8avVwJx2X/+Yxb3IhMLOEgKUOQXX
 BqWgDSWioRP22eiWOLPgOHclauL2edW19bdReFkFqe/4VTkpSTNvpji4DlWtej+N/izR
 FrgOxBvt5qYToV18QOqUubrv0y097ls77t+XF3I4m0zL107NMV+63vFTjggVPYY8l/cC
 eG69cxFfimNYavhPt8Y1YAIkPurjLGlZWDG1e29P4JS4QpEWzs8Sm6ob+7MPVdhP93Iw
 EtnA==
X-Gm-Message-State: AOAM531tceNBz7MORbCg/FLgUhpdQ+flivsG2d3x2VT5YxggI/St09ba
 EUYlRxg6X8vLYcZLKCmwcHdT49+fbvQ=
X-Google-Smtp-Source: ABdhPJyObC0EAtOw91pW1pwpuJ5p6FQ2u6ZMeh8WW8/L/39JXeg5mCjlaDSd88oE8Rqi10difsINZA==
X-Received: by 2002:a7b:cb4b:: with SMTP id v11mr17315042wmj.155.1633339521808; 
 Mon, 04 Oct 2021 02:25:21 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d8sm14721051wrv.80.2021.10.04.02.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:25:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] MAINTAINERS: Add MIPS general architecture support entry
Date: Mon,  4 Oct 2021 11:25:12 +0200
Message-Id: <20211004092515.3819836-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004092515.3819836-1-f4bug@amsat.org>
References: <20211004092515.3819836-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The architecture is covered in TCG (frontend and backend)
and hardware models. Add a generic section matching the
'mips' word in patch subjects.

Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..cfee52a3046 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -109,6 +109,12 @@ K: ^Subject:.*(?i)s390x?
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
+MIPS general architecture support
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Jiaxun Yang <jiaxun.yang@flygoat.com>
+S: Odd Fixes
+K: ^Subject:.*(?i)mips
+
 Guest CPU cores (TCG)
 ---------------------
 Overall TCG CPUs
@@ -242,7 +248,6 @@ F: include/hw/mips/
 F: include/hw/misc/mips_*
 F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
-K: ^Subject:.*(?i)mips
 
 MIPS TCG CPUs (nanoMIPS ISA)
 S: Orphan
-- 
2.31.1


