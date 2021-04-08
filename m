Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D811358E11
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:07:28 +0200 (CEST)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaw3-00036J-Gc
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lUaty-0001Ug-Ci
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lUatv-0004MI-E4
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617912313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=15o8gK4A4kJrERyT9HRy7n1DUa4DxORcsdTuhgY57cc=;
 b=FUwz//07aZJxcA6ThO2yUP9DqPgTsmON1TSB3Nmh0O7QX7ab+vZYW1dfHfQg7aI5yE/XvD
 aaU3Kgh43phn9vOeNJXm2xaOoSKI+57aWnSrMhsneCaKoM8QIejD/+BZ2IUIxgNyi5jrBR
 ftg3mF1dxl+j7CLYy8iKHq2DDSZAYSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-jXB0ZXHPO3Og6DPDvKGX9Q-1; Thu, 08 Apr 2021 16:05:09 -0400
X-MC-Unique: jXB0ZXHPO3Og6DPDvKGX9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FA7214B4DFD;
 Thu,  8 Apr 2021 19:52:53 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-57.gru2.redhat.com
 [10.97.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FD9C60864;
 Thu,  8 Apr 2021 19:52:41 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] tests/acceptance: Handle tests with "cpu" tag
Date: Thu,  8 Apr 2021 16:52:30 -0300
Message-Id: <20210408195237.3489296-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the acceptance tests tagged with "machine" have the "-M TYPE"
automatically added to the list of arguments of the QEMUMachine object.
In other words, that option is passed to the launched QEMU. On this
series it is implemented the same feature but instead for tests marked
with "cpu".

There is a caveat, however, in case the test needs additional arguments to
the CPU type they cannot be passed via tag, because the tags parser split
values by comma. For example, in tests/acceptance/x86_cpu_model_versions.py,
there are cases where:

  * -cpu is set to "Cascadelake-Server,x-force-features=on,check=off,enforce=off"
  * if it was tagged like "cpu:Cascadelake-Server,x-force-features=on,check=off,enforce=off"
    then the parser would break it into 4 tags ("cpu:Cascadelake-Server",
    "x-force-features=on", "check=off", "enforce=off")
  * resulting on "-cpu Cascadelake-Server" and the remaining arguments are ignored.

It was introduced the avocado_qemu.Test.set_vm_arg() method to deal with
cases like the example above, so that one can tag it as "cpu:Cascadelake-Server"
AND call self.set_vm_args('-cpu', "Cascadelake-Server,x-force-features=on,check=off,enforce=off"),
and that results on the reset of the initial value of -cpu.

This series was tested on CI (https://gitlab.com/wainersm/qemu/-/pipelines/277376246)
and with the following code:

from avocado_qemu import Test

class CPUTest(Test):
    def test_cpu(self):
        """
        :avocado: tags=cpu:host
        """
        # The cpu property is set to the tag value, or None on its absence
        self.assertEqual(self.cpu, "host")
        # The created VM has the '-cpu host' option
        self.assertIn("-cpu host", " ".join(self.vm._args))
        self.vm.launch()

    def test_cpu_none(self):
        self.assertEqual(self.cpu, None)
        self.assertNotIn('-cpu', self.vm._args)

    def test_cpu_reset(self):
        """
        :avocado: tags=cpu:host
        """
        self.assertIn("-cpu host", " ".join(self.vm._args))
        self.set_vm_arg("-cpu", "Cascadelake-Server,x-force-features=on")
        self.assertNotIn("-cpu host", " ".join(self.vm._args))
        self.assertIn("-cpu Cascadelake-Server,x-force-features=on", " ".join(self.vm._args))

Changes:
 - v1 -> v2:
   - Recognize the cpu value passed via test parameter [crosa]
   - Fixed tags (patch 02) on preparation to patch 03 [crosa]
   - Added QEMUMachine.args property (patch 04) so that _args could be handled
     without pylint complaining (protected property) 
   - Added Test.set_vm_arg() (patch 05) to handle the corner case [crosa]

Wainer dos Santos Moschetta (7):
  tests/acceptance: Automatic set -cpu to the test vm
  tests/acceptance: Fix mismatch on cpu tagged tests
  tests/acceptance: Let the framework handle "cpu:VALUE" tagged tests
  tests/acceptance: Tagging tests with "cpu:VALUE"
  python/qemu: Add args property to the QEMUMachine class
  tests/acceptance: Add set_vm_arg() to the Test class
  tests/acceptance: Handle cpu tag on x86_cpu_model_versions tests

 docs/devel/testing.rst                     | 17 +++++++++
 python/qemu/machine.py                     |  5 +++
 tests/acceptance/avocado_qemu/__init__.py  | 21 ++++++++++++
 tests/acceptance/boot_linux.py             |  3 --
 tests/acceptance/boot_linux_console.py     | 16 +++++----
 tests/acceptance/machine_mips_malta.py     |  7 ++--
 tests/acceptance/pc_cpu_hotplug_props.py   |  2 +-
 tests/acceptance/replay_kernel.py          | 17 ++++-----
 tests/acceptance/reverse_debugging.py      |  2 +-
 tests/acceptance/tcg_plugins.py            | 15 ++++----
 tests/acceptance/virtio-gpu.py             |  4 +--
 tests/acceptance/x86_cpu_model_versions.py | 40 +++++++++++++++++-----
 12 files changed, 107 insertions(+), 42 deletions(-)

-- 
2.29.2


