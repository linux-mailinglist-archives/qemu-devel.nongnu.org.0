Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F229A284002
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 22:02:04 +0200 (CEST)
Received: from localhost ([::1]:34882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWgN-000441-Jq
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 16:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWz-00004s-01
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWv-00077l-Pw
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601927537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=35/2e5BjQ7jXBoDfbRgvdrcGBb1eO8nqzcuxLnXBU8E=;
 b=HacKn7wFoZ16oOMWDdFYMT+PwqT0mJHgYEIEl0DRFpFBzwvempe/05w4/zQpBglMfo4K1q
 NVM67KnoJJFEbnDHRuXPWaNm9rSxKegGvtVi4KntduVo7YbGWo56DXTx34mJSLnbkVXaKJ
 Laksy/xKou6srV0xCxYtsm81KeRbmh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-wO-vJfavO2iCO_cluNOHbA-1; Mon, 05 Oct 2020 15:52:15 -0400
X-MC-Unique: wO-vJfavO2iCO_cluNOHbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C62118A0768
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 19:52:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D883E5C645;
 Mon,  5 Oct 2020 19:52:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/36] qapi/common.py: Replace one-letter 'c' variable
Date: Mon,  5 Oct 2020 15:51:35 -0400
Message-Id: <20201005195158.2348217-14-jsnow@redhat.com>
In-Reply-To: <20201005195158.2348217-1-jsnow@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/qapi/common.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index a417b6029c8..338adedef4f 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -30,14 +30,14 @@ def camel_to_upper(value):
     new_name = ''
     length = len(c_fun_str)
     for i in range(length):
-        c = c_fun_str[i]
-        # When c is upper and no '_' appears before, do more checks
-        if c.isupper() and (i > 0) and c_fun_str[i - 1] != '_':
+        char = c_fun_str[i]
+        # When char is upper case and no '_' appears before, do more checks
+        if char.isupper() and (i > 0) and c_fun_str[i - 1] != '_':
             if i < length - 1 and c_fun_str[i + 1].islower():
                 new_name += '_'
             elif c_fun_str[i - 1].isdigit():
                 new_name += '_'
-        new_name += c
+        new_name += char
     return new_name.lstrip('_').upper()
 
 
-- 
2.26.2


