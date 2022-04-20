Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C6508A69
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:13:13 +0200 (CEST)
Received: from localhost ([::1]:40730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhB4y-0006YY-Tq
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMk-0005zp-2p
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMi-0004VR-Je
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydZQajIQB9iEvRs9uGDmohN3xUDwdpnwMop0Kyl4LHE=;
 b=Hrkqa4K6vrVhNq7uan9jJEi+1Pa4I1cccuXzBolrEO0fWehCFxfup48vOcP8CqxCnmSU8/
 T/SYKQcy+lf7ELE1XQSbMEIHIqJQkrekU1hdQXMHDxCyXH6+J63ByWfZX37EW+fjFOW5Kt
 7qkwr5j5Z0LX11XCe0jfgtLnfiF8KP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-RHtb0puZN3WlEod5Zr-mgQ-1; Wed, 20 Apr 2022 09:27:26 -0400
X-MC-Unique: RHtb0puZN3WlEod5Zr-mgQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D643833968
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:27:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3468C46A3BF;
 Wed, 20 Apr 2022 13:27:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 12/41] docs: trace-events-all is installed without renaming
Date: Wed, 20 Apr 2022 17:25:55 +0400
Message-Id: <20220420132624.2439741-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/tracing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
index ec9a687cfdc9..d288480db11f 100644
--- a/docs/devel/tracing.rst
+++ b/docs/devel/tracing.rst
@@ -48,7 +48,7 @@ file. During build, the "trace-events" file in each listed subdirectory will be
 processed by the "tracetool" script to generate code for the trace events.
 
 The individual "trace-events" files are merged into a "trace-events-all" file,
-which is also installed into "/usr/share/qemu" with the name "trace-events".
+which is also installed into "/usr/share/qemu".
 This merged file is to be used by the "simpletrace.py" script to later analyse
 traces in the simpletrace data format.
 
-- 
2.35.1.693.g805e0a68082a


