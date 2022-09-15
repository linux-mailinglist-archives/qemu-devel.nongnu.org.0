Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D05B9BD2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 15:29:35 +0200 (CEST)
Received: from localhost ([::1]:49070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYovu-0006D1-KP
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 09:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oYohY-0007ua-3u
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 09:14:47 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:51270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.labiuk@virtuozzo.com>)
 id 1oYohT-0002u3-S3
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 09:14:42 -0400
Received: from [192.168.16.215] (helo=mikewrk.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <michael.labiuk@virtuozzo.com>) id 1oYoep-004BPT-CB;
 Thu, 15 Sep 2022 15:14:07 +0200
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
Subject: [PATCH v3 0/5] Add 'q35' machine type to hotplug tests
Date: Thu, 15 Sep 2022 16:14:02 +0300
Message-Id: <20220915131407.372485-1-michael.labiuk@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111;
 envelope-from=michael.labiuk@virtuozzo.com; helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to:  Michael Labiuk <michael.labiuk@virtuozzo.com>
From:  Michael Labiuk via <qemu-devel@nongnu.org>

Add pci bridge setting to run hotplug tests on q35 machine type.
Hotplug tests was bounded to 'pc' machine type by commit 7b172333f1b

Michael Labiuk (5):
  tests/x86: Add subtest with 'q35' machine type to device-plug-test
  tests/x86: Add 'q35' machine type to ivshmem-test
  tests/x86: Add 'q35' machine type to drive_del-test
  tests/x86: Add 'q35' machine type to hotplug hd-geo-test
  tests/x86: Add 'q35' machine type to override-tests in hd-geo-test

 tests/qtest/device-plug-test.c |  83 +++++++----
 tests/qtest/drive_del-test.c   | 111 +++++++++++++++
 tests/qtest/hd-geo-test.c      | 253 ++++++++++++++++++++++++++++++++-
 tests/qtest/ivshmem-test.c     |  30 ++++
 4 files changed, 445 insertions(+), 32 deletions(-)

-- 
2.34.1


