Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D927C693CDF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 04:23:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRPPc-0007rE-Sy; Sun, 12 Feb 2023 22:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pRPPa-0007qx-Cy
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 22:21:50 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pRPPX-0003O3-87
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 22:21:49 -0500
Received: by mail-pj1-x1030.google.com with SMTP id bx22so10623439pjb.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 19:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nP+UEs1brdAYX6cbHe9qe6Nxd3L4B1pFoBOSfW2Gvcw=;
 b=g/sN1Zj/iR0xplzpKREeEYabXcutVGMSqpI6XTRMqfwK9tPwoUSNNuqDymroBDDOOS
 Nhyy86YaUiPjlJBcbfZHhmN93ExMaqalQ7fUExVd2VMlJBlbUO0irqXQcSQaZ78zmpuH
 GWwiJrX1sFcZ6fmDVTV1ylJCUbyoUHZ+xNK4/s7FeLFWbWyhuR+d1OTBgI4nRK50mrAF
 iFbK+dI3Z+x/0I/1TPDF039NJwCY9B3mWPml21y/lyqISu2NzBTiBgMJ56UfcOyvdFkF
 ccW858VWg1VIj9CPm4evDRR999Db04KJamaTvg/EPw62QyV7mAFqPCDujmKaynfDT9K2
 6ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nP+UEs1brdAYX6cbHe9qe6Nxd3L4B1pFoBOSfW2Gvcw=;
 b=6wPBAb7lwxtPN8N837hhY7u7jktbvq9BFEQRoQDn8arSibqsqNbk9qIkGy9aNQt760
 Dfs7+IjJ3uzWKNJraohP41xm33iGa+FApp1usOLH0zw6rklrGl90Ii8/IoV0V7Re3t7Q
 DNbAyLJu6HToPyrqBRfUluH+Tqu/SbwvIvelI4F90fia0VUvhdA4gtIm5vUpIhkRofcc
 hLxDYzNad9+kDSVy6Xyqt0RqRmUJj2HxjWD30eB1i269e67Et/gm55nJ4VW0UzdAb9pc
 D5yYyO78FghtovERU8mMamOecEslaVLa23Ou3w0IyYcfeVre1GSKw4JIqTgYOmLFtE+E
 N+ug==
X-Gm-Message-State: AO0yUKWrbLZw4uYQq9JZJNo6LCWRz+dP6cia1/pmBNAIkvMdOEq9p30I
 NpidCaKDrxLo3IeUs9UPkwwXww==
X-Google-Smtp-Source: AK7set8XfiXCiqIKqza8mvYaafGhXp98WRjb7iukG2zElISZQ4Z84TGeTkQ90vERvG7SegBi1P28OQ==
X-Received: by 2002:a05:6a20:4e1f:b0:bf:5459:cc70 with SMTP id
 gk31-20020a056a204e1f00b000bf5459cc70mr20420246pzb.41.1676258505649; 
 Sun, 12 Feb 2023 19:21:45 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 s3-20020aa78d43000000b00593906a8843sm6999333pfe.176.2023.02.12.19.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 19:21:45 -0800 (PST)
Date: Sun, 12 Feb 2023 19:21:43 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: weiwei <liweiwei@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 RFC Zisslpcfi 2/9] target/riscv: zisslpcfi CSR, bit
 positions and other definitions
Message-ID: <20230213032143.GB3943238@debug.ba.rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-3-debug@rivosinc.com>
 <6b182beb-7e7d-45eb-50ec-3b822759c535@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6b182beb-7e7d-45eb-50ec-3b822759c535@iscas.ac.cn>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=debug@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, Feb 11, 2023 at 11:32:17AM +0800, weiwei wrote:
>
>On 2023/2/9 14:23, Deepak Gupta wrote:
>>`zisslpcfi` extension adds two new CSRs. CSR_SSP and CSR_LPLR.
>>- CSR_SSP: This CSR holds shadow stack pointer for current privilege mode
>>            CSR_SSP is accessible in all modes. Each mode must establish
>>            it's own CSR_SSP.
>>
>>- CSR_LPLR: This CSR holds label value set at the callsite by compiler.
>>             On call target label check instructions are emitted by
>>             compiler which check label value against value present in
>>             CSR_LPRL.
>>
>>Enabling of `zisslpcfi` is controlled via menvcfg (for S/HS/VS/U/VU) and
>>henvcfg (for VS/VU) at bit position 60.
>>
>>Each mode has enable/disable bits for forward cfi. Backward cfi doesn't
>>have separate enable/disable bits for S and M mode. User forward cfi and
>>user backward cfi enable/disable bits are in mstatus/sstatus CSR.
>>Supervisor forward cfi enable/disable bit are in menvcfg and henvcfg CSR.
>>Machine mode forward cfi enable/disable bit is in mseccfg CSR.
>>
>>If forward cfi enabled, all indirect branches must land on a landing pad
>>instruction (`lpcll`, introduced in later commits). CPU/hart tracks this
>>internally using a landing pad tracker called `elp` short for `expecting
>>landing pad`. An interrupt can occur between an indirect branch and
>>target. If such an event occurs `elp` is saved away in mstatus/sstatus
>>CSR
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>Signed-off-by: Kip Walker  <kip@rivosinc.com>
>>---
>>  target/riscv/cpu.h      |  5 +++++
>>  target/riscv/cpu_bits.h | 25 +++++++++++++++++++++++++
>>  target/riscv/pmp.h      |  3 ++-
>>  3 files changed, 32 insertions(+), 1 deletion(-)
>>
>>diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>index 9a923760b2..18db61a06a 100644
>>--- a/target/riscv/cpu.h
>>+++ b/target/riscv/cpu.h
>>@@ -181,6 +181,11 @@ struct CPUArchState {
>>      uint32_t features;
>>+    /* CFI Extension user mode registers and state */
>>+    uint32_t     lplr;
>>+    target_ulong ssp;
>>+    cfi_elp      elp;
>>+
>
>cfi_elp is not defined in current or previous patch.
>
thanks. sorry my mistake.
good catch. this needs to go in patch #5.

>>  #ifdef CONFIG_USER_ONLY
>>      uint32_t elf_flags;
>>  #endif
>>diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>index 8b0d7e20ea..1663ba5775 100644
>>--- a/target/riscv/cpu_bits.h
>>+++ b/target/riscv/cpu_bits.h
>>@@ -39,6 +39,10 @@
>>  /* Control and Status Registers */
>>+/* CFI CSRs */
>>+#define CSR_LPLR            0x006
>>+#define CSR_SSP             0x020
>>+
>>  /* User Trap Setup */
>>  #define CSR_USTATUS         0x000
>>  #define CSR_UIE             0x004
>>@@ -542,6 +546,10 @@
>>  #define MSTATUS_TVM         0x00100000 /* since: priv-1.10 */
>>  #define MSTATUS_TW          0x00200000 /* since: priv-1.10 */
>>  #define MSTATUS_TSR         0x00400000 /* since: priv-1.10 */
>>+#define MSTATUS_UFCFIEN     0x00800000 /* Zisslpcfi-0.1 */
>>+#define MSTATUS_UBCFIEN     0x01000000 /* Zisslpcfi-0.1 */
>>+#define MSTATUS_SPELP       0x02000000 /* Zisslpcfi-0.1 */
>>+#define MSTATUS_MPELP       0x04000000 /* Zisslpcfi-0.1 */
>>  #define MSTATUS_GVA         0x4000000000ULL
>>  #define MSTATUS_MPV         0x8000000000ULL
>>@@ -572,12 +580,21 @@ typedef enum {
>>  #define SSTATUS_XS          0x00018000
>>  #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
>>  #define SSTATUS_MXR         0x00080000
>>+#define SSTATUS_UFCFIEN     MSTATUS_UFCFIEN /* Zisslpcfi-0.1 */
>>+#define SSTATUS_UBCFIEN     MSTATUS_UBCFIEN /* Zisslpcfi-0.1 */
>>+#define SSTATUS_SPELP       MSTATUS_SPELP   /* Zisslpcfi-0.1 */
>>  #define SSTATUS64_UXL       0x0000000300000000ULL
>>  #define SSTATUS32_SD        0x80000000
>>  #define SSTATUS64_SD        0x8000000000000000ULL
>>+#define CFISTATUS_M_MASK    (MSTATUS_UFCFIEN | MSTATUS_UBCFIEN | \
>>+                             MSTATUS_MPELP | MSTATUS_SPELP)
>>+
>>+#define CFISTATUS_S_MASK    (SSTATUS_UFCFIEN | SSTATUS_UBCFIEN | \
>>+                             SSTATUS_SPELP)
>>+
>>  /* hstatus CSR bits */
>>  #define HSTATUS_VSBE         0x00000020
>>  #define HSTATUS_GVA          0x00000040
>>@@ -747,10 +764,14 @@ typedef enum RISCVException {
>>  #define MENVCFG_CBIE                       (3UL << 4)
>>  #define MENVCFG_CBCFE                      BIT(6)
>>  #define MENVCFG_CBZE                       BIT(7)
>>+#define MENVCFG_SFCFIEN                    BIT(59)
>>+#define MENVCFG_CFI                        BIT(60)
>We should use 1ULL << 59/60 here.
Noted. Will fix.

>>  #define MENVCFG_PBMTE                      (1ULL << 62)
>>  #define MENVCFG_STCE                       (1ULL << 63)
>>  /* For RV32 */
>>+#define MENVCFGH_SFCFIEN                   BIT(27)
>>+#define MENVCFGH_CFI                       BIT(28)
>>  #define MENVCFGH_PBMTE                     BIT(30)
>>  #define MENVCFGH_STCE                      BIT(31)
>>@@ -763,10 +784,14 @@ typedef enum RISCVException {
>>  #define HENVCFG_CBIE                       MENVCFG_CBIE
>>  #define HENVCFG_CBCFE                      MENVCFG_CBCFE
>>  #define HENVCFG_CBZE                       MENVCFG_CBZE
>>+#define HENVCFG_SFCFIEN                    MENVCFG_SFCFIEN
>>+#define HENVCFG_CFI                        MENVCFG_CFI
>>  #define HENVCFG_PBMTE                      MENVCFG_PBMTE
>>  #define HENVCFG_STCE                       MENVCFG_STCE
>>  /* For RV32 */
>>+#define HENVCFGH_SFCFIEN                    MENVCFGH_SFCFIEN
>>+#define HENVCFGH_CFI                        MENVCFGH_CFI
>>  #define HENVCFGH_PBMTE                      MENVCFGH_PBMTE
>>  #define HENVCFGH_STCE                       MENVCFGH_STCE
>>diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
>>index da32c61c85..f5bfc4955b 100644
>>--- a/target/riscv/pmp.h
>>+++ b/target/riscv/pmp.h
>>@@ -43,7 +43,8 @@ typedef enum {
>>      MSECCFG_MMWP  = 1 << 1,
>>      MSECCFG_RLB   = 1 << 2,
>>      MSECCFG_USEED = 1 << 8,
>>-    MSECCFG_SSEED = 1 << 9
>>+    MSECCFG_SSEED = 1 << 9,
>>+    MSECCFG_MFCFIEN =  1 << 10
>
>It's unnecessary to use multiple space after '='.
>
Somehow this escaped. Will fix it.

>Regards,
>
>Weiwei Li
>
>>  } mseccfg_field_t;
>>  typedef struct {
>

