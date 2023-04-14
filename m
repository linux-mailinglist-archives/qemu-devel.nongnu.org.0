Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF76E27E5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 18:03:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLt2-0001og-Rz; Fri, 14 Apr 2023 12:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLsa-0001ew-Ea
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:02:35 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pnLsY-0007Eo-Bx
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 12:02:27 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-18779252f7fso10175164fac.12
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681488145; x=1684080145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o2QcPUfp1MpPevNyEGith7KhVp0Sl4Ym11iIU4KtbXI=;
 b=aX1iY0SdJO6VmhTnoy2l2wvi/Ykc7nJlZupQxDdD+Vh8YzMKtYucoWYsX+XsOI/7ud
 rD4QTkaHsKkdEuKsevCtmg4BsHQ6q/LnF4Yy0Il8aPuZNyLZRMzrIEhKEqzeLNICYmsM
 O5ggx1hxP+ptV6tFVwO6xmNffYAIorNJTQCShq0XRt8QawIgZRmdYqfta2Key/V5g3Yr
 rArM9idVnpw7OK/ZGmNpEOuWS1CHMgj4QYbUfSc9H5MFqVSTArMRdapg88TfGwOfzcH1
 9VbKjfXZ6aLeyPDhvXTP+ucnmWQ0NrXOJFTxC1RK7WIK5kUILST80trRyIxaaKAZL0Pj
 aTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488145; x=1684080145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o2QcPUfp1MpPevNyEGith7KhVp0Sl4Ym11iIU4KtbXI=;
 b=jau5vcld3u124TeoealsODhusMNLGIdIDWyag1VN3nsRE1JWlbD/MCHPwAkjemmDAo
 on51Pzfy0cCryvZ0ZxOYoZryDiZsf9zO/X4/arv+RVZ22w5rEm+Cfrd1mS0gbPdS5/cd
 8he0GJCOaLzntSKVVQvHumLmnHZVBQPG8HM+XSC+NZnK0YnC36FsG3o8LrVzn0brnTwA
 nKc4i88cvbHVtgphKF9fpECBymImVSncYsybyKNzonVQcYxOWJMIe1NPmXL702qbmJr3
 o1Ae2nQKmzYE3DpKvH4OUUuqzSi3pUiBL1DcwtlBcyBPahb+C07xdisZdGfVq3A8vkWi
 ELeg==
X-Gm-Message-State: AAQBX9cKC/8Q7PMIaJpYaw3/rI19RMVhD+2fKx3YWOQaUHKvJ0XDrRRz
 0dWlurW61qQyu/ylVCPymChZ4jZ+t2ngkCGcweKZgA==
X-Google-Smtp-Source: AKy350aEv0fhqPNi4G37umwofF31GxaCVXrmXnERkMh8IA5i0YKbKlzkg48jMYw6x+VXglQhlEEZpg==
X-Received: by 2002:a05:6870:a412:b0:177:af7c:906f with SMTP id
 m18-20020a056870a41200b00177af7c906fmr4338924oal.40.1681488144205; 
 Fri, 14 Apr 2023 09:02:24 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a4a5706000000b00524fe20aee5sm1794323ooa.34.2023.04.14.09.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 09:02:23 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH v2 0/4] Smstateen FCSR
Date: Fri, 14 Apr 2023 21:31:58 +0530
Message-Id: <20230414160202.1298242-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Patch 4 and 5 of the smstateen series need to be re-submitted with
changes described in the email below.
https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
Hence splitting the patch 4 of the original series into three and
re-submitting along with the original patch 5.

Changes in v2:
 - Improve patch 1 description
 - Reuse TB_FLAGS.HS_FS for smstateen
 - Convert smstateen_fcsr_check to function
 - Add fcsr check for zdinx

Mayuresh Chitale (4):
  target/riscv: smstateen check for fcsr
  target/riscv: Reuse TB_FLAGS.MSTATUS_HFS_FS
  target/riscv: check smstateen fcsr flag
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |  3 ++-
 target/riscv/cpu_helper.c                 | 12 ++++++++++++
 target/riscv/csr.c                        | 23 ++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvd.c.inc   | 13 ++++++++----
 target/riscv/insn_trans/trans_rvf.c.inc   | 24 +++++++++++++++++++----
 target/riscv/insn_trans/trans_rvzfh.c.inc | 18 ++++++++++++++---
 target/riscv/translate.c                  |  7 +++++++
 7 files changed, 88 insertions(+), 12 deletions(-)

-- 
2.34.1


