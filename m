Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F7B23055C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 10:27:56 +0200 (CEST)
Received: from localhost ([::1]:41496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0Kxn-0005hg-DW
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 04:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwM-0003fg-1z
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 04:26:26 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zong.li@sifive.com>)
 id 1k0KwK-0000oW-8j
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 04:26:25 -0400
Received: by mail-pg1-x533.google.com with SMTP id e8so11444327pgc.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 01:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7CEjkScGiX3F/aHH/ElgOi/6qZ/atlZLd1boZ9oeYs=;
 b=ns2h7DvpJVu2lbvSd2+vRq5us9GZLWDF/B09iAuhT2pIctflpmBIBLp4ID+nybDRHo
 KKC8WVVPy8soaEOEDBISIxF2EXKP34PhWtluBXJ39MYgEWiurpl2ZEd3gI/o6ZBhDdHB
 LtPaABGR2iG+JfJoJl1VTLszSFSWMm+qPs7JUBZomUeNBD/2yBuCYkFkTj5gP9Y83qIg
 YfcJO/UKYugl7zT/4FleWvaySzCKuQCv2DJiht+mLqodZqLSksdQE2tHi5QfYZ0+k5Az
 UfzEUfSrzNcohGNg4467wCP3y2x64JkIfEn18wmH3ZIR+77taScychUUpZXCfHzdoVxt
 /vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P7CEjkScGiX3F/aHH/ElgOi/6qZ/atlZLd1boZ9oeYs=;
 b=nO7ia/wFj0YdXLusPw9ymUTcE1xwsjvmRFFhthvMOer8HrN01jtWB0JhdZHJ/66g/y
 RtsKCHBrVWz0We377p+zYSnhMvaFRgBLYlLL2nURTOqhDRAn7/4d31yJWdd4u8ZEkpWq
 tK2fxJ2vDFQFCeFfIjejapzZiFZ+7QSj4gxXkWL4bynf2hP+USSRkERkfvzWxbkdQdDZ
 Zh14beW5La+jbdMTmyE3+wsTPoY3AcnU7iHJf+81vWnuAAyCsmKjsrvcR3B3mDlHbSvB
 CH1KTFcGhz7eSNc5TmRoBU1Fd1anqx2Z/42KB0U8D7AmToXCQDD2aXNirBPAoBJ33/Zr
 G2jQ==
X-Gm-Message-State: AOAM533e96BoauWI7To51Qh7SeoY09Sw+Z1KNjvCPVP3gKMz+j8PSoDP
 8OBqddaWT8s2bQG2eE7556JMZw==
X-Google-Smtp-Source: ABdhPJx1phqc7k2CDwDk3l4K3ALQQ6uZKBZXxxXcTBFx+tD9rPTG3i8oTCesaUc4TzgR6FzMM+pzEw==
X-Received: by 2002:a62:6dc7:: with SMTP id i190mr23993096pfc.16.1595924782806; 
 Tue, 28 Jul 2020 01:26:22 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h2sm17599747pfk.93.2020.07.28.01.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 01:26:22 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v6 0/4] Fix some PMP implementations
Date: Tue, 28 Jul 2020 16:26:13 +0800
Message-Id: <cover.1595924470.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=zong.li@sifive.com; helo=mail-pg1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Zong Li <zong.li@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set contains the fixes for wrong index of pmpcfg CSR on rv64,
and the pmp range in CSR function table. After 3rd version of this patch
series, we also fix the PMP issues such as wrong physical address
translation and wrong ignoring PMP checking.

Changed in v6:
 - Mask low 12 bits of return value of riscv_cpu_get_phys_page_debug.
   Suggested by Alistair Francis.

Changed in v5:
 - Pick the suggestion which was lost in last version.

Changed in v4:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for PMP checking was ignored.

Changed in v3:
 - Refine the implementation. Suggested by Bin Meng.
 - Add fix for wrong physical address translation.

Changed in v2:
 - Move out the shifting operation from loop. Suggested by Bin Meng.

Zong Li (4):
  target/riscv: Fix the range of pmpcfg of CSR funcion table
  target/riscv/pmp.c: Fix the index offset on RV64
  target/riscv: Fix the translation of physical address
  target/riscv: Change the TLB page size depends on PMP entries.

 target/riscv/cpu_helper.c | 15 +++++++---
 target/riscv/csr.c        |  2 +-
 target/riscv/pmp.c        | 63 ++++++++++++++++++++++++++++++++++++++-
 target/riscv/pmp.h        |  2 ++
 4 files changed, 76 insertions(+), 6 deletions(-)

-- 
2.27.0


