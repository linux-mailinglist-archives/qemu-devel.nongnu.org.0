Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D346751F557
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 09:35:57 +0200 (CEST)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnxvw-0001Ky-Hu
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 03:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnxq6-0007gW-UW
 for qemu-devel@nongnu.org; Mon, 09 May 2022 03:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnxq5-0000Kb-Ap
 for qemu-devel@nongnu.org; Mon, 09 May 2022 03:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652081392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JkAfOU4Qfal5MtrKTWc07LFDCXvTVdVG2bm4avWmXNo=;
 b=iysdOiMRZ5r3pD0yLRJqJpbKetekMk0xrfzUEuXYBoi5cLXpiyzm9n2Rdrqsi9ni1r1io4
 4C8KNVsbadBflz91+CXyB/rpiqBg7VgC82k9OgxmD05XT2fzwiXWymNT9eHbCuTXP0niF9
 DzvgezADrfonkJ8aQldN/CygfbK4Hxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-jK9tgL2nPPWsuj5UBSHN1w-1; Mon, 09 May 2022 03:29:49 -0400
X-MC-Unique: jK9tgL2nPPWsuj5UBSHN1w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B08F85A5A8;
 Mon,  9 May 2022 07:29:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D848D7AD9;
 Mon,  9 May 2022 07:29:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 11/11] docs/devel/writing-monitor-commands: Replace obsolete
 STEXI/ETEXI tags
Date: Mon,  9 May 2022 09:29:33 +0200
Message-Id: <20220509072933.48586-4-thuth@redhat.com>
In-Reply-To: <20220509072933.48586-1-thuth@redhat.com>
References: <20220509072933.48586-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

STEXI and ETEXI is not used anymore since we switched to Sphinx.
Replace them in the example with SRST and ERST, too.

Message-Id: <20220506150146.564244-1-thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/writing-monitor-commands.rst | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/docs/devel/writing-monitor-commands.rst b/docs/devel/writing-monitor-commands.rst
index 1693822f8f..4aa2bb904d 100644
--- a/docs/devel/writing-monitor-commands.rst
+++ b/docs/devel/writing-monitor-commands.rst
@@ -331,13 +331,10 @@ we should add it to the hmp-commands.hx file::
         .cmd        = hmp_hello_world,
     },
 
-::
-
- STEXI
- @item hello_world @var{message}
- @findex hello_world
- Print message to the standard output
- ETEXI
+ SRST
+ ``hello_world`` *message*
+   Print message to the standard output
+ ERST
 
 To test this you have to open a user monitor and issue the "hello-world"
 command. It might be instructive to check the command's documentation with
-- 
2.27.0


