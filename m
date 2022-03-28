Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F1F4EA325
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:43:28 +0200 (CEST)
Received: from localhost ([::1]:57938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYy59-0004k9-JP
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:43:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2P-0002X8-0Y
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:40:37 -0400
Received: from [2607:f8b0:4864:20::533] (port=39548
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2N-0007rz-Bj
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:40:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id q19so13286810pgm.6
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KohNfu4bDHA3H+x9hEF/fxiuHZ+lQRcyQ/g/dT6gGUc=;
 b=VBmK/YuCh4Ggcx9GzqZYEw9yxkh8H2Qb2J7o6I48+ORTdr5Xd0t8K0J4PaG9PQiizl
 ibWsijskDDoNT0enUGen6G8rbrBw3Vcg7fq/KPq1/WKtNEifbn+kBK+PMzsa0hh9GN/N
 vWtomPv3/rcSbr2ocNBl/VRxQhgrcPhQI7MHuaDNrVJe/rQ091gyBvBuQJ7Sk9/4bnHW
 JrXgIzt2AcxK5sjUJGijw6NG8z69CZ+etbmuTRHdRRINVuNlxeefbj0xdn+cnZY/4drt
 VyWpUQL5Jf7CNuvZ/Bghhq3aByt+27A9MnJq+T/8MjDHD4NeHhShm0uJZIdxrW7pRM08
 ogpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KohNfu4bDHA3H+x9hEF/fxiuHZ+lQRcyQ/g/dT6gGUc=;
 b=oBMFJOlW2GqbjS2HU1rvqeTU8VTyH0cZJPWO/pGLJqRvSBSBaTJ0XkI4NKPd/NY7E7
 2DOfmpYiGRnY9SGCRe9u5+tk/ZGzdAbhzn1BZMKDmwxXC4xIGdQKQYx6taF0bDWGd28O
 jxTpPyy9EQHtFvCWI+KkXuMqDuJrvthw/rQL/E2hKqql6YWyUmVRLraENUbN/hXhGSbR
 sPqhU0FBNy1FLbbGLA5j/emD7RpIh7F3HoRHol1B+49uOp3J5eVtnJ1vqvag0QPlfctN
 4ftzdstsVvY4SusgiVAMH7VkEDIC4uLiPybJZays2UCs9N/c1qGB0DOxS/bfNmwZima/
 orEA==
X-Gm-Message-State: AOAM531EHrYT7cn+VXYmtkAnD3Fge1c3wY6LSKRpK/56p4q//KtIvPMz
 ms7SKLkhO+5yir06+jQdsiXU5VNU173Zcw==
X-Google-Smtp-Source: ABdhPJy6AYxdI85p3/VQM2gh/6V4atckJa8em6veekbE9AqDxFEQuCKTt+P+C4Buky+6ul1gY4HhGg==
X-Received: by 2002:a63:4041:0:b0:37f:8077:e0de with SMTP id
 n62-20020a634041000000b0037f8077e0demr11419189pga.138.1648507233855; 
 Mon, 28 Mar 2022 15:40:33 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a63a748000000b0038117e18f02sm13937073pgo.29.2022.03.28.15.40.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Mar 2022 15:40:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] gitattributes: Cover Objective-C source files
Date: Tue, 29 Mar 2022 00:40:09 +0200
Message-Id: <20220328224012.32737-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
References: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Apple's Git distribution actually carries a similar file which
annotates *.m:
https://github.com/apple-opensource/Git/blob/73/gitattributes

See comments in commit 29cf16db23 ("buildsys: Help git-diff
adding .gitattributes config file") for details.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
---
 .gitattributes | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitattributes b/.gitattributes
index 07f430e944..a217cb7bfe 100644
--- a/.gitattributes
+++ b/.gitattributes
@@ -1,3 +1,4 @@
 *.c.inc         diff=c
 *.h.inc         diff=c
+*.m             diff=objc
 *.py            diff=python
-- 
2.35.1


