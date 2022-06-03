Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960453CD02
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:14:36 +0200 (CEST)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx9wZ-0006mF-5r
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n6-00016a-Fk
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:04:48 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nx9n4-0008HY-SH
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:04:48 -0400
Received: by mail-pg1-x535.google.com with SMTP id r71so7581016pgr.0
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 09:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2aUBvrQlpNzn2WARyXj5t5iAYRyEUGcgIZzag4vLOjU=;
 b=T0gqJkF2+gAxUuBI3me+vb5sB2cUxpDg1oha7xwODHKqjfMDtvTVgPIfQYFWsGRYaB
 GuoFFjD8tsZGutz6s+3MydzANP7Aacyj8Tzgt0KRorRiS382kBwNtNdmTScXd0t8EBEx
 JptgSyD5k5jYuFSDIYMgMrU7F9SUVYXQHpLbe9t1nBPKT29xsYNE+R/UEmwv4rddGOXt
 T2aRN+0I+2bRc8rFusdaXlxps3g/i0ZiHFa4yvEce5WBnm9SD72MLp37llEJnu7dj0Jz
 wJzdgkU3WuvH86HCtL+BYWhzlYZSO2QBTzEYZ+k7JnKf6sgyhJafdprtPA0dLAG++Hz0
 rI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2aUBvrQlpNzn2WARyXj5t5iAYRyEUGcgIZzag4vLOjU=;
 b=jh4LBg6jqeYwoMmyYurFea8hBRkArbWRZ5rCNpJxNpqfBRE1phDUXCRaH9SopbRhco
 +3+7vSxIRXBd5So4hoNs3e2qh/K8gmnJKQim1ZXv+4yxitRkPL0woTPG3iVGGckKkY8X
 difPUBMuYo9QTk8rJbDYUgn2NCKZd6vOnEHIMEh5gyuJScMPCj3kE3uOaU+0LPuGmghC
 qgSCWGTuCuH+DnGz2CXST3wAkXnnP2ntvr5i1DvEmrmQg57B+iQsFv/JqZQxAob4+UMc
 RoE2FxymzD4CvRxjtq4kL/3/TYkMP/I7kLD8vIxLpBdpY2REPKnHHkaChWLVvLDMvnWE
 gc5Q==
X-Gm-Message-State: AOAM533htMoGzbB9eA2ELW3NeYVBNy6e8ltTKUDNjUtmwNlHNZGa78I8
 jJBL/QQSyoPruxvSfDWxzncXyTzNaI6y+g==
X-Google-Smtp-Source: ABdhPJyaheyB4WmDJIBJxEyDgiHq7Wdp9Cl/40isOzttmuiYYV8ftjNK7/yxt5BZd3IBEO6nScD9ng==
X-Received: by 2002:a62:3646:0:b0:51b:91c7:fd4a with SMTP id
 d67-20020a623646000000b0051b91c7fd4amr19598686pfa.78.1654272276894; 
 Fri, 03 Jun 2022 09:04:36 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.0.22])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a1709027e8c00b0016196bd15f4sm5638035pla.15.2022.06.03.09.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 09:04:36 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [RFC PATCH v5 0/4] RISC-V Smstateen support
Date: Fri,  3 Jun 2022 21:34:21 +0530
Message-Id: <20220603160425.3667456-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This series adds support for the Smstateen specification which provides
a mechanism plug potential covert channels which are opened by extensions
that add to processor state that may not get context-switched. Currently
access to AIA registers, *envcfg registers and floating point(fcsr) is
controlled via smstateen.

These patches can also be found on riscv_smstateen_v5 branch at:
https://github.com/mdchitale/qemu.git

This series depends on the following series from Anup:
https://lists.nongnu.org/archive/html/qemu-devel/2022-05/msg05231.html

Changes in v5:
- Fix the order in which smstateen extension is added to the isa_edata_arr as
described in rule #3 the comment.

Changes in v4:
- Fix build issue with riscv32/riscv64-linux-user targets

Changes in v3:
- Fix coding style issues
- Fix *stateen0h index calculation

Changes in v2:
- Make h/s/envcfg bits in m/h/stateen registers as writeable by default.

Anup Patel (1):
  target/riscv: Force disable extensions if priv spec version does not
    match

Mayuresh Chitale (4):
  target/riscv: Add smstateen support
  target/riscv: smstateen check for h/senvcfg
  target/riscv: smstateen check for fcsr
  target/riscv: smstateen check for AIA/IMSIC

 target/riscv/cpu.c      |   2 +
 target/riscv/cpu.h      |   4 +
 target/riscv/cpu_bits.h |  36 +++
 target/riscv/csr.c      | 555 +++++++++++++++++++++++++++++++++++++++-
 target/riscv/machine.c  |  21 ++
 5 files changed, 615 insertions(+), 3 deletions(-)

-- 
2.25.1


