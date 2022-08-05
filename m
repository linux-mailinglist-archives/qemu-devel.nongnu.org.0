Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5051558B094
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 21:57:39 +0200 (CEST)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3Ry-0003I2-7l
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 15:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pk-0006NM-OR
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:20 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3Pi-0004V6-VD
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 15:55:20 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o3so3517458ple.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 12:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B3SQ2DS2cpLqWmrbJI8Ooour/usv3U2Is5Duz3qXlLo=;
 b=VDe70jBiWqL6NfF37hdc9AaPGLBAAXOWO5MMRTl3t3TNCPz6N7FpA2W6b9m8795vkT
 f6jlftBaPdKca4l7gpRdEQvuHvdtxymRN4RBp3vI/t08dGHc+KTgBH2p9gJVgPzW33MJ
 r6BT8xfxo23F7MPEmX1Xh4AbkzJT0QnVPeDn2FWIUaFwKc+b4+yxMXmz17nlMCsUJZax
 ++Ua0mczEH8+hRFHuuFFzN4Cbaj7Fqc3saM/S8lI7e8H+8eV4cm2tym/VIAPaAWbywTx
 2ed7QOW9tZNN4FolnwxRaIvkUbUybfvBerY3sMaFjzrZpFrscHulcVCbnfV6YIU0NZd7
 JnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B3SQ2DS2cpLqWmrbJI8Ooour/usv3U2Is5Duz3qXlLo=;
 b=C5yYKiSomQpOR1p8bmy+Kfr4AfBY7dUYxJUMOvuYKc66J3ZWVtEEO2cUWK4esN8Yo8
 GTcvs4Gv9G7bbW26x1Yqs/Y/A31hKd8bLgVAISwxmZCmRrtnjSEteHHFsqlaIohocyNv
 urN7szCWgBq1L4ikaxfS24abxdKhRzZLv/NtUKAtkfTFaAA0IzmEzX0yvYirpM33jHq0
 D6a0HeYmsCnmO4lCg+ffktqnOzy+EG2TZeLzuoFVQCF/dmaarmdMgZFkRn1SFLNm0+7g
 S3//RHOj17egaNSrcM5g38uvSUFDOx5f9B7iDYCutE88FS2hDZ0WONfPKV6oyptzzSUH
 WK1A==
X-Gm-Message-State: ACgBeo2Sy0+yz1zPUNIqf8YlH5pnTdhA3lcgSAaZPHCyWJCj0qeznIhq
 kq+zEEHuxENsDXOehWJErWAaYYumL+32Dg==
X-Google-Smtp-Source: AA6agR4+Pc3xmi9j1mpwJUj8MtjvtQOjSzgwWtOmuZT9iNLDil/m8w846eTKvdDS4+hMnx0sM+9oYw==
X-Received: by 2002:a17:902:f54e:b0:16f:206b:74cc with SMTP id
 h14-20020a170902f54e00b0016f206b74ccmr8375707plf.170.1659729317466; 
 Fri, 05 Aug 2022 12:55:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170902f70d00b0016f0c2ea158sm3393048plo.157.2022.08.05.12.55.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 12:55:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] loongarch patch queue
Date: Fri,  5 Aug 2022 12:55:08 -0700
Message-Id: <20220805195515.349768-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 09ed077d7fae5f825e18ff9a2004dcdd1b165edb:

  Merge tag 'trivial-branch-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-04 17:21:13 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-la-20220805

for you to fetch changes up to 2f149c759ff352399e7a0eca25a62388822d7d13:

  target/loongarch: Update gdb_set_fpu() and gdb_get_fpu() (2022-08-05 10:02:40 -0700)

----------------------------------------------------------------
LoongArch updates:
  Store value in SET_FPU_* macros.
  Fix unused variable Werrors in acpi-build.c
  Update xml to match upstream gdb.

----------------------------------------------------------------
Qi Hu (1):
      target/loongarch: Fix macros SET_FPU_* in cpu.h

Song Gao (6):
      hw/loongarch: remove acpi-build.c unused variable 'aml_len'
      target/loongarch: Fix GDB get the wrong pc
      target/loongarch: add gdb_arch_name()
      target/loongarch: update loongarch-base64.xml
      target/loongarch: Update loongarch-fpu.xml
      target/loongarch: Update gdb_set_fpu() and gdb_get_fpu()

 configs/targets/loongarch64-softmmu.mak |  2 +-
 target/loongarch/cpu.h                  | 18 +++++++++--
 target/loongarch/internals.h            |  3 ++
 hw/loongarch/acpi-build.c               | 11 +------
 linux-user/loongarch64/signal.c         | 24 ++------------
 target/loongarch/cpu.c                  |  8 ++++-
 target/loongarch/gdbstub.c              | 43 +++++++++++++++++++------
 gdb-xml/loongarch-base64.xml            | 13 ++++----
 gdb-xml/loongarch-fpu.xml               | 50 +++++++++++++++++++++++++++++
 gdb-xml/loongarch-fpu64.xml             | 57 ---------------------------------
 10 files changed, 119 insertions(+), 110 deletions(-)
 create mode 100644 gdb-xml/loongarch-fpu.xml
 delete mode 100644 gdb-xml/loongarch-fpu64.xml

