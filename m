Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E9573412
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 12:24:19 +0200 (CEST)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZXV-0002F5-9N
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 06:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBZSh-00062t-Te
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBZSf-0007fq-Hy
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657707557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJBiB/nHlwCmxUHkVUxjMDwvztLLuKhonMo6oZhkaKk=;
 b=NH/nK4nvRYHmsWabyhMmF3mflAWli5jFBEcajl8vZn2RXkWdE9JrpAsZswWu0UTsab7J3y
 UNZiwws5/nAhnaB3n7PAxn6chZVhUk2pqQ5B5fkrWQwU6UBw6OGvLhE15vcM/BOzfuDXE/
 51h2dySc5LFMyBnsKxh0vxkx8WhXeHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-zNCYNuJQP5ekS87pP4QDKg-1; Wed, 13 Jul 2022 06:19:13 -0400
X-MC-Unique: zNCYNuJQP5ekS87pP4QDKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B8D728084F1;
 Wed, 13 Jul 2022 10:19:13 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 426DF1121315;
 Wed, 13 Jul 2022 10:19:12 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/3] MAINTAINERS: Add myself as Guest Agent reviewer
Date: Wed, 13 Jul 2022 13:19:06 +0300
Message-Id: <20220713101908.2212307-2-kkostiuk@redhat.com>
In-Reply-To: <20220713101908.2212307-1-kkostiuk@redhat.com>
References: <20220713101908.2212307-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220712092715.2136898-1-kkostiuk@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 450abd0252..b1e73d99f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2880,6 +2880,7 @@ T: git https://repo.or.cz/qemu/armbru.git qapi-next
 
 QEMU Guest Agent
 M: Michael Roth <michael.roth@amd.com>
+R: Konstantin Kostiuk <kkostiuk@redhat.com>
 S: Maintained
 F: qga/
 F: docs/interop/qemu-ga.rst
-- 
2.25.1


