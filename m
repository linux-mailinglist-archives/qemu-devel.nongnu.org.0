Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273F44C4125
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 10:18:43 +0100 (CET)
Received: from localhost ([::1]:56624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNWkL-0002RB-Sr
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 04:18:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1o-0004cO-Sh
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:48 -0500
Received: from [2607:f8b0:4864:20::534] (port=38764
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nNW1h-0002uY-Ht
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:32:35 -0500
Received: by mail-pg1-x534.google.com with SMTP id 132so4029112pga.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 00:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNb0Vvk2HDqY/khpe1ncIyLnRK2hTtwKvbCJnarNjjE=;
 b=QZtRxvH4ucUmeO3CoPJqcvcR2hzJpCLiALcY2s8QKv2sVfDB4y7uzeoaJu4Cf1gsjG
 +wbrPp/ZC5IKDl7nPttjF3nFBGH2O790qxwWRMFjS7OHtVDuQhKD8+G6acL4VwBH2vEf
 Bhx7O4D+u/0P+7iTwG1rMzaPujTAke7rQn61eY7um6zgODgGBIS5jdloYJQzI5SEf3r9
 CPY3KDYCkn6lIt0cJaJ9WQXjyAjEm+H5yOUGGQ5/McURHjhvnNMbORg3YTPI8ogL3BIm
 8wajbV81AP1vNeW5r+/OtMExc8XOOk38JHo0+6zoG2pPRjca2dQSXJppLDDhFVVCh46h
 yiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNb0Vvk2HDqY/khpe1ncIyLnRK2hTtwKvbCJnarNjjE=;
 b=abCKOGUWFTxUZ/yoaYBdj8N0alKUGB0cDnKXMvSwi3dw1lfhoIRpx0wR0VLvSMP4Hy
 eHZ+l1ejMm4Iz5lzOITx2o7m6LMMERvb1YeVlImVsn8FHvWHjFPFNdFhedWGTN//VNzc
 xQ2qe5vF+5DrKwRGQZ9fhYU9xx2M4zLhoilX3v1ZB17asmEtSGJUlyjtsXgDcxCKt2ti
 mHNYAb34B9wEiG2AA4cuaBiQCn1/GSYPSG2Byjjxw2SWioBz56/bZILwPXtDab8pzBbL
 WJk2P5Jxy69TOA+OV7M4d1Ep6b9qSDmeyh2OLPELFPEqtGKZ4cf820wbf5ESq1gcdQE5
 53Ig==
X-Gm-Message-State: AOAM532wW04bMcf/nud+JiHRg+cMLLu1506HHw3vhReSbaBHQYnAZE30
 La6nntt/p8E2l9wRTqZYDw6Rzvig6PCa6WFM
X-Google-Smtp-Source: ABdhPJyCM7K5+dVn+74UgRAbVMNQ0Frw0QMSdLLjaEmO8w+XtUEuyvrs5dbNNRh2Y4HAzkSizGJzkw==
X-Received: by 2002:a63:dc08:0:b0:372:be18:dafc with SMTP id
 s8-20020a63dc08000000b00372be18dafcmr5333695pgg.440.1645777949401; 
 Fri, 25 Feb 2022 00:32:29 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a056a00168c00b004e15818cda3sm2379975pfc.114.2022.02.25.00.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:32:28 -0800 (PST)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Subject: [PULL 0/6] OpenRISC DTS Generation patches for 7.0
Date: Fri, 25 Feb 2022 17:32:16 +0900
Message-Id: <20220225083222.1174517-1-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: Stafford Horne <shorne@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 4aa2e497a98bafe962e72997f67a369e4b52d9c1:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-next-pull-request' into staging (2022-02-23 09:25:05 +0000)

are available in the Git repository at:

  git://github.com/stffrdhrn/qemu.git tags/or1k-pull-request

for you to fetch changes up to 94c71f14e9ca15ede4172e0826d690b15069a7f8:

  hw/openrisc/openrisc_sim: Add support for initrd loading (2022-02-25 15:42:23 +0900)

----------------------------------------------------------------
OpenRISC patches

 - Add automatic DTS generation to openrisc_sim

----------------------------------------------------------------
Stafford Horne (6):
      hw/openrisc/openrisc_sim: Create machine state for or1ksim
      hw/openrisc/openrisc_sim: Parameterize initialization
      hw/openrisc/openrisc_sim: Use IRQ splitter when connecting UART
      hw/openrisc/openrisc_sim: Increase max_cpus to 4
      hw/openrisc/openrisc_sim: Add automatic device tree generation
      hw/openrisc/openrisc_sim: Add support for initrd loading

 configs/targets/or1k-softmmu.mak |   1 +
 hw/openrisc/openrisc_sim.c       | 308 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 285 insertions(+), 24 deletions(-)


