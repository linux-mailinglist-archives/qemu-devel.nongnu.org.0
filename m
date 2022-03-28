Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54114E9943
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:21:22 +0200 (CEST)
Received: from localhost ([::1]:33736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYqFF-0007pC-Mi
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:21:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0b-0006ET-Ew
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nYq0Z-0005GK-An
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q7myPQtMJ8Zkco9nF/bI4snnp/0XHmUckr/g7LCSwuI=;
 b=P3u6efZVbMTM+9+JqdA/Y1IEMuNiGbImDJdtpVKWPbePdF69TNjvKUS5CpPYGznRJ/9GmX
 oSLcjKYZ1YEHw+ENldKFhdgc9yJUFaUWS+fryQc/oWXS/pZm30LNiaWU36+tJbp7WlWpn/
 3LsXzDW6Ujcwiinh7+CgLs5yWOeZXXo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-A2cWCUKmMA-aw_5gmISDZQ-1; Mon, 28 Mar 2022 10:06:07 -0400
X-MC-Unique: A2cWCUKmMA-aw_5gmISDZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B6473803509
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:06:07 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58CFC140265C;
 Mon, 28 Mar 2022 14:06:06 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/14] Fix some qapi examples and a TODO section
Date: Mon, 28 Mar 2022 16:05:50 +0200
Message-Id: <20220328140604.41484-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

* Changes in v3:
Improved commit log from patch 03 to 14 with suggetions based on:
    https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg06490.html

* Changes in v2:
02/14: qapi: fix example of BLOCK_IMAGE_CORRUPTED event
    - changed the example to an actual error picked from
      qemu-iotests/60.out
    - added recent timestamp :)
03/14: qapi: fix example of BLOCK_IO_ERROR event
    - use real error message, in this case "No space left on device"
04/14: qapi: fix example of BLOCK_JOB_PENDING event
    - added an extra space
    - added recent timestamp
07/14: qapi: fix example of UNPLUG_PRIMARY event
    - amended commit message
08/14: qapi: fix example of FAILOVER_NEGOTIATED event
    - fixed syntax for proper document parameter
09/14: qapi: run-state examples: add missing member
    - fixed commit message
10/14: qapi: run-state examples: add missing timestamp
    - added chronological timestamps ;)

Cheers,
Victor

Victor Toso (14):
  qapi: BlockExportRemoveMode: move comments to TODO
  qapi: fix example of BLOCK_IMAGE_CORRUPTED event
  qapi: fix example of BLOCK_IO_ERROR event
  qapi: fix example of BLOCK_JOB_PENDING event
  qapi: fix example of DUMP_COMPLETED event
  qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event
  qapi: fix example of UNPLUG_PRIMARY event
  qapi: fix example of FAILOVER_NEGOTIATED event
  qapi: fix examples: SHUTDOWN and RESET events
  qapi: run-state examples: add missing @timestamp
  qapi: fix example of MEMORY_FAILURE
  qapi: ui examples: add missing @websocket member
  qapi: fix example of ACPI_DEVICE_OST event
  qapi: fix example of dump-guest-memory

 qapi/acpi.json         |  5 +++--
 qapi/block-core.json   | 14 +++++++-------
 qapi/block-export.json | 10 +++++-----
 qapi/dump.json         |  9 +++++----
 qapi/machine.json      |  3 ++-
 qapi/migration.json    |  4 +++-
 qapi/net.json          |  6 ++++--
 qapi/run-state.json    | 16 +++++++++++-----
 qapi/ui.json           | 12 ++++++------
 9 files changed, 46 insertions(+), 33 deletions(-)

-- 
2.35.1


