Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7898C6196B5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 13:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwG8-0001ek-OR; Fri, 04 Nov 2022 08:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqwG2-0001bP-0B
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqwG0-0004LL-9s
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667566630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jsz4BpMF6kDTvChfEiKgtGv943LrmJ3RSAHGf2DrxE4=;
 b=K0l/ZAROiVKHBwIalREv+W1RwIVsDPouz3vvSLzYA06HzQSSCIvSIcmYa7jFSacQaLu8tK
 3PwWjSbT8GzKXNTBnK2HY5z+6E/rlGqSnUW+Kig+xzwz1m6UgfgNncxoZmNzy2Tbptv7vQ
 SmNWUMP32DNv1VYMaIIGWtnvdflGNvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-5FRj1qstP8qPn5hayB6GVA-1; Fri, 04 Nov 2022 08:57:08 -0400
X-MC-Unique: 5FRj1qstP8qPn5hayB6GVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 623588001B8
 for <qemu-devel@nongnu.org>; Fri,  4 Nov 2022 12:57:08 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 760BA4A9254;
 Fri,  4 Nov 2022 12:57:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	pbonzini@redhat.com
Subject: [PATCH 0/3] Fix the "-nic help" option
Date: Fri,  4 Nov 2022 13:57:02 +0100
Message-Id: <20221104125705.415923-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier
versions, but since QEMU 6.0 it just complains that "help" is not
a valid value here. This patch series fixes this problem and also
extends the help output here to list the available NIC models, too.

Thomas Huth (3):
  net: Move the code to collect available NIC models to a separate
    function
  net: Restore printing of the help text with "-nic help"
  net: Replace "Supported NIC models" with "Available NIC models"

 include/net/net.h |  1 +
 hw/pci/pci.c      | 29 +-------------------------
 net/net.c         | 52 ++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 51 insertions(+), 31 deletions(-)

-- 
2.31.1


