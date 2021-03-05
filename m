Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7CF32EC96
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 14:56:41 +0100 (CET)
Received: from localhost ([::1]:43126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIAwZ-0000Zn-Tw
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 08:56:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIAuv-0007ZW-S1
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:54:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIAuu-000781-3f
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:54:57 -0500
Received: by mail-wm1-x329.google.com with SMTP id e23so1514811wmh.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 05:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NcYO7v1lBl/JJcG9J8U1SwmVEFIq6vwL1ejkFgN620A=;
 b=B9Sb0PcoXs05MkryKPVoCE5kv5Fu/iTEkMO1KkDBXvRYnoM+TANf/8UKI00igaHYYe
 XVH/Mo35elJCG4JTVmNmIQvNSib9hGeoHVEptE3Vtx5a8cRyKexZXJHetYVLFpVjUUld
 4QVmDXM/C/zpLwU4/AqwxijTbdikDjw+o2yVll23mqW6wAZrjezECGqUOPAGjTxXP1N9
 GS0Iuymi7DZ3daa1awr3njcBMqqumXvaSi4K41Rb0co8WkdZPduYvkOni7QGCaQnScYO
 T5KY45TN3iG5YvPFm81nktUJfnUzK5UVXC8NZseRlVTsE+h8t8GGx2vFII8iyXUBr0TW
 AAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NcYO7v1lBl/JJcG9J8U1SwmVEFIq6vwL1ejkFgN620A=;
 b=YeRyqo1LlgNIZkDfK6Q03wrrosAoKySa+sRIT9Oj/+TMKJSJi1RXD32BaVed81Q3i8
 cJKKvjo6QCgb/404Xpk3ViOkjFXs1Q/tgxPpiz5jvlREOULleGITQzk5iF2AxJc++lYG
 iNYUeUO0lp4r0RoRPSsidIAUALi2LR5+cROgS/JORHaYAex+NmpK0Owo990XJsKClmiD
 VH0VF6QfgHiV32XLTOJkaGuIZ0IItPriOae/tAz+n0mTQgl/+NlvZ4WhlRUe2ENjhUkT
 r5BePA7DXxXDihsDofFbV06O5dd1UZovXEzYk37bZWdqsqPefG7t3kk+OzRXJ4Vdsi8Q
 E7Vw==
X-Gm-Message-State: AOAM531GjYDpfFm+1zmb//uBpCMBKkaeATwj51OYxkdgegRQolDJ3J5e
 umJBHBTGnVWVmRpZ0C/bhMSafw==
X-Google-Smtp-Source: ABdhPJwNd76IG7l7SU4TEo1NTixVcLrCr8Syn/1zYH/Lk7yx2YDm7at0jbWeKLDpS7QqNMw8avldfQ==
X-Received: by 2002:a05:600c:2947:: with SMTP id
 n7mr9229284wmd.61.1614952493966; 
 Fri, 05 Mar 2021 05:54:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h2sm5123391wrq.81.2021.03.05.05.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 05:54:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BFC2D1FF7E;
 Fri,  5 Mar 2021 13:54:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/3] semihosting/next (move from hw, heapinfo)
Date: Fri,  5 Mar 2021 13:54:48 +0000
Message-Id: <20210305135451.15427-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Not much in this series apart from moving semihosting out of hw (where
it sat a bit weirdly) and an attempt at fixing a bug in the
SYS_HEAPINFO code. It works AFAICT but still seems a little fugly to
me. See:

 - semihosting/arg-compat: fix up handling of SYS_HEAPINFO

Alex Bennée (1):
  semihosting/arg-compat: fix up handling of SYS_HEAPINFO

Philippe Mathieu-Daudé (2):
  semihosting: Move include/hw/semihosting/ -> include/semihosting/
  semihosting: Move hw/semihosting/ -> semihosting/

 meson.build                                   |   1 +
 include/{hw => }/semihosting/console.h        |   0
 include/{hw => }/semihosting/semihost.h       |   0
 {hw/semihosting => semihosting}/common-semi.h |   0
 tests/tcg/arm/semicall.h                      |   1 +
 gdbstub.c                                     |   2 +-
 hw/mips/malta.c                               |   2 +-
 linux-user/aarch64/cpu_loop.c                 |   2 +-
 linux-user/arm/cpu_loop.c                     |   2 +-
 linux-user/riscv/cpu_loop.c                   |   2 +-
 linux-user/semihost.c                         |   2 +-
 .../arm-compat-semi.c                         | 135 ++++++++++--------
 {hw/semihosting => semihosting}/config.c      |   2 +-
 {hw/semihosting => semihosting}/console.c     |   4 +-
 softmmu/vl.c                                  |   2 +-
 stubs/semihost.c                              |   2 +-
 target/arm/helper.c                           |   4 +-
 target/arm/m_helper.c                         |   4 +-
 target/arm/translate-a64.c                    |   2 +-
 target/arm/translate.c                        |   2 +-
 target/lm32/helper.c                          |   2 +-
 target/m68k/op_helper.c                       |   2 +-
 target/mips/cpu.c                             |   2 +-
 target/mips/mips-semi.c                       |   4 +-
 target/mips/translate.c                       |   2 +-
 target/nios2/helper.c                         |   2 +-
 target/riscv/cpu_helper.c                     |   2 +-
 target/unicore32/helper.c                     |   2 +-
 target/xtensa/translate.c                     |   2 +-
 target/xtensa/xtensa-semi.c                   |   2 +-
 tests/tcg/arm/semihosting.c                   |  34 ++++-
 Kconfig                                       |   1 +
 MAINTAINERS                                   |   4 +-
 hw/Kconfig                                    |   1 -
 hw/meson.build                                |   1 -
 {hw/semihosting => semihosting}/Kconfig       |   0
 {hw/semihosting => semihosting}/meson.build   |   0
 37 files changed, 142 insertions(+), 92 deletions(-)
 rename include/{hw => }/semihosting/console.h (100%)
 rename include/{hw => }/semihosting/semihost.h (100%)
 rename {hw/semihosting => semihosting}/common-semi.h (100%)
 rename {hw/semihosting => semihosting}/arm-compat-semi.c (94%)
 rename {hw/semihosting => semihosting}/config.c (99%)
 rename {hw/semihosting => semihosting}/console.c (98%)
 rename {hw/semihosting => semihosting}/Kconfig (100%)
 rename {hw/semihosting => semihosting}/meson.build (100%)

-- 
2.20.1


