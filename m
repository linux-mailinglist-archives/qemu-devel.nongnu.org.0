Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A12FFD063
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 22:35:37 +0100 (CET)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVMm7-0003EC-Pp
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 16:35:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iVMkv-0002TZ-AD
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 16:34:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iVMkt-0004LV-Rw
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 16:34:20 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37660
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iVMkt-0004LR-L0
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 16:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573767258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q288qwFbv1mHiL53WSWYe7eL+61FyEci8UWEehenINY=;
 b=cTKQ5KHpHWb0Ia6nkdcMrLEez2w4m1UW12ppVzjo6nuGp3Nkk8iZ5UDNXAd63MD7XQxy5J
 /8n68ib0QpUKIL/9Q7tLG+fiuW27DWFhftVwF/MLFAiqWe7pUOWfHERhBQo5YLMqOZ0mdM
 5FbfE8u4kq+k2mkdxTajBvL8F2Hkie8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-s7Eb9yy5OxqL2Fx0RVCszw-1; Thu, 14 Nov 2019 16:34:17 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73016800C73
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 21:34:16 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-242.phx2.redhat.com [10.3.116.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C0CC6609E;
 Thu, 14 Nov 2019 21:34:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 for-4.2 0/4] tests: More iotest 223 improvements
Date: Thu, 14 Nov 2019 15:34:11 -0600
Message-Id: <20191114213415.23499-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: s7Eb9yy5OxqL2Fx0RVCszw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v2:
- rebase to SOCK_DIR changes
- new patch 2 to avoid TCP port 10810 contention [Max]
- add imgfmt filtering [Max]

As this is limited to iotests, I think it is fair game for -rc2.

Eric Blake (4):
  iotests: Fix 173
  iotests: Switch nbd tests to use Unix rather than TCP
  iotests: Include QMP input in .out files
  tests: More iotest 223 improvements

 tests/qemu-iotests/common.filter |   6 +-
 tests/qemu-iotests/common.qemu   |   9 +++
 tests/qemu-iotests/common.rc     |   8 +--
 tests/qemu-iotests/085.out       |  26 ++++++++
 tests/qemu-iotests/094.out       |   4 ++
 tests/qemu-iotests/095.out       |   2 +
 tests/qemu-iotests/109.out       |  88 +++++++++++++++++++++++++++
 tests/qemu-iotests/117.out       |   5 ++
 tests/qemu-iotests/127.out       |   4 ++
 tests/qemu-iotests/140.out       |   5 ++
 tests/qemu-iotests/141.out       |  26 ++++++++
 tests/qemu-iotests/143.out       |   3 +
 tests/qemu-iotests/144.out       |   5 ++
 tests/qemu-iotests/153.out       |  11 ++++
 tests/qemu-iotests/156.out       |  11 ++++
 tests/qemu-iotests/161.out       |   8 +++
 tests/qemu-iotests/173           |   4 +-
 tests/qemu-iotests/173.out       |  10 +++-
 tests/qemu-iotests/182.out       |   8 +++
 tests/qemu-iotests/183.out       |  11 ++++
 tests/qemu-iotests/185.out       |  18 ++++++
 tests/qemu-iotests/191.out       |   8 +++
 tests/qemu-iotests/200.out       |   1 +
 tests/qemu-iotests/223           |  16 ++++-
 tests/qemu-iotests/223.out       | 100 +++++++++++++++++++++++++++++++
 tests/qemu-iotests/229.out       |   3 +
 tests/qemu-iotests/249.out       |   6 ++
 27 files changed, 395 insertions(+), 11 deletions(-)

--=20
2.21.0


