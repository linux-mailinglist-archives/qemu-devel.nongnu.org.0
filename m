Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A3C5F27FE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 06:21:15 +0200 (CEST)
Received: from localhost ([::1]:42928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofCx6-0001dm-DG
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 00:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCr2-0003XB-E4
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 00:14:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ofCqy-0006TF-Vx
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 00:14:54 -0400
Received: by mail-pl1-x631.google.com with SMTP id x1so8661216plv.5
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 21:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=F7tdRk4Qrtb9mSNRqDP+OGNI6gDixPQRApuBKw62yjM=;
 b=Hh2GOPWc4NUsj6Of/i3k9A3sZXpfOPPxjE8KvEN64dNxuvde9B7vg7hZBNx/nPRV6j
 n/1hLLeIhZ8DDin+Pfbh+4+SR9hj19UyRraloquFS1J2Wi0OwDzRiN20kIt89eaTSOva
 /b/TGiBqhcpeZ4AEufZvcaUnfQ2HOC6IOHhw9Q7k0XbTgIdCVTXcGFetldmXuZbGmDf/
 qKmGeZUxl2MFjoq+uue1kw6Vvu4aM7L9lYyqFeRR4VfLv6pSozS00lLc2MvUkyyvZNa1
 dObfJoY2asz4a5hpa6dUT7h4pl/l/R4kyQE/Cnpfp7sz0zZIZEzllc7GekLQRhpFZbbg
 LISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=F7tdRk4Qrtb9mSNRqDP+OGNI6gDixPQRApuBKw62yjM=;
 b=OhZtCUVbR3dgYmHoPsTdofqSZGnReZXkTVROnqtAa/hdeFYqjPw0Sy2ii4gXbUwGK3
 bRIjRuacJgusRWlrKXjaWvNQD3Wd4lVlubM2Wxqz9LZVYJDi6ikqTwFp9tj59fLliyEN
 ArnL1RpANCRJTFrWlAFM5azUMbowcaRKWSUiYHUSaHyMhDdM3H2Nl4XfuS7ktYZOa5vz
 J+qIiodtkyTsNZgFRX2bfEX5D8DMuiFe2EfKZAqWYUl3hjACKQoppocS6AERVYveSCk3
 vX5y1cggVbezm2mcFAmdaCaIlaVX9lQVb0EICm60vPtHHyJJH77tZ/CKIEZ/GNdfs/7w
 msBQ==
X-Gm-Message-State: ACrzQf2sw1YeU8sNx4aPJB0G2ESZOLCG24knGR3Xy+Z7QWnr/YtU9NnM
 rfPQ8s2dT5ZPIhxXtxnGvCYoJLvIKF66i5O8L4uYbLojkXoL2zp4kE3g5KCg4o3OvmXl7br7eYN
 30BpjfE3IMK2PvSGineEnQjhn64FT4U4kU+PWQ6jaFtgcYd+93PbZnk3x1R5OISAe70s=
X-Google-Smtp-Source: AMsMyM4YECLzCPHM/GZC2uYllDhomQ2/NGzFQGs3GqnK4bPixJKuBD8s3X8vg9nYgszB0P4+z0itaw==
X-Received: by 2002:a17:902:7c8f:b0:176:cdd8:7258 with SMTP id
 y15-20020a1709027c8f00b00176cdd87258mr19534594pll.49.1664770491323; 
 Sun, 02 Oct 2022 21:14:51 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170902cecc00b0017732e4003bsm6108596plg.141.2022.10.02.21.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 21:14:51 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>
Subject: [PATCH v3 0/2] Enhance maximum priority support of PLIC
Date: Mon,  3 Oct 2022 04:14:38 +0000
Message-Id: <20221003041440.2320-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x631.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset fixes hard-coded maximum priority of interrupt priority
register and also changes this register to WARL field to align the PLIC
spec.

Changelog:

v3:
  * fix opposite of power-of-2 max priority checking expression.

v2:
  * change interrupt priority register to WARL field.

Jim Shu (2):
  hw/intc: sifive_plic: fix hard-coded max priority level
  hw/intc: sifive_plic: change interrupt priority register to WARL field

 hw/intc/sifive_plic.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

-- 
2.17.1


