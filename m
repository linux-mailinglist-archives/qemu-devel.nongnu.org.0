Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0302B5EF2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:18:12 +0100 (CET)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezw3-0003re-Io
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezu9-0002MQ-1U
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezu6-0002dT-Pz
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605615369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fb5B6lE4tNGEjdbPXYcZmdmp1gTQvC7DXjihuTUxdiQ=;
 b=Q30qiysu2A04xFRr3Ff+n+6EFI3C/YrZbvV62oLpfv1wLmN6OodOIk9K961IKQRi2hwyI3
 MiBxKhyt/oOJ3ps5TvVQNcdslD1c5TuDD/EEE+YbdKggd8SQds3gja9OEYOETH/xQQaUFa
 xkK2s0Iw6he5umh0HEiwr/t28fxDigI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-iuMfV25fPxKBuuKJpcE4hw-1; Tue, 17 Nov 2020 07:16:08 -0500
X-MC-Unique: iuMfV25fPxKBuuKJpcE4hw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0ECC879520;
 Tue, 17 Nov 2020 12:16:06 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95BB510013D0;
 Tue, 17 Nov 2020 12:16:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/7] Patches for 5.2.0-rc2
Date: Tue, 17 Nov 2020 13:15:51 +0100
Message-Id: <20201117121558.249585-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit bce36c6c5436c0c2679b42c6de54de5393dfcf59:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-11-16 22:29:51 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to c61c644f59c43017f9577d7f867c48bb9d7a28ad:

  iotests/081: Test rewrite-corrupted without WRITE (2020-11-17 12:38:32 +0100)

----------------------------------------------------------------
Patches for 5.2.0-rc2:

- quorum: Fix crash with rewrite-corrupted and without read-write user
- io_uring: do not use pointer after free
- file-posix: Use fallback path for -EBUSY from FALLOC_FL_PUNCH_HOLE
- iotests: Fix failure on Python 3.9 due to use of a deprecated function
- char-stdio: Fix QMP default for 'signal'

----------------------------------------------------------------
Kevin Wolf (2):
      char-stdio: Fix QMP default for 'signal'
      iotests: Replace deprecated ConfigParser.readfp()

Max Reitz (3):
      quorum: Require WRITE perm with rewrite-corrupted
      iotests/081: Filter image format after testdir
      iotests/081: Test rewrite-corrupted without WRITE

Maxim Levitsky (1):
      file-posix: allow -EBUSY errors during write zeros on raw block devices

Paolo Bonzini (1):
      io_uring: do not use pointer after free

 qapi/char.json                           |  3 +-
 block/file-posix.c                       |  1 +
 block/io_uring.c                         |  2 +-
 block/quorum.c                           |  5 +++
 chardev/char-stdio.c                     |  4 +--
 tests/qemu-iotests/nbd-fault-injector.py |  2 +-
 tests/qemu-iotests/081                   | 61 ++++++++++++++++++++++++++++++--
 tests/qemu-iotests/081.out               | 27 ++++++++++++++
 8 files changed, 95 insertions(+), 10 deletions(-)


