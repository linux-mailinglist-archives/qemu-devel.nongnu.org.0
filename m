Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D634EAB7B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:39:53 +0200 (CEST)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9GS-0005sg-9m
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:39:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9Cs-0003bI-SS
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:36:10 -0400
Received: from [2a00:1450:4864:20::431] (port=42920
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9Cq-00017N-FB
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:36:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id r13so24110287wrr.9
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1VK2IyBv2BANRK66EN93UY/XU9MdjYhQRd81s1DXDs=;
 b=I3Yp3E3K9itkfbl+/sd2Sak/sJQ68yE9togAGb2TJgWqd4sU2L0yS1ntjLRGoCdBFb
 qS0j1yV98CC6HuFIy7PpCvgX2AztWi4W7Do/wqfMXk6K9yOXQPrRLtzpMEwoBlNp8Wcs
 SvVE8DM4/0e1MjO2UOqPRAt+lDS1SH2W4TZgiUQ3fBgdDnAU5AXT85bpQLQXVK+LBaq3
 v20FIaDpZI9nAdU49Gce5imn16GMqIg5BEOHyelS0XOkzn+H5qcwfenT7VpDkomTaqkl
 xsx8TOksWR8OJa1zBi6WzepzWrjLwMa6+5Zv04hocpktx+zK7lIEEI+jPApWYN8Gsdj/
 0tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1VK2IyBv2BANRK66EN93UY/XU9MdjYhQRd81s1DXDs=;
 b=b0GwhyRbe16bNB8SQ/p0LUrfueU/m3CAVsAvV5Z+lIFsSL5BWH/QKGq8aaccjfRQ7a
 douT5+p2nwgtf2/CTJF+1fQ658urh02tX37iKsrkrg2ZXCecUYVAyGYKwIr4SebgO9yz
 qpHZsrLM7+yqVNkx56Sah/dCIPwwKWJEAxcuNSh4YNYsGaC/S/cQZ8Mdcz/K4sGUWmkM
 vP/wDuYZaUQovr0BkR+Rmir1QAb/4LSg5dUstWEgkkQb03Yi8umyXe2ooubuiWLuuXCz
 9IZQ5h8/67b4nf506OPdDqO/27sDycSJGMozEPJO6/WAPzBiNsZ9O0S5C1miaeBQMecn
 bfeQ==
X-Gm-Message-State: AOAM5321MB1weLcwhhj7bDJ32Fpm+VyJjiCFkuInom/990geH7bDLjIJ
 P0PPuMOXqR6fjyTUizMqOytlDGagSx7F2g==
X-Google-Smtp-Source: ABdhPJyz4BeDIgo08Q0dBaKsFwNWjNDxILf2vwnJzUP+t7wnTuNrdU7Ymc+QK4wKGXrq9dOUOUFhWA==
X-Received: by 2002:a05:6000:154c:b0:203:d46b:ede4 with SMTP id
 12-20020a056000154c00b00203d46bede4mr30512704wry.501.1648550166500; 
 Tue, 29 Mar 2022 03:36:06 -0700 (PDT)
Received: from localhost.localdomain ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm2374594wmq.35.2022.03.29.03.36.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Mar 2022 03:36:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] MIPS patches for 2022-03-29
Date: Tue, 29 Mar 2022 12:36:01 +0200
Message-Id: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit 27fc9f365d6f60ff86c2e2be57289bb47a2be882:

  Merge tag 'pull-ppc-20220326' of https://github.com/legoater/qemu into staging (2022-03-28 10:16:33 +0100)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20220329

for you to fetch changes up to 77d119dd335f910c7f953a265726e3753c69a0bb:

  qemu-binfmt-conf.sh: mips: allow nonzero EI_ABIVERSION, distinguish o32 and n32 (2022-03-29 00:51:55 +0200)

----------------------------------------------------------------
MIPS patches queue

- ABI fixes (Xuerui, Andreas)
- Memory API alias fix (David)

----------------------------------------------------------------

Andreas K. Hüttel (1):
  qemu-binfmt-conf.sh: mips: allow nonzero EI_ABIVERSION, distinguish
    o32 and n32

David Hildenbrand (1):
  memory: Make memory_region_readd_subregion() properly handle mapped
    aliases

WANG Xuerui (1):
  target/mips: Fix address space range declaration on n32

 scripts/qemu-binfmt-conf.sh | 20 ++++++++++----------
 softmmu/memory.c            |  3 +--
 target/mips/cpu-param.h     |  2 +-
 3 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.35.1


