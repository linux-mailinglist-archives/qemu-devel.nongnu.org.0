Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8152DE275
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:12:40 +0100 (CET)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEch-0003FG-BM
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEaz-0001Yh-0a
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEaw-0001Z3-0p
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0rRMFt6bBxawQMUqG+sRui3g+MSJ/Au3QwcuzfcLE2s=;
 b=EvKATRex7yilnezMY7GYGFz2e2tsvOpW3ZV/tgzmNUvKMOHA/1NXXPlkcPgAN6lDKBJKn3
 QkgEIwOKQBcqfSN9MTvQZQPDCk6MgB6T1xU7hzt3J5bYK7SiZ3QRVEO8S7iqKYV7X7/NrR
 hG6Axg/WJDyyeitdldfOofeFPGSH+1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-xyyDoy-vNyClQye6EKoiNw-1; Fri, 18 Dec 2020 07:10:47 -0500
X-MC-Unique: xyyDoy-vNyClQye6EKoiNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 560688049CE;
 Fri, 18 Dec 2020 12:10:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B32460C47;
 Fri, 18 Dec 2020 12:10:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/17] Block layer patches
Date: Fri, 18 Dec 2020 13:10:24 +0100
Message-Id: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2020-12-17 18:53:36 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to be7c5ddd0d80e2d6cf8e3ef12c049851d28d9c26:

  block/vpc: Use sizeof() instead of HEADER_SIZE for footer size (2020-12-18 12:43:30 +0100)

----------------------------------------------------------------
Block layer patches:

- Add qemu-storage-daemon documentation
- hw/block/nand: Decommission the NAND museum
- vpc: Clean up some buffer abuse
- nfs: fix int overflow in nfs_client_open_qdict
- Several iotests fixes

----------------------------------------------------------------
Markus Armbruster (9):
      block/vpc: Make vpc_open() read the full dynamic header
      block/vpc: Don't abuse the footer buffer as BAT sector buffer
      block/vpc: Don't abuse the footer buffer for dynamic header
      block/vpc: Make vpc_checksum() take void *
      block/vpc: Pad VHDDynDiskHeader, replace uint8_t[] buffers
      block/vpc: Use sizeof() instead of 1024 for dynamic header size
      block/vpc: Pad VHDFooter, replace uint8_t[] buffers
      block/vpc: Pass footer buffers as VHDFooter * instead of uint8_t *
      block/vpc: Use sizeof() instead of HEADER_SIZE for footer size

Max Reitz (1):
      iotests/210: Fix reference output

Peter Lieven (1):
      block/nfs: fix int overflow in nfs_client_open_qdict

Philippe Mathieu-Daudé (1):
      hw/block/nand: Decommission the NAND museum

Stefan Hajnoczi (3):
      docs: generate qemu-storage-daemon-qmp-ref(7) man page
      docs: add qemu-storage-daemon(1) man page
      MAINTAINERS: add Kevin Wolf as storage daemon maintainer

Vladimir Sementsov-Ogievskiy (2):
      iotests: make _filter_qom_path more strict
      iotests:172: use _filter_qom_path

 docs/interop/conf.py                         |   2 +
 docs/interop/index.rst                       |   1 +
 docs/interop/qemu-storage-daemon-qmp-ref.rst |  13 +++
 docs/meson.build                             |   1 +
 docs/tools/conf.py                           |   2 +
 docs/tools/index.rst                         |   1 +
 docs/tools/qemu-storage-daemon.rst           | 148 ++++++++++++++++++++++++++
 block/nfs.c                                  |   2 +-
 block/vpc.c                                  | 146 +++++++++++++------------
 hw/block/nand.c                              |  12 +--
 MAINTAINERS                                  |   9 ++
 storage-daemon/qapi/qapi-schema.json         |   3 +
 tests/qemu-iotests/172                       |   2 +-
 tests/qemu-iotests/172.out                   | 152 +++++++++++++--------------
 tests/qemu-iotests/186.out                   |  56 +++++-----
 tests/qemu-iotests/210.out                   |   2 +-
 tests/qemu-iotests/common.filter             |   2 +-
 17 files changed, 361 insertions(+), 193 deletions(-)
 create mode 100644 docs/interop/qemu-storage-daemon-qmp-ref.rst
 create mode 100644 docs/tools/qemu-storage-daemon.rst


