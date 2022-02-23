Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876AD4C1E42
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:12:04 +0100 (CET)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzrf-0003PB-DP
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMzp3-0000o9-5O
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMzox-0005rL-0E
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645654153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rb1fxEaWM1Go7AztZo1MkqSqpOZIqNxBG1Qg5DDmlpk=;
 b=KL8TM8J++W7Hh5Q6I27U6TkKVz6GJsrt5o1IeCsr1PTwYy+rx58vTmDLy2XmtfBQAVnzbw
 sW0uHxIHIh8j72rMFcuFt4SpGLQTmi8mYndVTLaNrijgNcNnnR+qaS6LWWD+KW2sISIgIF
 LDtcl8tr/vKXGtLJaZc1fq50LkNXXbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-Kgcggu2nMv-SX6Z5uvgASg-1; Wed, 23 Feb 2022 17:09:11 -0500
X-MC-Unique: Kgcggu2nMv-SX6Z5uvgASg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34446801AAD;
 Wed, 23 Feb 2022 22:09:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63875709EE;
 Wed, 23 Feb 2022 22:09:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Python patches
Date: Wed, 23 Feb 2022 17:08:54 -0500
Message-Id: <20220223220900.2226630-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 31e3caf21b6cdf54d11f3744b8b341f07a30b5d7=
:=0D
=0D
  Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/trivial-branch-=
for-7.0-pull-request' into staging (2022-02-22 20:17:09 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 89d38c74f4b69a93696392b55a9fee573055d78b:=0D
=0D
  MAINTAINERS: python - remove ehabkost and add bleal (2022-02-23 17:07:26 =
-0500)=0D
=0D
----------------------------------------------------------------=0D
Python patches=0D
=0D
New functionality in qmp-shell from Dan, and some packaging fixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  python: introduce qmp-shell-wrap convenience tool=0D
  python: support recording QMP session to a file=0D
=0D
John Snow (4):=0D
  Python: discourage direct setup.py install=0D
  Python: add setuptools v60.0 workaround=0D
  Revert "python: pin setuptools below v60.0.0"=0D
  MAINTAINERS: python - remove ehabkost and add bleal=0D
=0D
 MAINTAINERS                    |  4 +-=0D
 python/Makefile                |  2 -=0D
 python/qemu/aqmp/qmp_shell.py  | 86 +++++++++++++++++++++++++++++++---=0D
 python/setup.cfg               |  5 +-=0D
 python/setup.py                | 19 +++++++-=0D
 python/tests/iotests-pylint.sh |  3 +-=0D
 python/tests/pylint.sh         |  3 +-=0D
 scripts/qmp/qmp-shell-wrap     | 11 +++++=0D
 8 files changed, 118 insertions(+), 15 deletions(-)=0D
 create mode 100755 scripts/qmp/qmp-shell-wrap=0D
=0D
--=20=0D
2.34.1=0D
=0D


