Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC4C4A7DAE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 03:04:55 +0100 (CET)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFRUU-0004i3-Ay
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 21:04:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFRPi-0002JY-OW
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 20:59:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFRPd-0000kn-Ng
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 20:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643853593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4ktq05tP1lYIyoGnY2DnO+1yxOXd9A8LZdsB3zAGupA=;
 b=b2zLhIQZxn/+/1hXce0FPGw76eBgNhkR95LFvMSPAuUeld0elS+WkbwxASpnSoVei8b+HK
 nyC6rVJeWSZzRoTyvH6A5Pxhk9ZUUgPAqBcaOb4NtRcgLgo9J1GiUCk8aThx1Y5CDgKelW
 sPCswMaE7xy/B1HP65KlRBEpz3BxgP0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-rSk0GG1PO9eqvJqc9BBfLA-1; Wed, 02 Feb 2022 20:59:50 -0500
X-MC-Unique: rSk0GG1PO9eqvJqc9BBfLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09C568143F3;
 Thu,  3 Feb 2022 01:59:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 690BE101E59B;
 Thu,  3 Feb 2022 01:59:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Python patches
Date: Wed,  2 Feb 2022 20:59:42 -0500
Message-Id: <20220203015946.1330386-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 47cc1a3655135b89fa75c2824fbddd29df874612=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kwolf-gitlab/tags/for-upstream' int=
o staging (2022-02-01 19:48:15 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to b0b662bb2b340d63529672b5bdae596a6243c4d0:=0D
=0D
  python/aqmp: add socket bind step to legacy.py (2022-02-02 14:12:22 -0500=
)=0D
=0D
----------------------------------------------------------------=0D
Python patches=0D
=0D
Peter: I expect this to address the iotest 040,041 failures you observed=0D
on NetBSD. If it doesn't, let me know.=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (4):=0D
  python/aqmp: Fix negotiation with pre-"oob" QEMU=0D
  python/machine: raise VMLaunchFailure exception from launch()=0D
  python: upgrade mypy to 0.780=0D
  python/aqmp: add socket bind step to legacy.py=0D
=0D
 python/Pipfile.lock                       | 66 +++++++++++++----------=0D
 python/qemu/aqmp/legacy.py                |  3 ++=0D
 python/qemu/aqmp/protocol.py              | 41 ++++++++++++--=0D
 python/qemu/aqmp/qmp_client.py            |  4 +-=0D
 python/qemu/machine/machine.py            | 45 +++++++++++++---=0D
 python/setup.cfg                          |  2 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms |  3 +-=0D
 7 files changed, 123 insertions(+), 41 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


