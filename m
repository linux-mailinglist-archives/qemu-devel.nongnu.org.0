Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69BB213221
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 05:22:21 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrCHM-0006iv-RQ
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 23:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrCDS-0007pO-G1; Thu, 02 Jul 2020 23:18:18 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jrCDQ-0005x0-Ke; Thu, 02 Jul 2020 23:18:18 -0400
Received: by mail-pj1-x1032.google.com with SMTP id cm21so3956945pjb.3;
 Thu, 02 Jul 2020 20:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YoykrVtjYqt8oRbnP42shFLWN1mv4jmw4/LHlHynF4c=;
 b=kf/rCFglvSoSY3wGuHlcpNA5tCEuXWOj3g8vKyo3gl/dzNd5RIcdt+9bTMZZnaKl4X
 nbqScyz2j3aFPvf0VtZlnzCsCSIQ7nhXVR7O+ZS0EO+tzmXfzVejvViBTCxbBTwEj6CT
 yLs51ufRORusyLPWQDKY1azvshp5E7ofMDdE4zs31YKii/4z11BFYJhl9Dq24yyio/Wp
 b02wVqU2GQPKDr/fYLp8QzpPqcYuwSucfwdp/NwwHy3Zc8aw2luSupCkKahat+ivkI70
 VK07+dU/UpbUFaBJkFOPJk3/BTSJpt39qcbhghjn6Cmn2I6XPjmqf182XDW8PJdTHjF/
 PA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YoykrVtjYqt8oRbnP42shFLWN1mv4jmw4/LHlHynF4c=;
 b=Ep0aHUhGDCPRhR32/KxU7ZuCfeT/4S1rFKGywNkahudaPRkWlTnGY9agE3PgrYaOHo
 o5rFKaOnhmCx+pKnRM7zccsXG2O2qDNhfGRg6dLvORb5lPbr6nuSoSKwfH6l3fSkqa2B
 g9U/XI19m3gE1AH25YPOkZhvUi4hFLEIkSv1jKK2xM98fNhd72elgaOOZnGaudmyYMmy
 03S6dPZ1jgcFBdCmW2mUjcCiULkB98UvsOuG/YcoU4Bajadja2F2hEaknAfNpjuw84FW
 4xa1ZP+0sdYkxoHzWpJwYJeKTbKHYJLZW+za5HITlWG9DGDfJVq7TJCO3/wobwWtQDLm
 4s9Q==
X-Gm-Message-State: AOAM531yo/BZ178eGBf9crNk9G6HjJhhqn5+C4x8l5AoLemcvMG0YZ3K
 o6mK3+rR6m1NOpbFSjVTkrE=
X-Google-Smtp-Source: ABdhPJzUqTe6TQiaDjCeBGj5t7+yWhhwNebM12DfLp7/zIIoygGwy3X/KAqfHdg+w7N6wdG69Nbx8A==
X-Received: by 2002:a17:90a:ce90:: with SMTP id
 g16mr28638866pju.109.1593746294860; 
 Thu, 02 Jul 2020 20:18:14 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id c12sm10165745pfn.162.2020.07.02.20.18.13
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 02 Jul 2020 20:18:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 2/7] roms/opensbi: Upgrade from v0.7 to v0.8
Date: Thu,  2 Jul 2020 20:18:02 -0700
Message-Id: <1593746287-19251-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
References: <1593746287-19251-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Upgrade OpenSBI from v0.7 to v0.8.

The v0.8 release includes the following commits:

1bb00ab lib: No need to provide default PMP region using platform callbacks
a9eac67 include: sbi_platform: Combine reboot and shutdown into one callback
6585fab lib: utils: Add SiFive test device
4781545 platform: Add Nuclei UX600 platform
3a326af scripts: adapt binary archive script for Nuclei UX600
5bdf022 firmware: fw_base: Remove CSR_MTVEC update check
e6c1345 lib: utils/serial: Skip baudrate config if input frequency is zero
01a8c8e lib: utils: Improve fdt_parse_uart8250() API
0a0093b lib: utils: Add fdt_parse_uart8250_node() function
243b0d0 lib: utils: Remove redundant clint_ipi_sync() declaration
e3ad7c1 lib: utils: Rename fdt_parse_clint() to fdt_parse_compat_addr()
a39cd6f lib: utils: Add FDT match table based node lookup
dd33b9e lib: utils: Make fdt_get_node_addr_size() public function
66185b3 lib: utils: Add fdt_parse_sifive_uart_node() function
19e966b lib: utils: Add fdt_parse_hart_id() function
44dd7be lib: utils: Add fdt_parse_max_hart_id() API
f0eb503 lib: utils: Add fdt_parse_plic_node() function
1ac794c include: Add array_size() macro
8ff2b94 lib: utils: Add simple FDT timer framework
76f0f81 lib: utils: Add simple FDT ipi framework
75322a6 lib: utils: Add simple FDT irqchip framework
76a8940 lib: utils: Add simple FDT serial framework
7cc6fa4 lib: utils: Add simple FDT reset framework
4d06353 firmware: fw_base: Introduce optional fw_platform_init()
f1aa9e5 platform: Add generic FDT based platform support
1f21b99 lib: sbi: Print platform hart count at boot time
2ba7087 scripts: Add generic platform to create-binary-archive.sh
4f18c6e platform: generic: Add Sifive FU540 TLB flush range limit override
13717a8 platform: Remove qemu/virt directory
65c06b0 platform: Remove spike directory
d626037 docs: Add missing links in platform.md
7993ca2 include: sbi: Remove redundant page table related defines
5338679 lib: sbi_tlb: Fix remote TLB HFENCE VVMA implementation
dc38929 lib: sbi: Improve misa_string() implementation
433bac7 docs: platform/generic: Add details about stdout-path DT property
b4efa70 docs: platform/generic: Add details about IPI and timer expectations
dfd9dd6 docs: Add platform requirements document
c2286b6 docs: Fix ordering of pages in table of contents
7be75f5 docs: Don't use italic text in page title
63a513e lib: Rename unprivileged trap handler
aef9a60 lib: Add csr detect support
13ca20d lib: Create a separate math helper function file
79d0fad lib: utils: Update reserved memory fdt node even if PMP is not present
6a053f6 lib: Add support for hart specific features
b2df751 platform: Move platform features to hart
4938024 platform: fpga: Remove redundant platform specific features
ec0d2a7 lib: timer: Provide a hart based timer feature
1f235ec lib: Add platform features in boot time print
22c4334 lib: Add hart features in boot time print
36833ab lib: Optimize inline assembly for unprivilege access functions
38a4b54 firmware: Correct spelling mistakes
28b4052 lib: sbi: detect features before everything else in sbi_hart_init()
4984183 lib: sbi: Improve get_feature_str() implementation and usage
3aa1036 lib: sbi: Remove extra spaces from boot time prints
3a8fc81 lib: sbi: Print platform HART count just before boot HART id
63b0f5f include: sbi: Use scratch pointer as parmeter in HART feature APIs
2966510 lib: sbi: Few cosmetic improvements to HART feature detection
a38bea9 lib: sbi_hart: Detect number of supported PMP regions
89ba634 include: sbi: Add firmware extension constants
73d6ef3 lib: utils: Remove redundant parameters from PLIC init functions
446a9c6 lib: utils: Allow PLIC functions to be used for multiple PLICs
2c685c2 lib: utils: Extend fdt_find_match() Implementation
d30bb68 lib: utils/irqchip: Initialize all matching irqchip DT nodes
a9a9751 lib: utils: Allow CLINT functions to be used for multiple CLINTs
569dd64 lib: utils: Add fdt_parse_clint_node() function
6956e83 lib: utils/ipi: Initialize all matching ipi DT nodes
a63f05f lib: utils/timer: Initialize all matching timer DT nodes
30b6040 Makefile: Fix builtin DTB compilation for out-of-tree platforms
64f1408 firmware: fw_base: Make builtin DTB available to fw_platform_init()
4ce6b7a firmware: fw_base: Don't OR forced FW_OPTIONS
86ec534 firmware: Allow fw_platform_init() to return updated FDT location
c6c65ee Makefile: Preprocess builtin DTS
4e3876d Makefile: Add mechanism for platforms to have multiple builtin DTBs
72019ee platform: kendryte/k210: Use new mechanism of builtin DTB
51f0e4a firmware: Remove FW_PAYLOAD_FDT and related documentation
1b8c012 lib: Add RISC-V hypervisor v0.6.1 support
79bfd67 docs: Use doxygen config to mark the main page
106b888 docs: Remove redundant documentation about combined payload use case
9802906 platform: Add AE350 platform specific SBI handler
32f87e5 platform: Add AE350 cache control SBIs
e2c3f01 lib: Fix __sbi_hfence_gvma_vmid_gpa() and __sbi_hfence_vvma_asid_va()
6966ad0 platform/lib: Allow the OS to map the regions that are protected by PMP
518e85c platform: Update Nuclei ux600 platform support
d5725c2 lib: Don't print delegation CSRs if there is no S-Mode
637b348 lib: Fix the SBI_HART_HAS_MCOUNTEREN feature check
db56ef3 platform: Add support for Shakti C-class SoC from IIT-M
9bd5f8f lib: sbi: Fix 32/64 bits variable compatibility
2314101 lib: Don't return any invalid error from SBI ecall
a98258d include: Bump-up version to 0.8

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

(no changes since v2)

Changes in v2:
- Upgrade OpenSBI to v0.8 release

 roms/opensbi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/opensbi b/roms/opensbi
index 9f1b72c..a98258d 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit 9f1b72ce66d659e91013b358939e832fb27223f5
+Subproject commit a98258d0b537a295f517bbc8d813007336731fa9
-- 
2.7.4


