Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21233C65DA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 00:01:13 +0200 (CEST)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33zE-0000F1-PO
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 18:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tx-0000g7-Lf
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:45 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tu-0006tp-Uk
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:45 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p36so7974291pfw.11
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JMPNzuHLuXcksvxhjV6/BruPnEZ2eQfGcDwFCQcmMW8=;
 b=qmGdI2JvjRNQABt/JaYFsMbGSbqvuksNULSBLhOTpvBUSgMZTXqXw4sP3slWMCV8vY
 7VUIc6ZQSWQk2NZmDorboJ/QaukJ9VO5jmbb4t7Skgyb7PJYtN5N62NjjSEJuFWg7Kni
 DliauPpCIoAKyhK8o+Enu/Is36zefE+Rx9jU12tP/5VO1KTMQmzXU8ep4CBt+aFkNVnF
 kSfjbmPB8uRMi2cB/Li5qt0zHUSSgmL+vipWfqbwRxtjnkj2BP2f3Na+UdNYmbCrbs9o
 D4ATAS5SE6XJ2CW1ETLRsqslb+SdoTXMHIob6XeA+5RYXSwQd+wVEnS4md2rlwFOCYsk
 FTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMPNzuHLuXcksvxhjV6/BruPnEZ2eQfGcDwFCQcmMW8=;
 b=IWa/yflhGDQI0J7eK/BctxrKltaAgfUkEHBnoJysLs4EgDkFRNCYHzTBHqttpuXmqc
 EO8jJvh468QfveXf9WpyFIEdKHcBKmWlf7ReYJkXhLKReTcM7TTHDMrznyW4uZKlXcGl
 /e8SaxvPCBd5Sn4/TV/bBDnunfdkBKCIEZ8mCem+X/zajfcO+g46AZGWOfVPb3L8z/NE
 nAnjXwqTNqSo9Sa7TSBLEdy7Qa309t+OqNvRbo53euR8DGXUDbtYHpCej8HXNyNKtSxr
 bwvPEfzEOZvvLGxO3/YXo7QzI2MEhfhahS7m+YlJru0WnnEu7ccWF+/DYz+RS64sQmke
 KrQA==
X-Gm-Message-State: AOAM5339B/iOe6fmta24epaqmhv6oB6i+g7d0gkdyApwdTaHjJ91z1Vf
 /x51u5wB3mvBcenGmkZdn8nrPVhogOWWfA==
X-Google-Smtp-Source: ABdhPJzsD9HTW5fTGiYdLGc+8+vMPgmnuHkWoAtcLu6rQTQKFyQBU2b7by7I4O6puND4ZqpLGvH+8w==
X-Received: by 2002:a62:e90f:0:b029:307:8154:9ff7 with SMTP id
 j15-20020a62e90f0000b029030781549ff7mr1079842pfh.79.1626126941647; 
 Mon, 12 Jul 2021 14:55:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] hw/pci-hist/pnv_phb4: Fix typo in pnv_phb4_ioda_write
Date: Mon, 12 Jul 2021 14:55:31 -0700
Message-Id: <20210712215535.1471256-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
hw/pci-host/pnv_phb4.c:375:18: error: variable 'v' set but not used \
    [-Werror,-Wunused-but-set-variable]

It's pretty clear that we meant to write back 'v' after
all that computation and not 'val'.

Cc: qemu-ppc@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
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


