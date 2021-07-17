Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD53CC062
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:51:25 +0200 (CEST)
Received: from localhost ([::1]:59344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4YY8-0008SM-75
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YHD-0005u2-KV
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YHC-0006ee-5S
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626482033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jT8tslvFMRnrQL1eNarFLpseIV0ohb8XgXCUfp3Oiyg=;
 b=DhHCWkUgKMEhu6tCc6xT4Swpa2LZ+tUaiy3/1iTDwM8gbvHWkkO4cuw1YdafT+jtuah0+K
 p4reas7BRS37uGl/aggKq+tcQqSxSyVv3nVxKjrXXjRRo7IhTJZ+J5v1Kj3LEr9TwAQ/i3
 1vWnQ0POlCBC3EfHksIUZGnPTffTtiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-V1JrJio6OxuR3JVpMQGpyQ-1; Fri, 16 Jul 2021 20:33:50 -0400
X-MC-Unique: V1JrJio6OxuR3JVpMQGpyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79739801107;
 Sat, 17 Jul 2021 00:33:49 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D48DA5C1A1;
 Sat, 17 Jul 2021 00:33:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] python/aqmp: add scary message
Date: Fri, 16 Jul 2021 20:32:52 -0400
Message-Id: <20210717003253.457418-24-jsnow@redhat.com>
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

Add a warning whenever AQMP is used to steer people gently away from
using it for the time-being.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index ef2903fa7fc..321ea5c5c4b 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -21,6 +21,8 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
+import warnings
+
 from .error import AQMPError
 from .events import EventListener
 from .message import Message
@@ -28,6 +30,18 @@
 from .qmp_client import ExecInterruptedError, ExecuteError, QMPClient
 
 
+_WMSG = """
+
+The Asynchronous QMP library is currently in development and its API
+should be considered highly fluid and subject to change. It should
+not be used by any other scripts checked into the QEMU tree.
+
+Proceed with caution!
+"""
+
+warnings.warn(_WMSG, FutureWarning)
+
+
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
     # Classes, most to least important
-- 
2.31.1


