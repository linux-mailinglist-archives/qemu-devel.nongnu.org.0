Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F145B3C78ED
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:23:07 +0200 (CEST)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Pru-0003IO-CH
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Poq-0008CE-98
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pol-0007Oy-Rp
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TRw2JWAFiZW1xwot6O1tpJeMWowi6ioBe8SxCUBf3gQ=;
 b=RKGO6CEpLGeMoAEB0kqp4F+pi+yfbMHp7m1Sd8weMnxMWi9U3N0/erNhvCPlpP5Y1odTXa
 amJ1eUCPpAfmYyyuQ5hPiB2phzIM2UDgcUu3fGj08Aky1v6bUaIzXtBDIZh+HsQf8jUiZt
 Aj0Uq8kT77zhQ91qRd/JTdHxxg2txIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-5EHMeTpJNUSvrcIR9PKLbw-1; Tue, 13 Jul 2021 17:19:49 -0400
X-MC-Unique: 5EHMeTpJNUSvrcIR9PKLbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59FA9804307;
 Tue, 13 Jul 2021 21:19:46 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 868C019C45;
 Tue, 13 Jul 2021 21:19:29 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/23] Python and Acceptance Tests
Date: Tue, 13 Jul 2021 17:19:00 -0400
Message-Id: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 708f50199b59476ec4b45ebcdf171550086d6292=
:=0D
=0D
  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-07-09-v2' =
into staging (2021-07-13 14:32:20 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request=0D
=0D
for you to fetch changes up to c4e2d499c94fb7d6ea43d28e2613559861ef5d79:=0D
=0D
  tests/acceptance/cpu_queries.py: use the proper logging channels (2021-07=
-13 16:27:43 -0400)=0D
=0D
----------------------------------------------------------------=0D
Python and Acceptance Tests=0D
=0D
- New SMMUv3 and Intel IOMMU tests=0D
- Respect "cpu" tags and reduce boiler plate code=0D
- Improved logging of qemu execution output=0D
- Other misc improvements=0D
=0D
----------------------------------------------------------------=0D
=0D
Cleber Rosa (9):=0D
  Acceptance Tests: use the job work directory for created VMs=0D
  Acceptance Tests: log information when creating QEMUMachine=0D
  Acceptance Tests: distinguish between temp and logs dir=0D
  Acceptance Tests: rename attribute holding the distro image checksum=0D
  Acceptance Tests: move definition of distro checksums to the framework=0D
  Acceptance Tests: support choosing specific distro and version=0D
  Acceptance tests: do not try to reuse packages from the system=0D
  tests/acceptance/linux_ssh_mips_malta.py: drop identical setUp=0D
  tests/acceptance/cpu_queries.py: use the proper logging channels=0D
=0D
Eric Auger (2):=0D
  avocado_qemu: Add SMMUv3 tests=0D
  avocado_qemu: Add Intel iommu tests=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  tests/acceptance: Ignore binary data sent on serial console=0D
  tests/acceptance: Tag NetBSD tests as 'os:netbsd'=0D
=0D
Wainer dos Santos Moschetta (8):=0D
  tests/acceptance: Automatic set -cpu to the test vm=0D
  tests/acceptance: Fix mismatch on cpu tagged tests=0D
  tests/acceptance: Let the framework handle "cpu:VALUE" tagged tests=0D
  tests/acceptance: Tagging tests with "cpu:VALUE"=0D
  python/qemu: Add args property to the QEMUMachine class=0D
  tests/acceptance: Add set_vm_arg() to the Test class=0D
  tests/acceptance: Handle cpu tag on x86_cpu_model_versions tests=0D
  python: Configure tox to skip missing interpreters=0D
=0D
Willian Rampazzo (2):=0D
  avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro class=0D
  Acceptance Tests: Add default kernel params and pxeboot url to the=0D
    KNOWN_DISTROS collection=0D
=0D
 .gitlab-ci.d/static_checks.yml             |   1 +=0D
 MAINTAINERS                                |   1 +=0D
 docs/devel/testing.rst                     |  82 ++++++++++=0D
 python/Makefile                            |   5 +-=0D
 python/qemu/machine/machine.py             |  22 ++-=0D
 python/setup.cfg                           |   1 +=0D
 tests/Makefile.include                     |   2 +-=0D
 tests/acceptance/avocado_qemu/__init__.py  | 179 +++++++++++++++++++--=0D
 tests/acceptance/boot_linux.py             |  11 --=0D
 tests/acceptance/boot_linux_console.py     |  14 +-=0D
 tests/acceptance/boot_xen.py               |   1 -=0D
 tests/acceptance/cpu_queries.py            |   4 +-=0D
 tests/acceptance/intel_iommu.py            | 119 ++++++++++++++=0D
 tests/acceptance/linux_ssh_mips_malta.py   |   7 +-=0D
 tests/acceptance/machine_mips_malta.py     |   7 +-=0D
 tests/acceptance/pc_cpu_hotplug_props.py   |   2 +-=0D
 tests/acceptance/ppc_prep_40p.py           |   2 +=0D
 tests/acceptance/replay_kernel.py          |  17 +-=0D
 tests/acceptance/reverse_debugging.py      |   2 +-=0D
 tests/acceptance/smmu.py                   | 137 ++++++++++++++++=0D
 tests/acceptance/tcg_plugins.py            |  15 +-=0D
 tests/acceptance/virtio-gpu.py             |   4 +-=0D
 tests/acceptance/x86_cpu_model_versions.py |  40 ++++-=0D
 23 files changed, 603 insertions(+), 72 deletions(-)=0D
 create mode 100644 tests/acceptance/intel_iommu.py=0D
 create mode 100644 tests/acceptance/smmu.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


