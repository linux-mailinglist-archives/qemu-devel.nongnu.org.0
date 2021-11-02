Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD844350C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:03:34 +0100 (CET)
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhy8D-0000Gq-GH
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2k-0000Bt-Dt
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhy2h-0006pt-DQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635875870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Po9xfPHngLdrtA8HJjzlWRlYB5bfgztc6iHW/5BmUQ=;
 b=fs3psZV3lJTjliweO1eJhHWYUcDX63p9WxT/f0DFHR36saKws5pyqT+6pg1pdcRpqre78K
 qKNXWYai+hTEj7q0fbofowtJpQxEUBqvXezOAnBLLqtecvuSQisrO9MRsrj4HXJDZXcDHO
 a/P9mJkuublVtBVHsLrIX0W2XXtFYG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-j7giXJjHODiM5_cO8fiEVQ-1; Tue, 02 Nov 2021 13:57:47 -0400
X-MC-Unique: j7giXJjHODiM5_cO8fiEVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91CE71927802;
 Tue,  2 Nov 2021 17:57:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7424619C59;
 Tue,  2 Nov 2021 17:57:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] docs/devel: tweak headings in monitor command docs
Date: Tue,  2 Nov 2021 17:56:46 +0000
Message-Id: <20211102175700.1175996-5-berrange@redhat.com>
In-Reply-To: <20211102175700.1175996-1-berrange@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new headings reflect the intended structure of the document and will
better suit additions that follow.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index 4a4c051624..a973c48f66 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -85,8 +85,8 @@ any data". Now you're ready to enter the QMP example commands as explained in
 the following sections.
 
 
-Writing a command that doesn't return data
-------------------------------------------
+Writing a simple command: hello-world
+-------------------------------------
 
 That's the most simple QMP command that can be written. Usually, this kind of
 command carries some meaningful action in QEMU but here it will just print
@@ -340,8 +340,8 @@ Please, check the "-monitor" command-line option to know how to open a user
 monitor.
 
 
-Writing a command that returns data
------------------------------------
+Writing more complex commands
+-----------------------------
 
 A QMP command is capable of returning any data the QAPI supports like integers,
 strings, booleans, enumerations and user defined types.
-- 
2.31.1


