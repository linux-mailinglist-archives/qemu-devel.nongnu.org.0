Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5784847C4FE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:26:22 +0100 (CET)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziu5-00010m-96
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:26:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mzipy-00072f-Jf
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 12:22:06 -0500
Received: from [2607:f8b0:4864:20::536] (port=46061
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mzipv-0003X6-Sm
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 12:22:05 -0500
Received: by mail-pg1-x536.google.com with SMTP id 2so6104351pgb.12
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 09:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AX5Uqk/UbIV8+j2aDXYKoqRM56uXBf9Z77XSisGhMfo=;
 b=QnOx5ReVrPkxcVI+GFFdF7S/T9jQzvdkMgQ6djUlZAXrroTc6GrBYfl1dVTGK9ilcV
 RtmttfXR/MG/+CKrIdbPx7GtAO9Cpr/qJ9kyDWhpkrL2O3AaxJzB8DqhqqbvqKyxRrzJ
 dFo1f0sKm4fu7j4aMBEOaQr3o7rOVg45Hoi8IfiWG1rDhjKDJcEgPQNbt/RxJf0buHWN
 lO1/PFsDBcWVJGtCGrilhcsBz6KsgfvEbm+7MtAan5CAnFSzViFgAc2lGR3HckuVN4m1
 ghldJVZHCccmW0+1FzpL0Bkk8krSo7t+1vLZdCLo9keKJwZHz3FIbBlQVrn3p5MxrPIk
 JeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AX5Uqk/UbIV8+j2aDXYKoqRM56uXBf9Z77XSisGhMfo=;
 b=Bb7fFQ/RLxcS64FHPBIJNryR/Du489eYHXYH6F+5BjjCeAcgTI2jfkLsT8E1iShekk
 0zzMcvxJZ911XrNId452/x4lKs4k3t9Oq6wF/8tp/lnPCnmVlDOsFpT3XBsbzn65E1iw
 24fXMWxhWe9dT2iWVYo2O0BjhQSEAEj0UlcS1ZYWP8k09zhH7M/nEkc0Xk/92NGuj3bL
 oQICl29pJ/M63yL+MHCXeIburnkFwBX3VDPqgeUtqoE/58PSlhaQLkhWX4GvkXi0T/rb
 nh185T6n5cDPiAIeW3J/Aq4HJ9kFcxdQOJ+E+3TXriFjGJwJUzM9lLGqtFgLP6hmMck/
 ZBtw==
X-Gm-Message-State: AOAM5321jNp5pi+3BLEe4vIbKPExCS0R2fDolqWmRC/2KfW4/odziurh
 FddicLjcwLGHVKWasUOH/iyMOInAtzUNca3k
X-Google-Smtp-Source: ABdhPJz1yoKU0BnENtSipkbaveKTsBMgV/rPC9/GmO43YFn0raAaawwlsSV4etlQITH+4nXCVGYlTg==
X-Received: by 2002:a63:606:: with SMTP id 6mr3828307pgg.359.1640107321871;
 Tue, 21 Dec 2021 09:22:01 -0800 (PST)
Received: from vineetg-ThinkPad-X1-Carbon-Gen-9.ba.rivosinc.com
 (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id k6sm3347964pjt.14.2021.12.21.09.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 09:22:01 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: make H-extension non-experimental
Date: Tue, 21 Dec 2021 09:21:57 -0800
Message-Id: <20211221172157.2572503-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=vineetg@rivosinc.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vineet Gupta <vineetg@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

H-ext v1.0 was ratified recently as part of Privileged Spec 1.12.
So move it out of experimental.

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 target/riscv/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bced8..a582179b1773 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -640,12 +640,12 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
-    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
+    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
-- 
2.30.2


