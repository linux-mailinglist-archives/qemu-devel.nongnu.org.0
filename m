Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90012478333
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 03:33:24 +0100 (CET)
Received: from localhost ([::1]:47620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my33j-0004pf-Ky
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 21:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30L-00014c-KN
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my30K-0000ZT-3R
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 21:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639708191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sbVvS+UPknlapfhmCCfgKOGZQCkbjp0gHP+cPAr/U0=;
 b=Y1BbumWYx5X8MwNLy7sEXP0whJVWrfhGCoG4J6kDcpsV5JnPxKoIXC8cyVMMlUZKsBlLRk
 5wnFO+ru7m4gJYUuCm4s2IizbpKIRtQa+v9lM13FVk7woPZFzoFonQ/yXOFIzzbAB/z4ki
 c8vavcNzEkykMB2gyw/glQ8Ey9gEghE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-SDfgyA0jOiOP_3XTOfX7Ng-1; Thu, 16 Dec 2021 21:29:48 -0500
X-MC-Unique: SDfgyA0jOiOP_3XTOfX7Ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523CC801962;
 Fri, 17 Dec 2021 02:29:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C20F22DF5;
 Fri, 17 Dec 2021 02:29:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/9] scripts/qmp: delete qmp.py script stub
Date: Thu, 16 Dec 2021 21:29:35 -0500
Message-Id: <20211217022939.279559-6-jsnow@redhat.com>
In-Reply-To: <20211217022939.279559-1-jsnow@redhat.com>
References: <20211217022939.279559-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's been stubbed out for quite some time and nobody yelped, so out it
goes.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100755 scripts/qmp/qmp

diff --git a/scripts/qmp/qmp b/scripts/qmp/qmp
deleted file mode 100755
index 0f12307c87..0000000000
--- a/scripts/qmp/qmp
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/usr/bin/env python3
-
-import sys
-
-print('''This unmaintained and undocumented script was removed in preference
-for qmp-shell. The assumption is that most users are using either
-qmp-shell, socat, or pasting/piping JSON into stdio. The duplication of
-facilities here is unwanted, and the divergence of syntax harmful.''',
-      file=sys.stderr)
-
-sys.exit(1)
-- 
2.31.1


