Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E664E683E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:00:02 +0100 (CET)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRkf-0008MT-Ah
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:00:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcW-0002Vs-D1
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcU-0006YI-61
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648144293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SlW70ZOXtPHPbTL7NM+plL1aLUDYXDvw1ntyMzuFqoc=;
 b=FJuW4/ZcIHfUBZ8310NpMEGpIm7x0pJc96YZ6YZe6pQ8B7gfQsPAZ2QNVCaoz+Y4HsfKJ5
 bRiYooFfpjvVOO83GXUW/o0CZya5Jwi7J3IenpiS64w/GrYpnRt9Soc1WkEa/yic+7tX+I
 HnFnAMfisz18Bilfs/aMrXTtGGFvdBQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-ndk3vCCDNpCCCh1KkEvPIQ-1; Thu, 24 Mar 2022 13:50:17 -0400
X-MC-Unique: ndk3vCCDNpCCCh1KkEvPIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F81C811E75
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 17:50:17 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.195.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649B4417E40;
 Thu, 24 Mar 2022 17:50:16 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] Fix some qapi examples and a TODO section
Date: Thu, 24 Mar 2022 18:50:01 +0100
Message-Id: <20220324175015.232794-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I've being using the examples as unit tests and found a few that
doesn't work out-of-the-box, might be inteded in order to be less
verbose in the qapi documentation but nevertheless I'm sending this
out in case you want to cherry-pick them.

Cheers,

Victor Toso (14):
  qapi: BlockExportRemoveMode: move comments to TODO
  qapi: fix example of BLOCK_IMAGE_CORRUPTED event
  qapi: fix example of BLOCK_IO_ERROR event
  qapi: fix example of BLOCK_JOB_PENDING event
  qapi: fix example of DUMP_COMPLETED event
  qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event
  qapi: fix example of UNPLUG_PRIMARY event
  qapi: fix example of FAILOVER_NEGOTIATED event
  qapi: run-state examples: add missing member
  qapi: run-state examples: add missing timestamp
  qapi: fix example of MEMORY_FAILURE
  qapi: ui examples: add missing websocket member
  qapi: fix example of ACPI_DEVICE_OST event
  qapi: fix example of dump-guest-memory

 qapi/acpi.json         |  5 +++--
 qapi/block-core.json   |  9 +++++----
 qapi/block-export.json | 10 +++++-----
 qapi/dump.json         |  9 +++++----
 qapi/machine.json      |  3 ++-
 qapi/migration.json    |  4 +++-
 qapi/net.json          |  3 ++-
 qapi/run-state.json    | 16 +++++++++++-----
 qapi/ui.json           | 12 ++++++------
 9 files changed, 42 insertions(+), 29 deletions(-)

-- 
2.35.1


