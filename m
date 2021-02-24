Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC4323DBD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:21:25 +0100 (CET)
Received: from localhost ([::1]:60348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEu6W-000750-IE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtxm-0001P2-0L
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:12:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEtxd-0004VP-Rl
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GHBKLmYNSkQyxraBNKxs00/Evgv9JdLE5HI3phNRevE=;
 b=BnwIuKkPNTyTa6dZNPP7qX0yiN16JELDU1ivYJ7qYuUO5ISkiTMchIiVK2VFW0FU6JEKfO
 T7ee5oLk9DSWQchOTvOFej14rvC/Gvm72d32P/HCu2YE1Z04iBJ0Y2jOtLVVj685BqC6AX
 e/61e2eKWBNxxq6jiqgdh0Pcq5tepkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-GNhNPXmaPv2Y32jIWjiwMA-1; Wed, 24 Feb 2021 08:12:10 -0500
X-MC-Unique: GNhNPXmaPv2Y32jIWjiwMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB0419357A2;
 Wed, 24 Feb 2021 13:12:07 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-119.ams2.redhat.com
 [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45C9A10016F6;
 Wed, 24 Feb 2021 13:11:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] deprecations: remove many old deprecations
Date: Wed, 24 Feb 2021 13:11:28 +0000
Message-Id: <20210224131142.1952027-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following features have been deprecated for well over the 2=0D
release cycle we promise=0D
=0D
  ``-usbdevice`` (since 2.10.0)=0D
  ``-drive file=3D3Djson:{...{'driver':'file'}}`` (since 3.0)=0D
  ``-vnc acl`` (since 4.0.0)=0D
  ``-mon ...,control=3D3Dreadline,pretty=3D3Don|off`` (since 4.1)=0D
  ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)=0D
  ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10=
.0)=0D
  ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)=
=0D
  ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0=
)=0D
  ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].s=
ta=3D=0D
tus (ince 4.0)=0D
  ``query-cpus`` (since 2.12.0)=0D
  ``query-cpus-fast`` ``arch`` output member (since 3.0.0)=0D
  ``query-events`` (since 4.0)=0D
  chardev client socket with ``wait`` option (since 4.0)=0D
  ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` =
(s=3D=0D
ince 4.0.0)=0D
  ``ide-drive`` (since 4.2)=0D
  ``scsi-disk`` (since 4.2)=0D
=0D
AFAICT, libvirt has ceased to use all of these too.=0D
=0D
There are many more similarly old deprecations not (yet) tackled.=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (14):=0D
  ui, monitor: remove deprecated VNC ACL option and HMP commands=0D
  monitor: raise error when 'pretty' option is used with HMP=0D
  monitor: remove 'query-events' QMP command=0D
  softmmu: remove '-usbdevice' command line option=0D
  migrate: remove QMP/HMP commands for speed, downtime and cache size=0D
  machine: remove 'query-cpus' QMP command=0D
  machine: remove 'arch' field from 'query-cpus-fast' QMP command=0D
  chardev: reject use of 'wait' flag for socket client chardevs=0D
  hw/ide: remove 'ide-drive' device=0D
  hw/scsi: remove 'scsi-disk' device=0D
  block: remove 'encryption_key_missing' flag from QAPI=0D
  block: remove dirty bitmaps 'status' field=0D
  block: remove 'dirty-bitmaps' field from 'BlockInfo' struct=0D
  block: remove support for using "file" driver with block/char devices=0D
=0D
 block/dirty-bitmap.c                       |  38 ---=0D
 block/file-posix.c                         |  17 +-=0D
 block/qapi.c                               |   6 -=0D
 chardev/char-socket.c                      |  12 +-=0D
 docs/devel/migration.rst                   |   2 +-=0D
 docs/qdev-device-use.txt                   |   2 +-=0D
 docs/rdma.txt                              |   2 +-=0D
 docs/system/deprecated.rst                 | 117 -------=0D
 docs/system/removed-features.rst           | 123 +++++++=0D
 docs/xbzrle.txt                            |   5 -=0D
 hmp-commands-info.hx                       |  13 -=0D
 hmp-commands.hx                            | 121 -------=0D
 hw/core/machine-hmp-cmds.c                 |   8 +-=0D
 hw/core/machine-qmp-cmds.c                 | 120 -------=0D
 hw/i386/pc.c                               |   2 -=0D
 hw/ide/qdev.c                              |  38 ---=0D
 hw/ppc/mac_newworld.c                      |  13 -=0D
 hw/ppc/mac_oldworld.c                      |  13 -=0D
 hw/scsi/scsi-disk.c                        |  62 ----=0D
 hw/sparc64/sun4u.c                         |  15 -=0D
 include/block/dirty-bitmap.h               |   1 -=0D
 include/monitor/hmp.h                      |   4 -=0D
 migration/migration.c                      |  45 ---=0D
 migration/ram.c                            |   2 +-=0D
 monitor/hmp-cmds.c                         |  34 --=0D
 monitor/misc.c                             | 187 ----------=0D
 monitor/monitor.c                          |   4 +-=0D
 monitor/qmp-cmds-control.c                 |  24 --=0D
 qapi/block-core.json                       |  64 +---=0D
 qapi/control.json                          |  45 ---=0D
 qapi/machine.json                          | 181 +---------=0D
 qapi/migration.json                        |  98 ------=0D
 qemu-options.hx                            |   5 +-=0D
 scripts/device-crash-test                  |   2 -=0D
 softmmu/vl.c                               |  43 ---=0D
 tests/acceptance/pc_cpu_hotplug_props.py   |   2 +-=0D
 tests/acceptance/x86_cpu_model_versions.py |   2 +-=0D
 tests/migration/guestperf/engine.py        |  18 +-=0D
 tests/qemu-iotests/051                     |   4 -=0D
 tests/qemu-iotests/051.pc.out              |  20 --=0D
 tests/qemu-iotests/124                     |   4 -=0D
 tests/qemu-iotests/181                     |   2 +-=0D
 tests/qemu-iotests/184.out                 |   6 +-=0D
 tests/qemu-iotests/191.out                 |  48 +--=0D
 tests/qemu-iotests/194                     |   4 +-=0D
 tests/qemu-iotests/194.out                 |   4 +-=0D
 tests/qemu-iotests/226.out                 |  10 +-=0D
 tests/qemu-iotests/236                     |   2 +-=0D
 tests/qemu-iotests/236.out                 |  42 +--=0D
 tests/qemu-iotests/246                     |   3 +-=0D
 tests/qemu-iotests/246.out                 |  66 ++--=0D
 tests/qemu-iotests/254                     |   2 +-=0D
 tests/qemu-iotests/254.out                 |   9 +-=0D
 tests/qemu-iotests/257.out                 | 378 +++++++--------------=0D
 tests/qemu-iotests/260                     |   5 +-=0D
 tests/qemu-iotests/273.out                 |  15 +-=0D
 tests/qtest/migration-test.c               |  48 ---=0D
 tests/qtest/numa-test.c                    |   6 +-=0D
 tests/qtest/qmp-test.c                     |   6 +-=0D
 tests/qtest/test-hmp.c                     |   6 +-=0D
 tests/qtest/test-x86-cpuid-compat.c        |   4 +-=0D
 tests/qtest/vhost-user-test.c              |   8 +-=0D
 ui/vnc.c                                   |  38 ---=0D
 63 files changed, 380 insertions(+), 1850 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


