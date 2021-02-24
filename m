Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C083245C4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:28:58 +0100 (CET)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF1iL-0002M7-QF
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lF1gg-00010O-R3
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:27:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lF1ge-0003B6-TR
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:27:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614202030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VF8w2nnqyxDEykqicdKmz6clTMz70st/UP7HjDzRMHY=;
 b=UBW5UUek0A3oYGCaqxJQrcXmRJgJSTWo1VDuLRMMr8D9XFlJGbU1+JiAIhZSvdDzKLufVK
 E6bMjyQQh8/2lRSi20S765HGVU8Laq6TTnaVP6FYJiqk5N7f/YHcdEOh9AnXxtfE+8MR60
 brXjHClrkAFeFmbk3k3tVydOTCBEliQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-4f1TLQpXPL24Xok1ti2OqQ-1; Wed, 24 Feb 2021 16:27:06 -0500
X-MC-Unique: 4f1TLQpXPL24Xok1ti2OqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D01F179EC2;
 Wed, 24 Feb 2021 21:27:04 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 260CA5D6D3;
 Wed, 24 Feb 2021 21:26:58 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] tests/acceptance: Handle tests with "cpu" tag
Date: Wed, 24 Feb 2021 18:26:51 -0300
Message-Id: <20210224212654.1146167-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
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

For the example above, one should tag it (or not at all) as "cpu:Cascadelake-Server"
AND self.vm.add_args('-cpu', "Cascadelake-Server,x-force-features=on,check=off,enforce=off"),
and that results on something like:

  "qemu-system-x86_64 (...) -cpu Cascadelake-Server -cpu Cascadelake-Server,x-force-features=on,check=off,enforce=off".

QEMU is going to ignore the first -cpu argument. See the patch 0003 for a reference.

This series was tested on CI (https://gitlab.com/wainersm/qemu/-/pipelines/261254251)
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

Wainer dos Santos Moschetta (3):
  tests/acceptance: Automatic set -cpu to the test vm
  tests/acceptance: Let the framework handle "cpu:VALUE" tagged tests
  tests/acceptance: Tagging tests with "cpu:VALUE"

 docs/devel/testing.rst                     |  8 ++++++++
 tests/acceptance/avocado_qemu/__init__.py  |  4 ++++
 tests/acceptance/boot_linux.py             |  3 ---
 tests/acceptance/boot_linux_console.py     | 16 +++++++++-------
 tests/acceptance/machine_mips_malta.py     |  7 +++----
 tests/acceptance/pc_cpu_hotplug_props.py   |  2 +-
 tests/acceptance/replay_kernel.py          | 17 +++++++++--------
 tests/acceptance/reverse_debugging.py      |  2 +-
 tests/acceptance/tcg_plugins.py            | 15 +++++++--------
 tests/acceptance/virtio-gpu.py             |  4 ++--
 tests/acceptance/x86_cpu_model_versions.py |  8 ++++++++
 11 files changed, 52 insertions(+), 34 deletions(-)

-- 
2.29.2


