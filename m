Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10A1D052F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 04:54:36 +0200 (CEST)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYhXX-0005Gy-CC
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 22:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1jYhWl-0004jE-5K; Tue, 12 May 2020 22:53:47 -0400
Received: from [107.174.27.60] (port=56900 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1jYhWj-0000px-5Y; Tue, 12 May 2020 22:53:46 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id D5A96AE80026;
 Tue, 12 May 2020 22:41:53 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Date: Wed, 13 May 2020 12:43:55 +1000
Message-Id: <20200513024355.121476-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-Host-Lookup-Failed: Reverse DNS lookup failed for 107.174.27.60 (failed)
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 22:44:02
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 83b700a441ef8303983eed16c244adde8e40e808:

  target/ppc: Fix arguments to ppc_radix64_partition_scoped_xlate() (2020-05-11 11:44:03 +1000)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20200513

for you to fetch changes up to dc5e3ca3fd80048593153636020edae23cc583ac:

  pseries: Update SLOF firmware image (2020-05-13 12:34:59 +1000)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 965112 -> 968392 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries

This adds measuring the bootloader for secure boot and
some TPM related fixes.

The full changelog is:

Alexey Kardashevskiy (2):
      make: Define default rule for .c when V=1 or V=2
      version: update to 20200513

Stefan Berger (6):
      tcgbios: Only write logs for PCRs that are allocated
      tcgbios: Fix the vendorInfoSize to be of type uint8_t
      tcgbios: Add support for SHA3 type of algorithms
      elf: Implement elf_get_file_size to determine size of an ELF image
      tcgbios: Implement tpm_hash_log_extend_event_buffer
      tcgbios: Measure the bootloader file read from disk


