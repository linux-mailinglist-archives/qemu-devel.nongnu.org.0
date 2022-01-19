Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA69494110
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:44:14 +0100 (CET)
Received: from localhost ([::1]:37654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAGsN-0004M6-40
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAGo0-00027q-8q
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:39:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAGnx-0006yu-O2
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:39:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642621176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pN2qVcUjple2xRvMhXjAtR2fRF9djzZeudDhxRt8aQk=;
 b=Jm/4epQU3wuMaFkohCf62ZI1LkjwLyUnAJOycAG5Y1c5v8YjLSTEJkXyYPmNCrK3Ia581S
 9DN0ks4zqVCHS/aJYLSdToPWw9pgC4yaVmqYmVJYhi5CyTKyUo0oCq4lx7n5oJgeWrAY2I
 p4Ko02RKRJ/ov3QhPorzzJS/obCjFLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-7ua78_2-Osy7RzyUeGK6vA-1; Wed, 19 Jan 2022 14:39:32 -0500
X-MC-Unique: 7ua78_2-Osy7RzyUeGK6vA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89F1186A8A5;
 Wed, 19 Jan 2022 19:39:31 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DF5E196F1;
 Wed, 19 Jan 2022 19:39:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] Python: minor fixes
Date: Wed, 19 Jan 2022 14:39:11 -0500
Message-Id: <20220119193916.4138217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-fixes=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/451899886=0D
=0D
Fix a couple AQMP bugs and improve some minor irritants.=0D
=0D
V2:=0D
 - Hack-fix a race condition inherent=0D
   between machine.py and aqmp/legacy.py=0D
 - Improve error reporting from QEMUMachine.launch()=0D
=0D
John Snow (5):=0D
  python/aqmp: Fix negotiation with pre-"oob" QEMU=0D
  python: use avocado's "new" runner=0D
  python/machine: raise VMLaunchFailure exception from launch()=0D
  python: upgrade mypy to 0.780=0D
  python/aqmp: add socket bind step to legacy.py=0D
=0D
 python/Pipfile.lock                       | 66 +++++++++++++----------=0D
 python/avocado.cfg                        |  2 +-=0D
 python/qemu/aqmp/legacy.py                |  3 ++=0D
 python/qemu/aqmp/protocol.py              | 41 ++++++++++++--=0D
 python/qemu/aqmp/qmp_client.py            |  4 +-=0D
 python/qemu/machine/machine.py            | 44 ++++++++++++---=0D
 python/setup.cfg                          |  2 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms |  3 +-=0D
 8 files changed, 123 insertions(+), 42 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


