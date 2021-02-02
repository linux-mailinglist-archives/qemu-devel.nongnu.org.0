Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC5930C8C4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:01:53 +0100 (CET)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zzt-0001Ux-0W
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:01:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlf-00053t-Ml
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zle-0008Fp-0Y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612288029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GftNvl9QqS+qriNjqxWY8yBmQfUNiK84j48aT3ZfqnI=;
 b=bpUwPVNvGIjZBrvjqkd7mp2+mpT/oUkGZG3X01fbyLr25wEEGdJ77nXRl0SWMGHmNlLES7
 9UaO8iwDAhAUo+iNr5o5flUUIHUfLTV40sKW6n/8+5wlcaUg/PjVCqMi1wW+6Lqc87aOYd
 ffI6iTB07XDn7GfwzhcLbWoGBOL03Es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-RkRTVukKPcSMV6d-RYSrKg-1; Tue, 02 Feb 2021 12:47:06 -0500
X-MC-Unique: RkRTVukKPcSMV6d-RYSrKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1374107ACE3;
 Tue,  2 Feb 2021 17:47:04 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 312A75C1CF;
 Tue,  2 Feb 2021 17:47:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 13/14] qapi/introspect.py: Add docstring to _tree_to_qlit
Date: Tue,  2 Feb 2021 12:46:50 -0500
Message-Id: <20210202174651.2274166-14-jsnow@redhat.com>
In-Reply-To: <20210202174651.2274166-1-jsnow@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index eb5d34cdb42..3e59caf7d4d 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -97,6 +97,13 @@ def __init__(self, value: _NodeT, ifcond: Iterable[str],
 def _tree_to_qlit(obj: TreeValue,
                   level: int = 0,
                   suppress_first_indent: bool = False) -> str:
+    """
+    Convert the type tree into a QLIT C string, recursively.
+
+    :param obj: The value to convert.
+    :param level: The indentation level for this particular value.
+    :param suppress_first_indent: True for dict value children.
+    """
 
     def indent(level: int) -> str:
         return level * 4 * ' '
-- 
2.29.2


