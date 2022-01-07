Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE14871C1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 05:28:47 +0100 (CET)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5gru-0006BQ-C1
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 23:28:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5gpK-00041H-1T
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:26:06 -0500
Received: from [2607:f8b0:4864:20::1036] (port=45723
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5gpG-0005PK-TD
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:26:05 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso5280564pjg.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 20:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4hBJw4MxHRGrfALzzhY8NB/B5fMDA3bRMuaqM5UfqGY=;
 b=wggx86G7PL291dcO76qfgbXcWBZx0D81uqRvyl6pm4+3MVY4SG+AcMRA7OJ/Cnteaa
 FvbjYdKZtjvyXsGiDS6Xt8+k6HMHKNtj/UOCPadYsSvjtKzzPXbPBQzxaoMeZThKsuET
 nDfmnA6wJmujPUJ9x5pQ6AhfQvySwMfYtJpx+wQQ45Wa6txNzNWlrwMvQfNkkemUgx22
 t4+5iGyWRwSV2ZOPXCbhhU+rJwawlwjaD/XjgSjXpImSLyvl9lLUyaJGBadaRtde5MDf
 evv5XER2CXXtyCozNTHk0qIbcB+67hN1wDl27ZFUGC21zBKuD+Qqu0rNZtcgDyk3Deoc
 KFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4hBJw4MxHRGrfALzzhY8NB/B5fMDA3bRMuaqM5UfqGY=;
 b=JWgwPduMXyciIMjeEgDpAm/Bcf+pq7v+d5PDom/3ndMgD5Wlbk9PRC9HRv/vlO2rBD
 oI2ga1bjO/XQjpkey2a9JUg/xnQP1BWQvp5wR6QbBwP7e2FHEwfWmgt9fBywNPkkpZj9
 wNUOkEOR0FSvHOYWbh7DypVWaa8sgYdALasZN7yvkFwTawJ31+cjGPJ867VfUf+2QN1e
 R91MVA+xFKosUQ90q1qg8xDbh87fEp/R7E7PgXwNetzWv9n1IH/t+WCmHoW8AxFA/FI+
 mBwSYwe4X5D5zdKV8sgpGei7kXyrPBDjW2ChmR+eB9PhZAoaxJTPQlyF1+/vdNl04x07
 vrPw==
X-Gm-Message-State: AOAM5300nxU66Vrmcfo0vhW8OPpHCEE79AWhp6yKSHt+oNiJ7rp6tDhx
 n2wUEVwu+/ojkWQ8laUQyTHTKQJZ2Lmwlg==
X-Google-Smtp-Source: ABdhPJy0jNNCAVuGCYjgxi2ude5SoyoKyk82/PS0QMjkcsV6IbsAnq2TacA1nCImxYcDvovTzicuLw==
X-Received: by 2002:a17:902:f24b:b0:149:d634:d92f with SMTP id
 j11-20020a170902f24b00b00149d634d92fmr10451979plc.88.1641529561359; 
 Thu, 06 Jan 2022 20:26:01 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e4sm1396862pjr.40.2022.01.06.20.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 20:26:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] linux-user: Move target_struct.h generic definitions to
 generic/
Date: Thu,  6 Jan 2022 20:25:58 -0800
Message-Id: <20220107042600.149852-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: gaosong@loongson.cn, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I noticed this while reviewing loongarch64.

r~

Richard Henderson (2):
  linux-user/arm: Move target_oabi_flock64 out of target_structs.h
  linux-user: Move target_struct.h generic definitions to generic/

 linux-user/aarch64/target_structs.h    | 59 +------------------------
 linux-user/arm/target_structs.h        | 60 +-------------------------
 linux-user/cris/target_structs.h       | 59 +------------------------
 linux-user/generic/target_structs.h    | 58 +++++++++++++++++++++++++
 linux-user/hexagon/target_structs.h    | 55 +----------------------
 linux-user/i386/target_structs.h       | 59 +------------------------
 linux-user/m68k/target_structs.h       | 59 +------------------------
 linux-user/microblaze/target_structs.h | 59 +------------------------
 linux-user/nios2/target_structs.h      | 59 +------------------------
 linux-user/openrisc/target_structs.h   | 59 +------------------------
 linux-user/riscv/target_structs.h      | 47 +-------------------
 linux-user/sh4/target_structs.h        | 59 +------------------------
 linux-user/x86_64/target_structs.h     | 36 +---------------
 linux-user/syscall.c                   |  8 ++++
 14 files changed, 78 insertions(+), 658 deletions(-)
 create mode 100644 linux-user/generic/target_structs.h

-- 
2.25.1


