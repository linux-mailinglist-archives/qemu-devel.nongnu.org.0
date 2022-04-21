Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C918D50A409
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:26:20 +0200 (CEST)
Received: from localhost ([::1]:34086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYhH-0003ik-QZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXY-0003Vb-3M
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXR-0005nU-N2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDAexfzuLU0la3BW7me8tQSAM7lY3zYXlhumY7Vbc1Q=;
 b=ePT+2uqm9J+l+z2gWElUaAPSUSvGzxziVrPuht6r/IRAWF/fBOVOuOdRsWyn5YeGoVJL0p
 e5ErZu/ZPc2KpsiCCIX3OW/VMHriOIrAOBC26doyogKJVSug268cT9gpIgcocis8YVSqLn
 ulB9xNoWRWsqMQIrrdZAey1iQEoRVoc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-pA8jO-meNbOGRmcvb21vJQ-1; Thu, 21 Apr 2022 11:16:05 -0400
X-MC-Unique: pA8jO-meNbOGRmcvb21vJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D8161E15C06;
 Thu, 21 Apr 2022 15:16:05 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D327340D016E;
 Thu, 21 Apr 2022 15:16:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/17] python/qmp-shell: relicense as LGPLv2+
Date: Thu, 21 Apr 2022 11:15:50 -0400
Message-Id: <20220421151600.984189-8-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Luiz Capitulino <lcapitulino@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qmp-shell is presently licensed as GPLv2 (only). I intend to include
this tool as an add-on to an LGPLv2+ library package hosted on
PyPI.org. I've selected LGPLv2+ to maximize compatibility with other
licenses while retaining a copyleft license.

To keep licensing matters simple, I'd like to relicense this tool as
LGPLv2+ as well in order to keep the resultant license of the hosted
release files simple -- even if library users won't "link against" this
command line tool.

Therefore, I am asking permission from the current authors of this
tool to loosen the license. At present, those people are:

- John Snow (me!), 411/609
- Luiz Capitulino, Author, 97/609
- Daniel Berrangé, 81/609
- Eduardo Habkost, 10/609
- Marc-André Lureau, 6/609
- Fam Zheng, 3/609
- Cleber Rosa, 1/609

(All of which appear to have been written under redhat.com addresses.)

Eduardo's fixes are largely automated from 2to3 conversion tools and may
not necessarily constitute authorship, but his signature would put to
rest any questions.

Cleber's changes concern a single import statement change. Also won't
hurt to ask.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Fam Zheng <fam@euphon.net>
Acked-by: Luiz Capitulino <lcapitulino@redhat.com>
Acked-by: Eduardo Habkost <eduardo@habkost.net>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20220325200438.2556381-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_shell.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index 35691494d0a..c23f1b19280 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -1,11 +1,12 @@
 #
-# Copyright (C) 2009, 2010 Red Hat Inc.
+# Copyright (C) 2009-2022 Red Hat Inc.
 #
 # Authors:
 #  Luiz Capitulino <lcapitulino@redhat.com>
+#  John Snow <jsnow@redhat.com>
 #
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
+# This work is licensed under the terms of the GNU LGPL, version 2 or
+# later. See the COPYING file in the top-level directory.
 #
 
 """
-- 
2.34.1


