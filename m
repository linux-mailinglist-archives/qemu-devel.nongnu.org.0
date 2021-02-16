Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A188531C614
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 05:58:33 +0100 (CET)
Received: from localhost ([::1]:35432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBsRU-0007VX-5I
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 23:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQI-00066u-P0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQG-0007iP-Eu
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613451434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GClDayQbsKj02VbIWPQ44oZH8IJREDOAlm0k1eRzR10=;
 b=LpUiVReRlz1nPx1FcGyOBdIXs1gtFKpIq0O5JVEL2zM3mTQUmjGkGpJ5st7i8EebunFdtD
 Y2FMPp4b2Eg6fvh/FsgVYMJ8IGwfLUz/Tprs4xJYkL7Knf7rzmYtNv4Khf2V4etL1Ku4pJ
 3inz1SGKXieqY//NX/H/r1KvPC2gIpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-Vw7dVOgSOMKst-v5NNu56w-1; Mon, 15 Feb 2021 23:57:12 -0500
X-MC-Unique: Vw7dVOgSOMKst-v5NNu56w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9671C1005501;
 Tue, 16 Feb 2021 04:57:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-129.rdu2.redhat.com
 [10.10.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 375E51F0;
 Tue, 16 Feb 2021 04:57:07 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/9] Acceptance Tests and Python libs patches for 2021-02-15
Date: Mon, 15 Feb 2021 23:56:56 -0500
Message-Id: <20210216045705.9590-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8ba4bca570ace1e60614a0808631a517cf5df67a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into stagi=
ng=3D=0D
 (2021-02-15 17:13:57 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request=0D
=0D
for you to fetch changes up to c0c5a7f18e623b8f6eb7a9ccebdccdc56db2cec7:=0D
=0D
  Acceptance Tests: set up existing ssh keys by default (2021-02-15 22:30:0=
6 =3D=0D
-0500)=0D
=0D
----------------------------------------------------------------=0D
Acceptance Tests and Python libs improvements=0D
=0D
Along with the Acceptance Tests and Python libs improvements, a=0D
improvement to the diff generation for Python code.=0D
=0D
----------------------------------------------------------------=0D
=0D
Cleber Rosa (7):=0D
  Acceptance Tests: bump Avocado version requirement to 85.0=0D
  Python: close the log file kept by QEMUMachine before reading it=0D
  tests/acceptance/virtio-gpu.py: preserve virtio-user-gpu log=0D
  Acceptance Tests: introduce LinuxTest base class=0D
  Acceptance Tests: introduce method for requiring an accelerator=0D
  Acceptance Tests: fix population of public key in cloudinit image=0D
  Acceptance Tests: set up existing ssh keys by default=0D
=0D
Eric Blake (1):=0D
  maint: Tell git that *.py files should use python diff hunks=0D
=0D
Max Reitz (1):=0D
  virtiofs_submounts.py test: Note on vmlinuz param=0D
=0D
 .gitattributes                            |   1 +=0D
 python/qemu/machine.py                    |   4 +-=0D
 tests/acceptance/avocado_qemu/__init__.py | 127 +++++++++++++++++++++=0D
 tests/acceptance/boot_linux.py            | 128 +++-------------------=0D
 tests/acceptance/virtio-gpu.py            |   5 +-=0D
 tests/acceptance/virtiofs_submounts.py    |  23 ++--=0D
 tests/requirements.txt                    |   2 +-=0D
 7 files changed, 163 insertions(+), 127 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D


