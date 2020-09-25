Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473CF277D35
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 02:52:56 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLbyp-00005C-8p
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 20:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLbcX-0001NL-Bb
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:29:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLbcL-0000DV-Ik
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:29:53 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600993773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZUJwWCFNGA6+mV8YreYmKR5QC1m5IZJw4r6/CyXQT1E=;
 b=Ja93vRQiOdC33LILNpPEkq6hUeVbIbw5mzRRn72iWFj/8hMpaPq54KCqcahbWBefqy17OG
 lzNqtckc6KHiJlMV0JRG2qlQ41ivXs8ABeT+9S9iJwv6pWqWbx8NlmP0VMF2I5PxZTUCxa
 V3S6ZyG2Ar/HxbXeaWoS5GpOIk+yItw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-2LuE7ViFP5Sm_FmfhMXymQ-1; Thu, 24 Sep 2020 20:29:31 -0400
X-MC-Unique: 2LuE7ViFP5Sm_FmfhMXymQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6756188C122
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 00:29:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F8165D9DD;
 Fri, 25 Sep 2020 00:29:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/47] qapi/gen.py: Remove unused parameter
Date: Thu, 24 Sep 2020 20:28:47 -0400
Message-Id: <20200925002900.465855-35-jsnow@redhat.com>
In-Reply-To: <20200925002900.465855-1-jsnow@redhat.com>
References: <20200925002900.465855-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
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
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

module_basename doesn't use the 'what' argument, so remove it.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/gen.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index eec941074b..ece908a058 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -265,7 +265,7 @@ def _is_user_module(name: Optional[str]) -> bool:
     def _is_builtin_module(name: Optional[str]) -> bool:
         return not name
 
-    def _module_dirname(self, what: str, name: Optional[str]) -> str:
+    def _module_dirname(self, name: Optional[str]) -> str:
         if self._is_user_module(name):
             return os.path.dirname(name)
         return ''
@@ -283,7 +283,7 @@ def _module_basename(self, what: str, name: Optional[str]) -> str:
         return ret
 
     def _module_filename(self, what: str, name: Optional[str]) -> str:
-        return os.path.join(self._module_dirname(what, name),
+        return os.path.join(self._module_dirname(name),
                             self._module_basename(what, name))
 
     def _add_module(self, name: Optional[str], blurb: str) -> None:
-- 
2.26.2


