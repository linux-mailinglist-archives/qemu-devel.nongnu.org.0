Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9798B319587
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:05:36 +0100 (CET)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAK5f-000211-Kx
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2C-0000EH-Pe
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2A-0005pN-4I
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613080917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J28Pq755IArmti+RvAw3AMMMMCeVZJAxv54YbCmVWik=;
 b=I0L5RW0tf7lJAWgErRSfH7zHNWUUq2AyukCPV5rQ8AChhNPMiSVPODF2cTmpRQSx0vjKC8
 00QKF14Io1ox73IqtbJ71S+gWmT8ff6Xs+YKxQIXwYaOzKQU4AUffe3N5uDAoeSrIaKQiu
 gwuBhW3ifA9whqZ1gAqyJD0OhiPdKQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-8MkGjUANMS-BP-CsH_L5PQ-1; Thu, 11 Feb 2021 17:01:54 -0500
X-MC-Unique: 8MkGjUANMS-BP-CsH_L5PQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F6B9100AA22;
 Thu, 11 Feb 2021 22:01:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07E4560BF1;
 Thu, 11 Feb 2021 22:01:47 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Python / Acceptance Tests: improve logging
Date: Thu, 11 Feb 2021 17:01:40 -0500
Message-Id: <20210211220146.2525771-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The location and amount of information kept while using QEMUMachine in=0D
Acceptance Tests is currently not optimal.=0D
=0D
This improves the situation by using the Test's log directory (an=0D
Avocado standard feature) as the default location to keep logs,=0D
instead of the temporary directory currently used.=0D
=0D
Users will be able to find "qemu-$PID.log" files under the test log=0D
directories, containing all the stdout/stderr generated by the QEMU=0D
binary.=0D
=0D
Cleber Rosa (6):=0D
  Python: close the log file kept by QEMUMachine before reading it=0D
  Python: expose QEMUMachine's temporary directory=0D
  Acceptance Tests: use the job work directory for created VMs=0D
  Acceptance Tests: log information when creating QEMUMachine=0D
  Acceptance Tests: distinguish between temp and logs dir=0D
  tests/acceptance/virtio-gpu.py: preserve virtio-user-gpu log=0D
=0D
 python/qemu/machine.py                    | 42 +++++++++++++++++------=0D
 python/qemu/qtest.py                      |  6 ++--=0D
 tests/acceptance/avocado_qemu/__init__.py | 10 ++++--=0D
 tests/acceptance/virtio-gpu.py            |  5 +--=0D
 tests/qemu-iotests/iotests.py             |  2 +-=0D
 5 files changed, 45 insertions(+), 20 deletions(-)=0D
=0D
--=20=0D
2.25.4=0D
=0D


