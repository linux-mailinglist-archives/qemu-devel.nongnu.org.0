Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA564367283
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:27:45 +0200 (CEST)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHZg-0007lX-PE
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHSs-0002bm-QG
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHSq-0003eR-MP
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cvYDCFaKCSkJFdOM/fOmBdsVZEzVOwExA8PEh5H3F3M=;
 b=O3kIg8aUP8YtUMg8xCqwWRm+s3UTmuM4W4MI/Dmwn47jGZiIj5RekKjFjlwIIQqpo1NHK+
 2ML5MZghozB9qr480uEOtkhDU5teQjZGfTH9LMLeUjvMI9d2m1q5rIToUtRYhoZOyUg1K0
 j4DgZjs2YYxWoMq0buOaxhHZlSx1xxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-MBGucotJO8y_anc9O1cC3w-1; Wed, 21 Apr 2021 14:20:35 -0400
X-MC-Unique: MBGucotJO8y_anc9O1cC3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AB96107ACC7;
 Wed, 21 Apr 2021 18:20:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8676919701;
 Wed, 21 Apr 2021 18:20:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 01/17] qapi/expr: Comment cleanup
Date: Wed, 21 Apr 2021 14:20:16 -0400
Message-Id: <20210421182032.3521476-2-jsnow@redhat.com>
In-Reply-To: <20210421182032.3521476-1-jsnow@redhat.com>
References: <20210421182032.3521476-1-jsnow@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The linter yaps after 0825f62c842. Fix this trivial issue to restore the
linter baseline.

(Yes, ideally -- and soon -- the linter will be part of CI so we don't
clutter up the log with fixups. For now, though, the baseline is useful
for testing intermediate commits as types are added to the QAPI
library.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 540b3982b10..c207481f7e9 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -241,7 +241,7 @@ def check_enum(expr, info):
         source = "%s '%s'" % (source, member_name)
         # Enum members may start with a digit
         if member_name[0].isdigit():
-            member_name = 'd' + member_name # Hack: hide the digit
+            member_name = 'd' + member_name  # Hack: hide the digit
         check_name_lower(member_name, info, source,
                          permit_upper=permissive,
                          permit_underscore=permissive)
-- 
2.30.2


