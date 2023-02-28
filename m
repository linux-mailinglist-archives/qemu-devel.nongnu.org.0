Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CDB6A6118
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:17:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7KD-0004Ns-HB; Tue, 28 Feb 2023 16:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7K7-0004Nf-F8
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pX7K4-0004Kj-Pz
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677618943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EnCDpwIcNp0pmP2FCczcxf8VJlQXng8W68CgGBcCm2M=;
 b=AzrKukljQthKhGXWvNoNO4A5+OidUWuPRDb2JT2Y4bJCI+E8csJlBfyOz3u5iRc9wpP94l
 7ecGDoJ2BtjI6aAj4D9Iv02eayUv1j0nLD6cj9vZkPZGfFqrcWyBbvoN9GzOMC/Ov7F5FM
 E/Fo83HZbn2vi4VVBr/hpZm0B+9+tFE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-8dMGxNIoOD-pp0ySxnTjNA-1; Tue, 28 Feb 2023 16:15:42 -0500
X-MC-Unique: 8dMGxNIoOD-pp0ySxnTjNA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2808101A521;
 Tue, 28 Feb 2023 21:15:41 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEC6940C945A;
 Tue, 28 Feb 2023 21:15:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 0/6] tests/qtest/readconfig: Test configs in docs/config/
Date: Tue, 28 Feb 2023 22:15:27 +0100
Message-Id: <20230228211533.201837-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We've got a bunch of config files in our docs/config/ directory
which only get occasional manual test coverage. And we've got a
"readconfig" qtest which does not check real config files yet.
Let's bring those two areas together and check the real config
files in the readconfig qtest!

I started with ich9-ehci-uhci.cfg which is still quite easy to
test, and then went on with q35-emulated.cfg that needs a little
bit of tweaking (since it hard-codes disk image names) ... so I'd
like to get information on this approach first before I continue
with the other remaining config files in the docs/config/ directory.

Thomas Huth (6):
  tests/qtest/readconfig: Rework test_object_rng_resp into a generic
    function
  tests/qtest/readconfig: Test docs/config/ich9-ehci-uhci.cfg
  docs/config: Set the "kvm" accelerator via "[accel]" section
  tests/qtest/readconfig-test: Allow testing for arbitrary memory sizes
  tests/qtest: Move mkimg() and have_qemu_img() from libqos to libqtest
  tests/qtest/readconfig: Test docs/config/q35-emulated.cfg

 docs/config/mach-virt-graphical.cfg  |   4 +-
 docs/config/mach-virt-serial.cfg     |   4 +-
 docs/config/q35-emulated.cfg         |   2 +
 docs/config/q35-virtio-graphical.cfg |   2 +
 docs/config/q35-virtio-serial.cfg    |   2 +
 configure                            |   1 +
 tests/qtest/libqos/libqos.h          |   2 -
 tests/qtest/libqtest.h               |  21 ++++
 tests/qtest/libqos/libqos.c          |  49 +-------
 tests/qtest/libqtest.c               |  52 ++++++++
 tests/qtest/readconfig-test.c        | 175 +++++++++++++++++++++++++--
 11 files changed, 251 insertions(+), 63 deletions(-)

-- 
2.31.1


