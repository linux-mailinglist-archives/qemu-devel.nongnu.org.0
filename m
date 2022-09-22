Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343FD5E5E0E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 10:58:37 +0200 (CEST)
Received: from localhost ([::1]:46200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obI2W-0003oi-41
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 04:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtl-0004FX-JA
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHth-00036f-GV
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/2cek2gIWbbxCvJE+xwotfwaqqZoUeqfBd9ATK6/lJM=;
 b=Tq0IbO9n7Di1y9QqUyTZ8CWjIXjUJwM95m+yGGQZtv0uMTX3SR0QyXazoTmj5tEblu72lx
 2bx+bop3OEu9gtS0q2phyNxX6siyeuR9v4tT0AFHGCUqfF3hfT5q899wLKREgE5wXqPXbu
 CswgfSoNUEnSNhDaq5USlE2vCU6TPCE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-Lvfg9UknNl2IVRKaJjaXxg-1; Thu, 22 Sep 2022 04:49:27 -0400
X-MC-Unique: Lvfg9UknNl2IVRKaJjaXxg-1
Received: by mail-ed1-f72.google.com with SMTP id
 c6-20020a05640227c600b004521382116dso6286774ede.22
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/2cek2gIWbbxCvJE+xwotfwaqqZoUeqfBd9ATK6/lJM=;
 b=ZjuYwCGA8oQF+ejS5N1o0fl7iobFRlQrLrYTGo6yDcboPMQNf17u9S2Sgif2W2njMC
 ovQ4jO94sT6jBDzA4A7LzKGY9a0g/EqmHHmUHqNQHnDYJA8OYuo4/qvMUZZCo5Ezl+ka
 Wi9RdbadJTQGu95kLJe85kE388MTuR5Pj8G+smWzvRZPm0xjexHwChpMroveBGSMxO09
 ZoEnqlAeJ8wh3KFz4POWTjgNpmgaXN5qUAynRMoaDl/mzRvYQRWeX8KGhOSwfjfQ6m5b
 GxnCRWEmlLiawkougogCVoZX30vxe3mBx3WN1adxgWxNJekJs5h2VkcaSIcR84z6BM7B
 LezA==
X-Gm-Message-State: ACrzQf17UpCKX2dFK0NcdkKAcC/wZtIzKB7LVm+wPH88dA4Hl+ctDlq6
 Naa3OcYaIuMBciE7JtcUlVXI5TTtUpelo1ih58vVbOI3Z4wuugp5yCOI8wA9XlHGpp8BCASj3he
 CtRook+5xOWn62LvMMeafIDIpQyK2qG1fY/8rQDxT2AO6lKt9fY/81gYQ+1imAL/ljs4=
X-Received: by 2002:a05:6402:1f84:b0:455:27b8:27aa with SMTP id
 c4-20020a0564021f8400b0045527b827aamr1179039edc.243.1663836566271; 
 Thu, 22 Sep 2022 01:49:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7kgVnxlOtFVpMgMctFtN7vWfW5ujoUuxLJRgy/Ag4L49XGWHk85muu3z+vC5rB9SEfJfApRA==
X-Received: by 2002:a05:6402:1f84:b0:455:27b8:27aa with SMTP id
 c4-20020a0564021f8400b0045527b827aamr1179011edc.243.1663836565960; 
 Thu, 22 Sep 2022 01:49:25 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a17090676ca00b0078246b1360fsm769911ejn.131.2022.09.22.01.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH v3 00/26] block: fix coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:48:58 +0200
Message-Id: <20220922084924.201610-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

As discussed at KVM Forum 2022, I am reposting this series to
add more coroutine_fn annotations.  Fixing the annotations
enables static analysis of which functions are coroutine-only
and which are mixed (coroutine/non-coroutine).

A lot of the patches are similar to the ones that Marc-André Lureau
wrote back in 2017 (posted at [1]) but due to the changes in the code
it was easier to redo them.

This is a simple rebase of v2 (posted at [2]) with the following changes:
- patch 1 is new
- create_file_fallback_zero_first_sector is now marked as coroutine_fn
- blk_pwrite_zeroes is not a coroutine_fn anymore
- blk_pwrite is not a coroutine_fn anymore
- tracked_request_end is already a coroutine_fn in master
- some changes in commit messages

Paolo

[1] https://patchew.org/QEMU/20170704220346.29244-1-marcandre.lureau@redhat.com/).
[2] https://patchew.org/QEMU/20220509103019.215041-1-pbonzini@redhat.com/

Marc-André Lureau (3):
  9p: add missing coroutine_fn annotations
  migration: add missing coroutine_fn annotations
  test-coroutine: add missing coroutine_fn annotations

Paolo Bonzini (23):
  block/nvme: separate nvme_get_free_req cases for
    coroutine/non-coroutine context
  block: add missing coroutine_fn annotations
  qcow2: remove incorrect coroutine_fn annotations
  nbd: remove incorrect coroutine_fn annotations
  coroutine: remove incorrect coroutine_fn annotations
  blkdebug: add missing coroutine_fn annotations
  blkverify: add missing coroutine_fn annotations
  file-posix: add missing coroutine_fn annotations
  iscsi: add missing coroutine_fn annotations
  nbd: add missing coroutine_fn annotations
  nfs: add missing coroutine_fn annotations
  nvme: add missing coroutine_fn annotations
  parallels: add missing coroutine_fn annotations
  qcow2: add missing coroutine_fn annotations
  copy-before-write: add missing coroutine_fn annotations
  curl: add missing coroutine_fn annotations
  qed: add missing coroutine_fn annotations
  quorum: add missing coroutine_fn annotations
  throttle: add missing coroutine_fn annotations
  vmdk: add missing coroutine_fn annotations
  job: add missing coroutine_fn annotations
  coroutine-lock: add missing coroutine_fn annotations
  raw-format: add missing coroutine_fn annotations

 block.c                     |  6 ++---
 block/blkdebug.c            | 14 +++++-----
 block/blkverify.c           |  2 +-
 block/block-backend.c       | 10 +++----
 block/copy-before-write.c   |  8 +++---
 block/curl.c                |  2 +-
 block/file-posix.c          |  2 +-
 block/io.c                  | 22 +++++++--------
 block/iscsi.c               |  2 +-
 block/nbd.c                 | 10 +++----
 block/nfs.c                 |  2 +-
 block/nvme.c                | 53 ++++++++++++++++++++++---------------
 block/parallels.c           |  5 ++--
 block/qcow2-cluster.c       | 18 ++++++-------
 block/qcow2-refcount.c      |  6 ++---
 block/qcow2.c               |  4 +--
 block/qcow2.h               | 18 ++++++-------
 block/qed.c                 |  4 +--
 block/quorum.c              | 35 ++++++++++++------------
 block/raw-format.c          |  2 +-
 block/throttle.c            |  2 +-
 block/vmdk.c                | 20 +++++++-------
 hw/9pfs/9p.h                |  9 ++++---
 include/block/nbd.h         |  2 +-
 include/qemu/coroutine.h    |  2 +-
 include/qemu/job.h          |  2 +-
 job.c                       |  2 +-
 migration/migration.c       |  3 ++-
 tests/unit/test-coroutine.c |  2 +-
 util/qemu-coroutine-lock.c  | 14 +++++-----
 util/qemu-coroutine.c       |  2 +-
 31 files changed, 150 insertions(+), 135 deletions(-)

-- 
2.37.3


