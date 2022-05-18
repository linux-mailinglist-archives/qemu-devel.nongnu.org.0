Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089652B0AB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 05:16:08 +0200 (CEST)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrAAR-0001li-Dx
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 23:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nrA6r-0006iA-OZ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nrA6o-0004md-Kr
 for qemu-devel@nongnu.org; Tue, 17 May 2022 23:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652843540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IO9KZQbjc3S2J2cgY3f2cajincj8QRydDkaPGXivY7g=;
 b=aYAKCiD3EFKBXUaUt+PplqodsBAmcp+fvAR/kXe2CSB+r9wNymj7PjuYzPDylMPAtdJil6
 XoYTTw7V3X0LFP9uv3GZiLGpK9BjzsIuGtr4khq8oxBxGIAiOJcgFNahKNVh0LFXeVadSp
 QcwF7hxG/xpKLiH9hUXDJluASWjCR6M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-_XoZT093NXS55Ixz_sganA-1; Tue, 17 May 2022 23:12:19 -0400
X-MC-Unique: _XoZT093NXS55Ixz_sganA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70DE81D96CA4;
 Wed, 18 May 2022 03:12:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-27.pek2.redhat.com [10.72.14.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4F35400E114;
 Wed, 18 May 2022 03:12:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/8] Net patches
Date: Wed, 18 May 2022 11:12:06 +0800
Message-Id: <20220518031214.93760-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:

  Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-05-16 16:31:01 -0700)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 052c2579b89b0d87debe8b05594b5180f0fde87d:

  tulip: Assign default MAC address if not specified (2022-05-17 16:48:23 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Helge Deller (1):
      tulip: Assign default MAC address if not specified

Vladislav Yaroshchuk (7):
      net/vmnet: add vmnet dependency and customizable option
      net/vmnet: add vmnet backends to qapi/net
      net/vmnet: implement shared mode (vmnet-shared)
      net/vmnet: implement host mode (vmnet-host)
      net/vmnet: implement bridged mode (vmnet-bridged)
      net/vmnet: update qemu-options.hx
      net/vmnet: update hmp-commands.hx

 hmp-commands.hx               |   6 +-
 hw/net/tulip.c                |   4 +-
 meson.build                   |  16 +-
 meson_options.txt             |   2 +
 net/clients.h                 |  11 ++
 net/meson.build               |   7 +
 net/net.c                     |  10 ++
 net/vmnet-bridged.m           | 152 +++++++++++++++++
 net/vmnet-common.m            | 378 ++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 128 ++++++++++++++
 net/vmnet-shared.c            | 114 +++++++++++++
 net/vmnet_int.h               |  63 +++++++
 qapi/net.json                 | 133 ++++++++++++++-
 qemu-options.hx               |  25 +++
 scripts/meson-buildoptions.sh |   1 +
 15 files changed, 1044 insertions(+), 6 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h




