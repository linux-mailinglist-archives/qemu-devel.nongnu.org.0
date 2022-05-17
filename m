Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161BB52A293
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:04:26 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqwsB-0005Gy-Is
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvUG-0007FE-4W
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvUB-0002c6-Tm
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U2sNmW1WDrxCrFdt15EmP2SLORxZfqnaK84wuaXPg8g=;
 b=by8IUAFoyX9sndv02XSHO1B3y1L9suAWz9Nsx32BNEd6mXNf/LneAav0p3BpXSXDf6ltPi
 lgBqZqF7aBlb4ZJfy9Ne819kzeY9tXtCf430dgp9vCrHJICY7jtV+4YtwryGYe38DBiJup
 /sRRxHdvQA9jpfda/0dvTOQE9Y2yfJk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-2UZKWpDpO76QMd82NjXXkw-1; Tue, 17 May 2022 07:35:29 -0400
X-MC-Unique: 2UZKWpDpO76QMd82NjXXkw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso3615529wma.1
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U2sNmW1WDrxCrFdt15EmP2SLORxZfqnaK84wuaXPg8g=;
 b=kFmyIDvhbo5NVcHrzQMiv1Tvv5mX+9BPcqYYO/xdheq1dEhHNXMgCLttCdSjdxXyls
 vI6f0fFU8gNKRuI5BFjpMauiSoxX4XiZIFDz8tgbK7PGct0x85irhBNf0CDOaOih4Wra
 v9Zz3weBg8cHvqUUYuzDlhoypAYpFRJiVtE1Xq3qQMol1ttKYEMKpJ6THxYRUoXQSRnC
 yB94u6l4onLbJFf7AEcnL2zoy5gDFK8BuOWNcUglhz9AaBr/WJFJSvQKmxflhS9Uj4O9
 JlSlQNTa40lLVndjyBM63cZuhkKNyOV5ejlSrdGVN1mjn40EZnPjMSFiYs8242t3M2VT
 cDWw==
X-Gm-Message-State: AOAM533vVRVWM86w5yy4nu6CSVC7iGNgyMEewVjbDwqMZzqI4DQubDjq
 hy64VAdLiey6bPWk8Fv+FbwJ3FCBFVzC8m2ZRbWGzrQZbMNWRMoTQ9/pLd3UtE/FivJn/TkDKpy
 2WVn22QWozNVBJ2mrv323nF3ndtkjLiE6V/Op3tUet2KHDjRlKPJSeKiUDCIdMAKv
X-Received: by 2002:a5d:4948:0:b0:20e:58f8:f4ce with SMTP id
 r8-20020a5d4948000000b0020e58f8f4cemr2203838wrs.229.1652787328144; 
 Tue, 17 May 2022 04:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzov3l5thqbX4p/2Jte29EPejPe9dYXkyXXVBITCoDrG0xBTUpYmFScaQ3anVw70pJXdL5XpA==
X-Received: by 2002:a5d:4948:0:b0:20e:58f8:f4ce with SMTP id
 r8-20020a5d4948000000b0020e58f8f4cemr2203780wrs.229.1652787327684; 
 Tue, 17 May 2022 04:35:27 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d64ae000000b0020d0fbf578esm4570177wrp.7.2022.05.17.04.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:35:27 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH 00/18] Make block-backend-io.h API more consistent
Date: Tue, 17 May 2022 12:35:06 +0100
Message-Id: <20220517113524.197910-1-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Adjust existing pairs of non-coroutine and coroutine functions to share
the same calling convention, and add non-coroutine/coroutine
counterparts where they don't exist.

Also make the non-coroutine versions generated_co_wrappers.

This series sits on top of "[PATCH v2 00/10] Implement bdrv_{pread,
pwrite, pwrite_sync, pwrite_zeroes}() using generated_co_wrapper":

    https://lore.kernel.org/qemu-devel/20220513155418.2486450-1-afaria@redhat.com/

Based-on: <20220513155418.2486450-1-afaria@redhat.com>

Alberto Faria (18):
  block: Make blk_{pread,pwrite}() return 0 on success
  block: Add a 'flags' param to blk_pread()
  block: Change blk_{pread,pwrite}() param order
  block: Make 'bytes' param of blk_{pread,pwrite}() an int64_t
  block: Make blk_co_pwrite() take a const buffer
  block: Implement blk_{pread,pwrite}() using generated_co_wrapper
  block: Add blk_{preadv,pwritev}()
  block: Add blk_[co_]preadv_part()
  block: Export blk_pwritev_part() in block-backend-io.h
  block: Change blk_pwrite_compressed() param order
  block: Add blk_co_pwrite_compressed()
  block: Implement blk_pwrite_zeroes() using generated_co_wrapper
  block: Implement blk_pdiscard() using generated_co_wrapper
  block: Implement blk_flush() using generated_co_wrapper
  block: Add blk_co_ioctl()
  block: Add blk_co_truncate()
  block: Reorganize some declarations in block-backend-io.h
  block: Remove remaining unused symbols in coroutines.h

 block.c                           |  10 +-
 block/block-backend.c             | 150 ++++++++++++------------------
 block/commit.c                    |   4 +-
 block/coroutines.h                |  44 ---------
 block/crypto.c                    |   2 +-
 block/export/fuse.c               |   4 +-
 block/meson.build                 |   1 +
 block/parallels.c                 |   2 +-
 block/qcow.c                      |  14 +--
 block/qcow2.c                     |   4 +-
 block/qed.c                       |   8 +-
 block/vdi.c                       |   4 +-
 block/vhdx.c                      |  20 ++--
 block/vmdk.c                      |  10 +-
 block/vpc.c                       |  12 +--
 hw/arm/allwinner-h3.c             |   2 +-
 hw/arm/aspeed.c                   |   2 +-
 hw/block/block.c                  |   2 +-
 hw/block/fdc.c                    |  20 ++--
 hw/block/hd-geometry.c            |   2 +-
 hw/block/m25p80.c                 |   2 +-
 hw/block/nand.c                   |  47 +++++-----
 hw/block/onenand.c                |  32 +++----
 hw/block/pflash_cfi01.c           |   4 +-
 hw/block/pflash_cfi02.c           |   4 +-
 hw/ide/atapi.c                    |   4 +-
 hw/misc/mac_via.c                 |   6 +-
 hw/misc/sifive_u_otp.c            |  14 +--
 hw/nvram/eeprom_at24c.c           |   8 +-
 hw/nvram/spapr_nvram.c            |  16 ++--
 hw/nvram/xlnx-bbram.c             |   4 +-
 hw/nvram/xlnx-efuse.c             |   4 +-
 hw/ppc/pnv_pnor.c                 |   6 +-
 hw/sd/sd.c                        |   4 +-
 include/sysemu/block-backend-io.h | 105 ++++++++++++---------
 migration/block.c                 |   8 +-
 nbd/server.c                      |   8 +-
 qemu-img.c                        |  33 +++----
 qemu-io-cmds.c                    |  20 ++--
 tests/unit/test-block-iothread.c  | 141 ++++++++++++++++++++++++++--
 40 files changed, 433 insertions(+), 354 deletions(-)

-- 
2.35.3


