Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF21274CF7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 00:58:32 +0200 (CEST)
Received: from localhost ([::1]:33528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKrF1-0004j5-1m
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 18:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2j-0002Ga-S3
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKr2d-0000Ut-W9
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 18:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600814734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cohb1cEnh9mW0nABzu7a1jDE4scr/fqNYNgm1Qm484s=;
 b=D1MVOgOmKivkU2koC+E5Sk/zqz4WhRH16Kk2S7LRV+u7GX5NWW7UcusKV6/mnft53yucbC
 RzhhWsFOJY+CgEwIyRanAGdw8L+yD9et7Wolv8NjtnDOoPyVlvF8ZXEqFHZ/a2z1HtJuxy
 D+zP+rsBTQ07vQJzocxQC/TDo/HsJo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-RfqDWe25Nfu5m2TJF2pIIA-1; Tue, 22 Sep 2020 18:45:32 -0400
X-MC-Unique: RfqDWe25Nfu5m2TJF2pIIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ADA7801AE8;
 Tue, 22 Sep 2020 22:45:31 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF7D65C1A3;
 Tue, 22 Sep 2020 22:45:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 21/25] qapi/schema.py: disable pylint line limit
Date: Tue, 22 Sep 2020 18:44:57 -0400
Message-Id: <20200922224501.4087749-22-jsnow@redhat.com>
In-Reply-To: <20200922224501.4087749-1-jsnow@redhat.com>
References: <20200922224501.4087749-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's a big file, but there's really nothing in here that doesn't belong
in here -- and I don't think it's large enough to justify the
one-module-per-class approach.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/schema.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index a0e047c735..271befea1c 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -12,6 +12,8 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
+# pylint: disable=too-many-lines ¯\_(ツ)_/¯
+
 # TODO catching name collisions in generated code would be nice
 
 from collections import OrderedDict
-- 
2.26.2


