Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E573943DAC8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 07:34:26 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfy3W-0004GQ-3B
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 01:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfxzJ-0007Dc-D7
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 01:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mfxzH-0000vF-Qf
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 01:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635399003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UcIpgHEB+WhqPuxfQCfMatlhjt+l46QPfZ3Sa0HCsOE=;
 b=fWKHjJ8yJGbCtlIduIVV2wBqa3cXdDxW5XOJ9B/dtLy5QfE8Z0IOod6tXRQMZKknTYR9Tp
 kQEGVXDn+HM/U40gGd2qkgyqmLNeZkKmKbDvLB81k9FaVfZDpNzT+Gy6CQdmLwcVIGIXN3
 U3oe7VtCcxnEE0boS5+Wq7eLFStWq8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-II_-Q2zLO2SZqiASIIUdCg-1; Thu, 28 Oct 2021 01:29:58 -0400
X-MC-Unique: II_-Q2zLO2SZqiASIIUdCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18B521006AA2;
 Thu, 28 Oct 2021 05:29:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF6C65FC13;
 Thu, 28 Oct 2021 05:29:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 90C3F11380A7; Thu, 28 Oct 2021 07:29:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Monitor patches patches for 2021-10-28
Date: Thu, 28 Oct 2021 07:29:51 +0200
Message-Id: <20211028052955.454209-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-monitor-2021-10-28

for you to fetch changes up to 47c849357b57c1fbd3d3355c586c4784c6f4188e:

  qapi/monitor: only allow 'keep' SetPasswordAction for VNC and deprecate (2021-10-28 06:25:08 +0200)

----------------------------------------------------------------
Monitor patches patches for 2021-10-28

----------------------------------------------------------------
Stefan Reiter (4):
      monitor/hmp: add support for flag argument with value
      qapi/monitor: refactor set/expire_password with enums
      qapi/monitor: allow VNC display id in set/expire_password
      qapi/monitor: only allow 'keep' SetPasswordAction for VNC and deprecate

 docs/about/deprecated.rst  |   6 ++
 qapi/ui.json               | 156 +++++++++++++++++++++++++++++++++++++++------
 monitor/monitor-internal.h |   3 +-
 monitor/hmp-cmds.c         |  48 +++++++++++++-
 monitor/hmp.c              |  19 +++++-
 monitor/qmp-cmds.c         |  54 ++++------------
 hmp-commands.hx            |  24 +++----
 7 files changed, 236 insertions(+), 74 deletions(-)

-- 
2.31.1


