Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A0C42FD42
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:12:59 +0200 (CEST)
Received: from localhost ([::1]:56558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUVe-00020I-7P
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTF-0007Tu-1X
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUT6-0000bC-C8
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+4hSFLxP7pTjyAqUHRRd+FoB9lvoAppS4YtLBnfof1o=;
 b=Dbs0UXfg/JA65JJpvba84KlR3g3r7CJP4Yy312GuGIgpvepOjicCkMamqt/mLFxE/RY1p3
 rjXLsN/e5T2K866B0FXtT8mCWvhjt1d05exmiEZyQtxkAx6XzhEbniXRqFfU1f78OcVPFb
 b4jOy0JoyzbeWqX04Td1+YIS/sgbuiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-QlanYZLDNf-CrPTBoU4T5A-1; Fri, 15 Oct 2021 17:10:15 -0400
X-MC-Unique: QlanYZLDNf-CrPTBoU4T5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 982051006AAA
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 21:10:14 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6849519739
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 21:10:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] NBD patches through 2021-10-15
Date: Fri, 15 Oct 2021 16:09:55 -0500
Message-Id: <20211015211011.1272011-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 253e399bab7c83b3411f8eac01840283a9304cb3:

  Merge remote-tracking branch 'remotes/kwolf/tags/for-upstream' into staging (2021-10-15 12:08:54 -0700)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-10-15

for you to fetch changes up to bec4042baefc1bfeae05b161aa17d2f57d526b60:

  block-backend: update blk_co_pwrite() and blk_co_pread() wrappers (2021-10-15 16:02:09 -0500)

[Still not included: Rich's patch for qemu-nbd --selinux-label]

----------------------------------------------------------------
nbd patches for 2021-10-15

- Vladimir Sementsov-Ogievskiy: Consistent use of 64-bit parameters in
  block operations
- Hanna Reitz: Silence 32-bit compiler warning

----------------------------------------------------------------
Hanna Reitz (1):
      qcow2: Silence clang -m32 compiler warning

Vladimir Sementsov-Ogievskiy (14):
      block-backend: blk_check_byte_request(): int64_t bytes
      block-backend: make blk_co_preadv() 64bit
      block-backend: convert blk_co_pwritev_part to int64_t bytes
      block-backend: convert blk_co_pdiscard to int64_t bytes
      block-backend: rename _do_ helper functions to _co_do_
      block-coroutine-wrapper.py: support BlockBackend first argument
      block-backend: drop blk_prw, use block-coroutine-wrapper
      block-backend: convert blk_foo wrappers to use int64_t bytes parameter
      block-backend: convert blk_co_copy_range to int64_t bytes
      block-backend: convert blk_aio_ functions to int64_t bytes paramter
      block-backend: blk_pread, blk_pwrite: rename count parameter to bytes
      block-backend: drop INT_MAX restriction from blk_check_byte_request()
      block-backend: fix blk_co_flush prototype to mention coroutine_fn
      block-backend: update blk_co_pwrite() and blk_co_pread() wrappers

 scripts/block-coroutine-wrapper.py |  12 +-
 block/coroutines.h                 |  33 ++++++
 include/sysemu/block-backend.h     |  33 +++---
 block/block-backend.c              | 237 ++++++++++++++++---------------------
 block/qcow2-cluster.c              |   3 +-
 block/trace-events                 |   4 +-
 6 files changed, 169 insertions(+), 153 deletions(-)

-- 
2.31.1


