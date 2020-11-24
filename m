Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0482C2562
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:09:47 +0100 (CET)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khX8k-0002dq-Bf
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khX7Q-0001kG-Gm
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:08:24 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:51029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khX7O-00065e-Ib
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 07:08:24 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-oczCcG8fN4i7adIpLbfHmQ-1; Tue, 24 Nov 2020 07:08:09 -0500
X-MC-Unique: oczCcG8fN4i7adIpLbfHmQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBAFE18C43DB;
 Tue, 24 Nov 2020 12:08:07 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-44.ams2.redhat.com [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBB241002C11;
 Tue, 24 Nov 2020 12:08:04 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/1] 9p fixes for 5.2 2020-11-24
Date: Tue, 24 Nov 2020 13:07:27 +0100
Message-Id: <20201124120728.1482792-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 683685e72dccaf8cb9fe8ffa20f5c5aacea72118=
:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
uest' into staging (2020-11-23 13:03:13 +0000)

are available in the Git repository at:

  https://gitlab.com/gkurz/qemu.git tags/9p-fix-2020-11-24

for you to fetch changes up to 558f5c42efded3e0d0b20a90bce2a9a14580d824:

  tests/9pfs: Mark "local" tests as "slow" (2020-11-24 12:44:25 +0100)

----------------------------------------------------------------
Mark "local" qtests as slow to avoid unwanted breakage of "make check"
with some configurations (eg. Fedora's Copr automatic build system).

----------------------------------------------------------------
Greg Kurz (1):
      tests/9pfs: Mark "local" tests as "slow"

 tests/qtest/virtio-9p-test.c | 9 +++++++++
 1 file changed, 9 insertions(+)
--=20
2.26.2


