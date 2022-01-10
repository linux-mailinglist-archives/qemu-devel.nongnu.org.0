Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF9488EF8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 04:43:02 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6laG-0000aL-OO
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 22:43:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n6lXk-0006BL-6U
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 22:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n6lXd-00067S-LT
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 22:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641786015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dWJSn404cLcaYmgUyAMnmgEnLsAosW5kUKYfRj9VmYA=;
 b=CpaRydCehktC1W3haHo1utK178pzKDS3DX6B5D0cV5NKnXsvIyMDSC6+ZsMUF7NgfxF2qW
 Aa3BsCuE65SV/tyqkndIUuRDQAFvkbRmKfDnSU/NTDkA4sm77jBKweHyLFFLL0B/TWqlyx
 9Z0cytDsx+4R3QLMWQa0QN7ShQ6MAEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-0_r51j_kPRONKhquinnjGA-1; Sun, 09 Jan 2022 22:40:09 -0500
X-MC-Unique: 0_r51j_kPRONKhquinnjGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 924CC802C87;
 Mon, 10 Jan 2022 03:40:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-6.pek2.redhat.com [10.72.14.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A72BCE72B;
 Mon, 10 Jan 2022 03:40:03 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 00/13] Net patches
Date: Mon, 10 Jan 2022 11:39:47 +0800
Message-Id: <20220110034000.20221-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit df722e33d5da26ea8604500ca8f509245a0ea524:

  Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 5136cc6d3b8b74f4fa572f0874656947a401330e:

  net/vmnet: update MAINTAINERS list (2022-01-10 11:30:55 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Peter Foley (2):
      net/tap: Set return code on failure
      net: Fix uninitialized data usage

Philippe Mathieu-Daudé (1):
      hw/net/vmxnet3: Log guest-triggerable errors using LOG_GUEST_ERROR

Rao Lei (1):
      net/filter: Optimize filter_send to coroutine

Vladislav Yaroshchuk (7):
      net/vmnet: add vmnet dependency and customizable option
      net/vmnet: add vmnet backends to qapi/net
      net/vmnet: implement shared mode (vmnet-shared)
      net/vmnet: implement host mode (vmnet-host)
      net/vmnet: implement bridged mode (vmnet-bridged)
      net/vmnet: update qemu-options.hx
      net/vmnet: update MAINTAINERS list

Zhang Chen (2):
      net/colo-compare.c: Optimize compare order for performance
      net/colo-compare.c: Update the default value comments

 MAINTAINERS                   |   5 +
 hw/net/vmxnet3.c              |   4 +-
 meson.build                   |   4 +
 meson_options.txt             |   2 +
 net/clients.h                 |  11 ++
 net/colo-compare.c            |  28 ++--
 net/filter-mirror.c           |  66 +++++++--
 net/meson.build               |   7 +
 net/net.c                     |  10 ++
 net/tap-linux.c               |   1 +
 net/tap.c                     |   1 +
 net/vmnet-bridged.m           | 111 ++++++++++++++
 net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 105 ++++++++++++++
 net/vmnet-shared.c            |  91 ++++++++++++
 net/vmnet_int.h               |  48 ++++++
 qapi/net.json                 | 132 ++++++++++++++++-
 qemu-options.hx               |  25 ++++
 scripts/meson-buildoptions.sh |   3 +
 19 files changed, 954 insertions(+), 30 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h



