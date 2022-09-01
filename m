Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EF15A9306
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:21:35 +0200 (CEST)
Received: from localhost ([::1]:40600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgOD-00025W-Qr
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2D-0008KB-S0
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:58:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg29-0004tm-Oi
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662022724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yyjdDA/KFko2Vh6Hikzmmlyz71RdEIzcEMokUGa0+sU=;
 b=Tn1MGQJp34sUS5vvb+eLQCSTNaLzMXpfpUOk47v9c0OsgNYhDNfSw/AUqYzYI+azH1sth2
 SRKrzndzfcIPWCoLMMLKIDGKv54EF8Jp4YAAnY1kYibqzDVmceHgPvAvXPmllYgtZ1eu98
 fb+OqSX9iyBc3qdVhQwUGoflUqpcuos=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-OlGa4rEGMJC4P9hDMYGrQg-1; Thu, 01 Sep 2022 04:58:43 -0400
X-MC-Unique: OlGa4rEGMJC4P9hDMYGrQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 160358037AE;
 Thu,  1 Sep 2022 08:58:43 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B86DE2026D4C;
 Thu,  1 Sep 2022 08:58:41 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 00/10] qapi examples fixes, simplified version
Date: Thu,  1 Sep 2022 10:58:30 +0200
Message-Id: <20220901085840.22520-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Hi,

This is the follow up from v1. I've dropped a few patches that need
further discussion. I plan to revisit those when submiting the generator
again at a later time.

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg04525.html

Changes in v2:
 * Dropped "qapi: fix example of blockdev-add command". It was wrong.
 * Dropped patches with too long examples as we might want to cut them
   short. I've also dropped the patches that fixes examples with
   comments on them as we might want to have a way to do that.
 * Fixed style in:
  - qapi: fix example of NIC_RX_FILTER_CHANGED event
  - qapi: fix example of query-dump-guest-memory-capability command
 * Dropped the generator (rfc) as I'll submit it again later, improved.

Cheers,
Victor

Victor Toso (10):
  qapi: fix example of query-ballon command
  qapi: fix example of query-vnc command
  qapi: fix example of query-dump-guest-memory-capability command
  qapi: fix example of BLOCK_JOB_READY event
  qapi: fix example of NIC_RX_FILTER_CHANGED event
  qapi: fix example of DEVICE_UNPLUG_GUEST_ERROR event
  qapi: fix example of MEM_UNPLUG_ERROR event
  qapi: fix examples of blockdev-add with qcow2
  qapi: fix example of query-hotpluggable-cpus command
  qapi: fix examples of events missing timestamp

 qapi/block-core.json | 12 ++++++------
 qapi/dump.json       |  2 +-
 qapi/machine.json    |  8 ++++----
 qapi/migration.json  | 27 +++++++++++++++++++++++----
 qapi/net.json        |  1 -
 qapi/qdev.json       |  3 +--
 qapi/ui.json         |  4 ++--
 7 files changed, 37 insertions(+), 20 deletions(-)

-- 
2.37.2


