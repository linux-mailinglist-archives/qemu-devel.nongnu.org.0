Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76646453D2E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 01:36:41 +0100 (CET)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn8wK-0008Ql-49
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 19:36:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8u2-0006M9-2n
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8tw-0006vx-Jh
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637109252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+vwj6neMkyEdiKyr3BLuWwxy3Hv6s1hDTnC2YrQfA64=;
 b=XDzOIbczHE+2rptIqWy8riJP77j7WGMxArNZBIOXRCwOt6iWAzaS7O64DD9GStXubWIUiK
 7R5l5GiJRe4iDut8JJP5GFb6PT0ATeWf8OCtE9QxaTlb/JizSf5fsdqlPOgfqxndUUQhIs
 IVDbcxafDV5BHP+a9N4lHzIT/pItRdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-dATW3haqPN-NuzRF_GZjJw-1; Tue, 16 Nov 2021 19:34:08 -0500
X-MC-Unique: dATW3haqPN-NuzRF_GZjJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F7BF8799E0;
 Wed, 17 Nov 2021 00:34:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 698CD1980E;
 Wed, 17 Nov 2021 00:33:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Python patches
Date: Tue, 16 Nov 2021 19:33:12 -0500
Message-Id: <20211117003317.2844087-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2b22e7540d6ab4efe82d442363e3fc900cea6584=
:=0D
=0D
  Merge tag 'm68k-for-6.2-pull-request' of git://github.com/vivier/qemu-m68=
k into staging (2021-11-09 13:16:56 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to c398a241ec4138e0b995a0215dea84ca93b0384f:=0D
=0D
  scripts/device-crash-test: hide tracebacks for QMP connect errors (2021-1=
1-16 14:26:36 -0500)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (5):=0D
  python/aqmp: Fix disconnect during capabilities negotiation=0D
  python/aqmp: fix ConnectError string method=0D
  scripts/device-crash-test: simplify Exception handling=0D
  scripts/device-crash-test: don't emit AQMP connection errors to stdout=0D
  scripts/device-crash-test: hide tracebacks for QMP connect errors=0D
=0D
 python/qemu/aqmp/protocol.py | 24 ++++++++++++++++++------=0D
 scripts/device-crash-test    | 33 +++++++++++++++++++++++++--------=0D
 2 files changed, 43 insertions(+), 14 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


