Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F464DBAA9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 23:28:59 +0100 (CET)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUc8Y-0002lX-9z
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 18:28:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1nUc1q-0003vo-Ne
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:22:02 -0400
Received: from [2607:f8b0:4864:20::535] (port=42538
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tjeznach@rivosinc.com>)
 id 1nUc1m-0006h9-DQ
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 18:22:02 -0400
Received: by mail-pg1-x535.google.com with SMTP id o8so1216799pgf.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 15:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8AmkM8S51+EOY2aDLZKzaG1Ls7FAZJfhy2tA3AdwGqM=;
 b=HIXGJ9rX2Nntzowe1htEY+4+kk5C+/WUsP/41jiBcTdpDpc1yudLaZaPkMuG4Ftirm
 J5HU+UnkxHs3t31iiAnEUOFM9j1AwUe+hl3Mniky8DlpoBsX9dhMHJDuBBQxZXEqbpEd
 QzlhSIR3XRn++HWDE1omVe7JpSDKuYmECQtmtr5mmp/xl8Pl8ucjK3CpwvP5aW2ALTMW
 xRntJqJBJJniGb1e+xnN0p8UqZOuBLUKUS4YYAIVtF6R5rCthMCqCZx+8GBw/7Bu0Qw+
 lH2U+PKVFGqW4ZMklJqqVXvaBlr2GrlZo8HpGZP39LwTOHt1Xce1aAgsjKj1pT5P2Hu3
 fRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8AmkM8S51+EOY2aDLZKzaG1Ls7FAZJfhy2tA3AdwGqM=;
 b=nU2UEwuMO0lh9SX2rpyjKC+yMzUJLDSKruZfNDm+orUtrxNRlm2Fmzmga8+U2eAWRE
 N3W/CAiIdrvXnARTBallumAFP9S8PRISrHNL2iTv16YkWCDqUhOVTyW6GYrtBAYpn1fk
 fRzPLQ9bpwpYRrtKSQFo0qkHgq/eO1CFtELvjrr+Ol9ylQ4bB9ldXUiYj8AtjWKS/rrc
 xMU3ZJ0Jf4s2sECOn+teFl0TBzrsOSfPjPNfFAWTIxq7s8nZGKD0BTF15JlP5BTMdYsC
 SCipXZpL7TtUnoYbeaSOFFt+aRGjPmql8neHuTygYxdvRgis7uu6JqYhx8FlyCi1zVwj
 TXtQ==
X-Gm-Message-State: AOAM533NLBiGAZjRw5SXnh33k/fciga3l02oZdrS0ueNNalP3N7w4ajd
 ICErYlT47ViRQcix+o6l9ABMHM0sbx+0VQ==
X-Google-Smtp-Source: ABdhPJz52Syl7+aVRjPvyaySNApMFGF01qUlIkBEbCApJxxdR4OkjZCLOTUgMFc1p88nrjrSM7GR+g==
X-Received: by 2002:a63:ce14:0:b0:381:113d:fd24 with SMTP id
 y20-20020a63ce14000000b00381113dfd24mr1295125pgf.7.1647469316216; 
 Wed, 16 Mar 2022 15:21:56 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 k14-20020aa7820e000000b004f7134a70cdsm3928363pfi.61.2022.03.16.15.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 15:21:55 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] hw/riscv: rivos-iommu: Baseline implementation of
 RIVOS IOMMU.
Date: Wed, 16 Mar 2022 15:21:15 -0700
Message-Id: <20220316222116.2492777-2-tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316222116.2492777-1-tjeznach@rivosinc.com>
References: <20220316222116.2492777-1-tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=tjeznach@rivosinc.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 GOOGLE_DOC_SUSP=1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch introduces baseline implementation of a draft proposal
of RISC-V IOMMU specification as discussed in the RISC-V Forum [1] [2].

The implementation follows a draft version of the specification published
at [3] including all updates available on 2022/03/10.

This patch covers baseline features proposed in the specification:
- Two stage address translation, with Sv32, Sv39, Sv48, Sv57 modes.
- Multilevel device directory tree.
- Cache management command interface.
- Fault reporting interface.

References:
 [1] https://lists.riscv.org/g/tech-privileged/message/875
 [2] https://lists.riscv.org/g/tech-iommu/message/3
 [3] https://docs.google.com/document/d/1ytBZ6eDk1pAeBlZjDvm6_qqJbKQ0fMYKedyx0uoAGB0/view

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 hw/riscv/Kconfig               |    3 +
 hw/riscv/meson.build           |    1 +
 hw/riscv/rivos_iommu.c         | 1350 ++++++++++++++++++++++++++++++++
 hw/riscv/trace-events          |    7 +
 hw/riscv/trace.h               |    2 +
 include/hw/pci/pci_ids.h       |    1 +
 include/hw/riscv/rivos_iommu.h |   80 ++
 meson.build                    |    1 +
 8 files changed, 1445 insertions(+)
 create mode 100644 hw/riscv/rivos_iommu.c
 create mode 100644 hw/riscv/trace-events
 create mode 100644 hw/riscv/trace.h
 create mode 100644 include/hw/riscv/rivos_iommu.h

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 91bb9d21c4..c6cbd7b42c 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -4,6 +4,9 @@ config RISCV_NUMA
 config IBEX
     bool
 
+config RIVOS_IOMMU
+    bool
+
 config MICROCHIP_PFSOC
     bool
     select CADENCE_SDHCI
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
index ab6cae57ea..a2aeb5fab4 100644
--- a/hw/riscv/meson.build
+++ b/hw/riscv/meson.build
@@ -9,5 +9,6 @@ riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
 riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
 riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
 riscv_ss.add(when: 'CONFIG_MICROCHIP_PFSOC', if_true: files('microchip_pfsoc.c'))
+riscv_ss.add(when: 'CONFIG_RIVOS_IOMMU', if_true: files('rivos_iommu.c'))
 
 hw_arch += {'riscv': riscv_ss}
diff --git a/hw/riscv/rivos_iommu.c b/hw/riscv/rivos_iommu.c
new file mode 100644
index 0000000000..f043a6864a
--- /dev/null
+++ b/hw/riscv/rivos_iommu.c
@@ -0,0 +1,1350 @@
+/*
+ * QEMU emulation of an RISC-V RIVOS-IOMMU
+ *
+ * Copyright (C) 2022 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qom/object.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "hw/qdev-properties.h"
+#include "hw/riscv/riscv_hart.h"
+#include "hw/riscv/rivos_iommu.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+
+#include "trace.h"
+
+
+/* Based on Rivos RISC-V IOMMU Specification, Mar 10, 2022 */
+
+/* Rivos I/O programming interface registers */
+#define RIO_REG_CAP             0x0000  /* Supported capabilities  */
+#define RIO_REG_DDTP            0x0010  /* Device Directory Table Pointer */
+#define RIO_REG_CQ_BASE         0x0018  /* Command queue base/head/tail */
+#define RIO_REG_CQ_HEAD         0x0020
+#define RIO_REG_CQ_TAIL         0x0024
+#define RIO_REG_FQ_BASE         0x0028  /* Fault queue base/head/tail */
+#define RIO_REG_FQ_HEAD         0x0030
+#define RIO_REG_FQ_TAIL         0x0034
+#define RIO_REG_PQ_BASE         0x0038  /* Page request queue base/head/tail */
+#define RIO_REG_PQ_HEAD         0x0040
+#define RIO_REG_PQ_TAIL         0x0044
+#define RIO_REG_CQ_CONTROL      0x0048  /* Command queue control */
+#define RIO_REG_FQ_CONTROL      0x004C  /* Fault queue control */
+#define RIO_REG_PQ_CONTROL      0x0050  /* Page request queue control */
+#define RIO_REG_IPSR            0x0054  /* Interrupt pending status  */
+#define RIO_REG_IOCNTOVF        0x0058
+#define RIO_REG_IOCNTINH        0x005C
+#define RIO_REG_IOHPMCYCLES     0x0060
+#define RIO_REG_IOHPMCTR_BASE   0x0068
+#define RIO_REG_IOHPMEVT_BASE   0x0160
+#define RIO_REG_IOCNTSEC        0x0258
+#define RIO_REG_IVEC            0x02F8  /* Interrupt cause to vector mapping */
+#define RIO_REG_MSI_ADDR_BASE   0x0300  /* MSI address for vector #0 */
+#define RIO_REG_MSI_DATA_BASE   0x0308  /* MSI data for vector #0 */
+#define RIO_REG_MSI_CTRL_BASE   0x030C  /* MSI control for vector #0 */
+#define RIO_REG_MSI_PBA_BASE    0x0400  /* MSI Pending Bit Array */
+
+/* Capabilities supported by the IOMMU, RIO_REG_CAP */
+#define RIO_CAP_REVISION_MASK   0x00FF
+#define RIO_CAP_STAGE_ONE      (1ULL << 8)
+#define RIO_CAP_STAGE_TWO      (1ULL << 9)
+#define RIO_CAP_MSI            (1ULL << 10)
+#define RIO_CAP_MRIF           (1ULL << 11)
+#define RIO_CAP_ATS            (1ULL << 12)
+#define RIO_CAP_AMO            (1ULL << 13)
+
+/* Device directory table pointer */
+#define RIO_DDTP_BUSY          (1ULL << 59)
+
+#define RIO_DDTP_MASK_PPN       0x00000FFFFFFFFFFFULL
+#define RIO_DDTP_MASK_MODE      0xF000000000000000ULL
+#define RIO_DDTE_MASK_PPN       0x00FFFFFFFFFFF000ULL
+
+/* Device directory mode values, within RIO_DDTP_MASK_MODE */
+#define RIO_DDTP_MODE_OFF       0
+#define RIO_DDTP_MODE_BARE      1
+#define RIO_DDTP_MODE_3LVL      2
+#define RIO_DDTP_MODE_2LVL      3
+#define RIO_DDTP_MODE_1LVL      4
+#define RIO_DDTP_MODE_MAX       RIO_DDTP_MODE_1LVL
+
+/* Command queue base register */
+#define RIO_CQ_MASK_LOG2SZ      0x000000000000001FULL
+#define RIO_CQ_MASK_PPN         0x0001FFFFFFFFFFE0ULL
+
+/* Command queue control and status register */
+#define RIO_CQ_ENABLE          (1 << 0)
+#define RIO_CQ_IRQ_ENABLE      (1 << 1)
+#define RIO_CQ_FAULT           (1 << 8)
+#define RIO_CQ_TIMEOUT         (1 << 9)
+#define RIO_CQ_ERROR           (1 << 10)
+#define RIO_CQ_ACTIVE          (1 << 16)
+#define RIO_CQ_BUSY            (1 << 17)
+
+/* Fault queue base register */
+#define RIO_FQ_MASK_LOG2SZ      0x000000000000001FULL
+#define RIO_FQ_MASK_PPN         0x0001FFFFFFFFFFE0ULL
+
+/* Fault queue control and status register */
+#define RIO_FQ_ENABLE          (1 << 0)
+#define RIO_FQ_IRQ_ENABLE      (1 << 1)
+#define RIO_FQ_FAULT           (1 << 8)
+#define RIO_FQ_FULL            (1 << 9)
+#define RIO_FQ_ACTIVE          (1 << 16)
+#define RIO_FQ_BUSY            (1 << 17)
+
+/* Page request queue base register */
+#define RIO_PQ_MASK_LOG2SZ      0x000000000000001FULL
+#define RIO_PQ_MASK_PPN         0x0001FFFFFFFFFFE0ULL
+
+/* Page request queue control and status register */
+#define RIO_PQ_ENABLE          (1 << 0)
+#define RIO_PQ_IRQ_ENABLE      (1 << 1)
+#define RIO_PQ_FAULT           (1 << 8)
+#define RIO_PQ_FULL            (1 << 9)
+#define RIO_PQ_ACTIVE          (1 << 16)
+#define RIO_PQ_BUSY            (1 << 17)
+
+/* Interrupt Sources, used for IPSR and IVEC indexing. */
+#define RIO_INT_CQ              0
+#define RIO_INT_FQ              1
+#define RIO_INT_PM              2
+#define RIO_INT_PQ              3
+#define RIO_INT_COUNT           4
+
+/* Device Context */
+typedef struct RivosIOMMUDeviceContext {
+    uint64_t  tc;          /* Translation Control */
+    uint64_t  gatp;        /* IO Hypervisor Guest Address Translation */
+    uint64_t  satp;        /* IO SATP or IO vSATP or PDTP */
+    uint64_t  pscid;       /* Process soft-context ID */
+    uint64_t  msiptp;      /* MSI Page Table Pointer (extended context) */
+    uint64_t  msi_addr_mask;
+    uint64_t  msi_addr_pattern;
+    uint64_t  _reserved;
+} RivosIOMMUDeviceContext;
+
+#define RIO_DCTC_VALID            (1ULL << 0)
+#define RIO_DCTC_EN_ATS           (1ULL << 1)
+#define RIO_DCTC_EN_PRI           (1ULL << 2)
+#define RIO_DCTC_T2GPA            (1ULL << 3)
+#define RIO_DCTC_DIS_TRANS_FAULT  (1ULL << 4)
+#define RIO_DCTC_PDTV             (1ULL << 5)
+
+/* Shared MODE:ASID:PPN masks for GATP, SATP */
+#define RIO_ATP_MASK_PPN           SATP64_PPN
+#define RIO_ATP_MASK_GSCID         SATP64_ASID
+#define RIO_ATP_MASK_MODE          SATP64_MODE
+
+#define RIO_ATP_MODE_SV32          VM_1_10_SV32
+#define RIO_ATP_MODE_SV39          VM_1_10_SV39
+#define RIO_ATP_MODE_SV48          VM_1_10_SV48
+#define RIO_ATP_MODE_SV57          VM_1_10_SV57
+#define RIO_ATP_MODE_BARE          VM_1_10_MBARE
+
+/* satp.mode when tc.RIO_DCTC_PDTV is set */
+#define RIO_PDTP_MODE_BARE         0
+#define RIO_PDTP_MODE_PD20         1
+#define RIO_PDTP_MODE_PD17         2
+#define RIO_PDTP_MODE_PD8          3
+
+#define RIO_DCMSI_VALID            1
+#define RIO_DCMSI_MASK_PPN         0x0FFFFFFFFFFFFFFEULL
+#define RIO_DCMSI_MASK_MODE        0xF000000000000000ULL
+
+#define RIO_DCMSI_MODE_BARE        0
+#define RIO_DCMSI_MODE_FLAT        1
+
+/* I/O Management Unit Command format */
+typedef struct RivosIOMMUCommand {
+    uint64_t request;
+    uint64_t address;
+} RivosIOMMUCommand;
+
+/* RivosIOMMUCommand.request opcode and function mask */
+#define RIO_CMD_MASK_FUN_OP        0x00000000000003FFULL
+
+/* opcode == IOTINVAL.* */
+#define RIO_CMD_IOTINVAL_VMA       0x001
+#define RIO_CMD_IOTINVAL_GVMA      0x081
+#define RIO_CMD_IOTINVAL_MSI       0x101
+
+#define RIO_IOTINVAL_PSCID_VALID   0x0000000000000400ULL
+#define RIO_IOTINVAL_ADDR_VALID    0x0000000000000800ULL
+#define RIO_IOTINVAL_GSCID_VALID   0x0000000000001000ULL
+#define RIO_IOTINVAL_ADDR_NAPOT    0x0000000000002000ULL
+#define RIO_IOTINVAL_MASK_PSCID    0x0000000FFFFF0000ULL
+#define RIO_IOTINVAL_MASK_GSCID    0x00FFFF0000000000ULL
+
+/* opcode == IODIR.* */
+#define RIO_CMD_IODIR_INV_DDT      0x002
+#define RIO_CMD_IODIR_PRE_DDT      0x082
+#define RIO_CMD_IODIR_INV_PDT      0x102
+#define RIO_CMD_IODIR_PRE_PDT      0x182
+
+#define RIO_IODIR_DID_VALID        0x0000000000000400ULL
+#define RIO_IODIR_MASK_PID         0x0000000FFFFF0000ULL
+#define RIO_IODIR_MASK_DID         0xFFFFFF0000000000ULL
+
+/* opcode == IOFENCE.* */
+#define RIO_CMD_IOFENCE_C          0x003
+
+#define RIO_IOFENCE_PR             0x0000000000000400ULL
+#define RIO_IOFENCE_PW             0x0000000000000800ULL
+#define RIO_IOFENCE_AV             0x0000000000001000ULL
+#define RIO_IOFENCE_MASK_DATA      0xFFFFFFFF00000000ULL
+
+/* opcode == ATS */
+#define RIO_CMD_ATS_INVAL          0x004
+#define RIO_CMD_ATS_PRGR           0x084
+
+/* Fault Queue element */
+typedef struct RivosIOMMUEvent {
+    uint64_t reason;
+    uint64_t _rsrvd;
+    uint64_t iova;
+    uint64_t phys;
+} RivosIOMMUEvent;
+
+/* Event reason */
+#define RIO_EVENT_MASK_DID         0x0000000000FFFFFFULL
+#define RIO_EVENT_MASK_PID         0x00000FFFFF000000ULL
+#define RIO_EVENT_PV               0x0000100000000000ULL
+#define RIO_EVENT_PRIV             0x0000200000000000ULL
+#define RIO_EVENT_MASK_TTYP        0x000FC00000000000ULL
+#define RIO_EVENT_MASK_CAUSE       0xFFF0000000000000ULL
+
+#define RIO_TTYP_NONE              0 /* Fault not caused by an inbound trx */
+#define RIO_TTYP_URX               1 /* Untranslated read for execute trx */
+#define RIO_TTYP_URD               2 /* Untranslated read transaction */
+#define RIO_TTYP_UWR               3 /* Untranslated write/AMO transaction */
+#define RIO_TTYP_TRX               4 /* Translated read for execute trx */
+#define RIO_TTYP_TRD               5 /* Translated read transaction */
+#define RIO_TTYP_TWR               6 /* Translated write/AMO transaction */
+#define RIO_TTYP_ATS               7 /* PCIe ATS Translation Request */
+#define RIO_TTYP_MRQ               8 /* Message Request */
+
+#define RIO_ERRC_I_ALIGN           0 /* Instruction address misaligned */
+#define RIO_ERRC_I_FAULT           1 /* Instruction access fault */
+#define RIO_ERRC_RD_ALIGN          4 /* Read address misaligned */
+#define RIO_ERRC_RD_FAULT          5 /* Read access fault */
+#define RIO_ERRC_WR_ALIGN          6 /* Write/AMO address misaligned */
+#define RIO_ERRC_WR_FAULT          7 /* Write/AMO access fault */
+#define RIO_ERRC_PGFAULT_I        12 /* Instruction page fault */
+#define RIO_ERRC_PGFAULT_RD       13 /* Read page fault */
+#define RIO_ERRC_PGFAULT_WR       15 /* Write/AMO page fault */
+#define RIO_ERRC_GPGFAULT_I       20 /* Instruction guest page fault */
+#define RIO_ERRC_GPGFAULT_RD      21 /* Read guest-page fault */
+#define RIO_ERRC_GPGFAULT_WR      23 /* Write/AMO guest-page fault */
+#define RIO_ERRC_DMA_DISABLED    256 /* Inbound transactions disallowed */
+#define RIO_ERRC_DDT_FAULT       257 /* DDT entry load access fault */
+#define RIO_ERRC_DDT_INVALID     258 /* DDT entry not valid */
+#define RIO_ERRC_DDT_UNSUPPORTED 259 /* DDT entry misconfigured */
+#define RIO_ERRC_REQ_INVALID     260 /* Transaction type disallowed */
+#define RIO_ERRC_PDT_FAULT       261 /* PDT entry load access fault. */
+#define RIO_ERRC_PDT_INVALID     262 /* PDT entry not valid */
+#define RIO_ERRC_PDT_UNSUPPORTED 263 /* PDT entry misconfigured */
+#define RIO_ERRC_MSI_FAULT       264 /* MSI PTE load access fault */
+#define RIO_ERRC_MSI_INVALID     265 /* MSI PTE not valid */
+#define RIO_ERRC_MRIF_FAULT      266 /* MRIF access fault */
+
+
+/*
+ * Rivos Inc. I/O Management Unit PCIe Device Emulation
+ */
+
+#ifndef PCI_VENDOR_ID_RIVOS
+#define PCI_VENDOR_ID_RIVOS           0x1efd
+#endif
+
+#ifndef PCI_DEVICE_ID_RIVOS_IOMMU
+#define PCI_DEVICE_ID_RIVOS_IOMMU     0x8001
+#endif
+
+/* Programming interface revision */
+#define RIO_CAP_REVISION              0x0002
+
+#define RIO_REG_MMIO_SIZE             0x0300
+
+#define RIO_ERR_NONE                  0
+#define RIO_ERR_ANY                   1
+
+#define RIO_ERR(cause)                \
+    (RIO_ERR_ANY | (((cause) & 0x0fff) << 16))
+
+#define RIO_ERR_IO(cause, ttyp)       \
+    (RIO_ERR_ANY | (((cause) & 0x0fff) << 16) | (((ttyp) & 0x3f) << 8))
+
+#define RIO_ERR_CAUSE(err)            (((err) >> 16) & 0xfff)
+#define RIO_ERR_TTYP(err)             (((err) >> 8) & 0x3f)
+
+
+/* IO virtual address space wrapper for attached PCI devices */
+struct RivosIOMMUSpace {
+    IOMMUMemoryRegion             mr;
+    AddressSpace                  as;
+    RivosIOMMUState              *iommu;
+    RivosIOMMUDeviceContext       dc;
+    bool                          dc_valid;
+    uint32_t                      devid;
+    QLIST_ENTRY(RivosIOMMUSpace)  list;
+};
+
+
+static uint32_t rivos_iommu_reg_mod(RivosIOMMUState *s,
+    unsigned idx, uint32_t set, uint32_t clr)
+{
+    uint32_t val;
+    qemu_mutex_lock(&s->core_lock);
+    val = ldl_le_p(&s->regs_rw[idx]);
+    stl_le_p(&s->regs_rw[idx], set | (val & ~clr));
+    qemu_mutex_unlock(&s->core_lock);
+    return val;
+}
+
+static unsigned rivos_iommu_irq_vector(RivosIOMMUState *s, int source)
+{
+    const uint32_t ivec = ldl_le_p(&s->regs_rw[RIO_REG_IVEC]);
+    return (ivec >> (source * 4)) & 0x0F;
+}
+
+static void rivos_iommu_irq_use(RivosIOMMUState *s, int source)
+{
+    msix_vector_use(&(s->pci), rivos_iommu_irq_vector(s, source));
+}
+
+static void rivos_iommu_irq_unuse(RivosIOMMUState *s, int source)
+{
+    msix_vector_unuse(&(s->pci), rivos_iommu_irq_vector(s, source));
+}
+
+static void rivos_iommu_irq_assert(RivosIOMMUState *s, int source)
+{
+    uint32_t ipsr = rivos_iommu_reg_mod(s, RIO_REG_IPSR, (1 << source), 0);
+
+    if (!(ipsr & (1 << source)) && msix_enabled(&(s->pci))) {
+        const unsigned vector = rivos_iommu_irq_vector(s, source);
+        msix_notify(&(s->pci), vector);
+    }
+}
+
+static void rivos_iommu_fault_iova(RivosIOMMUSpace *as, int err, hwaddr iova,
+    hwaddr gpa)
+{
+    RivosIOMMUState *s = as->iommu;
+    RivosIOMMUEvent ev;
+    MemTxResult res;
+    MemTxAttrs ma = MEMTXATTRS_UNSPECIFIED;
+    uint32_t head = ldl_le_p(&s->regs_rw[RIO_REG_FQ_HEAD]) & s->fq_mask;
+    uint32_t next = (s->fq_tail + 1) & s->fq_mask;
+    uint32_t ctrl = ldl_le_p(&s->regs_rw[RIO_REG_FQ_CONTROL]);
+    uint32_t ctrl_err = 0;
+
+    ev.reason = as->devid;
+    ev.reason = set_field(ev.reason, RIO_EVENT_MASK_CAUSE, RIO_ERR_CAUSE(err));
+    ev.reason = set_field(ev.reason, RIO_EVENT_MASK_TTYP, RIO_ERR_TTYP(err));
+    ev.iova = iova;
+    ev.phys = gpa;
+
+    trace_rivos_iommu_flt(PCI_BUS_NUM(as->devid), PCI_SLOT(as->devid),
+                          PCI_FUNC(as->devid), RIO_ERR_CAUSE(err), iova);
+
+    if (!(ctrl & RIO_FQ_ACTIVE) || !!(ctrl & (RIO_FQ_FULL | RIO_FQ_FAULT))) {
+        return;
+    }
+
+    if (head == next) {
+        ctrl_err = RIO_FQ_FULL;
+    } else {
+        dma_addr_t addr = s->fq_base + s->fq_tail * sizeof(RivosIOMMUEvent);
+        res = dma_memory_write(&address_space_memory, addr, &ev, sizeof(ev),
+                               ma);
+        if (res != MEMTX_OK) {
+            ctrl_err = RIO_FQ_FAULT;
+        } else {
+            s->fq_tail = next;
+        }
+    }
+
+    stl_le_p(&s->regs_rw[RIO_REG_FQ_TAIL], s->fq_tail);
+
+    if (ctrl_err) {
+        rivos_iommu_reg_mod(s, RIO_REG_CQ_CONTROL, ctrl_err, 0);
+    }
+
+    if (ctrl & RIO_FQ_IRQ_ENABLE) {
+        rivos_iommu_irq_assert(s, RIO_INT_FQ);
+    }
+}
+
+static void rivos_iommu_fault(RivosIOMMUSpace *as, int cause)
+{
+    rivos_iommu_fault_iova(as, cause, 0, 0);
+}
+
+
+/* Risc-V IOMMU Page Table walker.
+ *
+ * Note: Code is based on get_physical_address() from target/riscv/cpu_helper.c
+ * Both implementation can be merged into single helper function in future.
+ * Keeping them separate for now, as error reporting and flow specifics are
+ * sufficiently different for separate implementation.
+ *
+ * Returns RIO_ERR_ with fault code.
+ */
+static int rivos_iommu_fetch_pa(RivosIOMMUSpace *as,
+    hwaddr addr, hwaddr *physical, uint64_t gatp, uint64_t satp,
+    bool first_stage, IOMMUAccessFlags access)
+{
+    MemTxResult res;
+    MemTxAttrs ma = MEMTXATTRS_UNSPECIFIED;
+    hwaddr base;
+    int i, levels, ptidxbits, ptshift, ptesize, mode, widened;
+    uint64_t atp = first_stage ? satp : gatp;
+
+    base = (hwaddr) get_field(atp, RIO_ATP_MASK_PPN) << PGSHIFT;
+    mode = get_field(atp, RIO_ATP_MASK_MODE);
+
+    switch (mode) {
+    case RIO_ATP_MODE_SV32:
+        levels = 2;
+        ptidxbits = 10;
+        ptesize = 4;
+        break;
+    case RIO_ATP_MODE_SV39:
+        levels = 3;
+        ptidxbits = 9;
+        ptesize = 8;
+        break;
+    case RIO_ATP_MODE_SV48:
+        levels = 4;
+        ptidxbits = 9;
+        ptesize = 8;
+        break;
+    case RIO_ATP_MODE_SV57:
+        levels = 5;
+        ptidxbits = 9;
+        ptesize = 8;
+        break;
+    case RIO_ATP_MODE_BARE:
+        if (first_stage) {
+            return rivos_iommu_fetch_pa(as, addr, physical,
+                                        gatp, satp, false, access);
+        }
+        *physical = addr;
+        return RIO_ERR_NONE;
+    default:
+        return RIO_ERR(RIO_ERRC_DDT_UNSUPPORTED);
+    }
+
+    widened = first_stage ? 0 : 2;
+    ptshift = (levels - 1) * ptidxbits;
+
+    /* zero extended address range check */
+    int va_bits = PGSHIFT + levels * ptidxbits + widened;
+    uint64_t va_mask = (1ULL << va_bits) - 1;
+    if ((addr & va_mask) != addr) {
+        return RIO_ERR(RIO_ERRC_DMA_DISABLED);
+    }
+
+    for (i = 0; i < levels; i++, ptshift -= ptidxbits) {
+        target_ulong pte;
+        hwaddr pte_addr;
+        target_ulong idx;
+
+        idx = (addr >> (PGSHIFT + ptshift)) & ((1 << (ptidxbits + widened))-1);
+        pte_addr = base + idx * ptesize;
+        widened = 0;
+
+        if (ptesize == 4) {
+            pte = address_space_ldl(&address_space_memory, pte_addr, ma, &res);
+        } else {
+            pte = address_space_ldq(&address_space_memory, pte_addr, ma, &res);
+        }
+
+        if (res != MEMTX_OK) {
+            return RIO_ERR(RIO_ERRC_PDT_FAULT);
+        }
+
+        hwaddr ppn = pte >> PTE_PPN_SHIFT;
+
+        if (!(pte & PTE_V)) {
+            /* Invalid PTE */
+            return RIO_ERR(RIO_ERRC_PDT_INVALID);
+        } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
+            /* Inner PTE, continue walking */
+            base = ppn << PGSHIFT;
+        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
+            /* Reserved leaf PTE flags: PTE_W */
+            return RIO_ERR(RIO_ERRC_PDT_INVALID);
+        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
+            /* Reserved leaf PTE flags: PTE_W + PTE_X */
+            return RIO_ERR(RIO_ERRC_PDT_INVALID);
+        } else if (ppn & ((1ULL << ptshift) - 1)) {
+            /* Misaligned PPN */
+            return RIO_ERR(RIO_ERRC_PDT_INVALID);
+        } else if ((access & IOMMU_RO) && !(pte & PTE_R)) {
+            /* Read access check failed */
+            return first_stage ? RIO_ERR(RIO_ERRC_GPGFAULT_RD)
+                               : RIO_ERR(RIO_ERRC_PGFAULT_RD);
+        } else if ((access & IOMMU_WO) && !(pte & PTE_W)) {
+            /* Write access check failed */
+            return first_stage ? RIO_ERR(RIO_ERRC_GPGFAULT_WR)
+                               : RIO_ERR(RIO_ERRC_PGFAULT_WR);
+        } else {
+            /* Leaf PTE, update base to translated address. */
+            target_ulong vpn = addr >> PGSHIFT;
+            base = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
+                    (addr & ~TARGET_PAGE_MASK);
+        }
+
+        /* Do the second stage translation if enabled. */
+        if (first_stage) {
+            hwaddr spa;
+
+            int ret = rivos_iommu_fetch_pa(as, base, &spa,
+                                           gatp, satp, false, access);
+
+            /* Report back GPA causing second stage translation fault. */
+            if (ret) {
+                *physical = base;
+                return ret;
+            }
+
+            base = spa;
+        }
+
+        if (pte & (PTE_R | PTE_W | PTE_X)) {
+            /* Leaf PTE, return translated address */
+            *physical = base;
+            return RIO_ERR_NONE;
+        }
+    }
+    return RIO_ERR(RIO_ERRC_PDT_INVALID);
+}
+
+/* Risc-V IOMMU Device Directory Tree walker.
+ *
+ * Returns RIO_ERR_ with fault code.
+ */
+static int rivos_iommu_fetch_dc(RivosIOMMUState *iommu, uint32_t devid,
+    RivosIOMMUDeviceContext *dc)
+{
+    MemTxResult res;
+    MemTxAttrs ma = MEMTXATTRS_UNSPECIFIED;
+    hwaddr addr;
+    const bool dcbase = !iommu->enable_msi;
+    const size_t dcsize = sizeof(*dc) >> dcbase;
+    unsigned int depth = RIO_DDTP_MODE_1LVL - iommu->ddt_mode;
+
+    if (depth > 2) {
+        return RIO_ERR(RIO_ERRC_DDT_UNSUPPORTED);
+    }
+
+    /* Check supported device id range. */
+    if (devid >= (1 << (depth * 9 + 6 + (dcbase && depth != 2)))) {
+        return RIO_ERR(RIO_ERRC_DDT_INVALID);
+    }
+
+    for (addr = iommu->ddt_base; depth-- > 0; ) {
+        const int split = depth * 9 + 6 + dcbase;
+        addr |= ((devid >> split) << 3) & ~TARGET_PAGE_MASK;
+        uint64_t dde = address_space_ldq(&address_space_memory, addr, ma, &res);
+        if (res != MEMTX_OK) {
+            return RIO_ERR(RIO_ERRC_DDT_FAULT);
+        }
+        if (!(dde & RIO_DCTC_VALID)) {
+            return RIO_ERR(RIO_ERRC_DDT_INVALID);
+        }
+        addr = dde & RIO_DDTE_MASK_PPN;
+    }
+
+    /* index into device context entry page */
+    addr |= (devid * dcsize) & ~TARGET_PAGE_MASK;
+
+    memset(dc, 0, sizeof(*dc));
+    res = dma_memory_read(&address_space_memory, addr, dc, dcsize, ma);
+
+    if (res != MEMTX_OK) {
+        return RIO_ERR(RIO_ERRC_DDT_FAULT);
+    }
+
+    if (!(dc->tc & RIO_DCTC_VALID)) {
+        return RIO_ERR(RIO_ERRC_DDT_INVALID);
+    }
+
+    return RIO_ERR_NONE;
+}
+
+static void rivos_iommu_translate_tlb(RivosIOMMUSpace *as,
+    IOMMUAccessFlags flag, IOMMUTLBEntry *tlb)
+{
+    RivosIOMMUState *iommu = as->iommu;
+
+    if (!as->dc_valid) {
+        /* Fetch device context if not cached. */
+        int ret = rivos_iommu_fetch_dc(iommu, as->devid, &as->dc);
+        if (ret != RIO_ERR_NONE) {
+            rivos_iommu_fault(as, ret);
+            return;
+        } else {
+            as->dc_valid = true;
+        }
+    }
+
+    /* MSI window */
+    if (!(((tlb->iova >> PGSHIFT) ^ as->dc.msi_addr_pattern) &
+        ~as->dc.msi_addr_mask)) {
+        if (flag != IOMMU_WO) {
+            /* only writes are allowed. */
+            rivos_iommu_fault_iova(as, RIO_ERR(RIO_ERRC_MRIF_FAULT),
+                                   tlb->iova, 0);
+            return;
+        }
+        if (tlb->iova & ~TARGET_PAGE_MASK) {
+            /* unaligned access. */
+            rivos_iommu_fault_iova(as, RIO_ERR(RIO_ERRC_MRIF_FAULT),
+                                   tlb->iova, 0);
+            return;
+        }
+        if (!(as->dc.msiptp & RIO_DCMSI_VALID)) {
+            /* MSI remapping not enabled */
+            rivos_iommu_fault(as, RIO_ERR(RIO_ERRC_DDT_INVALID));
+            return;
+        }
+        int mode = get_field(as->dc.msiptp, RIO_DCMSI_MASK_MODE);
+        switch (mode) {
+            case RIO_DCMSI_MODE_BARE:
+                tlb->translated_addr = tlb->iova;
+                tlb->addr_mask = ((1ULL << PGSHIFT) - 1);
+                tlb->perm = flag;
+                break;
+
+            case RIO_DCMSI_MODE_FLAT:
+                /* TODO: not implemented, follow AIA section 9.5 */
+                rivos_iommu_fault(as, RIO_ERR(RIO_ERRC_DDT_UNSUPPORTED));
+                return;
+
+            default:
+                rivos_iommu_fault(as, RIO_ERR(RIO_ERRC_DDT_UNSUPPORTED));
+                return;
+        }
+
+        return;
+    }
+
+    /* Lookup SATP */
+    if (as->dc.tc & RIO_DCTC_PDTV) {
+        /* Process directory tree is not supported yet. */
+        rivos_iommu_fault(as, RIO_ERR(RIO_ERRC_PDT_UNSUPPORTED));
+        return;
+    }
+
+    /* Lookup IOATC */
+    /* TODO: merge in IOATC PoC */
+
+    /* Memory access */
+    hwaddr physical;
+    int err = rivos_iommu_fetch_pa(as, tlb->iova, &physical,
+                                   as->dc.gatp, as->dc.satp,
+                                   iommu->enable_stage_one, flag);
+    if (err == RIO_ERR_NONE) {
+        tlb->translated_addr = physical;
+        tlb->addr_mask = ((1ULL << PGSHIFT) - 1);
+        tlb->perm = flag;
+    } else if (!(as->dc.tc & RIO_DCTC_DIS_TRANS_FAULT)) {
+        const int fault = RIO_ERR_IO(RIO_ERR_CAUSE(err),
+            flag == IOMMU_WO ? RIO_TTYP_UWR : RIO_TTYP_URD);
+        rivos_iommu_fault_iova(as, fault, tlb->iova, physical);
+    }
+
+    return;
+}
+
+static const char *IOMMU_FLAG_STR[] = {
+    "NA",
+    "RO",
+    "WR",
+    "RW",
+};
+
+/* Called from RCU critical section */
+static IOMMUTLBEntry rivos_iommu_translate(IOMMUMemoryRegion *iommu_mr,
+    hwaddr addr, IOMMUAccessFlags flag, int iommu_idx)
+{
+    RivosIOMMUSpace *as = container_of(iommu_mr, RivosIOMMUSpace, mr);
+    const uint32_t ddt_mode = as->iommu->ddt_mode;
+    IOMMUTLBEntry tlb = {
+        .iova = addr,
+        .target_as = &address_space_memory,
+        .perm = IOMMU_NONE,
+    };
+
+    switch (ddt_mode) {
+        case RIO_DDTP_MODE_OFF:
+            /* All translations disabled, power-on state. */
+            rivos_iommu_fault_iova(as, RIO_ERR(RIO_ERRC_DMA_DISABLED),
+                                   tlb.iova, 0);
+            break;
+
+        case RIO_DDTP_MODE_BARE:
+            /* Global passthrough mode enabled for all devices. */
+            tlb.translated_addr = tlb.iova;
+            tlb.addr_mask = ~0ULL;
+            tlb.perm = flag;
+            break;
+
+        case RIO_DDTP_MODE_3LVL:
+        case RIO_DDTP_MODE_2LVL:
+        case RIO_DDTP_MODE_1LVL:
+            /* Translate using device directory information. */
+            rivos_iommu_translate_tlb(as, flag, &tlb);
+            break;
+
+        default:
+            /* Invalid device directory tree mode, should never happen. */
+            rivos_iommu_fault(as, RIO_ERR(RIO_ERRC_DDT_UNSUPPORTED));
+            break;
+    }
+
+    trace_rivos_iommu_dma(PCI_BUS_NUM(as->devid), PCI_SLOT(as->devid),
+        PCI_FUNC(as->devid), IOMMU_FLAG_STR[tlb.perm & IOMMU_RW],
+        tlb.iova, tlb.translated_addr);
+
+    return tlb;
+}
+
+static void rivos_iommu_iodir_inval_ddt(RivosIOMMUState *s, bool all,
+    uint32_t devid)
+{
+    RivosIOMMUSpace *as;
+
+    qemu_mutex_lock(&s->core_lock);
+    QLIST_FOREACH(as, &s->spaces, list) {
+        if (all || (as->devid == devid)) {
+            as->dc_valid = false;
+        }
+    }
+    qemu_mutex_unlock(&s->core_lock);
+}
+
+static void rivos_iommu_iofence(RivosIOMMUState *s, bool av, uint64_t addr,
+    uint32_t data)
+{
+    MemTxResult res;
+    MemTxAttrs ma = MEMTXATTRS_UNSPECIFIED;
+
+    if (av) {
+        res = dma_memory_write(&address_space_memory, addr, &data, sizeof(data),
+                               ma);
+        if (res != MEMTX_OK) {
+            rivos_iommu_reg_mod(s, RIO_REG_CQ_CONTROL, RIO_CQ_FAULT, 0);
+        }
+    }
+}
+
+static int rivos_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
+    IOMMUNotifierFlag old, IOMMUNotifierFlag new, Error **errp)
+{
+    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        error_setg(errp, "rivos-iommu does not support dev-iotlb");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static void rivos_iommu_process_cq_tail(RivosIOMMUState *s)
+{
+    RivosIOMMUCommand cmd;
+    MemTxResult res;
+    dma_addr_t addr;
+    MemTxAttrs ma = MEMTXATTRS_UNSPECIFIED;
+    uint32_t tail;
+    uint32_t ctrl = ldl_le_p(&s->regs_rw[RIO_REG_CQ_CONTROL]);
+    uint32_t bdf = pci_get_bdf(&s->pci);
+    uint32_t err = 0;
+
+    /* Fetch latest tail position and clear busy marker */
+    s->cq_tail_db = false;
+    tail = s->cq_mask & ldl_le_p(&s->regs_rw[RIO_REG_CQ_TAIL]);
+
+    /* Check for pending error or queue processing disabled */
+    if (!(ctrl & RIO_CQ_ACTIVE) || !!(ctrl & (RIO_CQ_ERROR | RIO_CQ_FAULT)))
+    {
+        return;
+    }
+
+    while (tail != s->cq_head) {
+        addr = s->cq_base  + s->cq_head * sizeof(cmd);
+        res = dma_memory_read(&address_space_memory, addr, &cmd, sizeof(cmd),
+                              ma);
+
+        if (res != MEMTX_OK) {
+            err = RIO_CQ_FAULT;
+            break;
+        }
+
+        trace_rivos_iommu_cmd(PCI_BUS_NUM(bdf), PCI_SLOT(bdf),
+                              PCI_FUNC(bdf), cmd.request, cmd.address);
+
+        int fun_op = get_field(cmd.request, RIO_CMD_MASK_FUN_OP);
+
+        switch(fun_op) {
+            case RIO_CMD_IOFENCE_C:
+                rivos_iommu_iofence(s, !!(cmd.request & RIO_IOFENCE_AV),
+                    cmd.address,
+                    get_field(cmd.request, RIO_IOFENCE_MASK_DATA));
+                break;
+
+            case RIO_CMD_IOTINVAL_GVMA:
+                /* IOTLB not implemented */
+                break;
+
+            case RIO_CMD_IOTINVAL_MSI:
+                /* IOTLB not implemented */
+                break;
+
+            case RIO_CMD_IOTINVAL_VMA:
+                /* IOTLB not implemented */
+                break;
+
+            case RIO_CMD_IODIR_INV_DDT:
+                rivos_iommu_iodir_inval_ddt(s,
+                        !(cmd.request & RIO_IODIR_DID_VALID),
+                        get_field(cmd.request, RIO_IODIR_MASK_DID));
+                break;
+
+            case RIO_CMD_IODIR_INV_PDT:
+                /* PDT invalidate not implemented. */
+                break;
+
+            case RIO_CMD_IODIR_PRE_DDT:
+                /* DDT pre-fetching not implemented. */
+                break;
+
+            case RIO_CMD_IODIR_PRE_PDT:
+                /* PDT pre-fetching not implemented. */
+                break;
+
+            default:
+                err = RIO_CQ_ERROR;
+                break;
+        }
+
+        /* Invalid instruction, keep cq_head at failed instruction index. */
+        if (err) {
+            break;
+        }
+
+        s->cq_head = (s->cq_head + 1) & s->cq_mask;
+    }
+
+    stl_le_p(&s->regs_rw[RIO_REG_CQ_HEAD], s->cq_head);
+
+    if (err) {
+        rivos_iommu_reg_mod(s, RIO_REG_CQ_CONTROL, err, 0);
+    }
+
+    if (ctrl & RIO_CQ_IRQ_ENABLE) {
+        rivos_iommu_irq_assert(s, RIO_INT_CQ);
+    }
+}
+
+static void rivos_iommu_process_ddtp(RivosIOMMUState *s)
+{
+    uint64_t base = ldq_le_p(&s->regs_rw[RIO_REG_DDTP]) & ~RIO_DDTP_BUSY;
+    uint32_t mode = get_field(base, RIO_DDTP_MASK_MODE);
+    bool ok;
+
+    /* Allowed DDTP.MODE transitions:
+     * {OFF, BARE} -> {OFF, BARE, 1LVL, 2LVL, 3LVL}
+     * {1LVL, 2LVL, 3LVL} -> {OFF, BARE}
+     */
+
+    if (s->ddt_mode == mode) {
+        ok = true;
+    } else if (s->ddt_mode == RIO_DDTP_MODE_OFF ||
+               s->ddt_mode == RIO_DDTP_MODE_BARE) {
+        ok = mode == RIO_DDTP_MODE_1LVL ||
+             mode == RIO_DDTP_MODE_2LVL ||
+             mode == RIO_DDTP_MODE_3LVL;
+    } else {
+        ok = mode == RIO_DDTP_MODE_OFF ||
+             mode == RIO_DDTP_MODE_BARE;
+    }
+
+    if (ok) {
+        s->ddt_base = get_field(base, RIO_DDTP_MASK_PPN) << PGSHIFT;
+        s->ddt_mode = mode;
+    } else {
+        /* report back last valid mode and device directory table pointer. */
+        base = s->ddt_base >> PGSHIFT;
+        base = set_field(base, RIO_DDTP_MASK_MODE, s->ddt_mode);
+    }
+
+    stq_le_p(&s->regs_rw[RIO_REG_DDTP], base);
+}
+
+static void rivos_iommu_process_cq_control(RivosIOMMUState *s)
+{
+    uint64_t base;
+    uint32_t ctrl_set = ldl_le_p(&s->regs_rw[RIO_REG_CQ_CONTROL]);
+    uint32_t ctrl_clr;
+    bool enable = !!(ctrl_set & RIO_FQ_ENABLE);
+    bool active = !!(ctrl_set & RIO_FQ_ACTIVE);
+
+    if (enable && !active) {
+        base = ldq_le_p(&s->regs_rw[RIO_REG_CQ_BASE]);
+        s->cq_mask = (2ULL << get_field(base, RIO_CQ_MASK_LOG2SZ)) - 1;
+        s->cq_base = get_field(base, RIO_CQ_MASK_PPN) << PGSHIFT;
+        s->cq_head = 0;
+        rivos_iommu_irq_use(s, RIO_INT_CQ);
+        stl_le_p(&s->regs_ro[RIO_REG_CQ_TAIL], ~s->cq_mask);
+        stl_le_p(&s->regs_rw[RIO_REG_CQ_HEAD], s->cq_head);
+        stl_le_p(&s->regs_rw[RIO_REG_CQ_TAIL], s->cq_head);
+        ctrl_set = RIO_CQ_ACTIVE;
+        ctrl_clr = RIO_CQ_BUSY | RIO_CQ_FAULT | RIO_CQ_ERROR | RIO_CQ_TIMEOUT;
+    } else if (!enable && active) {
+        rivos_iommu_irq_unuse(s, RIO_INT_CQ);
+        stl_le_p(&s->regs_ro[RIO_REG_CQ_TAIL], ~0);
+        ctrl_set = 0;
+        ctrl_clr = RIO_CQ_BUSY | RIO_CQ_ACTIVE;
+    } else {
+        ctrl_set = 0;
+        ctrl_clr = RIO_CQ_BUSY;
+    }
+
+    rivos_iommu_reg_mod(s, RIO_REG_CQ_CONTROL, ctrl_set, ctrl_clr);
+}
+
+static void rivos_iommu_process_fq_control(RivosIOMMUState *s)
+{
+    uint64_t base;
+    uint32_t ctrl_set = ldl_le_p(&s->regs_rw[RIO_REG_FQ_CONTROL]);
+    uint32_t ctrl_clr;
+    bool enable = !!(ctrl_set & RIO_FQ_ENABLE);
+    bool active = !!(ctrl_set & RIO_FQ_ACTIVE);
+
+    if (enable && !active) {
+        base = ldq_le_p(&s->regs_rw[RIO_REG_FQ_BASE]);
+        s->fq_mask = (2ULL << get_field(base, RIO_FQ_MASK_LOG2SZ)) - 1;
+        s->fq_base = get_field(base, RIO_FQ_MASK_PPN) << PGSHIFT;
+        s->fq_tail = 0;
+        rivos_iommu_irq_use(s, RIO_INT_FQ);
+        stl_le_p(&s->regs_rw[RIO_REG_FQ_HEAD], s->fq_tail);
+        stl_le_p(&s->regs_rw[RIO_REG_FQ_TAIL], s->fq_tail);
+        stl_le_p(&s->regs_ro[RIO_REG_FQ_HEAD], ~s->fq_mask);
+        ctrl_set = RIO_FQ_ACTIVE;
+        ctrl_clr = RIO_FQ_BUSY | RIO_FQ_FAULT | RIO_FQ_FULL;
+    } else if (!enable && active) {
+        rivos_iommu_irq_unuse(s, RIO_INT_FQ);
+        stl_le_p(&s->regs_ro[RIO_REG_FQ_HEAD], ~0);
+        ctrl_set = 0;
+        ctrl_clr = RIO_FQ_BUSY | RIO_FQ_ACTIVE;
+    } else {
+        ctrl_set = 0;
+        ctrl_clr = RIO_FQ_BUSY;
+    }
+
+    rivos_iommu_reg_mod(s, RIO_REG_FQ_CONTROL, ctrl_set, ctrl_clr);
+}
+
+static void rivos_iommu_process_pq_control(RivosIOMMUState *s)
+{
+    uint64_t base;
+    uint32_t ctrl_set = ldl_le_p(&s->regs_rw[RIO_REG_PQ_CONTROL]);
+    uint32_t ctrl_clr;
+    bool enable = !!(ctrl_set & RIO_PQ_ENABLE);
+    bool active = !!(ctrl_set & RIO_PQ_ACTIVE);
+
+    if (enable && !active) {
+        base = ldq_le_p(&s->regs_rw[RIO_REG_PQ_BASE]);
+        s->pq_mask = (2ULL << get_field(base, RIO_PQ_MASK_LOG2SZ)) - 1;
+        s->pq_base = get_field(base, RIO_PQ_MASK_PPN) << PGSHIFT;
+        s->pq_tail = 0;
+        rivos_iommu_irq_use(s, RIO_INT_PQ);
+        stl_le_p(&s->regs_rw[RIO_REG_PQ_HEAD], s->pq_tail);
+        stl_le_p(&s->regs_rw[RIO_REG_PQ_TAIL], s->pq_tail);
+        stl_le_p(&s->regs_ro[RIO_REG_PQ_HEAD], ~s->pq_mask);
+        ctrl_set = RIO_PQ_ACTIVE;
+        ctrl_clr = RIO_PQ_BUSY | RIO_PQ_FAULT | RIO_PQ_FULL;
+    } else if (!enable && active) {
+        rivos_iommu_irq_unuse(s, RIO_INT_PQ);
+        stl_le_p(&s->regs_ro[RIO_REG_PQ_HEAD], ~0);
+        ctrl_set = 0;
+        ctrl_clr = RIO_PQ_BUSY | RIO_PQ_ACTIVE;
+    } else {
+        ctrl_set = 0;
+        ctrl_clr = RIO_PQ_BUSY;
+    }
+
+    rivos_iommu_reg_mod(s, RIO_REG_PQ_CONTROL, ctrl_set, ctrl_clr);
+}
+
+static void *rivos_iommu_core_proc(void* arg)
+{
+    RivosIOMMUState *s = arg;
+
+    qemu_mutex_lock(&s->core_lock);
+    while (!s->core_stop) {
+        if (s->cq_tail_db) {
+            qemu_mutex_unlock(&s->core_lock);
+            rivos_iommu_process_cq_tail(s);
+        } else if (ldl_le_p(&s->regs_rw[RIO_REG_CQ_CONTROL]) & RIO_CQ_BUSY) {
+            qemu_mutex_unlock(&s->core_lock);
+            rivos_iommu_process_cq_control(s);
+        } else if (ldl_le_p(&s->regs_rw[RIO_REG_FQ_CONTROL]) & RIO_FQ_BUSY) {
+            qemu_mutex_unlock(&s->core_lock);
+            rivos_iommu_process_fq_control(s);
+        } else if (ldl_le_p(&s->regs_rw[RIO_REG_PQ_CONTROL]) & RIO_PQ_BUSY) {
+            qemu_mutex_unlock(&s->core_lock);
+            rivos_iommu_process_pq_control(s);
+        } else if (ldq_le_p(&s->regs_rw[RIO_REG_DDTP]) & RIO_DDTP_BUSY) {
+            qemu_mutex_unlock(&s->core_lock);
+            rivos_iommu_process_ddtp(s);
+        } else {
+            qemu_cond_wait(&s->core_cond, &s->core_lock);
+            continue;
+        }
+        qemu_mutex_lock(&s->core_lock);
+    }
+    qemu_mutex_unlock(&s->core_lock);
+
+    return NULL;
+}
+
+static void rivos_iommu_mmio_write(void *opaque, hwaddr addr, uint64_t val,
+                             unsigned size)
+{
+    RivosIOMMUState *s = opaque;
+    uint64_t busy = 0;
+    bool wakeup = true;
+
+    if (addr + size > sizeof(s->regs_rw)) {
+        /* unsupported MMIO access location */
+        return;
+    }
+
+    /* actionable MMIO write. */
+    switch (addr) {
+        case RIO_REG_DDTP:
+            busy = RIO_DDTP_BUSY;
+            break;
+
+        /* upper half DDTP update */
+        case RIO_REG_DDTP + 4:
+            busy = RIO_DDTP_BUSY >> 32;
+            break;
+
+        case RIO_REG_CQ_TAIL:
+            s->cq_tail_db = true;
+            break;
+
+        case RIO_REG_CQ_CONTROL:
+            busy = RIO_CQ_BUSY;
+            break;
+
+        case RIO_REG_FQ_CONTROL:
+            busy = RIO_FQ_BUSY;
+            break;
+
+        case RIO_REG_PQ_CONTROL:
+            busy = RIO_PQ_BUSY;
+            break;
+
+        default:
+            wakeup = false;
+            break;
+    }
+
+    qemu_mutex_lock(&s->core_lock);
+    if (size == 1) {
+        uint8_t ro = s->regs_ro[addr];
+        uint8_t wc = s->regs_wc[addr];
+        uint8_t rw = s->regs_rw[addr];
+        s->regs_rw[addr] = ((rw & ro) | (val & ~ro)) & ~(val & wc);
+    } else if (size == 2) {
+        uint16_t ro = lduw_le_p(&s->regs_ro[addr]);
+        uint16_t wc = lduw_le_p(&s->regs_wc[addr]);
+        uint16_t rw = lduw_le_p(&s->regs_rw[addr]);
+        stw_le_p(&s->regs_rw[addr], ((rw & ro) | (val & ~ro)) & ~(val & wc));
+    } else if (size == 4) {
+        uint32_t ro = ldl_le_p(&s->regs_ro[addr]);
+        uint32_t wc = ldl_le_p(&s->regs_wc[addr]);
+        uint32_t rw = ldl_le_p(&s->regs_rw[addr]) | busy;
+        stl_le_p(&s->regs_rw[addr], ((rw & ro) | (val & ~ro)) & ~(val & wc));
+    } else if (size == 8) {
+        uint64_t ro = ldq_le_p(&s->regs_ro[addr]);
+        uint64_t wc = ldq_le_p(&s->regs_wc[addr]);
+        uint64_t rw = ldq_le_p(&s->regs_rw[addr]) | busy;
+        stq_le_p(&s->regs_rw[addr], ((rw & ro) | (val & ~ro)) & ~(val & wc));
+    }
+
+    /* wakeup core processing thread */
+    if (wakeup) {
+        qemu_cond_signal(&s->core_cond);
+    }
+    qemu_mutex_unlock(&s->core_lock);
+}
+
+static uint64_t rivos_iommu_mmio_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RivosIOMMUState *s = opaque;
+    uint64_t val = -1;
+
+    if (addr + size > sizeof(s->regs_rw)) {
+        return (uint64_t)-1;
+    } else if (size == 1) {
+        val = (uint64_t) s->regs_rw[addr];
+    } else if (size == 2) {
+        val = lduw_le_p(&s->regs_rw[addr]);
+    } else if (size == 4) {
+        val = ldl_le_p(&s->regs_rw[addr]);
+    } else if (size == 8) {
+        val = ldq_le_p(&s->regs_rw[addr]);
+    }
+
+    return val;
+}
+
+static const MemoryRegionOps rivos_iommu_mmio_ops = {
+    .read = rivos_iommu_mmio_read,
+    .write = rivos_iommu_mmio_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = false,
+    },
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+    }
+};
+
+static AddressSpace *rivos_iommu_dma_as(PCIBus *bus, void *opaque, int devfn)
+{
+    RivosIOMMUState *s = opaque;
+    RivosIOMMUSpace *as;
+    char name[64];
+    uint32_t devid = PCI_BUILD_BDF(pci_bus_num(bus), devfn);
+    uint32_t iommu_devid = pci_get_bdf(&s->pci);
+
+    if (iommu_devid == devid) {
+        /* No translation for IOMMU device itself. */
+        return &address_space_memory;
+    }
+
+    qemu_mutex_lock(&s->core_lock);
+    QLIST_FOREACH(as, &s->spaces, list) {
+        if (as->devid == devid)
+            break;
+    }
+    qemu_mutex_unlock(&s->core_lock);
+
+    if (as == NULL) {
+        as = g_malloc0(sizeof(RivosIOMMUSpace));
+
+        as->iommu = s;
+        as->devid = devid;
+
+        snprintf(name, sizeof(name), "rivos-iommu-%04x:%02x.%d-iova",
+            PCI_BUS_NUM(as->devid), PCI_SLOT(as->devid), PCI_FUNC(as->devid));
+
+        memory_region_init_iommu(&as->mr, sizeof(as->mr),
+            TYPE_RIVOS_IOMMU_MEMORY_REGION,
+            OBJECT(as), name, UINT64_MAX);
+
+        address_space_init(&as->as, MEMORY_REGION(&as->mr),
+                           TYPE_RIVOS_IOMMU_PCI);
+
+        qemu_mutex_lock(&s->core_lock);
+        QLIST_INSERT_HEAD(&s->spaces, as, list);
+        qemu_mutex_unlock(&s->core_lock);
+
+        trace_rivos_iommu_new(PCI_BUS_NUM(iommu_devid), PCI_SLOT(iommu_devid),
+            PCI_FUNC(iommu_devid), PCI_BUS_NUM(as->devid), PCI_SLOT(as->devid),
+            PCI_FUNC(as->devid));
+    }
+
+    return &as->as;
+}
+
+static void rivos_iommu_reg_reset(RivosIOMMUState *s)
+{
+    const uint64_t cap = (s->version & RIO_CAP_REVISION_MASK) |
+                   (s->enable_stage_one * RIO_CAP_STAGE_ONE) |
+                   (s->enable_stage_two * RIO_CAP_STAGE_TWO) |
+                   (s->enable_msi * RIO_CAP_MSI);
+
+    /* Mark all registers read-only */
+    memset(s->regs_ro, 0xff, sizeof(s->regs_ro));
+
+    /* Set power-on register state */
+    stq_le_p(&s->regs_rw[RIO_REG_CAP], cap);
+    stq_le_p(&s->regs_ro[RIO_REG_DDTP],
+        ~(RIO_DDTP_MASK_PPN | RIO_DDTP_MASK_MODE));
+    stq_le_p(&s->regs_ro[RIO_REG_CQ_BASE],
+        ~(RIO_CQ_MASK_LOG2SZ | RIO_CQ_MASK_PPN));
+    stq_le_p(&s->regs_ro[RIO_REG_FQ_BASE],
+        ~(RIO_FQ_MASK_LOG2SZ | RIO_FQ_MASK_PPN));
+    stq_le_p(&s->regs_ro[RIO_REG_PQ_BASE],
+        ~(RIO_PQ_MASK_LOG2SZ | RIO_PQ_MASK_PPN));
+    stl_le_p(&s->regs_wc[RIO_REG_CQ_CONTROL],
+        RIO_CQ_FAULT | RIO_CQ_TIMEOUT | RIO_CQ_ERROR);
+    stl_le_p(&s->regs_ro[RIO_REG_CQ_CONTROL], RIO_CQ_ACTIVE | RIO_CQ_BUSY);
+    stl_le_p(&s->regs_wc[RIO_REG_FQ_CONTROL], RIO_FQ_FAULT | RIO_FQ_FULL);
+    stl_le_p(&s->regs_ro[RIO_REG_FQ_CONTROL], RIO_FQ_ACTIVE | RIO_FQ_BUSY);
+    stl_le_p(&s->regs_wc[RIO_REG_PQ_CONTROL], RIO_PQ_FAULT | RIO_PQ_FULL);
+    stl_le_p(&s->regs_ro[RIO_REG_PQ_CONTROL], RIO_PQ_ACTIVE | RIO_PQ_BUSY);
+    stl_le_p(&s->regs_wc[RIO_REG_IPSR], ~0);
+}
+
+static void rivos_iommu_realize(PCIDevice *dev, Error **errp)
+{
+    DeviceState *d = DEVICE(dev);
+    RivosIOMMUState *s = RIVOS_IOMMU_PCI(d);
+    const uint64_t bar_size =
+        pow2ceil(QEMU_ALIGN_UP(sizeof(s->regs_rw), TARGET_PAGE_SIZE));
+    Error *err = NULL;
+
+    QLIST_INIT(&s->spaces);
+    qemu_cond_init(&s->core_cond);
+    qemu_mutex_init(&s->core_lock);
+    rivos_iommu_reg_reset(s);
+
+    qemu_thread_create(&s->core_proc, "rivos-iommu-core",
+        rivos_iommu_core_proc, s, QEMU_THREAD_JOINABLE);
+
+    memory_region_init(&s->bar0, OBJECT(s),
+            "rivos-iommu-bar0", bar_size);
+    memory_region_init_io(&s->mmio, OBJECT(s), &rivos_iommu_mmio_ops, s,
+            "rivos-iommu", sizeof(s->regs_rw));
+    memory_region_add_subregion(&s->bar0, 0, &s->mmio);
+
+    pcie_endpoint_cap_init(dev, 0x80);
+
+    pci_register_bar(dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
+            PCI_BASE_ADDRESS_MEM_TYPE_64, &s->bar0);
+
+    int ret = msix_init(dev, RIO_INT_COUNT,
+                    &s->bar0, 0, RIO_REG_MSI_ADDR_BASE,
+                    &s->bar0, 0, RIO_REG_MSI_PBA_BASE, 0, &err);
+
+    if (ret == -ENOTSUP) {
+        /* MSI-x is not supported by the platform.
+         * Driver should use timer/polling based notification handlers.
+         */
+        warn_report_err(err);
+    } else if (ret < 0) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    /* TODO: find root port bus ranges and use for FDT/ACPI generation. */
+    PCIBus *bus = pci_device_root_bus(dev);
+    if (!bus) {
+        error_setg(errp, "can't find PCIe root port for %02x:%02x.%x",
+            pci_bus_num(pci_get_bus(dev)), PCI_SLOT(dev->devfn),
+            PCI_FUNC(dev->devfn));
+        return;
+    }
+
+    pci_setup_iommu(bus, rivos_iommu_dma_as, s);
+}
+
+static void rivos_iommu_exit(PCIDevice *dev)
+{
+    DeviceState *d = DEVICE(dev);
+    RivosIOMMUState *s = RIVOS_IOMMU_PCI(d);
+
+    qemu_mutex_lock(&s->core_lock);
+    s->core_stop = true;
+    qemu_cond_signal(&s->core_cond);
+    qemu_mutex_unlock(&s->core_lock);
+    qemu_thread_join(&s->core_proc);
+    qemu_cond_destroy(&s->core_cond);
+    qemu_mutex_destroy(&s->core_lock);
+}
+
+static const VMStateDescription rivos_iommu_vmstate = {
+    .name = "rivos-iommu",
+    .unmigratable = 1
+};
+
+static Property rivos_iommu_properties[] = {
+    DEFINE_PROP_UINT32("version", RivosIOMMUState, version, RIO_CAP_REVISION),
+    DEFINE_PROP_BOOL("msi", RivosIOMMUState, enable_msi, TRUE),
+    DEFINE_PROP_BOOL("stage-one", RivosIOMMUState, enable_stage_one, TRUE),
+    DEFINE_PROP_BOOL("stage-two", RivosIOMMUState, enable_stage_two, TRUE),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void rivos_iommu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, rivos_iommu_properties);
+    k->realize = rivos_iommu_realize;
+    k->exit = rivos_iommu_exit;
+    k->vendor_id = PCI_VENDOR_ID_RIVOS;
+    k->device_id = PCI_DEVICE_ID_RIVOS_IOMMU;
+    k->revision = 0;
+    k->class_id = PCI_CLASS_SYSTEM_IOMMU;
+    dc->desc = "RIVOS-IOMMU (RIO) DMA Remapping device";
+    dc->vmsd = &rivos_iommu_vmstate;
+    dc->hotpluggable = false;
+    dc->user_creatable = true;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo rivos_iommu_pci = {
+    .name = TYPE_RIVOS_IOMMU_PCI,
+    .parent = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(RivosIOMMUState),
+    .class_init = rivos_iommu_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { },
+    },
+};
+
+static void rivos_iommu_memory_region_class_init(ObjectClass *klass, void *data)
+{
+    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_CLASS(klass);
+
+    imrc->translate = rivos_iommu_translate;
+    imrc->notify_flag_changed = rivos_iommu_notify_flag_changed;
+}
+
+static const TypeInfo rivos_iommu_memory_region_info = {
+    .parent = TYPE_IOMMU_MEMORY_REGION,
+    .name = TYPE_RIVOS_IOMMU_MEMORY_REGION,
+    .class_init = rivos_iommu_memory_region_class_init,
+};
+
+static void rivos_iommu_register_types(void)
+{
+    type_register_static(&rivos_iommu_pci);
+    type_register_static(&rivos_iommu_memory_region_info);
+}
+
+type_init(rivos_iommu_register_types);
diff --git a/hw/riscv/trace-events b/hw/riscv/trace-events
new file mode 100644
index 0000000000..c3618764ed
--- /dev/null
+++ b/hw/riscv/trace-events
@@ -0,0 +1,7 @@
+# See documentation at docs/devel/tracing.rst
+
+# rivos-iommu.c
+rivos_iommu_new(int bus, int slot, int func, int dbus, int dslot, int dfunc) "NEW %04x:%02x.%d attached %04x:%02x.%d"
+rivos_iommu_flt(int bus, int slot, int func, int cause, uint64_t iova) "FLT %04x:%02x.%d cause: %d iova: 0x%"PRIx64
+rivos_iommu_dma(int bus, int slot, int func, const char *dir, uint64_t iova, uint64_t phys) "TLB q%04x:%02x.%d %s 0x%"PRIx64" -> 0x%"PRIx64
+rivos_iommu_cmd(int bus, int slot, int func, uint64_t l, uint64_t u) "CMD %04x:%02x.%d 0x%"PRIx64" 0x%"PRIx64
diff --git a/hw/riscv/trace.h b/hw/riscv/trace.h
new file mode 100644
index 0000000000..b88504b750
--- /dev/null
+++ b/hw/riscv/trace.h
@@ -0,0 +1,2 @@
+#include "trace/trace-hw_riscv.h"
+
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 11abe22d46..73dad2aced 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -88,6 +88,7 @@
 #define PCI_CLASS_SYSTEM_RTC             0x0803
 #define PCI_CLASS_SYSTEM_PCI_HOTPLUG     0x0804
 #define PCI_CLASS_SYSTEM_SDHCI           0x0805
+#define PCI_CLASS_SYSTEM_IOMMU           0x0806
 #define PCI_CLASS_SYSTEM_OTHER           0x0880
 
 #define PCI_BASE_CLASS_INPUT             0x09
diff --git a/include/hw/riscv/rivos_iommu.h b/include/hw/riscv/rivos_iommu.h
new file mode 100644
index 0000000000..097086d83e
--- /dev/null
+++ b/include/hw/riscv/rivos_iommu.h
@@ -0,0 +1,80 @@
+/*
+ * QEMU emulation of an RISC-V RIVOS-IOMMU
+ *
+ * Copyright (C) 2022 Rivos Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RIVOS_IOMMU_H
+#define HW_RIVOS_IOMMU_H
+
+#include "hw/sysbus.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
+#include "qom/object.h"
+
+#define TYPE_RIVOS_IOMMU_PCI "rivos-iommu"
+OBJECT_DECLARE_SIMPLE_TYPE(RivosIOMMUState, RIVOS_IOMMU_PCI)
+
+#define TYPE_RIVOS_IOMMU_MEMORY_REGION "rivos-iommu-memory-region"
+
+typedef struct RivosIOMMUState RivosIOMMUState;
+typedef struct RivosIOMMUSpace RivosIOMMUSpace;
+
+#define RIVOS_IOMMU_REGS_SIZE 0x300  /* control registers space        */
+
+/*
+ * IO virtual address space remapping device state.
+ */
+struct RivosIOMMUState {
+    PCIDevice pci;                   /* Parent PCI device              */
+
+    MemoryRegion bar0;
+    MemoryRegion mmio;
+    uint8_t regs_rw[RIVOS_IOMMU_REGS_SIZE]; /* MMIO register state     */
+    uint8_t regs_wc[RIVOS_IOMMU_REGS_SIZE]; /* MMIO write-1-to-clear   */
+    uint8_t regs_ro[RIVOS_IOMMU_REGS_SIZE]; /* MMIO read/only mask     */
+
+    /* IOMMU Properties */
+    uint32_t version;
+    bool enable_msi;                 /* Enable MSI translation         */
+    bool enable_stage_one;           /* Enable IOVA->GPA translation   */
+    bool enable_stage_two;           /* Enable GPA->SPA translation    */
+
+    QemuCond core_cond;
+    QemuMutex core_lock;
+    QemuThread core_proc;
+    bool core_stop;
+
+    hwaddr ddt_base;
+    uint32_t ddt_mode;
+    int ddt_depth;
+
+    hwaddr cq_base;
+    uint32_t cq_mask;
+    uint32_t cq_head;
+    bool cq_tail_db;
+
+    hwaddr fq_base;
+    uint32_t fq_mask;
+    uint32_t fq_tail;
+
+    hwaddr pq_base;
+    uint32_t pq_mask;
+    uint32_t pq_tail;
+
+    QLIST_HEAD(, RivosIOMMUSpace) spaces;
+};
+
+#endif
diff --git a/meson.build b/meson.build
index bae62efc9c..62d2a56326 100644
--- a/meson.build
+++ b/meson.build
@@ -2688,6 +2688,7 @@ if have_system
     'hw/ppc',
     'hw/rdma',
     'hw/rdma/vmw',
+    'hw/riscv',
     'hw/rtc',
     'hw/s390x',
     'hw/scsi',
-- 
2.25.1


