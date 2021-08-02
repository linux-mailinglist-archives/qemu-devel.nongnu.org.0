Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B943DCFC1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 06:35:32 +0200 (CEST)
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAPfn-0006PT-Qy
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 00:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeK-0004H1-CD
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeE-0007vY-Bn
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627878832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ILZTVX0y5R9DnvRqYBQJACM95PbSXijtv+9qOSdP6rU=;
 b=M7t/jxwV18TORV1k5qV3mptum4JYGI1JfWtjQBx0DvaZ6NSU6dJLspanIoa5aWRjZOqzEM
 VrE+dEPWWHdwLQ+YR5fdzrgyyuetm1mkGWxByYAQkp3hpYwOSsHqJSXEj7pO+vmBzrxCdB
 aMzBOXxQtsQzoBrcmKpr9qVngKnW1qE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-JkZkJvaQOeibFURoJPCOnQ-1; Mon, 02 Aug 2021 00:33:49 -0400
X-MC-Unique: JkZkJvaQOeibFURoJPCOnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E94C760C0;
 Mon,  2 Aug 2021 04:33:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-135.pek2.redhat.com
 [10.72.12.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6EC46A904;
 Mon,  2 Aug 2021 04:33:46 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/5] Net patches
Date: Mon,  2 Aug 2021 12:33:39 +0800
Message-Id: <20210802043344.44301-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0c633cf0c221922a0a9f9d0b8866cbb111f5e192:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210730' into staging (2021-07-31 21:29:57 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to cfe6d6841ff46b43ec38792422f690813f4ce3bf:

  hw/net: e1000e: Don't zero out the VLAN tag in the legacy RX descriptor (2021-08-02 12:19:18 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Christina Wang (3):
      hw/net: e1000: Correct the initial value of VET register
      hw/net: e1000e: Correct the initial value of VET register
      hw/net: e1000e: Don't zero out the VLAN tag in the legacy RX descriptor

Pavel Pisa (1):
      hw/net/can: sja1000 fix buff2frame_bas and buff2frame_pel when dlc is out of std CAN 8 bytes

Thomas Huth (1):
      hw/net/vmxnet3: Do not abort QEMU if guest specified bad queue numbers

 hw/core/machine.c        |  2 ++
 hw/net/can/can_sja1000.c |  8 ++++++++
 hw/net/e1000.c           | 17 +++++++++++++++++
 hw/net/e1000e.c          |  8 +++++++-
 hw/net/e1000e_core.c     | 10 ++++------
 hw/net/vmxnet3.c         | 34 ++++++++++++++++++++++------------
 6 files changed, 60 insertions(+), 19 deletions(-)



