Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE1C343DA8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:21:58 +0100 (CET)
Received: from localhost ([::1]:54194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHh7-0003A0-H4
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHU4-0007z9-JJ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lOHU0-0002nb-Cg
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616407700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LkflHFAdlqyZLzzrV9qP3OpnleMvpgL81cPy7xUqmwA=;
 b=ZJXj+kyDoD0bMY35uH/G3tEtXLYUyBFyNnbNg5QC0mHW4Mbo+YYVcUxZFKtiHacykLjke7
 qB4HKmmGZWE3tzNtGglZjFDIsoF9JZaBH7iRLXsRgw2r5ciWTLdq+DhYbBn+anyevDrGP5
 YjhCtRWkpyXbkow8vlVYRx6q+zx4EF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-9Av-_QtfMcKOhVoD300b8w-1; Mon, 22 Mar 2021 06:08:17 -0400
X-MC-Unique: 9Av-_QtfMcKOhVoD300b8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58F651084C95;
 Mon, 22 Mar 2021 10:08:16 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-83.pek2.redhat.com
 [10.72.12.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1DD45D9CD;
 Mon, 22 Mar 2021 10:08:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 00/13] Net patches
Date: Mon, 22 Mar 2021 18:07:59 +0800
Message-Id: <1616407692-693-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The following changes since commit bdee969c0e65d4d509932b1d70e3a3b2ffbff6d5:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-19 18:01:17 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to c7274b5ef43614dd133daec1e2018f71d8744088:

  net/eth: Add an assert() and invert if() statement to simplify code (2021-03-22 17:34:31 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Bin Meng (4):
      net: eth: Add a helper to pad a short Ethernet frame
      net: Add a 'do_not_pad" to NetClientState
      net: Pad short frames to minimum size before sending from SLiRP/TAP
      hw/net: virtio-net: Initialize nc->do_not_pad to true

Lukas Straub (2):
      net/colo-compare.c: Fix memory leak for non-tcp packet
      net/colo-compare.c: Optimize removal of secondary packet

Philippe Mathieu-Daudé (7):
      net/eth: Use correct in6_address offset in _eth_get_rss_ex_dst_addr()
      net/eth: Simplify _eth_get_rss_ex_dst_addr()
      net/eth: Better describe _eth_get_rss_ex_dst_addr's offset argument
      net/eth: Check size earlier in _eth_get_rss_ex_dst_addr()
      net/eth: Check iovec has enough data earlier
      net/eth: Read ip6_ext_hdr_routing buffer before accessing it
      net/eth: Add an assert() and invert if() statement to simplify code

 MAINTAINERS                    |  1 +
 hw/net/virtio-net.c            |  4 +++
 include/net/eth.h              | 17 ++++++++++++
 include/net/net.h              |  1 +
 net/colo-compare.c             |  3 ++-
 net/eth.c                      | 61 +++++++++++++++++++++++++++---------------
 net/slirp.c                    | 10 +++++++
 net/tap-win32.c                | 10 +++++++
 net/tap.c                      | 10 +++++++
 tests/qtest/fuzz-e1000e-test.c | 53 ++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |  1 +
 11 files changed, 148 insertions(+), 23 deletions(-)
 create mode 100644 tests/qtest/fuzz-e1000e-test.c


