Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7B54B0C71
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:36:20 +0100 (CET)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7kI-0005pp-F2
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:36:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nI7ed-0003hb-25
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:30:27 -0500
Received: from [2a00:1450:4864:20::530] (port=36402
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nI7ea-0002VD-RW
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 06:30:26 -0500
Received: by mail-ed1-x530.google.com with SMTP id s7so10400828edd.3
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 03:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g7ZSGCxN+8THvk0kgxS/JbTzR49GfLMA1s7p1Trh+TE=;
 b=cDlGHmJvYT0sKxVQOIgPN5s5bOIZil4zyIKP9CYV2EhsrKT09GpBJDuSCe3nJN2HU4
 2asfD9tw0FJ4pmv4otFjfDu+zFP8XcMDwT8NiFdMbB6aWVT4xEAMYZIhc8/GQymtWzhn
 MvuttGqsLJvquLtsQv3CUAcsvLxLyeey2v5U5X9M2fWz1sUS3ex5MP74r9EGd0SBYF7h
 QXBd2eMUqFP0D7KG1DQFhauxYq8Cnq8WBG50f7JLeJ3m9NG42rhQKitNlSguIFqcS8mK
 1YoHwmOp0EpJ6nIDU+zGYbCHMr52cquJLxyP2kzQ4neJIw91ErQsPaKqBCcosdvvOYpQ
 lpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g7ZSGCxN+8THvk0kgxS/JbTzR49GfLMA1s7p1Trh+TE=;
 b=h1htMKazJCWlpv2f96KrgxTXodwpUQFfToIOhiWqFgTDBCcPrpzFMOc/zuox6DJN8n
 eFnnwhNZ5cNeDZNrS5io7gjMNGDMk4ofUwdc3F/Ev121ptHdFPAF5uAs7La4qSl3989g
 jhxrlBK2Imljf46CqSDyL9Y/jggAgr0CpQGEIdP392GTpLwKCEF+iwAEndcEI3K1Y37i
 psLsNAkmbjL8fdilPY+Q7ibiVIyA7VXHvhFbwu1HHz7cnDd2QJmWjSIUvN3rIKi6sRQY
 qZf646vWdrzkfxtap037sL5njBDA06bmMZnnAV2jHT5Ct6RoaMBeChzDPOem9Vkpy2cD
 mRZA==
X-Gm-Message-State: AOAM533n161kpTkgaBNPKaA8fkeITejlz9OGlvlk6g83uglk4uj68oUB
 cj3riTHbsgiOA4FV1MoC179i3Q==
X-Google-Smtp-Source: ABdhPJwBoGGbhz2M5t6tWKZnXaElzudJ1lqQ/n7SBYUK6Usbl6KxjaNOst2DQVz8yKZgzwG+rrIOfA==
X-Received: by 2002:a05:6402:40d2:: with SMTP id
 z18mr7717920edb.152.1644492623272; 
 Thu, 10 Feb 2022 03:30:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id eg11sm8146530edb.17.2022.02.10.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 03:30:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8612C1FFB7;
 Thu, 10 Feb 2022 11:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH  v5 0/2] semihosting/next (SYS_HEAPINFO)
Date: Thu, 10 Feb 2022 11:30:19 +0000
Message-Id: <20220210113021.3799514-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I'm working through the backlog of stalled patches in my queue so here
is the latest version of the semihosting info fixes with Peter's
comments addressed. Both patches are still missing their elusive r-b
tags ;-)

Alex Bennée (2):
  semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
  tests/tcg: port SYS_HEAPINFO to a system test

 include/hw/loader.h                 |  14 +++
 hw/core/loader.c                    |  86 +++++++++++++++++++
 semihosting/arm-compat-semi.c       | 129 +++++++++++++++-------------
 tests/tcg/aarch64/system/semiheap.c |  93 ++++++++++++++++++++
 MAINTAINERS                         |   1 +
 5 files changed, 262 insertions(+), 61 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

-- 
2.30.2


