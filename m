Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6B50A2CD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:39:24 +0200 (CEST)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXxr-0006mm-Vc
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqS-0002ik-Bu
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhXqP-0004Kw-5M
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 10:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650551500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWje4EqdZpxWaBXZ0lpdTZMP30Jg97zPp02phq7hIpI=;
 b=JoOHBrIMHdX0tP+L3/ycu1/n+SKWV9AzgUZIhw6130ZSKqmEnKDgteaguMWJ4M7hZDNs0x
 L3vF3Z6EtSUCu+6oPnB2rinaCRpow8ivJbP5xQpq37kGZ0Hs0JhARULtnRswWMN//Manm7
 5UoB1mDz3uQwb/GaBsOt2bHcoeTn3cY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-lEQXirqqPbCKJxKi2DvSkQ-1; Thu, 21 Apr 2022 10:31:37 -0400
X-MC-Unique: lEQXirqqPbCKJxKi2DvSkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF8543811A39;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6FCC28129;
 Thu, 21 Apr 2022 14:31:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA23C21E6A23; Thu, 21 Apr 2022 16:31:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] docs: qapi: Remove outdated reference to simple unions
Date: Thu, 21 Apr 2022 16:31:32 +0200
Message-Id: <20220421143135.1491256-5-armbru@redhat.com>
In-Reply-To: <20220421143135.1491256-1-armbru@redhat.com>
References: <20220421143135.1491256-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: richard.henderson@linaro.org, Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrea Bolognani <abologna@redhat.com>

Commit 4e99f4b12c0e dropped simple unions and updated most
documentation accordingly, but in one case we still claim that
there are "two flavors of unions".

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Message-Id: <20220420153408.243584-2-abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 246709ede8..7b968433a6 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -41,8 +41,8 @@ used internally.
 
 There are several kinds of types: simple types (a number of built-in
 types, such as ``int`` and ``str``; as well as enumerations), arrays,
-complex types (structs and two flavors of unions), and alternate types
-(a choice between other types).
+complex types (structs and unions), and alternate types (a choice
+between other types).
 
 
 Schema syntax
-- 
2.35.1


