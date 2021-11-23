Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95C459A29
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 03:40:02 +0100 (CET)
Received: from localhost ([::1]:60306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpLiy-00074W-Ra
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 21:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhO-00050K-09
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpLhL-0006B3-IM
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 21:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637635098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s70sC6vYVcomgL5ImF2P3C3u/uMm2GuqJ3IIYO/qBIE=;
 b=S4vua7AHWMrs68rCTKhYZsTj2dknBuBd+lxiYjDJZbk+PWyGYkX4NSD7npcrnBYWfskUv7
 uAS1RUUdlRVd6DQFlt8gEQioyZLWVQQBA7S33zA0muyHP/VXMbKDdWIhU2KA07QHqMe6ss
 QMCZv2OHRdlQMgdd84JsUbcuNBNECq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-FQLa45T8PO6nZzc6iV0cow-1; Mon, 22 Nov 2021 21:38:15 -0500
X-MC-Unique: FQLa45T8PO6nZzc6iV0cow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F5B31023F4E;
 Tue, 23 Nov 2021 02:38:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3ECF65F4EA;
 Tue, 23 Nov 2021 02:38:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Python patches
Date: Mon, 22 Nov 2021 21:37:58 -0500
Message-Id: <20211123023805.2745382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 89d2f9e4c63799f7f03e9180c63b7dc45fc2a04a=
:=0D
=0D
  Merge tag 'pull-target-arm-20211122' of https://git.linaro.org/people/pma=
ydell/qemu-arm into staging (2021-11-22 16:35:54 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to a57cb3e23d5ac918a69d0aab918470ff0b429ff9:=0D
=0D
  python/aqmp: fix send_fd_scm for python 3.6.x (2021-11-22 18:41:21 -0500)=
=0D
=0D
----------------------------------------------------------------=0D
Python testing fixes for 6.2=0D
=0D
A few more fixes to help eliminate race conditions from=0D
device-crash-test, along with a fix that allows the SCM_RIGHTS=0D
functionality to work on hosts that only have Python 3.6.=0D
=0D
If this is too much this late in the RC process, I'd advocate for at=0D
least patch 7/7 by itself.=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (7):=0D
  python/machine: add @sock_dir property=0D
  python/machine: remove _remove_monitor_sockfile property=0D
  python/machine: add instance disambiguator to default nickname=0D
  python/machine: move more variable initializations to _pre_launch=0D
  python/machine: handle "fast" QEMU terminations=0D
  scripts/device-crash-test: Use a QMP timeout=0D
  python/aqmp: fix send_fd_scm for python 3.6.x=0D
=0D
 python/qemu/aqmp/qmp_client.py |  9 ++++--=0D
 python/qemu/machine/machine.py | 59 ++++++++++++++++++++--------------=0D
 scripts/device-crash-test      |  2 +-=0D
 3 files changed, 42 insertions(+), 28 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


