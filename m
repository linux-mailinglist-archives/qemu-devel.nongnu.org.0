Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA24D0AEA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:19:37 +0100 (CET)
Received: from localhost ([::1]:53200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRLhY-0006Q7-AO
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:19:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdX-0006NO-N1
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdR-00015B-Kg
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646691313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=no0SbRXSVw6tbF2MFJiDT5Wr7jZ9JADsFFpAWu/2IHs=;
 b=ZxSLg7BpVZbeJY3w3Pm8bx2bVgjZx3kVZa0AStKVaNq6SjEW9KzcvjYA0gzzxrO24dmLUs
 8vFtZIZ1doJqsOK1pHC5uLERDks/xm7rQPq9GE/8VwNJW5kSOGJGq9skTifinj8Cap4OK1
 bBhuWj6ItVl4UVBYflZiQb+gFRn/qu4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-fV5am6jKOhyHa_CIHIiYFg-1; Mon, 07 Mar 2022 17:15:10 -0500
X-MC-Unique: fV5am6jKOhyHa_CIHIiYFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 770B6180FD71;
 Mon,  7 Mar 2022 22:15:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6771C4530E;
 Mon,  7 Mar 2022 22:15:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Python patches
Date: Mon,  7 Mar 2022 17:14:56 -0500
Message-Id: <20220307221507.1218892-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b49872aa8fc0f3f5a3036cc37aa2cb5c92866f33=
:=0D
=0D
  Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-=
03-07' into staging (2022-03-07 17:14:09 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 7cba010e821bf227e5fa016d0df06f2a33a0c318:=0D
=0D
  scripts/qmp-shell-wrap: Fix import path (2022-03-07 14:36:47 -0500)=0D
=0D
----------------------------------------------------------------=0D
Python patches=0D
=0D
Hopefully, fixes the race conditions witnessed through the NetBSD vm tests.=
=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (11):=0D
  python/aqmp: add _session_guard()=0D
  python/aqmp: rename 'accept()' to 'start_server_and_accept()'=0D
  python/aqmp: remove _new_session and _establish_connection=0D
  python/aqmp: split _client_connected_cb() out as _incoming()=0D
  python/aqmp: squelch pylint warning for too many lines=0D
  python/aqmp: refactor _do_accept() into two distinct steps=0D
  python/aqmp: stop the server during disconnect()=0D
  python/aqmp: add start_server() and accept() methods=0D
  python/aqmp: fix race condition in legacy.py=0D
  python/aqmp: drop _bind_hack()=0D
  scripts/qmp-shell-wrap: Fix import path=0D
=0D
 python/qemu/aqmp/legacy.py   |   7 +-=0D
 python/qemu/aqmp/protocol.py | 393 +++++++++++++++++++++--------------=0D
 python/tests/protocol.py     |  45 ++--=0D
 scripts/qmp/qmp-shell-wrap   |   2 +-=0D
 4 files changed, 274 insertions(+), 173 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


