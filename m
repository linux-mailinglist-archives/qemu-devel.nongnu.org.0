Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F566D55D0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 03:21:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjVMU-0001mS-0z; Mon, 03 Apr 2023 21:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pjVMS-0001m1-8a
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:21:24 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pjVLK-0004dk-Fs
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 21:21:23 -0400
Received: by mail-qt1-x829.google.com with SMTP id p2so25105985qtw.13
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 18:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680571212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J0GrULLPmmqWPWBNRXHFMKEFlhMzwFaD7JDE8ON8reY=;
 b=chWuJYooO9m5LB9P7LJ3bdTsjN5GRnKofESLNldhAh9N16B4HiosCTO07ORt8dzarF
 UDRlFV5+Wv4oJttO3qB3umCtlr3A5G6C2pC9BReYlSYd0PArx8QZYp8c0likHT23TXVw
 gW86kT5y+G9sT68TIHJ5i7Zoi8yOs39BEbFF3mVrkVqAw7oCVMPOr4DsFK9rJxEHb8uh
 PpK4pq1/JkBtctMFN7IqCNserew5WNcrtYIi4tNJLzzps4KFT7+BsxxTgBzsD++h0jFm
 IwGPwqZVE0y5IqceGL8SgE9p46i/YrrIu/d6xii3ByxRTbeKglj4KAqFz8NfUogaNnQy
 RuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J0GrULLPmmqWPWBNRXHFMKEFlhMzwFaD7JDE8ON8reY=;
 b=At06K3uVjQRF3oqbmffdiA2Xo+ncsXlXP1MAInLtyvDyeZF8WrHVu7u3ofYqsR2gnY
 6PeNZyMCT/nqTG4BHb4514di1whnVmjd78kEerQVjMWqV9KCElK2zHYHh2fq8c7n8U2f
 RTVAJcNNgDcyTfvsiakBQWHi5hnr7khuofibP5ZVFDyHwxns2cQiCdkuhY1+rgdzFPUE
 HW9hzMS0DuimwXXiy4cju3AeiyFrvC7WUKZ4GBikVheqlbTB8qBH9w3LWwKPBzhABGtH
 NOmwUJVCx26h1u2h/Q3Q8RykCjEAvPK4mGuuHyqbsrDMEYVVRIA7ouEhAqmv7woR/Jm7
 dsKw==
X-Gm-Message-State: AAQBX9d4f5rUtjS4UPNE+H6Jm156xw+R2rS+TJCdM76MrMlW3h7KogDw
 ux0x24iASmVteRQ0fkCo23XrYy+Ohks=
X-Google-Smtp-Source: AKy350Ycrig54WYxDzDjd48BObizgpe97uzucOTXWnS3Mz2Ix+vAT9V4HN2WRCTsbeko2ReCnYDJvA==
X-Received: by 2002:ac8:7d42:0:b0:3bf:da79:6703 with SMTP id
 h2-20020ac87d42000000b003bfda796703mr972142qtb.3.1680571212606; 
 Mon, 03 Apr 2023 18:20:12 -0700 (PDT)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::3e69])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a05620a248400b0074865a9cb34sm3229909qkn.28.2023.04.03.18.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:20:12 -0700 (PDT)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>
Subject: [RESEND PATCH v2 0/3] Enable -cpu <cpu>,help
Date: Mon,  3 Apr 2023 21:19:53 -0400
Message-Id: <20230404011956.90375-1-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x829.google.com
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

Part 1 is a refactor/code motion patch for
qapi/machine target required for setup of

Part 2 which enables query-cpu-model-expansion
on all architectures

Part 3 implements the '<cpu>,help' feature

Limitations:
Currently only 'FULL' expansion queries are implemented since
that's the only type enabled on the architectures that
allow feature probing

Unlike the 'device,help' command, default values aren't
printed

Changes since v2: Rebase

Dinah Baum (3):
  qapi/machine-target: refactor machine-target
  cpu, qapi, target/arm, i386, s390x: Generalize
    query-cpu-model-expansion
  cpu, qdict, vl: Enable printing options for CPU type

 MAINTAINERS                      |   1 +
 cpu.c                            |  61 +++++++++++++++
 include/exec/cpu-common.h        |  10 +++
 include/qapi/qmp/qdict.h         |   2 +
 qapi/machine-target-common.json  | 130 +++++++++++++++++++++++++++++++
 qapi/machine-target.json         | 129 +-----------------------------
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
 16 files changed, 278 insertions(+), 144 deletions(-)
 create mode 100644 qapi/machine-target-common.json

-- 
2.30.2


