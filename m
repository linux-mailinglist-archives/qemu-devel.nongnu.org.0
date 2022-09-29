Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD85EF2C3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:53:58 +0200 (CEST)
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odqEv-0004M9-S5
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odptW-0007Bl-Ha; Thu, 29 Sep 2022 05:31:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odptU-0001eS-Om; Thu, 29 Sep 2022 05:31:50 -0400
Received: by mail-pf1-x435.google.com with SMTP id i6so955785pfb.2;
 Thu, 29 Sep 2022 02:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NmH17nRzTUhEoYe3POY8usj9frv4jTI4OAQ62LBdoG8=;
 b=qUxBB7rVfLyxcMhYgIVWoH9Pd5l0V5VGZlPUiXWtKPzhhCdDehkuHxf66Ew1ge3QCc
 wkq2GljJGTbq00hk1W4CZvFgDZcXmbgCYyw7BfxIUN7MJZzHMputP+pFlStIaY2GHT4m
 +Up5qDJZ/CPoHD50SWoFN/mLCAVKtINY95esNhwRUlmKf7UTbnwGjlnlcT/ZgR+OwaL3
 TJ/56ey5BqRqfVPdJjo/ED0O6dXfsYfw3dHAbXjAGV4jKOsE6UxC+vW7431cfJOLr8Qf
 +2vo/lRm7rkYBlxj9bFoKGHO9z6IuNcXPhRjtQJVpAQQNG72EWaLF6dSH9q24lpqIZ1D
 pkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NmH17nRzTUhEoYe3POY8usj9frv4jTI4OAQ62LBdoG8=;
 b=vhc93uRIKGUTlE/4YUUVcv2MWaokHDj/fY7pdE9Jj2W+Ac2cdJQxEk4dEbVS17T5Eb
 zCVQKFq9Vi/uBf5hWVyGk+XDBDTAxnm0jcmDL9IHuspKDfIMe+eGeN1vSFopuhqs+b/M
 ofVgkdC+Ods/+Wrm0HQ5n5YgJxfvrnsRDn8lm7tczn+9LjIgkAb3gldacOOuxn0GAuyo
 Un/iec4CUiOXsPkhxVP9V/UEVqCe9eT8t2u/5SCtCou7khJwD0g8tLcbfOr0dC2hJzN1
 NsaqV4GWpKOoF/N3frLQw9RgggIbE6CHhe+KhDDVbIKJzUOqsAfsh1YplEEUgOwmwtSE
 Tybw==
X-Gm-Message-State: ACrzQf39FkGCgiz4Zn8Iw5U3IjCC2OKnkbfF6XgLYwYorYjs/yTmIev6
 TlRxtJ6Xq2U/AaKIEEj4+f3jLOnSK86wVw==
X-Google-Smtp-Source: AMsMyM5N0Ms9CHFUi49jR9+vBX/gTRsTa2V2Tdeve2Tnu+unVpD/Y1q31jn+csv3fTQjDUaHVJlCKA==
X-Received: by 2002:a63:1d22:0:b0:439:3e7c:8af7 with SMTP id
 d34-20020a631d22000000b004393e7c8af7mr2150580pgd.78.1664443906453; 
 Thu, 29 Sep 2022 02:31:46 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 f4-20020a623804000000b0053e669cc845sm5570537pfa.190.2022.09.29.02.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 02:31:46 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, damien.lemoal@opensource.wdc.com,
 Fam Zheng <fam@euphon.net>, stefanha@redhat.com, dmitry.fomichev@wdc.com,
 hare@suse.de, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v2 0/2] add zone append write for zoned device
Date: Thu, 29 Sep 2022 17:31:32 +0800
Message-Id: <20220929093134.73974-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- split patch to two patches for better reviewing
- change BlockZoneWps's structure to an array of integers
- use only mutex lock on locking conditions of zone wps
- coding styles and clean-ups

v1:
- introduce zone append write

Sam Li (2):
  file-posix: add the tracking of the zones wp
  block: introduce zone append write for zoned devices

 block/block-backend.c              |  65 ++++++++++
 block/file-posix.c                 | 189 ++++++++++++++++++++++++++++-
 block/io.c                         |  21 ++++
 block/raw-format.c                 |   7 ++
 include/block/block-common.h       |  16 +++
 include/block/block-io.h           |   3 +
 include/block/block_int-common.h   |   8 ++
 include/block/raw-aio.h            |   4 +-
 include/sysemu/block-backend-io.h  |   9 ++
 qemu-io-cmds.c                     |  62 ++++++++++
 tests/qemu-iotests/tests/zoned.out |   7 ++
 tests/qemu-iotests/tests/zoned.sh  |   9 ++
 12 files changed, 396 insertions(+), 4 deletions(-)

-- 
2.37.3


