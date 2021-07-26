Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BD3D690E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:54:14 +0200 (CEST)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Y9-0000G5-R5
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rx-0002z7-SB
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:49 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rw-0006EO-C3
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:49 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e14so13367286plh.8
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ulypwX8cmbI95lC2kA6TSEHH51l/u0q3kJ3MExHdI5k=;
 b=ODbDqhlcGV2tde0bIQEaH61FUBSHxyE30ZGBDmt5HKWZUkxAPstVBBmTVeE228fKe7
 XgI8wwVVwafqYXqZF4LEIMx13SkZZohEXyDFt470L3fC8AZPjqINITgTC+/bkxKHi6jj
 jY7OgySI8sEesbdTz0a2UdAtIbxkBu/jK8lFfJUWbwei6MDe7D3HYkxYiMd1ayEQgf2W
 PSIymWAjPuyohzvRpuiBF3JbaontSaQyhVv8e/3WuvXjGyo2RcQppv2XUitlS+KSCCiw
 vYjPGNWSdOqW9+MkY7nQBr53JSWoiPRyy1A96vbCb5+iNZlhRrevrDeW+uANmMD7z3E2
 9l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ulypwX8cmbI95lC2kA6TSEHH51l/u0q3kJ3MExHdI5k=;
 b=BP+fwPdPx432DEjM3GiSqyTBQC8GxCuUdoTf5IibVkes8g16NsBjQAom+afvSWMeqG
 flTI3jdcwUbXAjg9kONF/09+lKDo7lnpFAtXpaCAWECi6ebjoWSyLMSB1vfeUcQs2xmH
 3W8X0j5Jl+5wz4zD9BT6NyNlpDc1yQNqjovPx7DCLgoV4Y/V/UqPadxNM5WfuYhSEnye
 zA+TtRn2pftM4XuDjVBvBCrdJB57RU5+Yix895bMvg5UoYVohjG6+jTcJUSwHe+DjKQt
 Z6/4FttyLb/jd4URfZRcRZvYNpWt8L8yltNkkTn59DMWd3dknSp81Pl+1W2EDV0UPYfQ
 DjHw==
X-Gm-Message-State: AOAM530PgI0AL2jylhzKtEE+dnUFVR1xLTYL09XhCRZ8m1u9L+dHyP3g
 r9qwrydPkpSMcqp+oGUc6fV8Bk9ELdwo3w==
X-Google-Smtp-Source: ABdhPJxHjl9E5q76X891gnbCzkVnx934OrOpbEIAPsQF7hPYxC5egYLEIza19UUZPIEp4HID0oNpKg==
X-Received: by 2002:a17:902:7b83:b029:12c:2758:1d2d with SMTP id
 w3-20020a1709027b83b029012c27581d2dmr5395567pll.80.1627336067052; 
 Mon, 26 Jul 2021 14:47:47 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 10/12] hw/pci-hist/pnv_phb4: Fix typo in
 pnv_phb4_ioda_write
Date: Mon, 26 Jul 2021 11:47:27 -1000
Message-Id: <20210726214729.2062862-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
hw/pci-host/pnv_phb4.c:375:18: error: variable 'v' set but not used \
    [-Werror,-Wunused-but-set-variable]

It's pretty clear that we meant to write back 'v' after
all that computation and not 'val'.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/pci-host/pnv_phb4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 54f57c660a..5c375a9f28 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -392,7 +392,7 @@ static void pnv_phb4_ioda_write(PnvPHB4 *phb, uint64_t val)
             v &= 0xffffffffffff0000ull;
             v |= 0x000000000000cfffull & val;
         }
-        *tptr = val;
+        *tptr = v;
         break;
     }
     case IODA3_TBL_MBT:
-- 
2.25.1


