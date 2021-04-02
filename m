Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E970635274F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:17:29 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSEzg-0004eM-Iz
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSExq-00032C-Ry
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSExl-0003qH-MF
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617351327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PBftpiYH8SHKOGgvX/yqGDHdu8LhOV+69v5vjH4Qi3I=;
 b=S/2gG9UzCNVazt0iJDcMlr7WqbjtJlOP7yngGvzEh+pIetQNjEsXgWmAN6l7jM3b1eNM4L
 1sDFNNdfYvKD0FNjcppcyYzo5Efosn4SziVh+zc2jpHcbL0EaAYlarCHhSNcga2zaDQK3c
 lSi+jxq7V45YIFpi7yUNRswt1vwkaUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-v38zgvOfOHW5yS0ZIynhAA-1; Fri, 02 Apr 2021 04:15:26 -0400
X-MC-Unique: v38zgvOfOHW5yS0ZIynhAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5E326B9C3;
 Fri,  2 Apr 2021 08:15:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-26.pek2.redhat.com [10.72.12.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B3846267F;
 Fri,  2 Apr 2021 08:15:22 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	lekiravi@yandex-team.ru
Subject: [PATCH 0/5] Revert query-netdev command for 6.0
Date: Fri,  2 Apr 2021 16:15:14 +0800
Message-Id: <20210402081519.78878-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Hi All:

Several issues has been reported for query-netdev command:

- coverity warnings of memory leak and cut-and-paste issue
- lacking of documentation for future new netdev development

Consider it's late in the rc, I would like to revert this series and
let's retry for 6.1.

Thanks

Jason Wang (5):
  Revert "net: Do not fill legacy info_str for backends"
  Revert "hmp: Use QAPI NetdevInfo in hmp_info_network"
  Revert "net: Move NetClientState.info_str to dynamic allocations"
  Revert "tests: Add tests for query-netdev command"
  Revert "qapi: net: Add query-netdev command"

 hw/net/xen_nic.c                  |   5 +-
 include/net/net.h                 |   5 +-
 include/qapi/hmp-output-visitor.h |  30 -----
 net/l2tpv3.c                      |   8 +-
 net/net.c                         |  73 ++---------
 net/netmap.c                      |   7 --
 net/slirp.c                       | 124 +------------------
 net/socket.c                      |  92 ++++----------
 net/tap-win32.c                   |  10 +-
 net/tap.c                         | 107 ++---------------
 net/vde.c                         |  25 +---
 net/vhost-user.c                  |  20 +---
 net/vhost-vdpa.c                  |  15 +--
 qapi/hmp-output-visitor.c         | 193 ------------------------------
 qapi/meson.build                  |   1 -
 qapi/net.json                     |  80 -------------
 tests/qtest/meson.build           |   3 -
 tests/qtest/test-query-netdev.c   | 120 -------------------
 18 files changed, 62 insertions(+), 856 deletions(-)
 delete mode 100644 include/qapi/hmp-output-visitor.h
 delete mode 100644 qapi/hmp-output-visitor.c
 delete mode 100644 tests/qtest/test-query-netdev.c

-- 
2.24.3 (Apple Git-128)


