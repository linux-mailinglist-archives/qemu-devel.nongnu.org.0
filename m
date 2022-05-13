Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689EE5266A8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:57:45 +0200 (CEST)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXfk-0007go-HH
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXcb-00058U-5s
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXcZ-0001cO-Dr
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZZd4F2h66w9V9qY8MVyG2pW6W12i9w3UXgHmyIwMFT8=;
 b=hjzdSH8YeHcpdrtzGxLmxDdS59H3w1IRiVl8fkSznWDv9v4YOPWYUCzRz2fuR5kb2f7a2i
 OxXLzZcuKQskCXqF5ecBaIW2LNjBRZz4JjZbGLIbGM2GVfuTeHL1B4wRfEl5rtyRH9V24K
 zCgcyEmoX+ip0Y22s1UrTX1cy26UV/k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-KOLs5A3PO1ahrVo4y2ooHA-1; Fri, 13 May 2022 11:54:25 -0400
X-MC-Unique: KOLs5A3PO1ahrVo4y2ooHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 w20-20020adfd1b4000000b0020cbb4347e6so3083895wrc.17
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZZd4F2h66w9V9qY8MVyG2pW6W12i9w3UXgHmyIwMFT8=;
 b=yNAo/q7lW75Zqq5WrZXYu5bjgQ8DBmvfflXlxLoQKYbhZdPH6w0/ASaKWOMUyDn99q
 5OCNjXq3udtv2Tv755sOHE+g3PivxD06dl1FRQuaj5q4PMRWRX02CLkWNrbbklHewyYh
 wtLmPwdMjJLAXziFgFUGmALb+KSM0HWq5oIerbrMhmZKY/l8ou/tj7jSc3HVKw2HHs97
 4ijlrLEnw40o4/UVwMRdg5wfqO7GNvS3JNkeFP9ocWoPU7GhCdo9h5dVBaeP7JpfxGmm
 1XVtvPpMI4XfLKPgKU2AFrbKMFNWaGOA2dKlb9JBziWBuHLxA7IFNs2vmE/7cM86+qff
 P7mQ==
X-Gm-Message-State: AOAM532vBuG3IglCHIs/QK0/J0OZdDGEV2WX4Ccayv7Fw4mRvcdEfQoP
 KzCJjaEBrfKAy7Gtz/gXjuHTDFXSF+cMsdRJOke9vdk0SkH8qyFDLbbadWYBFChEs+nazd6T5KR
 CwCT1XIm26fDYuU4gsu20yzHcQGIRyuVRCeFZPwtKe09GDQ+nOcS1OUzS/2klRqWe
X-Received: by 2002:a05:600c:a08:b0:392:a561:9542 with SMTP id
 z8-20020a05600c0a0800b00392a5619542mr5183554wmp.62.1652457263859; 
 Fri, 13 May 2022 08:54:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL8vxtKRJMAGBoOU0h8XVQkjzVlrWUR4cAA5GLCg/mL8fiNbGjix0JgiAjk2gQP1+f/WtvqQ==
X-Received: by 2002:a05:600c:a08:b0:392:a561:9542 with SMTP id
 z8-20020a05600c0a0800b00392a5619542mr5183516wmp.62.1652457263471; 
 Fri, 13 May 2022 08:54:23 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 bg12-20020a05600c3c8c00b003942a244ecbsm2791262wmb.16.2022.05.13.08.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:54:23 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 00/10] Implement bdrv_{pread, pwrite, pwrite_sync,
 pwrite_zeroes}() using generated_co_wrapper
Date: Fri, 13 May 2022 16:54:08 +0100
Message-Id: <20220513155418.2486450-1-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Start by making the interfaces of analogous non-coroutine and coroutine
functions consistent with each other, then implement the non-coroutine
ones using generated_co_wrapper.

For the bdrv_pwrite_sync() case, also add the missing
bdrv_co_pwrite_sync() function.

Changes v1 --> v2:
- Drop unnecessary assignments to ret in vhdx_log_peek_hdr(),
  vhdx_log_read_sectors(), and vhdx_log_write_sectors().
- Simplify vdi_co_pwritev() return expression.
- Add patch making crypto block callbacks return 0 on success.
- Clarify in commit message that bdrv_pwrite_zeroes() now calls
  trace_bdrv_co_pwrite_zeroes() and clears the BDRV_REQ_MAY_UNMAP flag
  when appropriate, which it didn't previously.
- Use _co_ functions in the implementation of bdrv_co_pwrite_sync().
- Add patch converting uses of bdrv_pwrite_sync() into
  bdrv_co_pwrite_sync() when the callers are already coroutine_fn.
- Add patch making qcow2_mark_dirty() use bdrv_pwrite_sync() instead of
  calling bdrv_pwrite() and bdrv_flush() separately.

Alberto Faria (10):
  block: Add a 'flags' param to bdrv_{pread,pwrite,pwrite_sync}()
  block: Change bdrv_{pread,pwrite,pwrite_sync}() param order
  block: Make bdrv_{pread,pwrite}() return 0 on success
  crypto: Make block callbacks return 0 on success
  block: Make bdrv_co_pwrite() take a const buffer
  block: Make 'bytes' param of bdrv_co_{pread,pwrite,preadv,pwritev}()
    an int64_t
  block: Implement bdrv_{pread,pwrite,pwrite_zeroes}() using
    generated_co_wrapper
  block: Add bdrv_co_pwrite_sync()
  block: Use bdrv_co_pwrite_sync() when caller is coroutine_fn
  block/qcow2: Use bdrv_pwrite_sync() in qcow2_mark_dirty()

 block/blklogwrites.c             |  6 +--
 block/bochs.c                    | 10 ++--
 block/cloop.c                    | 12 ++---
 block/coroutines.h               |  4 +-
 block/crypto.c                   | 56 +++++++++++-----------
 block/dmg.c                      | 36 +++++++-------
 block/io.c                       | 55 ++--------------------
 block/parallels-ext.c            |  6 +--
 block/parallels.c                | 12 ++---
 block/qcow.c                     | 41 ++++++++--------
 block/qcow2-bitmap.c             | 14 +++---
 block/qcow2-cache.c              |  9 ++--
 block/qcow2-cluster.c            | 19 ++++----
 block/qcow2-refcount.c           | 58 ++++++++++++-----------
 block/qcow2-snapshot.c           | 53 ++++++++++-----------
 block/qcow2.c                    | 80 ++++++++++++++++----------------
 block/qed.c                      | 13 ++----
 block/vdi.c                      | 16 +++----
 block/vhdx-log.c                 | 23 +++++----
 block/vhdx.c                     | 36 +++++++-------
 block/vmdk.c                     | 70 +++++++++++++---------------
 block/vpc.c                      | 23 ++++-----
 block/vvfat.c                    | 11 +++--
 crypto/block-luks.c              |  8 ++--
 crypto/block.c                   |  6 +--
 include/block/block-io.h         | 22 ++++++---
 include/block/block_int-io.h     |  4 +-
 include/crypto/block.h           | 32 ++++++-------
 tests/unit/test-block-iothread.c | 12 ++---
 tests/unit/test-crypto-block.c   | 38 +++++++--------
 30 files changed, 370 insertions(+), 415 deletions(-)

-- 
2.35.3


