Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182A756BD0A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:49:14 +0200 (CEST)
Received: from localhost ([::1]:49786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qED-0006vG-5r
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCE-0003r2-5M
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:10 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:36483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCC-0002Ju-1D
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:09 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s206so22691518pgs.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u5bMwXG4IU/r0sxnFAwifGQr1Ap3Oogwvv6AlPSJY6M=;
 b=diU+Buze2AbeNOAQ9zKtIGP71WwhTafm4h4AKM6ieinIC01sYl6ir1bGQ+4N9P7sul
 cH+pCBxnnguOs1cboq0fBR3UNLGusIpLUcGcEQAcBWvJlcTYUkYGczl6I3YI6s+jeEsF
 pl/pi0Gjeww+N6bbI0L/31i6W1mAhoSdJp0ehuH5QUBLh0oMbsXHGZ/2CZSGlBDO851n
 vkPzUEzPI0NmAxudftyoOZR4XxcSBH0yfrjv6nfQxHGZ09O1A6NKR6wiKbO8yl7SRb7r
 HzGt8aF6cWHi3jIkCN/iAzUARmgTO/mWriCAvS141sahkUqxk/XPs3F514/aRDwsBNvI
 RZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u5bMwXG4IU/r0sxnFAwifGQr1Ap3Oogwvv6AlPSJY6M=;
 b=XK7mMBD5Ry5kXvQvm0MsTLuhpsPztEeII2EdtpIb6YTztHRdLro33GcJq6zXgVKrNc
 K5Eizum6PbOyI1iIfI+Ti7Zxb8Uhlh7931makxabZWvHFp+5kJTk01p1ciZ91/VtfZS8
 f0kP4o3/IOLngbj6sk5Hiv0bp0L27gfkpBmZsI1YxEtUSZN1454A2r8W68CLVObRBmTY
 Wc4hHHObCKECia0jv27ZNEhCVrNjZynTDvysVrXmhpQWqLTefAozCnrZj8b94mu8k6Hw
 8ZMVM+GHEt72pumXwXUW5VEUF2mNAOY1nisHkeYN0/17ZH8S/IN6447W6brQPKqVSpA2
 Fy1g==
X-Gm-Message-State: AJIora/bp6LuskLU69WRDPwC4+KKpblhpqRFvPzAeVxMeS3laFZy9l/X
 jrzF+NGmkAoq4nrFWZpKCXbW1s6NzpZg9kg1
X-Google-Smtp-Source: AGRyM1tLdzFeAiJerO0l72EGPxrvcRBba9omhOPNENsbaJMmBXm08XvDgNGWLetlczw0xMIyIx0IBA==
X-Received: by 2002:a63:150f:0:b0:414:1a88:3b94 with SMTP id
 v15-20020a63150f000000b004141a883b94mr3730944pgl.426.1657295226495; 
 Fri, 08 Jul 2022 08:47:06 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 00/29] risu cleanups and improvements
Date: Fri,  8 Jul 2022 21:16:31 +0530
Message-Id: <20220708154700.18682-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you can imagine, v3 was back in 2020:
https://lore.kernel.org/qemu-devel/20200522023440.26261-1-richard.henderson@linaro.org/

I've refreshed that, not that risu has changed much in that time,
and then also added support for SME to aarch64, i.e. SVCR and ZA
storage are now present in the reginfo, and compared.

I include a small test case, which allows one to see that ZA
storage is being handled properly.  When run with

  ./risu --test-sve=1 --test-za=1 --master -t test_sme_aarch64.{out,bin}
  ./risu --fulldump -t test_sme_aarch64.out

one can see the 16x16 bytes filled with row major then
column major indexes.


r~


Richard Henderson (29):
  Use bool for tracing variables
  Unify master_fd and apprentice_fd to comm_fd
  Hoist trace file and socket opening
  Adjust tracefile open for write
  Use EXIT_FAILURE, EXIT_SUCCESS
  Make some risu.c symbols static
  Add enum RisuOp
  Add enum RisuResult
  Unify i/o functions and use RisuResult
  Pass non-OK result back through siglongjmp
  Always write for --master
  Simplify syncing with master
  Split RES_MISMATCH for registers and memory
  Merge reginfo.c into risu.c
  Rearrange reginfo and memblock buffers
  Split out recv_register_info
  Add magic and size to the trace header
  Compute reginfo_size based on the reginfo
  aarch64: Assume system support for SVE
  aarch64: Reorg sve reginfo to save space
  aarch64: Use arch_init to configure sve
  ppc64: Use uint64_t to represent double
  Standardize reginfo_dump_mismatch printing
  Add --fulldump and --diffdup options
  Remove return value from reginfo_dump
  ppc64: Clean up reginfo handling
  aarch64: Tidy reginfo dumping ahead of ZA state
  aarch64: Add support for ZA storage
  aarch64: Trivial SME test

 Makefile               |   2 +-
 risu.h                 | 103 +++----
 risu_reginfo_aarch64.h |  97 ++++--
 risu_reginfo_ppc64.h   |   3 +-
 comms.c                |  34 +--
 reginfo.c              | 183 -----------
 risu.c                 | 676 ++++++++++++++++++++++++++++++-----------
 risu_aarch64.c         |   6 +-
 risu_arm.c             |   6 +-
 risu_i386.c            |   4 +-
 risu_m68k.c            |   4 +-
 risu_ppc64.c           |   4 +-
 risu_reginfo_aarch64.c | 408 +++++++++++++++----------
 risu_reginfo_arm.c     |  32 +-
 risu_reginfo_i386.c    |  22 +-
 risu_reginfo_m68k.c    |  37 +--
 risu_reginfo_ppc64.c   | 183 +++++------
 test_sme_aarch64.s     |  55 ++++
 18 files changed, 1070 insertions(+), 789 deletions(-)
 delete mode 100644 reginfo.c
 create mode 100644 test_sme_aarch64.s

-- 
2.34.1


