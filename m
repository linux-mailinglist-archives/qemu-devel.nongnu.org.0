Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F09CE4421D6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:44:56 +0100 (CET)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mheAp-0003ws-7D
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mhdUm-0005SX-5W
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:01:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mhdUh-0002H6-OS
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635796881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZkUvYDbTEKsXfnVFKAKKXuZ38CoS4kWyIEXnRtwugWU=;
 b=Aa9LE5KSy6WK9t5FnShHPrXICjx8qWsW/mF38Rb8A9R3RR5wCm6OUsJnwgKue09GyEpIxY
 1aAYXxTAmRj6i0Oy+nwj5cFWFqeIkpsQQGIYk2IbbtVkGhns43QO43ihvOEBIPiofQ3rjN
 dIi+HyGx1shWmkaSEYfanmYsFZVv8KI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-UOUAWu1aNhebhZCLsm5SCQ-1; Mon, 01 Nov 2021 16:01:18 -0400
X-MC-Unique: UOUAWu1aNhebhZCLsm5SCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1BCC1B18BC2;
 Mon,  1 Nov 2021 20:01:16 +0000 (UTC)
Received: from [172.30.41.16] (ovpn-113-78.phx2.redhat.com [10.3.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABFA45D9DC;
 Mon,  1 Nov 2021 20:01:11 +0000 (UTC)
Subject: [PULL 0/2] VFIO update 2021-11-01 (for v6.2)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 01 Nov 2021 14:01:11 -0600
Message-ID: <163579674962.3486201.2525541279968158386.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.williamson@redhat.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 Nianyao Tang <tangnianyao@huawei.com>, Qixin Gan <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:

  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)

are available in the Git repository at:

  git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20211101.0

for you to fetch changes up to e4b34708388b20f1ceb55f1d563d8da925a32424:

  vfio/common: Add a trace point when a MMIO RAM section cannot be mapped (2021-11-01 12:17:51 -0600)

----------------------------------------------------------------
VFIO update 2021-11-01

 * Re-enable expanded sub-page BAR mappings after migration (Kunkun Jiang)

 * Trace dropped listener sections due to page alignment (Kunkun Jiang)

----------------------------------------------------------------
Kunkun Jiang (2):
      vfio/pci: Add support for mmapping sub-page MMIO BARs after live migration
      vfio/common: Add a trace point when a MMIO RAM section cannot be mapped

 hw/vfio/common.c |  7 +++++++
 hw/vfio/pci.c    | 19 ++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)


