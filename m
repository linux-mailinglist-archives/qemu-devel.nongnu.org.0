Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B48F318ACE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:36:40 +0100 (CET)
Received: from localhost ([::1]:41612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABD5-0003VJ-KP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB53-0003X4-7O
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4p-0003tt-K4
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:20 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v1so405246wrd.6
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q/r6ozA8AMgNk3NK5Gk4JgNhOCqCOpaSvGrBuktxPls=;
 b=OhRf+sjQTIrFIZy/SW7/V5nEObDHg0F5T6GH1733FJGAWWM5cXWvDsNPDOaWG8xOYY
 WOErbo5qLBJQcxlLzl1vsPl2bwIGWTWlmhBtLcbAe1Y6HXhRio4L4i9S9TS4rN5HBdqK
 0xCtOR5cM5Uw9m0Rc3dHSI/qdF5D+Zg8YJfBiFEk0xXMUS1x6FWcIlkNuikEcDdIBFwt
 pKO+8G77UrlGOimviK0zol3QZQnds4TWsmWHVj+7P13qEB+8t9q6LJDrwbQ9lxl/3OGV
 7holSPkkfu/aezSeNShxH2SLYd+R5sDxkrRslFqaVhADNG5pqG+i75GQjXoxjPZWE2mr
 MYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q/r6ozA8AMgNk3NK5Gk4JgNhOCqCOpaSvGrBuktxPls=;
 b=JlDBM8prUIIyOo6/q5CuIlyuvNJNnlfoWlBS21XIuX6I8+nswnsbcEOfDk/8gp7VrV
 B3d4/+/0kkUQG6S9QypYJdb7w6h64DgXeFx1q9X0t55SX/X/5Mn2U8Ry0d49HK05tRqL
 5MW0JDhZlVq4mX2ebEYpRWKITIAF7EWSKfg3tKJNVP8BM3/LXv2iakY6ic2SuQof825P
 pyUoNnrf8qpRDAH34zvhb4ujWqXmleQlgZjq3OkC6Rl7/JtBkOg7o7BnHfGj3z5A+ILA
 djw/qcjzlbD9V1BmNqKHPcx0lgScuwH5XdgQ8RFLjr2Hr6kp1Scr/vsPfh0ceyorvReF
 pvYA==
X-Gm-Message-State: AOAM532l5KcF9u+RtIRhoSoZ9eMTBh4g4QU99X2vH5L06rnOArX5J1eS
 z8l0ZmeP7K8PudnEuhk9h2890w==
X-Google-Smtp-Source: ABdhPJy+oL/39jMbljKmR2/YT8GT+LNFKg5fZJmLEmJ6mLfSZScfd6X1TDPYAJpFfrRhtJ7ORwgm1Q==
X-Received: by 2002:a5d:4a0c:: with SMTP id m12mr5439625wrq.274.1613046486270; 
 Thu, 11 Feb 2021 04:28:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u4sm4399520wrr.37.2021.02.11.04.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:28:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E1F2A1FF98;
 Thu, 11 Feb 2021 12:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/15] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
Date: Thu, 11 Feb 2021 12:27:44 +0000
Message-Id: <20210211122750.22645-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210208113729.25170-1-peter.maydell@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b0b5ddc05..a2b92f973a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2338,6 +2338,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: gdbstub*
+F: include/exec/gdbstub.h
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
 
-- 
2.20.1


