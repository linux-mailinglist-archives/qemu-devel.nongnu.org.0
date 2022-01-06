Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA159486614
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:31:33 +0100 (CET)
Received: from localhost ([::1]:33454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Tnh-00070v-06
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:31:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n5T0J-0002Im-IA
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:40:31 -0500
Received: from [2a00:1450:4864:20::233] (port=46611
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1n5T0G-0005H3-Jf
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:40:30 -0500
Received: by mail-lj1-x233.google.com with SMTP id i11so4087267ljm.13
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0uJ97Utl42Dw2KuxPdQDJkAGqv7RwUA/bCw3Y6Nu5vk=;
 b=lIRS8kaJuNsrqBnEuHVLxRwIK3lJhHEon2c6kzelYXyfJuhX9yo1jgnocSyJwqmfAf
 /9tF5hRbtmMPMVo28PFSEfREPmU4HqMCOfQTBEkxWrz5sT6UDpNOE00UXPrQDSfahAXQ
 6k/wXayBV6MBzdbfmdMecDPPYm0Zp7EgdTm5mmwKzouexqj3MOaNWqlGF5A5K3x3fGQ+
 aZw5z0HJkUv7wuk8d5R/Azc8eWp8uVzDZqSQWkJyYE5SHhMpJkS77gaKpKx2sYb3WIG/
 27+Oyta1CXzXRcNXzwb27GXXv1bu0GvapZJJOhHOz5xR3YV0Yhj1u4FRa82+fin7/r2w
 uHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0uJ97Utl42Dw2KuxPdQDJkAGqv7RwUA/bCw3Y6Nu5vk=;
 b=ktNjLOf2IzDjkEsgzuui1k5i5eR27ULwZI7LPOb7ZDF2XnpoVi6pqqnsWL6h5RsnHG
 h5urb+pvbp7ZPIYc5FYfb19oMUFlArm4pu8Kbizn6YX9x1LbHwHJz459yJufMg53AgYy
 6NRJYMttrFcRitxpTlTeI2gVvbGnuUUphiBA474TmL28EBYGRHdIIo3t5uwtVNljpiAv
 IR/kcpmJBAqEbBW5d+khs1ya+98jo+haR5mBYsMj6E3b95Wh9uqkb5egL/0tepZuADVv
 XYTVvvVZ4tWhqSzUT+skoOVZXIAbfLcP0vYk0+OGOlfaAXHXtaQzMPPJRnQhLiIaNitS
 4COQ==
X-Gm-Message-State: AOAM532wM4ZCoUd6rWr4WOq0SDKjzkOrm5LQOcDUkYex6j2Ck0+Ng7zn
 g1IupPVPpSt9jUZvu0AAal4Sv8U3+CitLqma
X-Google-Smtp-Source: ABdhPJyCEPscb5ZfhXlXrg2+eD5jwU6E18kI1u2ivoxE2KHXMd3QHTM3218ZXTtrRH9v41acAtEoCQ==
X-Received: by 2002:a2e:bd14:: with SMTP id n20mr5637830ljq.336.1641476424780; 
 Thu, 06 Jan 2022 05:40:24 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id h2sm179293lji.50.2022.01.06.05.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:40:24 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/riscv: Fix position of 'experimental' comment
Date: Thu,  6 Jan 2022 14:40:20 +0100
Message-Id: <20220106134020.1628889-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x233.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Vineet Gupta <vineetg@rivosinc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When commit 0643c12e4b dropped the 'x-' prefix for Zb[abcs] and set
them to be enabled by default, the comment about experimental
extensions was kept in place above them.  This moves it down a few
lines to only cover experimental extensions.

References: 0643c12e4b ("target/riscv: Enable bitmanip Zb[abcs] instructions")

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

---

 target/riscv/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bce..e322e729d2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -640,11 +640,12 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
 
-    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
+
+    /* These are experimental so mark with 'x-' */
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
-- 
2.33.1


