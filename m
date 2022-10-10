Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856335F96D9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:36:02 +0200 (CEST)
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohie9-0005X3-Kf
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiba-0001GN-S3; Sun, 09 Oct 2022 22:33:27 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohibY-0007om-3i; Sun, 09 Oct 2022 22:33:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so11891275pjs.4; 
 Sun, 09 Oct 2022 19:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mQu0xSeBdFh0OBmncdcSyCrRF2TnNs8L6m99W/T0F1A=;
 b=PpdtwWWgEoYFw+RmfrKVaJMheD7Ceye1f46IjIks6HL1XbMMqoyYYNxoZRG5OQOKEz
 UIXEVx9NY+2iWMtH4BE3ABJ9klgPS7ciWBDBtWzJaf7bRy6rnRqBmh700FWSCiNWhViZ
 g7Z5M5NGcM+9IIwEE8mfmTVdsL/TDba5gminb1g+SlindQ889oc+9txOR4Cc2R0fy3fY
 tf3m4dWrZXALx4/ZKVY2ncWBtXOa0RGvkKnJrhue1qDqWhzG5UXS493ZJmpeCzuc8C3J
 oidtDjGvlSxZgRmJJvqp0ky5s0lnRBJicXFioqBZYHXu/BDSCUULn+3b+YHBXK3xTXcb
 l58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mQu0xSeBdFh0OBmncdcSyCrRF2TnNs8L6m99W/T0F1A=;
 b=e6nn/3x1ZO2zWZ1nsAE8Na7xwfIsenvT4jgboWG64MCfhEoMfHwY2k1QQje8YMzwg1
 i6u4zBi/GvRqp2xvnjhrxeNXCVtgRY3kzFhpxyozLV+6SAZzwSoPwK3rqVx5t/8xpLoJ
 CStDkbGZkuAYm040tvULXGLDOgrjHCAMlj8pL80Mh3Tiorp1E8kYXPGwCCVgm+Jmoqvi
 YdQdO3IhAIlULwRMzQstfqbwaqhXEoiLikJ18NNX1MgZsYHiLNfAbZS8XkuSHNPI5E4+
 zn+QtPI/KOEWHx8U0wsvxzukGJFOJIUDw1M7Pvb28/GtAxCT/A65dX0i3meXmoO0JXu5
 61Jg==
X-Gm-Message-State: ACrzQf3MVEI7tx/VGEE+1XNDDMtE/svEuTEQpjZZqyaPV+uQs7cA1f4e
 l4uoDuDj3ASgYLB9o6zk/WEamSUN4+EdXf9cXIc=
X-Google-Smtp-Source: AMsMyM5XrseMWg/GOHyGy/RWOmX3HbGUAqBkrYB5T8sporCkPYcg8AWGR0xIrUeOQJNSNcWshHVhDw==
X-Received: by 2002:a17:90b:3846:b0:20a:e735:f84c with SMTP id
 nl6-20020a17090b384600b0020ae735f84cmr17975538pjb.183.1665369197845; 
 Sun, 09 Oct 2022 19:33:17 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 j64-20020a625543000000b00537b1aa9191sm5743995pfb.178.2022.10.09.19.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:33:17 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, dmitry.fomichev@wdc.com, hare@suse.de,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v3 0/3] Add zone append write for zoned device
Date: Mon, 10 Oct 2022 10:33:03 +0800
Message-Id: <20221010023306.43610-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1036.google.com
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

v3:
- only read wps when it is locked [Damien]
- allow last smaller zone case [Damien]
- add zone type and state checks in zone_mgmt command [Damien]
- fix RESET_ALL related problems

v2:
- split patch to two patches for better reviewing
- change BlockZoneWps's structure to an array of integers
- use only mutex lock on locking conditions of zone wps
- coding styles and clean-ups

v1:
- introduce zone append write

Sam Li (3):
  file-posix:add the tracking of the zones write pointers
  block: introduce zone append write for zoned devices
  qemu-iotests: test zone append operation

 block/block-backend.c              |  64 +++++++++
 block/file-posix.c                 | 216 ++++++++++++++++++++++++++++-
 block/io.c                         |  21 +++
 block/raw-format.c                 |   7 +
 include/block/block-common.h       |  14 ++
 include/block/block-io.h           |   3 +
 include/block/block_int-common.h   |   8 ++
 include/block/raw-aio.h            |   4 +-
 include/sysemu/block-backend-io.h  |   9 ++
 qemu-io-cmds.c                     |  62 +++++++++
 tests/qemu-iotests/tests/zoned.out |   7 +
 tests/qemu-iotests/tests/zoned.sh  |   9 ++
 12 files changed, 420 insertions(+), 4 deletions(-)

-- 
2.37.3


