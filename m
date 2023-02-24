Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395976A21F7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:02:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdJk-0001f4-KX; Fri, 24 Feb 2023 14:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJh-0001dd-9L
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:13 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVdJd-0002eU-Hn
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:01:13 -0500
Received: by mail-pl1-x629.google.com with SMTP id z2so432392plf.12
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677265266;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lx0M+hYFCHNKkG1Lj780I7YKmL/EVcbXsrThtaMCRAY=;
 b=CTkX6u+66vSsrejTgB0cicEuQVAsuTaOSQDrQCxzr6CFtGHbScaDN/cPlt4hq+7ygW
 HXjydaCh8C7wNiA2tovT7n9obuTnSQJZoLj8L3kYYVLD6CUdisin+CSoUkZElVvjRCCt
 fK2dc9IKcKu8fHP+n/U2jQvsnSXJEe1IR7QugZXqokOfE6xhI1IoRs+erCHTpcAA62LV
 2IeuS1VmaBVm7dLC2FjEAZdw+UAaiiDn2at+cvN8Em2rPN7qwfRVJ+Egk9+vPJki3Ad8
 7+AWsT070LwUqTOXTld33GXXQXrnXtUals3SMH/0xikl/Zi3puRzjaMJbiV74BPgemGY
 xrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677265266;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lx0M+hYFCHNKkG1Lj780I7YKmL/EVcbXsrThtaMCRAY=;
 b=VQK22ad17ydnFdjvxmFppT7tkwRaJPQuyZHLPvVejiCZQJVqrYzRr02fA379yCj3Yc
 BQVIzH3ypY0G1NsRO5DOmhFhfIgkSW8yGFmVbpBGwu0G9p5/xiGKIIVHVexetL8Kvmyw
 1N0JQxZ+Blk+ID9L/SEv8v7PjZywXK0dbbB+9316RTyxBNhhGGUDVN6Vqms/Yrw4WJgq
 ue6ai1O0x3pLwbx4yQdNaXQBUXCGspnZiWU+ogTcYUFslcAotmELwgnIb5fhLyIk4h5M
 XiOY7+IrDgo6MVU+WwnqokbGBFmBqjCNA4KHzuCcmuiUL57JIGTsD2wz632WFpvVZh4q
 mFiQ==
X-Gm-Message-State: AO0yUKXdhoUziRQXFRMeodrf6GiMw3ZJzqUhcVDs96rOA8QX00I2UF8f
 ZLAOScIiImhgsUYbXPmQeJmxPQ==
X-Google-Smtp-Source: AK7set9//u48MVdDMl1TVHV+C2astQb6qrt4vaDQDsazPTClPqzkr98MctVZHZkdn2joTxqPx1cQRA==
X-Received: by 2002:a17:90a:192:b0:237:b121:6711 with SMTP id
 18-20020a17090a019200b00237b1216711mr1125210pjc.3.1677265266012; 
 Fri, 24 Feb 2023 11:01:06 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 h1-20020a17090adb8100b002348bfd3799sm1851344pjv.39.2023.02.24.11.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 11:01:05 -0800 (PST)
Subject: [PULL 5/8] MAINTAINERS: Add some RISC-V reviewers
Date: Fri, 24 Feb 2023 10:59:06 -0800
Message-Id: <20230224185908.32706-6-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
References: <20230224185908.32706-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x629.google.com
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

From: Alistair Francis <alistair.francis@wdc.com>

This patch adds some active RISC-V members as reviewers to the
MAINTAINERS file.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Acked-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e25f62ac..847bc7f131 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -287,6 +287,9 @@ RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
 M: Alistair Francis <alistair.francis@wdc.com>
 M: Bin Meng <bin.meng@windriver.com>
+R: Weiwei Li <liweiwei@iscas.ac.cn>
+R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
+R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/
-- 
2.39.0


