Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D242F204
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 15:19:34 +0200 (CEST)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbN7V-0003xw-F8
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 09:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mbN5H-00015p-V7
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mbN5D-00025q-6x
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 09:17:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634303830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OqUuuGcjB8ZPlmWReN/hA1h81MdDRQ30k8jTE7Rv4lI=;
 b=bIrie8BguruMW+m2wVmsJRQ708A9knVBVfmh/i4r2cHWhn7tAU+6ws/RACO96ao3pt7CZj
 p9TZQbZqJbfs0V+2jQkKocDOk5fhhqm3HusHSDcw/VYyMka/3o9joSwxK6T07BMIHfPDkw
 UxjuIH1I3AobRowJwNxGaVdYoya/I0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-iQXBhqk4NyCzGEMS1Zd9RA-1; Fri, 15 Oct 2021 09:17:07 -0400
X-MC-Unique: iQXBhqk4NyCzGEMS1Zd9RA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7487A1006AA2;
 Fri, 15 Oct 2021 13:17:06 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A4BA60C13;
 Fri, 15 Oct 2021 13:16:54 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] analyze-migration.py: fix a long standing typo
Date: Fri, 15 Oct 2021 15:16:44 +0200
Message-Id: <20211015131645.501281-2-lvivier@redhat.com>
In-Reply-To: <20211015131645.501281-1-lvivier@redhat.com>
References: <20211015131645.501281-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The parameters of '-d' can be either 'state' or 'desc', not 'dump'
as it is reported in the error message.

Fixes: b17425701d66 ("Add migration stream analyzation script")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 scripts/analyze-migration.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index d7177b212c86..9d239d309f33 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -610,4 +610,4 @@ def default(self, o):
     dump.read(desc_only = True)
     print(jsonenc.encode(dump.vmsd_desc))
 else:
-    raise Exception("Please specify either -x, -d state or -d dump")
+    raise Exception("Please specify either -x, -d state or -d desc")
-- 
2.31.1


