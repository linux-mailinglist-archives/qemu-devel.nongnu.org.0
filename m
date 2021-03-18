Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9CA340213
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:30:35 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMozC-0005Wu-7U
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMoun-0002Uh-60
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMouY-0000lA-EY
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=loGkdlcGDkhHC2KC0+UUYaXoTUJ20yZIbB4HBU3Kk8A=;
 b=RLdxdP2Bcm9mXX8aLH41njNWT4ki+Cjgy5MBrQr2N23IcMBp4Bo8nt+zmNZs7c/2l2Hrli
 mabGVIBzWEBjMTijLkHTOMlJDiSuDjN+cq+vLfjjkJeZ7uDTzsvRhHglhvp5P8yKnERcEo
 9ioqAwS6a1Wr0c61Yzu5ehpZJW2jV1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-OpwXA8a6MAqSlHCyIENZlA-1; Thu, 18 Mar 2021 05:25:42 -0400
X-MC-Unique: OpwXA8a6MAqSlHCyIENZlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A50D61034B20;
 Thu, 18 Mar 2021 09:25:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-61.ams2.redhat.com
 [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56C4862951;
 Thu, 18 Mar 2021 09:25:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/13] misc patches removing deprecated features
Date: Thu, 18 Mar 2021 09:24:59 +0000
Message-Id: <20210318092512.250725-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

The following changes since commit 571d413b5da6bc6f1c2aaca8484717642255ddb0=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-2021031=
6' into staging (2021-03-17 21:02:37 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/dep-many-pull-request=0D
=0D
for you to fetch changes up to 8d17adf34f501ded65a106572740760f0a75577c:=0D
=0D
  block: remove support for using "file" driver with block/char devices (20=
21-03-18 09:22:55 +0000)=0D
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
 docs/system/removed-features.rst              | 108 +++++=0D
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
 64 files changed, 369 insertions(+), 1801 deletions(-)=0D
=0D
--=20=0D
2.30.2=0D
=0D


