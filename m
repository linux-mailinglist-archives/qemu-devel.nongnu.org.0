Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DFF6F31BD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 16:02:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptU5P-0003Fi-Pr; Mon, 01 May 2023 10:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU50-0003Cl-2a
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:00:38 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1ptU4y-0006ID-1H
 for qemu-devel@nongnu.org; Mon, 01 May 2023 10:00:37 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6a5f6349ec3so981912a34.0
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682949634; x=1685541634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NMmiwnaBD6ON+RG9bdRSLuIxQBZQJymmvjm7ZFQcQmk=;
 b=IO6Fvm45VTHzonvKD4p1rgPqZwjhzySTPaWl89uInnmlnCoN3QynYkQeJgz3BVmILQ
 Z+c3t2OK9VaYZn57dDTgLPZ32e3WyatDVgxHCtZ9p2j+n2Iv4ww0KewZaHklTaVTPK0A
 tGZaeqbIsZImguZxdL4pCgsT+S+4IFeiJyeBEgPjNvJoX0sr3RnmEZLOOaP60k55oyTe
 ffOhurDFblOhrgmVXa0w8OWcg/qt8sVl/GX4Z6vw0CYl3ggVPYltt+xT2l589LOocDdH
 OSNg7FAlPSUwFNE48fRSwuw5+3AxL4seITWnVkmUHcl/zwqw8lYwR/tqlyQTo+rpHxA+
 L/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682949634; x=1685541634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NMmiwnaBD6ON+RG9bdRSLuIxQBZQJymmvjm7ZFQcQmk=;
 b=I23BeegZ9l/eYaGdMmFhcomrNvNr/hhZDrQBCmrXAZC176uKJZVFr7WkWhJv3EQ/y8
 LuAg3j/G5JW4pfbaKYdOyTeI9m+93FcBtk3AgbpmrUHdBhosfeTyk0oBqzFF25DgJxNj
 QL8FBJeClHwGUs4BymxKsI2ODzfDrA+6TJwMLU/xiUdE945SAlZGH9oCwSdXvmbAIAiA
 g7j2n08RsvyGC2Pkym/RJOBPnjthYevQ44B2Eq2bRUltcKqNzScOx6L0pcwKvf0fcYQf
 VsTsrMq7LK1M9tbodNF1v2Voi9QPh6fmqCQDG7YmeODOgZOgAj/PkeoSp6/6F5H41u8/
 Gt+w==
X-Gm-Message-State: AC+VfDzizn8dkW9YZHPCl/IoFKPfoJ0d/8lkMNjv5lDz5dA+MeRW/A3C
 kKlIoZmEH38D5vN+vXBMqEdU4nePxQrmDpAmzHAGYA==
X-Google-Smtp-Source: ACHHUZ756fZ5PGUNVVzNMzGbtAzBYbuoQtaU/n9uuhTzUF/CTJmnYjAPfcaDjXc1/xqqxQc6oPmmyA==
X-Received: by 2002:a9d:6b90:0:b0:6a4:fab4:56a6 with SMTP id
 b16-20020a9d6b90000000b006a4fab456a6mr6648253otq.24.1682949633820; 
 Mon, 01 May 2023 07:00:33 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 f12-20020a9d6c0c000000b006a44338c8efsm10744342otq.44.2023.05.01.07.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 07:00:32 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 0/3] Smstateen FCSR
Date: Mon,  1 May 2023 19:30:17 +0530
Message-Id: <20230501140020.3667219-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=mchitale@ventanamicro.com; helo=mail-ot1-x332.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Patch 4 and 5 of the smstateen series need to be re-submitted with
changes described in the email below.
https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
Hence splitting the patch 4 of the original series into three and
re-submitting along with the original patch 5.

Changes in v4:
- Drop patch 3 
- Add reviewed-by tag

Changes in v3:
- Reuse TB_FLAGS.FS (instead of TB_FLAGS.HS_FS) for smstateen as HS_FS bits been removed.
- Remove fcsr check for zfh and zfhmin

Changes in v2:
 - Improve patch 1 description
 - Reuse TB_FLAGS.HS_FS for smstateen
 - Convert smstateen_fcsr_check to function
 - Add fcsr check for zdinx

Mayuresh Chitale (3):
  target/riscv: smstateen check for fcsr
  target/riscv: Reuse tb->flags.FS
  target/riscv: smstateen knobs

 target/riscv/cpu.c                      |  3 ++-
 target/riscv/cpu_helper.c               |  6 ++++++
 target/riscv/csr.c                      | 15 +++++++++++++++
 target/riscv/insn_trans/trans_rvf.c.inc |  7 ++++---
 4 files changed, 27 insertions(+), 4 deletions(-)

-- 
2.34.1


