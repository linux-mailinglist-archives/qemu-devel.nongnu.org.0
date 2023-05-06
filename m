Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42EC6F917F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 13:23:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvFzJ-0004O9-VA; Sat, 06 May 2023 07:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pvFzI-0004NZ-5B
 for qemu-devel@nongnu.org; Sat, 06 May 2023 07:22:04 -0400
Received: from esa4.hc2706-39.iphmx.com ([216.71.146.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pvFzG-0004BU-BP
 for qemu-devel@nongnu.org; Sat, 06 May 2023 07:22:03 -0400
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 276521195
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xe/od6//Ykb1Sj5fPwUXDrUDPXyTJUtcMsCJ2f8bNWPcYEJGY0x3m
 2MYDDiOM/eJN2LzKY0iPtm2808BuZLTyYA3SVQ6+y4xFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jefQHeCU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNFg06/gEk35q+q5WtG5gVWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJEAMerMB0fxGO05Dr
 +E8OjsGQTauru3jldpXSsE07igiBMziPYdao285iD+GVbApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDMGspM0yojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKMklErieG8bbI5fPSWVOpLtEDGn
 V758mrcUgkrLPiD0iq8pyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83s/F3+hPzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:ONe3U67UFPr9aMxVtQPXwPjXdLJyesId70hD6qkXc3Bom62j+P
 xG+c5x6faaslgssR0b+OxoWpPwIk80hKQU3WB5B97LNmTbUQ2TXeRfBODZsl/d8kPFh4hg/J
 YlX69iCMDhSXhW5PyKmTVQyuxQpOVvJprY4tvj8w==
X-Talos-CUID: 9a23:GaJ4KmH+QySn70EGqmJmzgkqA+s/Q0fywS3NB12zAklPZZSaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AwhIuPA+0TjnHIUr8vCYu13CQf9t5zLqEDh42rao?=
 =?us-ascii?q?LtezULR1oHyuGnA3iFw=3D=3D?=
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 May 2023 07:21:52 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5f55eefb3b6so13998166d6.0
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1683372111; x=1685964111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uGI+N67eRj0fK3PN1zJXWJRrDKfleBEiRtAICNBbTK0=;
 b=N3YinlwJFQ6R7XytPWkypmCC/g+8yN3cF8TvMRngBfR40DXxTSGBnUwZs4Z3ODc8Ql
 9uSrLKPWptNDJT1kTrtpwK0TOiG+pXKoyY/VtDblW9QburfiYIEBLBNjT0yioaR3ZNdV
 8PjM0CgYWYSJgyM1jL9QY07jLkeip970XrLOAqwJZvYQ53riFKhmAvgb89aurh/20DG2
 8sK0DV8A5MpOuXrLnUAQp2b98FLCNmidgQqWv/QQA1ESIe+hLYc8PthzCQFdr3OiVfXi
 j/MRoAFDFwxjeWNI564cz30t8DADqXLka46sZ7zaiWB519bW0E1U919fOtVDd5BxuXXf
 08EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683372111; x=1685964111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uGI+N67eRj0fK3PN1zJXWJRrDKfleBEiRtAICNBbTK0=;
 b=ZE+dmUFe5e5IE5Hj5Y2dDZ0JN/IwMWZfQclX2SZR+LNjjV7VmH2r4WUz3wuV1XE69t
 DrGkaa+UJpvF16uCNlxucZbkvUC12lW8Ij7e3Z0cuiugUNKVdl8cKV7SWh2D6rpDb/Ee
 T2ayZwe6bB+SBTB98hWi+mlgv0+ya4tewSwLg0ZcOCmDpTAWCI2/4a3Yyufkh7OR50pc
 HushKue5TAofzNN/HdLWAaMkQrhg34PG85tXN1xm4ZDi2d6axUzZFJH1HwMVgt5BON7f
 6YoZi8E6OL6yPMUWKkk6CcEra02ogNCWY5ndrI2z6ttIdqS6Ha7+K8cN9EaVq9oTm5av
 3S7A==
X-Gm-Message-State: AC+VfDyym6fXmRgiyTOExbChDlLLimHmNwgtWdkkNp+A0qOOhhGvBMxk
 E8eJdInjmn2IykTPdFSFt+T2eWkXbsVAbnQbZbmPIGFuxiN8Vs63v9+Q4NN9r0FT+23E5oPz09g
 CEXs+rvw+RLB48AQIX4dNaavI89Fs/bG6mBALrEIs
X-Received: by 2002:a05:6214:2609:b0:5a6:24f6:724d with SMTP id
 gu9-20020a056214260900b005a624f6724dmr6602197qvb.13.1683372111450; 
 Sat, 06 May 2023 04:21:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6h26fHu+oJfbAXTUJGs7v7+Zqww3u2PbZsIo8jIB9+kdGkFmw2h/6ks/+8y0MBnIJ5LQraDg==
X-Received: by 2002:a05:6214:2609:b0:5a6:24f6:724d with SMTP id
 gu9-20020a056214260900b005a624f6724dmr6602179qvb.13.1683372111195; 
 Sat, 06 May 2023 04:21:51 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a05620a16d600b0074df16f36f1sm1235793qkn.108.2023.05.06.04.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 04:21:50 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH] loongarch: mark loongarch_ipi_iocsr re-entrnacy safe
Date: Sat,  6 May 2023 07:21:45 -0400
Message-Id: <20230506112145.3563708-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.146.118; envelope-from=alxndr@bu.edu;
 helo=esa4.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

loongarch_ipi_iocsr MRs rely on re-entrant IO through the ipi_send
function. As such, mark these MRs re-entrancy-safe.

Fixes: a2e1753b80 ("memory: prevent dma-reentracy issues")
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/intc/loongarch_ipi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
index bdba0f8107..9de7c01e11 100644
--- a/hw/intc/loongarch_ipi.c
+++ b/hw/intc/loongarch_ipi.c
@@ -215,6 +215,10 @@ static void loongarch_ipi_init(Object *obj)
     for (cpu = 0; cpu < MAX_IPI_CORE_NUM; cpu++) {
         memory_region_init_io(&s->ipi_iocsr_mem[cpu], obj, &loongarch_ipi_ops,
                             &lams->ipi_core[cpu], "loongarch_ipi_iocsr", 0x48);
+
+        /* loongarch_ipi_iocsr performs re-entrant IO through ipi_send */
+        s->ipi_iocsr_mem[cpu].disable_reentrancy_guard = true;
+
         sysbus_init_mmio(sbd, &s->ipi_iocsr_mem[cpu]);
 
         memory_region_init_io(&s->ipi64_iocsr_mem[cpu], obj, &loongarch_ipi64_ops,
-- 
2.39.0


