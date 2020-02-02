Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA36F14FB18
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Feb 2020 02:06:14 +0100 (CET)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iy3iH-000530-U8
	for lists+qemu-devel@lfdr.de; Sat, 01 Feb 2020 20:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45510)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iy3gr-0003Tg-O9
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 20:04:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iy3gq-0001sR-91
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 20:04:45 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:55833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iy3gq-0001qu-1B
 for qemu-devel@nongnu.org; Sat, 01 Feb 2020 20:04:44 -0500
Received: by mail-pj1-x1031.google.com with SMTP id d5so4655220pjz.5
 for <qemu-devel@nongnu.org>; Sat, 01 Feb 2020 17:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BcMVCyKPO9Rc8ZrVPu6WxO+J0XJXWIuE90agQINnvm4=;
 b=AuRQqU9z0etjghkgS2PI4Xl7MilrinB5va/KJGSBHemNT65byP8hgzEledtNSjHoEg
 uRvDFC+maO+KMboVlimCqUuVLKFB+y/spVRlS1+a+xyGA4IipPmh8l0nFUiSPYC0k2s2
 Goi0u3kgrdaSWa1lmzrG56tQ10gfMtMC9EnGXPoojDjZaICsmsy7/qrrHPHuhjMPka/Y
 76AYYg2NLDOjFPFfJE96Kb9JtWCYKKTCoSZhm0ZZlJ9pAqM6NlDwAo8/VG1JQO1lieNP
 /noDgWUunUAn0t6iSvXJXpOzBhmHSTURyP+f1kaz27Gu4UaiPj7NAKvVU6uYVi8shav6
 Y7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BcMVCyKPO9Rc8ZrVPu6WxO+J0XJXWIuE90agQINnvm4=;
 b=fItjN7mwLGC3ZY3itupLNQevY1xyGb3Fn7H6Mq8cVRZgUecwVhnq+h+Va54N90HP1k
 pUASBONiYAG42NW32CNrSN9TxvkdPCLAtiVioPtjw/TbkAdY+RguxuWb9Zlitn/DEjFd
 lse0K3xMIMIjmC3UQqm1dfI+jxsXab6uMmtCATXSOC0z65A/6cMqNUa6GIwBlkBIx/c1
 YRxlWNPzizwUEhdc5C+MNcVC7hMZ1Ks7hFLA5g4LFoqC3USFWa5AMf4zO6BPPlcSQicF
 9XrBZTFAzfYKwX7xZMVpvx4m6FjDAEYJcb9/VKH4wb5sjgO8fIpjCyrHIrRGyVJ2NM7n
 eH/A==
X-Gm-Message-State: APjAAAWbMqJPavAFQb9R+Mobou1T5dZGCFH6wMBLwTbUns6P7YQRB9c/
 lGP3yR+4SN2ES4xWBi8RrL0UztVDVhE=
X-Google-Smtp-Source: APXvYqw4rRJZ26mWu2qrbP56U2ESCKnUK5jc/pffk/gl4Zme6qSvH67Quwv6rDkTzVH3jNRQdPNS1g==
X-Received: by 2002:a17:902:b70e:: with SMTP id
 d14mr17145365pls.295.1580605481107; 
 Sat, 01 Feb 2020 17:04:41 -0800 (PST)
Received: from cloudburst.WiFi.IPv4InfoBelow
 (h210.212.133.40.static.ip.windstream.net. [40.133.212.210])
 by smtp.gmail.com with ESMTPSA id 13sm14678975pfi.78.2020.02.01.17.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 17:04:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/14] target/arm: Implement PAN, ATS1E1, UAO
Date: Sat,  1 Feb 2020 17:04:25 -0800
Message-Id: <20200202010439.6410-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1031
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20200201192916.31796-1-richard.henderson@linaro.org>
("[v6] target/arm: Implement ARMv8.1-VHE")

Version 2 addresses review commentary, and also merges the 4 UAO
patches into the PAN + ATS1E1 omnibus patch set.

Changes:
  * Moved reginfo to file scope.
  * Rename arm_mmu_idx_is_stage1 to arm_mmu_idx_is_stage1_of_2
  * Mask PAN + UAO when not supported.


r~


Richard Henderson (14):
  target/arm: Add arm_mmu_idx_is_stage1_of_2
  target/arm: Add mmu_idx for EL1 and EL2 w/ PAN enabled
  target/arm: Add isar_feature tests for PAN + ATS1E1
  target/arm: Move LOR regdefs to file scope
  target/arm: Update MSR access for PAN
  target/arm: Update arm_mmu_idx_el for PAN
  target/arm: Enforce PAN semantics in get_S1prot
  target/arm: Set PAN bit as required on exception entry
  target/arm: Implement ATS1E1 system registers
  target/arm: Enable ARMv8.2-ATS1E1 in -cpu max
  target/arm: Add ID_AA64MMFR2_EL1
  target/arm: Update MSR access to UAO
  target/arm: Implement UAO semantics
  target/arm: Enable ARMv8.2-UAO in -cpu max

 target/arm/cpu-param.h     |   2 +-
 target/arm/cpu.h           |  96 ++++++++++--
 target/arm/internals.h     |  40 +++++
 target/arm/cpu.c           |   4 +
 target/arm/cpu64.c         |   9 ++
 target/arm/helper-a64.c    |   9 ++
 target/arm/helper.c        | 314 ++++++++++++++++++++++++++++---------
 target/arm/kvm64.c         |   2 +
 target/arm/op_helper.c     |   9 +-
 target/arm/translate-a64.c |  31 ++++
 target/arm/translate.c     |   8 +-
 11 files changed, 437 insertions(+), 87 deletions(-)

-- 
2.20.1


