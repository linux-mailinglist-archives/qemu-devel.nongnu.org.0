Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F8669A4A2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 05:09:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSs3y-0000gc-2a; Thu, 16 Feb 2023 23:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs3v-0000fV-7l
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:31 -0500
Received: from esa5.hc2706-39.iphmx.com ([216.71.137.63])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pSs3p-00017A-K8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 23:09:30 -0500
X-IronPort-RemoteIP: 209.85.222.197
X-IronPort-MID: 271087189
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Maamna7wvTysHG8pre/rAgxRtIbFchMFZxGqfqrLsTDasY5as4F+v
 mVKDWrQO/jYYzemLot0O4u/px8B75OHx4M2QANvpSA9Eysa+MHIO4+lIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlB4ARlDRx2lAS2e0c9Xcp3yZ6ZciOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDX4pZkc/HKbitq/0Te5p0G2M80Mi+7vdkoc+dZk
 72hvbToIesg0zaldO41CnG0GAknVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2ktBKscqudTPFhSq
 /syMBUxaSyIxN2PlefTpulE3qzPLeHuNYIb/2hjlHTXVKd5B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2A1NlKZMkIn1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYuieC9b4OFK7RmQ+13vFSTu
 DPaxF+hAzxFBea/lBCF106z07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe0r9xXuQICsAFu3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:A9v7+Kylq++n/0ayxcKkKrPw/L1zdoMgy1knxilNoNJuA6ilfq
 eV7YkmPH7P+UwssRQb8+xoV5PwJ080maQFg7X5Xo3SJzUOxlHYVb2KhLGKq1aQeBEWntQ86U
 4KSdkYNDSfNykese/KpCOVKZIP+uWmzYyfrdvi7h5WPH1XgmJbgzuRyDz3LqS7fmd77OICZe
 KhDwN8yFudRUg=
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 23:09:22 -0500
Received: by mail-qk1-f197.google.com with SMTP id
 op8-20020a05620a534800b0073b2e9d5061so2420236qkn.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 20:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D1Gnk93yd5GPP+8PqPwTBtwTCgTfTH0W++PVK3WzzWE=;
 b=faVRlsHR3EXXo4B7C78sc9gebCWCC5UDQiZwhUik5ejjwVuaxm5vz2ysFrNv1jmRll
 Pn5E6h7snKXLGsGpYCRkpz7v9To3QrUdeDQ6US3g8XoPFqyPkMVaCigjKL8DHShoE7Wv
 eU0iwlFkaz6vW+E3J1j0ytH4BNHB4hVryki9wXGxiAyTi1XNRnIxSFSgAZ3qYFQNPiDN
 Nz7TYDy75ov9sKDze5ASWUeJcV1Fh6aMkhltJQRqn2yOBqjl87H95KEJRi3bDoPF7Xgh
 OTveQbf4vsZMC9mSh8EEOqdNh7kaNmwHPEWkYp6MrTVUCLzo5FVqnZTfI0zeu9MfMBFs
 sPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1Gnk93yd5GPP+8PqPwTBtwTCgTfTH0W++PVK3WzzWE=;
 b=MD0Et2hjgWmmnrfxt92FsFSY66lrSiasLLqQ6zoFdQf0yJAjda12rzZHGdscQPoBSE
 KVfkY2uD58J7lCUH3wJcFR5rWRASuIfhXY+CcvwT0s1RgMmR3kkbr2gtbezNhIWurAgJ
 RurWFFKO12jZk3uqjccXbMdQW5Gu4wDK7lEl6NKSlxIu8+7HrzKfsNR2FOh72obkjNwy
 NAfOlYmucuzXuzbakkUMXTXIxnVuIgcT30Y7PVgyhPN1QQwOJBDcFOHRGuIm7Cjd81B1
 nZ1meucCmokwYZY73S79IVAT0rZ5i2E2RABOT5Sx3jGsaEN8SY7lhu2F6DKpESHZ1zy/
 oJZw==
X-Gm-Message-State: AO0yUKU99Tuz9tyGAeDerZKOwP6HJhBbv/2dSBwp9+Y0zrsEVYW72oWp
 gJHKxnhEpIyYT0FovQ6mRtBp55HFuBUoTIcgQsrgMZfiezqslfwtWbmWtHWwow2ho5mGrhTsN7b
 my5kMvT4oK1W9cgHjTgKxbyRNyXw3AqkzLN4=
X-Received: by 2002:a05:6214:29ce:b0:537:6e29:e9e9 with SMTP id
 gh14-20020a05621429ce00b005376e29e9e9mr14196498qvb.21.1676606962030; 
 Thu, 16 Feb 2023 20:09:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9mm8sNWN/yPpaaE7Cmws+D5DGpnJOtc77h2UWOGSWdDdo/GMMQ5cTQs34nC6RDMjFLYee0SA==
X-Received: by 2002:a05:6214:29ce:b0:537:6e29:e9e9 with SMTP id
 gh14-20020a05621429ce00b005376e29e9e9mr14196479qvb.21.1676606961714; 
 Thu, 16 Feb 2023 20:09:21 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a376484000000b00738e8e81dc9sm2521998qkb.75.2023.02.16.20.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 20:09:21 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 00/10] Replace fork-based fuzzing with reboots
Date: Thu, 16 Feb 2023 23:08:45 -0500
Message-Id: <20230217040855.16873-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.63; envelope-from=alxndr@bu.edu;
 helo=esa5.hc2706-39.iphmx.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.649, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,
The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de99c261:

  Merge tag 'migration-20230215-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu/ tags/pr-2023-02-16

for you to fetch changes up to 7d9e5f18a94792ed875a1caed2bfcd1e68a49481:

  docs/fuzz: remove mentions of fork-based fuzzing (2023-02-16 23:02:46 -0500)

----------------------------------------------------------------
Replace fork-based fuzzing with reboots.
Now the fuzzers will reboot the guest between inputs.

----------------------------------------------------------------
Alexander Bulekov (10):
      hw/sparse-mem: clear memory on reset
      fuzz: add fuzz_reset API
      fuzz/generic-fuzz: use reboots instead of forks to reset state
      fuzz/generic-fuzz: add a limit on DMA bytes written
      fuzz/virtio-scsi: remove fork-based fuzzer
      fuzz/virtio-net: remove fork-based fuzzer
      fuzz/virtio-blk: remove fork-based fuzzer
      fuzz/i440fx: remove fork-based fuzzer
      fuzz: remove fork-fuzzing scaffolding
      docs/fuzz: remove mentions of fork-based fuzzing

 docs/devel/fuzzing.rst              |  22 +------
 hw/mem/sparse-mem.c                 |  13 +++-
 meson.build                         |   4 --
 tests/qtest/fuzz/fork_fuzz.c        |  41 -------------
 tests/qtest/fuzz/fork_fuzz.h        |  23 -------
 tests/qtest/fuzz/fork_fuzz.ld       |  56 -----------------
 tests/qtest/fuzz/fuzz.c             |   6 ++
 tests/qtest/fuzz/fuzz.h             |   2 +-
 tests/qtest/fuzz/generic_fuzz.c     | 119 ++++++++----------------------------
 tests/qtest/fuzz/i440fx_fuzz.c      |  27 +-------
 tests/qtest/fuzz/meson.build        |   6 +-
 tests/qtest/fuzz/virtio_blk_fuzz.c  |  51 +++-------------
 tests/qtest/fuzz/virtio_net_fuzz.c  |  54 ++--------------
 tests/qtest/fuzz/virtio_scsi_fuzz.c |  51 +++-------------
 14 files changed, 71 insertions(+), 404 deletions(-)
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
 delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld

