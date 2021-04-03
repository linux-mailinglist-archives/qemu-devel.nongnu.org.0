Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88FB3534B3
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Apr 2021 18:18:01 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSiyG-0007o6-Hx
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 12:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lSix3-0007NV-AW
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 12:16:45 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lSix1-0001wp-QH
 for qemu-devel@nongnu.org; Sat, 03 Apr 2021 12:16:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id bg21so983538pjb.0
 for <qemu-devel@nongnu.org>; Sat, 03 Apr 2021 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=li/neLMrGeo5AdO0mxzJ4vcgnbc+QZ9+bTwNcOIJjCk=;
 b=r3BXYWLEZI7ZZlaueind1IRbIHvjCeQttGB2kM8DSq5fLNIeEtIkPgYVpXSMKan9mR
 uZxzExlOG63sOa9uvD4YU/+8XJiYkcaB2HWsIHr9Sr1APysUB2la/Fp6QOEAmr/+Ukct
 y2D4cjyk1OzhTK1NZ62M0xwJxTCkfPTqXHqgEIBbINPiRuhntvNnAs6s8H5CN3saKAbn
 NTcZlTK/EL6dq05j8XGVwbD5fD4b5R3SXC0h7B8X0Bwe1oS0Jjb0gMV6TXRMRBILdrwd
 K0of4rFHZvwJbwnUgYJ++Ins5sbunVRuRuMqoPYn0Z3EWIR/3fyDTSKxb74wrT5nKAUQ
 Y5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=li/neLMrGeo5AdO0mxzJ4vcgnbc+QZ9+bTwNcOIJjCk=;
 b=IreWUvy7PG04LuPaFjjhTXktR0dYZRnp29dbygEHQ1505KAES7dvSTZNjd3Het5GHP
 LVUpZBWxR23FZSpUTooJK5FgmRtWVcAQepm+WfMHQl9hDcLa4xGm7PZMG0pap1KRQ+t4
 GFVlUIkHdFq79xDL6WJZjv1OOXCPcXHanevbCe/HpoFN3BHxCGzUdQgUH4BnarSAIAnB
 7A3X8SbmA//3AxQcStXf4ZXsHT4PQjX5P37mkBBRnRHqEA/7M6Kw16bOnAwPpXQDKs/f
 mtiQpAId0DxpqoSIoXe+C3kNrwW30nOc2jKwUYBccWq5ghb9IrDVG7hyEcmMy7vubuAy
 9QYg==
X-Gm-Message-State: AOAM531AOVUgLsh5Q11HLu93LsB+lsq94ADuQUX+Km8DT22GXUpGtcxd
 AF+0+Yt2OvlPNqYpJo9Lw+d1gyooYqU=
X-Google-Smtp-Source: ABdhPJxLl0r+JcsmwwhmLs7hLY+7X2zHQFdLPnCb9S88HQWHDltkI3Ip+o92jxYameODU4G1475yUQ==
X-Received: by 2002:a17:902:edc2:b029:e4:3738:9b23 with SMTP id
 q2-20020a170902edc2b02900e437389b23mr17345314plk.37.1617466601849; 
 Sat, 03 Apr 2021 09:16:41 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id js16sm10899703pjb.21.2021.04.03.09.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Apr 2021 09:16:41 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] target/xtensa fixes for v6.0
Date: Sat,  3 Apr 2021 09:16:16 -0700
Message-Id: <20210403161616.17502-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

please pull the following two fixes for the target/xtensa.

The following changes since commit 6d40ce00c1166c317e298ad82ecf10e650c4f87d:

  Update version for v6.0.0-rc1 release (2021-03-30 18:19:07 +0100)

are available in the Git repository at:

  git://github.com/OSLL/qemu-xtensa.git tags/20210403-xtensa

for you to fetch changes up to 30c676134eb8f956853a55023d694062062d40d7:

  target/xtensa: make xtensa_modules static on import (2021-04-03 08:52:18 -0700)

----------------------------------------------------------------
target/xtensa fixes for v6.0:

- make meson.build pick up all available xtensa core definitions;
- don't modify Makefile.objs in import_core.sh;
- add sed rule to import_core.sh to make xtensa_modules variable static.

----------------------------------------------------------------
Max Filippov (2):
      target/xtensa: fix meson.build rule for xtensa cores
      target/xtensa: make xtensa_modules static on import

 target/xtensa/import_core.sh |  4 +---
 target/xtensa/meson.build    | 13 ++++---------
 2 files changed, 5 insertions(+), 12 deletions(-)

-- 
Thanks.
-- Max

