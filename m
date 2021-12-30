Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999CB481C53
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 14:03:15 +0100 (CET)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2v5O-0001Sb-Mh
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 08:03:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ug9-0004gV-E6
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:37:09 -0500
Received: from [2607:f8b0:4864:20::102f] (port=52813
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ug7-0003WA-RX
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:37:09 -0500
Received: by mail-pj1-x102f.google.com with SMTP id co15so21131444pjb.2
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 04:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPClrl+E022R8f538AAyF53sS8xiciJmEKN7UogGtIA=;
 b=q02hmWLgBhGRN/t3eZRjb56LHe8A1PtbQ8j3wfSpeE1xrL5ljl6lJcvBWEVEbWhdSM
 Ql8Bt1qCeoI21OZ1OARSWBHck2SBN2RIHNGURixAUxg76sQ84ELrIQgIt/gMPrtJ14gz
 LpZGjQvPMkgTalI2E6kb5690Ydz6TDMKAnPisSKj5XohP2NZbbbe03kFEhDCjEB9BKsg
 WNl8MG+POrBextIKKF1HWQiaWHJ28hNI3+UbC3GWrjERmPqkBi91ncrNLGpS+sYK3XWC
 F92hgh3YiDgwG2JjOtWg1uvheessXxGW79fuYsKt8vYRMJt4i9MIhiuPM13vW53UqOTp
 TcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oPClrl+E022R8f538AAyF53sS8xiciJmEKN7UogGtIA=;
 b=sVEhLsve1E7/yMv54FsnfjUTrnkKmG1swBkcG1s1/OM6TKvUxzXkC5Ta71xfUUnceo
 xBNwXaQt0RDFFArMFL8VueI7r99pDg732iWYl1iOJ4gaXr64sUhGtatiJS29QtQ9GN9k
 LuiMZ95jJr6ADXmWTTlQ004UmtI658HS2MGhDpcfQzTp1RU4IP/m5pC1NuKiEKJUcOH+
 NsSjVTdDoTebJr3NWgU1d8oI5x5d7djStQaG1udoqA+sT137+LYSjl0wIfyL3x0FKO+K
 StZPV+pcHCWetnjOFzszPVttaqJp/3tbRK7AoJHhyaxuAebq7GH+rE4BHrLjGHYtPO+m
 mstw==
X-Gm-Message-State: AOAM533VoNEu6Z264ixYdOfeyXX8sLz3mnxx1r/ArDFklPl3ynvKBTLQ
 /314IKZp4LYBRLBnQgmUQsFtMw==
X-Google-Smtp-Source: ABdhPJw4Ik5zUgVhq3BYRAGbAQERkq+DiDnnlnBPtxewcWWFFIVQCDmT3cxmNnTi0oIC1uPy6VD+wA==
X-Received: by 2002:a17:90b:4b90:: with SMTP id
 lr16mr38053403pjb.209.1640867826548; 
 Thu, 30 Dec 2021 04:37:06 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:37:05 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v6 22/23] docs/system: riscv: Document AIA options for virt
 machine
Date: Thu, 30 Dec 2021 18:05:38 +0530
Message-Id: <20211230123539.52786-23-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=anup@brainfault.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We have two new machine options "aia" and "aia-guests" available
for the RISC-V virt machine so let's document these options.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index fa016584bf..373645513a 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -63,6 +63,22 @@ The following machine-specific options are supported:
   When this option is "on", ACLINT devices will be emulated instead of
   SiFive CLINT. When not specified, this option is assumed to be "off".
 
+- aia=[none|aplic|aplic-imsic]
+
+  This option allows selecting interrupt controller defined by the AIA
+  (advanced interrupt architecture) specification. The "aia=aplic" selects
+  APLIC (advanced platform level interrupt controller) to handle wired
+  interrupts whereas the "aia=aplic-imsic" selects APLIC and IMSIC (incoming
+  message signaled interrupt controller) to handle both wired interrupts and
+  MSIs. When not specified, this option is assumed to be "none" which selects
+  SiFive PLIC to handle wired interrupts.
+
+- aia-guests=nnn
+
+  The number of per-HART VS-level AIA IMSIC pages to be emulated for a guest
+  having AIA IMSIC (i.e. "aia=aplic-imsic" selected). When not specified,
+  the default number of per-HART VS-level AIA IMSIC pages is 0.
+
 Running Linux kernel
 --------------------
 
-- 
2.25.1


