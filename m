Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584F3A3B93
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:02:39 +0200 (CEST)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lraFZ-00067t-Ht
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDe-0003Nr-OQ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDa-0001xB-Jn
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623391232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pr/LFId9srK7vFXMXfCH+ZX9znHE3qirTw+mdJxVmiE=;
 b=NF6jrXokYnjtvgHZemE+I9cjZnpqC3vCRUWANc3luAb6meLMCzkwZ5aciPAbWxJSiKN3/4
 sEwD0X64FcKbnR1JHfIjz7HcQUshV7UwYebCox5hAta0SSR1n3ZOxyXMgnlkUw8+ikxPnS
 6oQUTKjhDJNNU7Gl2Ee56BhiQXxdZWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-cjeX1TZdMTOMFlgwXxsL2A-1; Fri, 11 Jun 2021 02:00:29 -0400
X-MC-Unique: cjeX1TZdMTOMFlgwXxsL2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D7611922965;
 Fri, 11 Jun 2021 06:00:28 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-78.pek2.redhat.com [10.72.13.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D0D660C16;
 Fri, 11 Jun 2021 06:00:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 00/12] Net patches
Date: Fri, 11 Jun 2021 14:00:12 +0800
Message-Id: <20210611060024.46763-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 7fe7fae8b48e3f9c647fd685e5155ebc8e6fb84d:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20210609a' into staging (2021-06-09 16:40:21 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 5a2d9929ac1f01a1e8ef2a3f56f69e6069863dad:

  Fixed calculation error of pkt->header_size in fill_pkt_tcp_info() (2021-06-11 10:30:13 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Jason Wang (4):
      vhost-vdpa: skip ram device from the IOTLB mapping
      vhost-vdpa: map virtqueue notification area if possible
      vhost-vdpa: don't initialize backend_features
      vhost-vdpa: remove the unused vhost_vdpa_get_acked_features()

Paolo Bonzini (1):
      netdev: add more commands to preconfig mode

Rao, Lei (7):
      Remove some duplicate trace code.
      Fix the qemu crash when guest shutdown during checkpoint
      Optimize the function of filter_send
      Remove migrate_set_block_enabled in checkpoint
      Add a function named packet_new_nocopy for COLO.
      Add the function of colo_compare_cleanup
      Fixed calculation error of pkt->header_size in fill_pkt_tcp_info()

 hmp-commands.hx                |   2 +
 hw/virtio/vhost-vdpa.c         | 100 +++++++++++++++++++++++++++++++++++------
 include/hw/virtio/vhost-vdpa.h |   6 +++
 include/net/vhost-vdpa.h       |   1 -
 migration/colo.c               |   6 ---
 migration/migration.c          |   4 ++
 net/colo-compare.c             |  25 +++++------
 net/colo-compare.h             |   1 +
 net/colo.c                     |  25 +++++++----
 net/colo.h                     |   1 +
 net/filter-mirror.c            |   8 ++--
 net/filter-rewriter.c          |   3 +-
 net/net.c                      |   4 ++
 net/vhost-vdpa.c               |   9 ----
 qapi/net.json                  |   6 ++-
 softmmu/runstate.c             |   1 +
 16 files changed, 143 insertions(+), 59 deletions(-)




