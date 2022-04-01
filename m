Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C7C4EF41C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:29:24 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJDH-0003ze-W2
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:29:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7l-0001L5-Mt
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7g-0000rQ-F7
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648826615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arVoTcAZW7Mlx0fGNyg6R8QmTtIumam8RmQcU84wRbo=;
 b=A6R5FKheFR1KdIlWFHrLnEgF9407wMIyi+oJr9uliZozOkVyAoJ85WOBLwJlcznltqG10R
 O6s4Tqy3q0gpF2tie+TyvrpUICd6eWnhRCSovLM/C7c5smv52VGDc0HjMCJYBp7ktTMcsr
 /LodzKBUHNe9A09pjEswRIhuKFTM3Hg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-vg7ApgA5OKSSRSW697fWVg-1; Fri, 01 Apr 2022 11:23:32 -0400
X-MC-Unique: vg7ApgA5OKSSRSW697fWVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DA54811E75;
 Fri,  1 Apr 2022 15:23:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66D432166B4E;
 Fri,  1 Apr 2022 15:23:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] meson.build: Fix dependency of page-vary-common.c to
 config-poison.h
Date: Fri,  1 Apr 2022 17:23:21 +0200
Message-Id: <20220401152323.52519-5-thuth@redhat.com>
In-Reply-To: <20220401152323.52519-1-thuth@redhat.com>
References: <20220401152323.52519-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before compiling page-vary-common.c, we have to make sure that
config-poison.h has been generated (which is in the "genh" list).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/948
Message-Id: <20220330114808.942933-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index aef724ad3c..04ce33fef1 100644
--- a/meson.build
+++ b/meson.build
@@ -2881,7 +2881,7 @@ if get_option('b_lto')
   if get_option('cfi')
     pagevary_flags += '-fno-sanitize=cfi-icall'
   endif
-  pagevary = static_library('page-vary-common', sources: pagevary,
+  pagevary = static_library('page-vary-common', sources: pagevary + genh,
                             c_args: pagevary_flags)
   pagevary = declare_dependency(link_with: pagevary)
 endif
-- 
2.27.0


