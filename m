Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82840612FEB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:42:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNWr-0001Xu-83; Mon, 31 Oct 2022 01:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNWp-0001Wq-5A
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:07 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNWk-0003Xb-GB
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:06 -0400
Received: by mail-oi1-x22d.google.com with SMTP id r76so5355164oie.13
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Eqh2uA4L92Pu5ox6KNhCtNzAV6+F47kxe5NAB6um1Yc=;
 b=BsdJDRo5MchWP9LlPVGZFqUoprxPJVmKUJUK4jDbD6mcGxRAnczB41p5r3XseMSP+T
 s7xGdf4isIMA0TJEG0urTxqmT+7dJ9ux6K/1JivKj/F9Pwayfw27M74lyO2vRxfyufD+
 W3wY5yDCfX9U8iOc+S91SVKJStvva/zt3FMUR0/8+CmqHDo+8kmGDR6EdcvEehGGeiVu
 5jzIpLcT7JsqWhDUcX1ZfZ+pruFPBR/H2SSAqI52/+IlFelL7NzIhocAEAH/mKpx6kEt
 qVSGaF7+fFdrLC1buUGjP9t/hGN3vC/owA2BC600lNGutlVGBVDWipQzOzW/Yv09d0By
 oOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Eqh2uA4L92Pu5ox6KNhCtNzAV6+F47kxe5NAB6um1Yc=;
 b=r4NbnaMBYOlqaG3sItaLvoAXwTkO4QPCwzjNd80yH+8uTe10YJgYLw2NZV0peHsWhv
 nP+O8Yein2QBrp1C/ixHGnpRHnasGSPmeo8ZCubpS/diYVzQe5Vb7TRBH99bhCVwZjSD
 9r7rlwY4W2QP4qf3ydAY8EG18wD92WiG66hbgTYfwb6HvJtwp5X217pDY/sACg/Uq0Xo
 kSg97alRd+0tWRunUxixqQ+FFyOfZsjXgOQ3h6kldhOK9ZCbQpZlDdnO+dBR457v6nay
 wWce7zfugTLRVEzbRDOLn16lVz2pc6h97Du3gxiuknjhg9NCkSGutKJLxV3Uh/OiDVFn
 R+jw==
X-Gm-Message-State: ACrzQf2MogczkcItV9rWFeeNvHC3mNoBTUU9zTEEoDKDdmFAewS6drsk
 YPtshQlRT+D4BoZUeY8+OLBnA0jINgzU3w==
X-Google-Smtp-Source: AMsMyM6t2zoJug2cnh/b3bAHfya5zMVOLF1CgdzjgsjBPaxEYwnkPIpKi6wbeX17Uj1NgeaJZsCmUw==
X-Received: by 2002:a05:6808:190e:b0:359:a2f6:8176 with SMTP id
 bf14-20020a056808190e00b00359a2f68176mr5622856oib.283.1667194800339; 
 Sun, 30 Oct 2022 22:40:00 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.39.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:39:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] tcg patch queue
Date: Mon, 31 Oct 2022 16:39:37 +1100
Message-Id: <20221031053948.3408-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 75d30fde55485b965a1168a21d016dd07b50ed32:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-10-30 15:07:25 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221031

for you to fetch changes up to cb375590983fc3d23600d02ba05a05d34fe44150:

  target/i386: Expand eflags updates inline (2022-10-31 11:39:10 +1100)

----------------------------------------------------------------
Remove sparc32plus support from tcg/sparc.
target/i386: Use cpu_unwind_state_data for tpr access.
target/i386: Expand eflags updates inline

----------------------------------------------------------------
Icenowy Zheng (1):
      tcg/tci: fix logic error when registering helpers via FFI

Richard Henderson (10):
      tcg/sparc: Remove support for sparc32plus
      tcg/sparc64: Rename from tcg/sparc
      tcg/sparc64: Remove sparc32plus constraints
      accel/tcg: Introduce cpu_unwind_state_data
      target/i386: Use cpu_unwind_state_data for tpr access
      target/openrisc: Always exit after mtspr npc
      target/openrisc: Use cpu_unwind_state_data for mfspr
      accel/tcg: Remove will_exit argument from cpu_restore_state
      accel/tcg: Remove reset_icount argument from cpu_restore_state_from_tb
      target/i386: Expand eflags updates inline

 meson.build                                 |   4 +-
 accel/tcg/internal.h                        |   4 +-
 include/exec/exec-all.h                     |  24 ++-
 target/i386/helper.h                        |   5 -
 tcg/{sparc => sparc64}/tcg-target-con-set.h |  16 +-
 tcg/{sparc => sparc64}/tcg-target-con-str.h |   3 -
 tcg/{sparc => sparc64}/tcg-target.h         |  11 --
 accel/tcg/cpu-exec-common.c                 |   2 +-
 accel/tcg/tb-maint.c                        |   4 +-
 accel/tcg/translate-all.c                   |  91 +++++----
 target/alpha/helper.c                       |   2 +-
 target/alpha/mem_helper.c                   |   2 +-
 target/arm/op_helper.c                      |   2 +-
 target/arm/tlb_helper.c                     |   8 +-
 target/cris/helper.c                        |   2 +-
 target/i386/helper.c                        |  21 ++-
 target/i386/tcg/cc_helper.c                 |  41 -----
 target/i386/tcg/sysemu/svm_helper.c         |   2 +-
 target/i386/tcg/translate.c                 |  30 ++-
 target/m68k/op_helper.c                     |   4 +-
 target/microblaze/helper.c                  |   2 +-
 target/nios2/op_helper.c                    |   2 +-
 target/openrisc/sys_helper.c                |  17 +-
 target/ppc/excp_helper.c                    |   2 +-
 target/s390x/tcg/excp_helper.c              |   2 +-
 target/tricore/op_helper.c                  |   2 +-
 target/xtensa/helper.c                      |   6 +-
 tcg/tcg.c                                   |  81 +-------
 tcg/{sparc => sparc64}/tcg-target.c.inc     | 275 ++++++++--------------------
 MAINTAINERS                                 |   2 +-
 30 files changed, 232 insertions(+), 437 deletions(-)
 rename tcg/{sparc => sparc64}/tcg-target-con-set.h (69%)
 rename tcg/{sparc => sparc64}/tcg-target-con-str.h (77%)
 rename tcg/{sparc => sparc64}/tcg-target.h (95%)
 rename tcg/{sparc => sparc64}/tcg-target.c.inc (91%)

