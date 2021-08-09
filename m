Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5F3E46B7
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:34:38 +0200 (CEST)
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5QL-0005SJ-Om
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54P-0003uR-KD; Mon, 09 Aug 2021 09:11:58 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:35461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54N-0001l2-Ts; Mon, 09 Aug 2021 09:11:57 -0400
Received: by mail-qt1-x82e.google.com with SMTP id a12so12395774qtb.2;
 Mon, 09 Aug 2021 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VlLiPUH07aX5BhUnXhksMTU2lxpYTU9ETbG3rk/uAz4=;
 b=S3DFDcmufyNkajogv58BxLk5cPj5HNm7Sw+q6AT9BxRH+LrePNm0msyZQVYPe27hVT
 TYymE+Yb0eaGb5LVy5gWfmu80FVCtL5nzxdvK9gLdS8BSY29sJagIwU+lTexP+lNZCrb
 Utvkj7DxyXiAzenFV4HyNuGKNhhTdDza9yGNG2oC9/c7RKSXtYwMayiJOp4EsgXFIasQ
 /BhNlrbIWpZmw4DYY4L1UvXTsUW/uozshOf9ppARBX3XRBOfMpRD5/BUh1YSehyisRx8
 p7bPkXw0JRuwf1sRbE3XWMRPXFqUjDIR1O6ewAvmSkv+h5iaRHLJA0rkFP/jD946xnkF
 mqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VlLiPUH07aX5BhUnXhksMTU2lxpYTU9ETbG3rk/uAz4=;
 b=NzFoFP0t6C46gT6e9gFw3kNhKIfv8gq/DHRboQpCFzlH/LnlygINOXr+xTukyKI1+Z
 HurrtFBhJqayQDPpMlI7/sq704bPmk24RlIgmhkpQHqVrldJgx54lnK27ennMO66DqWO
 rmMzYLKMBDZ7M3mKSnotpoNHe6OOMxIjF3NZZW2/gpc2IUwRbiEpLHH0/boJBbEgY6eJ
 h8qaKLdPG9r4Z+rmH63PNPOZxPhISoY3ycjJJeC2XeHVMVc/u3CmUxBPyt5GTbqVs7GO
 V3yBYQALrc1YViwIafYy/p+ZBXKyX1ZYNcPcYjBQOBk7JezCixi/DKnvSrJb391tarnP
 l4FA==
X-Gm-Message-State: AOAM532UHeE4+Qlm3htOA5tkGhe+D4E65GpwFoVNJDHPl3KA4P6okT7P
 yOq72Ldmw8lAiYb9NbkvZ2O6J/3FEjQZdg==
X-Google-Smtp-Source: ABdhPJzizKHdsHlyhlCbnuHr8gicL/pOYSLA5rn7R5elxgkN2iHvqTakYIU/tJsyFKOoF1pg1TBsEA==
X-Received: by 2002:a05:622a:391:: with SMTP id
 j17mr4497772qtx.206.1628514714456; 
 Mon, 09 Aug 2021 06:11:54 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/19] docs/specs: add PPC64 TCG PMU-EBB documentation
Date: Mon,  9 Aug 2021 10:10:57 -0300
Message-Id: <20210809131057.1694145-20-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we didn't implement a fully fledged Book3s PMU in TCG, add a new
doc page in the specs dir to register the current capabilities of the
new PPC64 TCG PMU.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/specs/index.rst           |  1 +
 docs/specs/ppc-tcg-pmu-ebb.rst | 71 ++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 docs/specs/ppc-tcg-pmu-ebb.rst

diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index b7b08ea30d..a44fa93f4c 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -10,6 +10,7 @@ guest hardware that is specific to QEMU.
    ppc-xive
    ppc-spapr-xive
    ppc-spapr-numa
+   ppc-tcg-pmu-ebb
    acpi_hw_reduced_hotplug
    tpm
    acpi_hest_ghes
diff --git a/docs/specs/ppc-tcg-pmu-ebb.rst b/docs/specs/ppc-tcg-pmu-ebb.rst
new file mode 100644
index 0000000000..d40276b3f0
--- /dev/null
+++ b/docs/specs/ppc-tcg-pmu-ebb.rst
@@ -0,0 +1,71 @@
+==================================
+QEMU TCG PMU-EBB support for PPC64
+==================================
+
+Introduction
+============
+
+QEMU version 6.2 introduces an EBB (Event-Based Branch) implementation
+for PPC64 TCG guests. It was introduced together with a simple PMU
+(Performance Monitor Unit) implementation which was only introduced
+as a means to validate EBB using the Linux kernel selftests located
+in the kernel tree at tools/testing/selftests/powerpc/pmu/ebb.
+
+The goal of this document is to give a brief explanation of what
+to expect, and more important, what to not expect from this existing
+PMU implementation.
+
+
+EBB support
+-----------
+
+The existing EBB support can be summarized as follows:
+
+ - all bits from BESCR are implemented;
+ - rfebb instruction is implemented as the mnemonic 'rfebb 1', i.e. the
+ instruction will always set BESCR_GE;
+ - support for both Performance Monitor and External event-based exceptions
+ are included, although there is no code that triggers an external exception
+ at this moment.
+
+
+PMU support
+-----------
+
+The existing PMU logic is capable of counting instructions (perf event
+PM_INST_CMPL) and cycles (perf event PM_CYC) using QEMU's icount
+framework. A handful of PM_STALL events were added as fixed ratio of
+the total cycles as a means to enable one of the EBB tests.
+
+Everything that is not mentioned above is not supported in the PMU. Most
+notably:
+
+ - reading unfrozen (running) PMCs will return their last set value. The PMCs
+ are only updated after they're frozen;
+ - no MMCR2 and MMCRA support. The registers can be read and written at will,
+ but the PMU will ignore it;
+ - as a consequence of not supporting MMCRA, no random events and no threshold
+ event counters are enabled;
+ - no form of BHRB support is implemented;
+ - several MMCR0 bits are not supported;
+ - access control of the PMCs is only partially done. For example, setting
+ MMCR0_PMCC to 0b11 will not exclude PMC5 and PMC6 from the PMU.
+
+
+icount usage
+------------
+
+The development of both the PMU and EBB support were tested with icount shift
+zero with alignment, e.g. this command line option:
+
+``-icount shift=0,align=on``
+
+Different 'shift' options will degrade the performance of the PMU tests and some
+EBB tests that relies on small count error margins (e.g. 'count_instructions').
+
+Running PMU and EBB tests without any icount support will not give reliable
+results due to how the instructions and cycles relies on icount to work.
+
+It's also worth mentioning that all these icount restrictions and conditions
+are exclusive to the PMU logic. The Event-Based Branch code does not rely on
+the icount availability or configuration to work.
-- 
2.31.1


