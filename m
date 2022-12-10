Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F60648E63
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 12:23:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3xvb-0004BE-TY; Sat, 10 Dec 2022 06:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3xvZ-0004Aw-Bs
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 06:21:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3xvX-0004PN-Ov
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 06:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670671315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x3yjKgz2FgS2qK5S/aryZIXPL5vFiTgvJ4GUTylXbws=;
 b=dAIMxCntcqa1/mIZ/IQZaiT5FC/v4wLuF4kFZsoCsqGqKO5wbHfSlY2Dv1mQi/7h78NWQG
 +g+oZqtg93Qh0Rkkn7v8GnmMt7CbNtCWosat27zdacM3palHXsrmmLwn/er8dp5sbMhRSN
 9Tu5yeE73b7RtK/SnBEEkegntJIrjf4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-kBwCAYIrObWihrmspJUOKw-1; Sat, 10 Dec 2022 06:21:43 -0500
X-MC-Unique: kBwCAYIrObWihrmspJUOKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C41A85A588;
 Sat, 10 Dec 2022 11:21:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 535A72024CC0;
 Sat, 10 Dec 2022 11:21:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 436FD21E6921; Sat, 10 Dec 2022 12:21:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/4] hw/ppc: Clean up includes
Date: Sat, 10 Dec 2022 12:21:36 +0100
Message-Id: <20221210112140.4057731-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Back in 2016, we discussed[1] rules for headers, and these were
generally liked:

1. Have a carefully curated header that's included everywhere first.  We
   got that already thanks to Peter: osdep.h.

2. Headers should normally include everything they need beyond osdep.h.
   If exceptions are needed for some reason, they must be documented in
   the header.  If all that's needed from a header is typedefs, put
   those into qemu/typedefs.h instead of including the header.

3. Cyclic inclusion is forbidden.

After this series, include/hw/ppc and include/hw/pci-host/pnv* conform
to these rules.

It is based on

    [PATCH 0/5] include/hw/pci include/hw/cxl: Clean up includes
    [PATCH 0/3] block: Clean up includes
    [PATCH 0/4] coroutine: Clean up includes

[1] Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html

Based-on: <20221209134802.3642942-1-armbru@redhat.com>

Markus Armbruster (4):
  include/hw/ppc: Split pnv_chip.h off pnv.h
  include/hw/ppc: Supply a few missing includes
  include/hw/ppc: Don't include hw/pci-host/pnv_phb.h from pnv.h
  include/hw/ppc include/hw/pci-host: Drop extra typedefs

 hw/pci-host/pnv_phb.h          |   2 +-
 include/hw/pci-host/pnv_phb3.h |   1 -
 include/hw/pci-host/pnv_phb4.h |   5 +-
 include/hw/ppc/pnv.h           | 146 +-------------------------------
 include/hw/ppc/pnv_chip.h      | 147 +++++++++++++++++++++++++++++++++
 include/hw/ppc/pnv_core.h      |   3 +-
 include/hw/ppc/pnv_homer.h     |   2 +-
 include/hw/ppc/pnv_lpc.h       |  11 +--
 include/hw/ppc/pnv_occ.h       |   3 +-
 include/hw/ppc/pnv_pnor.h      |   2 +-
 include/hw/ppc/pnv_sbe.h       |   3 +-
 include/hw/ppc/pnv_xive.h      |   7 +-
 include/hw/ppc/pnv_xscom.h     |   3 +-
 include/hw/ppc/xive2.h         |   2 +
 include/hw/ppc/xive2_regs.h    |   2 +
 hw/intc/pnv_xive.c             |   1 +
 hw/intc/pnv_xive2.c            |   1 +
 hw/pci-host/pnv_phb3.c         |   1 +
 hw/pci-host/pnv_phb4_pec.c     |   1 +
 hw/ppc/pnv.c                   |   3 +
 hw/ppc/pnv_core.c              |   1 +
 hw/ppc/pnv_homer.c             |   1 +
 hw/ppc/pnv_lpc.c               |   1 +
 hw/ppc/pnv_psi.c               |   1 +
 hw/ppc/pnv_xscom.c             |   1 +
 25 files changed, 186 insertions(+), 165 deletions(-)
 create mode 100644 include/hw/ppc/pnv_chip.h

-- 
2.37.3


