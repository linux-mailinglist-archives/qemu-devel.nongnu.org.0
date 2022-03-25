Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28344E7A9F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:11:02 +0100 (CET)
Received: from localhost ([::1]:53288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqGz-0002q9-Si
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:11:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAy-0003Qr-1a
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXqAs-0001iu-Qd
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 16:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648238681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AYuUSF5pAARD8qjUX7WiLSm5SEuXndbsonGAKv7qeSE=;
 b=GtDdzi7La1LtQorv1wKm7McwbWvAVuNG/+zMMfEEjL2XPUZWSeR3CkXcpKGuJ56ioek6LQ
 101WK/ZxkVuYP/jCSSksgqPZ2HguBcOfNBJgBmxWSycicvzIUpyODdf9X+uc4saAWuZhEZ
 5WJsSmKJ5Dk2wd4TBIBBG3frsAd7TEk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-3qerhTbrPASC7owwhJzZjg-1; Fri, 25 Mar 2022 16:04:40 -0400
X-MC-Unique: 3qerhTbrPASC7owwhJzZjg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 020B638009F6
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 20:04:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B48A65ED81A;
 Fri, 25 Mar 2022 20:04:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] python/aqmp: relicense as LGPLv2+
Date: Fri, 25 Mar 2022 16:04:36 -0400
Message-Id: <20220325200438.2556381-3-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-1-jsnow@redhat.com>
References: <20220325200438.2556381-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Daniel Berrange <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am the sole author of all of the async QMP code (python/qemu/aqmp)
with the following exceptions:

python/qemu/aqmp/qmp_shell.py and python/qemu/aqmp/legacy.py were
written by Luiz Capitulino (et al) and are already licensed separately
as GPLv2 (only).

aqmp_tui.py was written by Niteesh Babu G S and is licensed as GPLv2+.

I wish to relicense as LGPLv2+ in order to provide as much flexibility
as I reasonably can, while retaining a copyleft license. It is my belief
that LGPLv2+ is a suitable license for the Python ecosystem that aligns
with the goals and philosophy of the QEMU project.

The intent is to eventually drop legacy.py, leaving only library code
that is LGPLv2+.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 4c22c38079..2b69b264f4 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -11,15 +11,15 @@
 managing QMP events.
 """
 
-# Copyright (C) 2020, 2021 John Snow for Red Hat, Inc.
+# Copyright (C) 2020-2022 John Snow for Red Hat, Inc.
 #
 # Authors:
 #  John Snow <jsnow@redhat.com>
 #
 # Based on earlier work by Luiz Capitulino <lcapitulino@redhat.com>.
 #
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
+# This work is licensed under the terms of the GNU LGPL, version 2 or
+# later. See the COPYING file in the top-level directory.
 
 import logging
 
-- 
2.34.1


