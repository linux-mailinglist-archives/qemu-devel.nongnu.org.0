Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CC464BDF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 11:45:14 +0100 (CET)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msN6u-0000y6-6H
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 05:45:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msN5p-0000Fu-Ak
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msN5m-0002gJ-5O
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638355439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NtknpfnkcP+mxmexPo/VtlECLl2XElId+rW8L/kYeVs=;
 b=QEvXBGimkx+6dMe2nJ6Mpe0Q5XI5ioVCTA4r6STLj+Iica++ZSPjwWBmL61XU2sXqk18NS
 LUDu6H6K/ayXm6YgRpRhXVFcKQ3rhz0y0dD1lYEfUauP8l5XMBgq1k7ozludp7gD69gZaT
 lV6ausuxt3QJ0xDBy2sGOPvV8EX1FRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-JgkBeV0MNh-RVKVi8MTlxA-1; Wed, 01 Dec 2021 05:43:57 -0500
X-MC-Unique: JgkBeV0MNh-RVKVi8MTlxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8D4681CCC5
 for <qemu-devel@nongnu.org>; Wed,  1 Dec 2021 10:43:56 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B61160C0F;
 Wed,  1 Dec 2021 10:43:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH for-7.0 0/4] qtest patches for binaries with reduced machines
Date: Wed,  1 Dec 2021 11:43:43 +0100
Message-Id: <20211201104347.51922-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First patch extends the ppc64 tests as we used them before the
conversion to meson.

The other patches improve the usage of the qtests with target
binaries that have a reduced set of machines (since this is
possible now e.g. by using the --with-devices-<arch>=... config
switch).

Thomas Huth (4):
  tests/qtest: Run the PPC 32-bit tests with the 64-bit target binary,
    too
  tests/qtest: Fence the tests that need xlnx-zcu102 with
    CONFIG_XLNX_ZYNQMP_ARM
  tests/qtest: Add a function that gets a list with available machine
    types
  tests/qtest: Add a function to check whether a machine is available

 tests/qtest/boot-serial-test.c |  3 +-
 tests/qtest/cdrom-test.c       |  8 ++--
 tests/qtest/libqos/libqtest.h  |  8 ++++
 tests/qtest/libqtest.c         | 79 +++++++++++++++++++++++++++++-----
 tests/qtest/meson.build        |  4 +-
 tests/qtest/prom-env-test.c    |  8 ++--
 6 files changed, 91 insertions(+), 19 deletions(-)

-- 
2.27.0


