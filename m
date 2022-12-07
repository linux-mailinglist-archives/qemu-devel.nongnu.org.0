Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9F2646103
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 19:30:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2zAU-0001Iv-4o; Wed, 07 Dec 2022 13:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1p2zAM-0001Id-1N
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:29:10 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1p2zAK-00035r-Bp
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:29:09 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 0871D5EB32;
 Wed,  7 Dec 2022 21:28:54 +0300 (MSK)
Received: from davydov-max-nux.yandex-team.ru (unknown
 [2a02:6b8:b081:a431::1:16])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PSdNg80Q5iE1-ZpRTxBXO; Wed, 07 Dec 2022 21:28:53 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1670437733; bh=WP3HWogVJ0CGPEzreQBqe0XzIiplQHZ0JhW3FYREdmQ=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=QhtwbTBhWjL7UjCReNtRdGH4jHqV9meHKZAOQ3zyIaMQF66fb5eRprRcCH0vUNcIp
 BvtVMSr+MMP3owcO5pOQVTjQqaF0v4TlUTbh6WgBlf0pcpEmXoUYEaThMGaGP5fbEn
 L2EmXnp7ZpzAlnBllwoeI/PJAbuukNZ1dowdINBA=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: davydov-max@yandex-team.ru, yc-core@yandex-team.ru,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, jsnow@redhat.com,
 crosa@redhat.com, bleal@redhat.com, eblake@redhat.com, armbru@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, lvivier@redhat.com
Subject: [PATCH v4 0/4] compare machine type compat_props
Date: Wed,  7 Dec 2022 21:28:21 +0300
Message-Id: <20221207182825.84380-1-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This script is necessary to choose the best machine type in the
appropriate cases. Also we have to check compat_props of the old MT
after changes to be sure that they haven't broken old the MT. For
example, pc_compat_3_1 of pc-q35-3.1 has Icelake-Client which was
removed in March.

v4 -> v3:
* increase read buffer limit to limit value in libvirt
* add caching of qmp requests to speed up the script 

v3 -> v2:
* simplify adding new methods for getting QEMU default values
* add typing
* change concept from fixed dictionaries to classes

v2 -> v1:
* fix script code style and descriptions
* reorder patches
 
v1 -> previous iteration:
* new default value print concept
* QEMU python library is used to collect qmp data
* remove auxiliary patches (that was used to fix `->get` sematics)
* print compat_props in the correct order
* delete `absract` field to reduce output JSON size


Maksim Davydov (4):
  qom: add default value
  python/qmp: increase read buffer size
  qmp: add dump machine type compatible properties
  scripts: add script to compare compatible properties

 hw/core/machine-qmp-cmds.c    |  22 +-
 python/qemu/qmp/qmp_client.py |   4 +-
 qapi/machine.json             |  54 +++-
 qom/qom-qmp-cmds.c            |   2 +
 scripts/compare_mt.py         | 506 ++++++++++++++++++++++++++++++++++
 tests/qtest/fuzz/qos_fuzz.c   |   2 +-
 6 files changed, 584 insertions(+), 6 deletions(-)
 create mode 100755 scripts/compare_mt.py

-- 
2.25.1


