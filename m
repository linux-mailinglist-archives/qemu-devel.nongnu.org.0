Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5CA5B1A60
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:44:44 +0200 (CEST)
Received: from localhost ([::1]:55880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWF1X-00015X-Jr
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oWEzR-0005IZ-Gb
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:42:33 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <davydov-max@yandex-team.ru>)
 id 1oWEzP-0005HT-3Z
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:42:32 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id A23FA2E2E99;
 Thu,  8 Sep 2022 13:37:12 +0300 (MSK)
Received: from davydov-max-nux.yandex.net (unknown
 [2a02:6b8:0:107:fa75:a4ff:fe7d:8480])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 U3HXU6koyH-bAPSQBqL; Thu, 08 Sep 2022 13:37:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662633431; bh=Cg5Q+9XvviatG18UMEGtYpXPFiJgmMul7XSbMeCTzBg=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=mjBnQb3/Bin71xbSfPrN5cSXSizvhYPcmfVHybaIBZzcUv30hIBn7X+R3T/OjfGGr
 pgt4Crh5E36/NLoQ5k3Z67qGIUR4bwF9nZZ6THJ/Xo8RbL668WDEp/ZV0uJfDKJYnu
 wVLaYPpvp1Xyc2CnMIP481DPz4DhUQaYhfQpKZi4=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Maksim Davydov <davydov-max@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: davydov-max@yandex-team.ru, yc-core@yandex-team.ru, pbonzini@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu,
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com,
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, lvivier@redhat.com,
 jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Subject: [PATCH 0/4] compare machine type compat_props 
Date: Thu,  8 Sep 2022 13:36:46 +0300
Message-Id: <20220908103650.9518-1-davydov-max@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=davydov-max@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This script is necessary to choose the best machine type in the
appropriate cases. Also we have to check compat_props of the old MT 
after changes to be sure that they haven't broken old the MT. For 
example, pc_compat_3_1 of pc-q35-3.1 has Icelake-Client which was
removed in March.

changes:
* new default value print concept
* QEMU python library is used to collect qmp data
* remove auxiliary patches (that was used to fix ->get sematics)
* print compat_props in the correct order
* delete `absract` field to reduce output JSON size

Maksim Davydov (4):
  qom: add devault value
  qmp: add dump machine type compatible properties
  python/qmp: increase read buffer size
  scripts: add script to compare compatible properties

 hw/core/machine-qmp-cmds.c    |  22 +-
 python/qemu/qmp/qmp_client.py |   4 +-
 qapi/machine.json             |  54 ++++-
 qom/qom-qmp-cmds.c            |   2 +
 scripts/compare_mt.py         | 370 ++++++++++++++++++++++++++++++++++
 tests/qtest/fuzz/qos_fuzz.c   |   2 +-
 6 files changed, 448 insertions(+), 6 deletions(-)
 create mode 100755 scripts/compare_mt.py

-- 
2.25.1


