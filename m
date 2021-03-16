Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2744733D9E4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:55:45 +0100 (CET)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCyu-0007Ip-4S
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCo5-0007ge-BA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:44:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCo0-0003z4-GE
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615913066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CbfD9iqITxg5FKKdqKP4MUnVO65c/VmwgFLDu+B7Xu4=;
 b=KZ4x8SvS1jyOgeKK2P/CQTawyuMt6fFer+Vjw3W5uIPtG9rGOu7oKSvsKYv8Y6Z+m0AFu9
 1tJsqZ36LO3Dd75C4ohost9aM2noo6z+JcwR7MAFS+OXJHRwS0nx6OWm52re/kzlAqIifg
 R5N/JNlxcYxxDM6zmtqQUlGp1qzq7TQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-cXxWqFNrMgqmBd0qz0aQog-1; Tue, 16 Mar 2021 12:44:24 -0400
X-MC-Unique: cXxWqFNrMgqmBd0qz0aQog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D6681084D71;
 Tue, 16 Mar 2021 16:44:22 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-185.ams2.redhat.com
 [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA0645C1A1;
 Tue, 16 Mar 2021 16:43:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] misc patches removing deprecated features
Date: Tue, 16 Mar 2021 16:43:42 +0000
Message-Id: <20210316164355.150519-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' int=
o staging (2021-03-16 10:53:47 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/dep-many-pull-request=0D
=0D
for you to fetch changes up to 13bf1a48d1671e26ca2fa13817d388fbdc4215ff:=0D
=0D
  block: remove support for using "file" driver with block/char devices (20=
21-03-16 16:33:52 +0000)=0D
=0D
----------------------------------------------------------------=0D
Remove many old deprecated features=0D
=0D
The following features have been deprecated for well over the 2=0D
release cycle we promise=0D
=0D
  ``-drive file=3Djson:{...{'driver':'file'}}`` (since 3.0)=0D
  ``-vnc acl`` (since 4.0.0)=0D
  ``-mon ...,control=3Dreadline,pretty=3Don|off`` (since 4.1)=0D
  ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)=0D
  ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10=
.0)=0D
  ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)=
=0D
  ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0=
)=0D
  ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].s=
tatus (since 4.0)=0D
  ``query-cpus`` (since 2.12.0)=0D
  ``query-cpus-fast`` ``arch`` output member (since 3.0.0)=0D
  ``query-events`` (since 4.0)=0D
  chardev client socket with ``wait`` option (since 4.0)=0D
  ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`` =
(since 4.0.0)=0D
  ``ide-drive`` (since 4.2)=0D
  ``scsi-disk`` (since 4.2)=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (13):=0D
  ui, monitor: remove deprecated VNC ACL option and HMP commands=0D
  monitor: raise error when 'pretty' option is used with HMP=0D
  monitor: remove 'query-events' QMP command=0D
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
 block/dirty-bitmap.c                          |  38 --=0D
 block/file-posix.c                            |  17 +-=0D
 block/qapi.c                                  |   6 -=0D
 chardev/char-socket.c                         |  12 +-=0D
 docs/devel/migration.rst                      |   2 +-=0D
 docs/qdev-device-use.txt                      |   2 +-=0D
 docs/rdma.txt                                 |   2 +-=0D
 docs/system/deprecated.rst                    | 108 -----=0D
 docs/system/removed-features.rst              | 109 +++++=0D
 docs/xbzrle.txt                               |   5 -=0D
 hmp-commands-info.hx                          |  13 -=0D
 hmp-commands.hx                               | 121 ------=0D
 hw/core/machine-hmp-cmds.c                    |   8 +-=0D
 hw/core/machine-qmp-cmds.c                    | 120 ------=0D
 hw/i386/pc.c                                  |   2 -=0D
 hw/ide/qdev.c                                 |  38 --=0D
 hw/ppc/mac_newworld.c                         |  13 -=0D
 hw/ppc/mac_oldworld.c                         |  13 -=0D
 hw/scsi/scsi-disk.c                           |  62 ---=0D
 hw/sparc64/sun4u.c                            |  15 -=0D
 include/block/dirty-bitmap.h                  |   1 -=0D
 include/monitor/hmp.h                         |   4 -=0D
 migration/migration.c                         |  45 ---=0D
 migration/ram.c                               |   2 +-=0D
 monitor/hmp-cmds.c                            |  34 --=0D
 monitor/misc.c                                | 187 ---------=0D
 monitor/monitor.c                             |   4 +-=0D
 monitor/qmp-cmds-control.c                    |  24 --=0D
 qapi/block-core.json                          |  64 +--=0D
 qapi/control.json                             |  45 ---=0D
 qapi/machine.json                             | 181 +--------=0D
 qapi/migration.json                           |  98 -----=0D
 qemu-options.hx                               |   5 +-=0D
 scripts/device-crash-test                     |   2 -=0D
 softmmu/vl.c                                  |   1 -=0D
 tests/acceptance/pc_cpu_hotplug_props.py      |   2 +-=0D
 tests/acceptance/x86_cpu_model_versions.py    |   2 +-=0D
 tests/migration/guestperf/engine.py           |  18 +-=0D
 tests/qemu-iotests/051                        |   4 -=0D
 tests/qemu-iotests/051.pc.out                 |  20 -=0D
 tests/qemu-iotests/124                        |   4 -=0D
 tests/qemu-iotests/181                        |   2 +-=0D
 tests/qemu-iotests/184.out                    |   6 +-=0D
 tests/qemu-iotests/191.out                    |  48 +--=0D
 tests/qemu-iotests/194                        |   4 +-=0D
 tests/qemu-iotests/194.out                    |   4 +-=0D
 tests/qemu-iotests/226.out                    |  10 +-=0D
 tests/qemu-iotests/236                        |   2 +-=0D
 tests/qemu-iotests/236.out                    |  42 +-=0D
 tests/qemu-iotests/246                        |   3 +-=0D
 tests/qemu-iotests/246.out                    |  66 +--=0D
 tests/qemu-iotests/254                        |   2 +-=0D
 tests/qemu-iotests/254.out                    |   9 +-=0D
 tests/qemu-iotests/257.out                    | 378 ++++++------------=0D
 tests/qemu-iotests/260                        |   5 +-=0D
 tests/qemu-iotests/273.out                    |  15 +-=0D
 .../tests/migrate-bitmaps-postcopy-test       |   6 +-=0D
 tests/qtest/migration-test.c                  |  48 ---=0D
 tests/qtest/numa-test.c                       |   6 +-=0D
 tests/qtest/qmp-test.c                        |   6 +-=0D
 tests/qtest/test-hmp.c                        |   6 +-=0D
 tests/qtest/test-x86-cpuid-compat.c           |   4 +-=0D
 tests/qtest/vhost-user-test.c                 |   8 +-=0D
 ui/vnc.c                                      |  38 --=0D
 64 files changed, 370 insertions(+), 1801 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


