Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312AD6AC17A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:38:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAvv-0002RS-NJ; Mon, 06 Mar 2023 08:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAur-0002D9-3K
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAup-0007S8-6I
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NiyEML7jUQU6oIhG4edKu9ogrZdmJN4g1ZEYRqafWWQ=;
 b=R/hVyz4i2KQai9PG8vN1pSV3h3Z29UXOqbw/L0l3UU83QKO6YVCSDT15tLiT1Gbuacuejh
 hLc6CiEWGQhsfaJNZRaObk3Aj24TRRO9c5zmJZZA8JaYcIByLYGKVKuveF0gZGv4yb5ac9
 PI6lp4mCt0OKxWUCVtYWzxDeNahPxVU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-sLdjYdt2MsCxegpMDCwZAw-1; Mon, 06 Mar 2023 08:30:06 -0500
X-MC-Unique: sLdjYdt2MsCxegpMDCwZAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCB3D183B3CE;
 Mon,  6 Mar 2023 13:30:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42C4C40C10FA;
 Mon,  6 Mar 2023 13:30:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/16] Hexagon (meson.build): define min bison version
Date: Mon,  6 Mar 2023 14:29:48 +0100
Message-Id: <20230306133002.418421-3-thuth@redhat.com>
In-Reply-To: <20230306133002.418421-1-thuth@redhat.com>
References: <20230306133002.418421-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

Hexagon's idef-parser machinery uses some bison features that are not
available at older versions. The most preeminent example (as it can
be used as a sentinel) is "%define parse.error verbose". This was
introduced in version 3.0 of the tool, which is able to compile
qemu-hexagon just fine. However, compilation fails with the previous
minor bison release, v2.7. So let's assert the minimum version at
meson.build to give a more comprehensive error message for those trying
to compile QEMU.

[1]: https://www.gnu.org/software/bison/manual/html_node/_0025define-Summary.html#index-_0025define-parse_002eerror

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alessandro Di Federico <ale@rev.ng>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/hexagon/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
index c9d31d095c..42b03c81e6 100644
--- a/target/hexagon/meson.build
+++ b/target/hexagon/meson.build
@@ -183,7 +183,7 @@ if idef_parser_enabled and 'hexagon-linux-user' in target_dirs
     )
 
     bison = generator(
-        find_program('bison'),
+        find_program('bison', version: '>=3.0'),
         output: ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
         arguments: ['@INPUT@', '--defines=@OUTPUT1@', '--output=@OUTPUT0@']
     )
-- 
2.31.1


