Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333806DC7BB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 16:15:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plsGy-0000xj-J4; Mon, 10 Apr 2023 10:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsGw-0000xQ-1o
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:13:30 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1plsGu-0000Nf-0m
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:13:29 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-246a1c48021so128856a91.3
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 07:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681136006; x=1683728006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sbelkXj5/xY8TaRMGMYt1lsv6AVM2L6f4uqa2EtkMaQ=;
 b=DxEEYPFhWkFMlT3Mfs5cfBgw6zy5aepnorrey4XBhXo5KX1xCJce2PSm2NQ9tPjtyl
 y8xzfyWVCXGus/xMq2F/g5GdjxyTtR9dSCS0AgRCUGB99miDfv3B8aG0QCX5CTu6ZHpx
 oqAq3+slqy1y3ypbU+ZgH14lKA8JP1RY5Mr2bcGkYxavqnW0NDMoS14+rGjoofD3mdyy
 rUl+ccD2vrfpBlKsCwkQUQpfoSHOJ+CKiwtn1R6xYr6F3jKo9AEAnshwWVKwjiEKnAbR
 4CIKCMUZc7LrhMiH4BMl7gAZ6gfAoTM8lDW01apjUZMG5tmwhiZMuwHIJHECeiWgz6ds
 emzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136006; x=1683728006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sbelkXj5/xY8TaRMGMYt1lsv6AVM2L6f4uqa2EtkMaQ=;
 b=PsfSzix+1mAKJruR7NqDduAN/vL+hjyrMUhSlLNw6tmyghgdTcWSVszHDhWJ7LNS/u
 fOI7nIeJVGoF6ItuU4aDS5XuOEh2X1lR24Zd7D1RKDWb5eMu2cI2z3xW7uZTjOmiNo4+
 KlcnaonQybZmZq2o/7COKOcYH05V8AUpdZlBsg4l4fe3yNiVSuyl6Lit2Ggg720u+fUF
 VxvIYo2nDlJL1Kk54gREJbihiOVM3Go4h9eMInB3vK6Lmx32X8V/AOf6psOkyxBKT1LM
 5I2d6zc7QuEcEtjaTSUDwC8NcQgmt0kiF2HdkD9Eu3vAqysKxF6g4j0hmwd/57sxVKNH
 pV5A==
X-Gm-Message-State: AAQBX9eOoUa2YNyp0dWwhNhWvuzwzKnhhXjIfFoCB6WBGCSAdIyy6wid
 VuNopGSgBLOxrjKTEDExChWaP0bvVqo9Ee49juwSsw==
X-Google-Smtp-Source: AKy350b7ROScqzIrDmoV+6/N3OCLRR1fduTcnnYKi6Hd++BkuExJCuMjYwwi3TkCjhv2z/O863YyIw==
X-Received: by 2002:a62:1b85:0:b0:626:17b8:8586 with SMTP id
 b127-20020a621b85000000b0062617b88586mr11258684pfb.30.1681136005834; 
 Mon, 10 Apr 2023 07:13:25 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b22-20020aa78716000000b0063486255a87sm3783526pfo.142.2023.04.10.07.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:13:25 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org,
	alistair.francis@wdc.com
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>, liweiwei@iscas.ac.cn,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC PATCH 0/4] Smstateen FCSR implementation
Date: Mon, 10 Apr 2023 19:43:12 +0530
Message-Id: <20230410141316.3317474-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Patch 4 and 5 of the smstateen series need to be re-submitted with
changes described in the email below:
https://lists.nongnu.org/archive/html/qemu-riscv/2022-11/msg00155.html
Hence spliting the patch 4 of the original series into three patches and
re-submitting along with the original patch 5.

Mayuresh Chitale (4):
  target/riscv: smstateen check for fcsr
  target/riscv: Add fcsr field in tb->flags
  target/riscv: check smstateen fcsr flag
  target/riscv: smstateen knobs

 target/riscv/cpu.c                        |  3 ++-
 target/riscv/cpu.h                        |  4 ++++
 target/riscv/cpu_helper.c                 |  5 +++++
 target/riscv/csr.c                        | 25 ++++++++++++++++++++++-
 target/riscv/insn_trans/trans_rvf.c.inc   | 24 +++++++++++++++++++---
 target/riscv/insn_trans/trans_rvzfh.c.inc |  4 ++++
 target/riscv/translate.c                  |  2 ++
 7 files changed, 62 insertions(+), 5 deletions(-)

-- 
2.34.1


