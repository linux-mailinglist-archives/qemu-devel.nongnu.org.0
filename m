Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01933CC048
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:39:14 +0200 (CEST)
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4YML-0001sm-PQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGw-0005Cx-LP
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGu-0006T5-HJ
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626482016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mr3911+3HzsahwEY8Hz4xSUe0S3X+HKRBF0HnU4Oj6Q=;
 b=Nx2y+dDP5K16tYJsEc8P5tZbRtFVtmCPMIpzjosex8F6pcVI9XosZdBTFgjmCgDs1eo802
 ZgFfzvtuOP/jAzFEd8Z+mznBxN3vO7qCud5VyeLXIR0ap88fOHZ396Ji+nEgIHCHfACtrl
 9zZp5aX6Wgn332MAPHbfvs2hhW9rwNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Z2XxaEZHMQygS55hFWP0EA-1; Fri, 16 Jul 2021 20:33:34 -0400
X-MC-Unique: Z2XxaEZHMQygS55hFWP0EA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4124800C78;
 Sat, 17 Jul 2021 00:33:33 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E0345C1A1;
 Sat, 17 Jul 2021 00:33:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/24] python/pylint: disable no-member check
Date: Fri, 16 Jul 2021 20:32:47 -0400
Message-Id: <20210717003253.457418-19-jsnow@redhat.com>
In-Reply-To: <20210717003253.457418-1-jsnow@redhat.com>
References: <20210717003253.457418-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mypy handles this better -- but we only need the workaround because
pylint under Python 3.6 does not understand that a MutableMapping really
does have a .get() method attached.

We could remove this again once 3.7 is our minimum.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 19d5e154630..2573cd7bfb3 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -89,6 +89,7 @@ ignore_missing_imports = True
 # no Warning level messages displayed, use "--disable=all --enable=classes
 # --disable=W".
 disable=too-many-function-args,  # mypy handles this with less false positives.
+        no-member,  # mypy also handles this better.
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.31.1


