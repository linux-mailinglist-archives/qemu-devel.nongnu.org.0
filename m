Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC446B6BAB
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:08:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbSu0-0000VA-DD; Sun, 12 Mar 2023 17:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pbSty-0000UP-BP
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:06:46 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pbStw-0006kj-Pa
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:06:46 -0400
Received: by mail-qt1-x831.google.com with SMTP id l18so11425152qtp.1
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678655203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rDW+0fkfb4zHUIewucwUnBKkfZcje3Z5roePgDChp6g=;
 b=E4L3iaWyZebMUjnSvDf8lIraH4I2+s4BfNoMFU5UPeQLgSllJb6nbL0/V/N3JWrE24
 8FfWsz+EYXGgbsIzuvlYk0/CA6V9Mfc/WIPFsXJ8im1TM43nKK7x4y4YqzdPWUlgLzuT
 EJm4LrrW7NLNbdb4AAlTKpVjL8jADDzJEOCUAjzkhiIkkSJRYDKpLP1d1FVvBAq44IOI
 ZVaqRWI67dnRcPV7i+bpqYgO+EXFWpvc5sDeALpD3I5iR25q7mI1A54pbHquQSMRGIlI
 Z+1+MNyA2sghCzu/7RIuH0kXXGjBZ16dBlo7tD7STz67IOkdJmPOHF1KBGYmzhUapKHx
 kmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678655203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rDW+0fkfb4zHUIewucwUnBKkfZcje3Z5roePgDChp6g=;
 b=oUg6t3etKvsmbAd+FiqHlkYNYiA/SN97x4+lidV/bNv3gBlecnnvCeNZ+wnnGSdHe5
 Mssr2nO4KCZcwZGancajt6p82hkAHKfUz9kQCG6uMoMF6ukoXFwB5A3bMgHPJ1FkSMt/
 Ei4jkbLYUxbrLT6jteMVkwIjtooWBdFuzjMC99UsxTaNfXEMSehB0/ynh5UK9wpuQopP
 3ROMhWD+3l89j+soLnXtINHnQS0KuzHI2TY6sgx/T6uRegPz1330GaJUpblJc1Hn7ooG
 QN8L0PJu6iC6g+F8hbLIJASbzKoXKkC4L6Rdr7+wuPK3D277hMkkEfb4ZUgvUE41Yz3H
 +mQw==
X-Gm-Message-State: AO0yUKUWXtMBSx9tsItOYavOKWWctGykWGnle8eYZlUchKVTcQR8DzwV
 fuYY3qNT8Wh/PVYtPSVXTcsnAbmDfL0=
X-Google-Smtp-Source: AK7set9C/1mEJs7zndz73MRyzCbxHH3QUvjy0NZy/p7x0mtoiR99yT/6hQYXLVzAYjbFzOuKxeSuAw==
X-Received: by 2002:ac8:5e08:0:b0:3bf:c83d:5d4c with SMTP id
 h8-20020ac85e08000000b003bfc83d5d4cmr50170737qtx.64.1678655203178; 
 Sun, 12 Mar 2023 14:06:43 -0700 (PDT)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::675])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a05622a019100b003b86b088755sm4291290qtw.15.2023.03.12.14.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 14:06:42 -0700 (PDT)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>
Subject: [PATCH 0/2] *** Enable -cpu <cpu>,help ***
Date: Sun, 12 Mar 2023 17:06:22 -0400
Message-Id: <20230312210624.2326264-1-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch series enables printing the CPU
options using '-cpu cpu,help' as requested in
https://gitlab.com/qemu-project/qemu/-/issues/1480

Sample output:
athlon features:
  3dnow=<qbool>
  3dnowext=<qbool>
  3dnowprefetch=<qbool>
  ...

Part 1 is a refactor patch that enables query-cpu-model-expansion
on all architectures, but doesn't implement any additional
feature probing. Currently only arm, i386, and s390x support
full feature probing.

This lays for the groundwork for Part 2 which actually
implements the '<cpu>,help' feature

Limitations:
Currently only 'FULL' expansion queries are implemented since
that's the only type enabled on the architectures that
allow feature probing

Unlike the 'device,help' command, default values aren't
printed

Dinah Baum (2):
  cpu, qapi, target/arm, i386, s390x: Refactor query-cpu-model-expansion
  cpu, qdict, vl: Enable printing options for CPU type

 MAINTAINERS                      |   1 +
 cpu.c                            |  61 +++++++++++++++
 include/exec/cpu-common.h        |  10 +++
 include/qapi/qmp/qdict.h         |   2 +
 qapi/machine-target-common.json  | 129 +++++++++++++++++++++++++++++++
 qapi/machine-target.json         | 129 +------------------------------
 qapi/meson.build                 |   1 +
 qemu-options.hx                  |   7 +-
 qobject/qdict.c                  |   5 ++
 softmmu/vl.c                     |  36 ++++++++-
 target/arm/arm-qmp-cmds.c        |   7 +-
 target/arm/cpu.h                 |   7 +-
 target/i386/cpu-sysemu.c         |   7 +-
 target/i386/cpu.h                |   6 ++
 target/s390x/cpu.h               |   7 ++
 target/s390x/cpu_models_sysemu.c |   6 +-
 16 files changed, 277 insertions(+), 144 deletions(-)
 create mode 100644 qapi/machine-target-common.json

-- 
2.30.2


