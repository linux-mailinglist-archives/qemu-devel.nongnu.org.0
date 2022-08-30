Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C95A6CA1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:57:05 +0200 (CEST)
Received: from localhost ([::1]:40102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6Q4-0006wx-EB
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AT-0007hJ-TG
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:41:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AS-0005Cb-Gs
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGkjJP+5U3F7+hax18oGblUCTnZbzz8NFyPGwq2srC4=;
 b=gTHoeVUSekjKkwe473prb+XlN69N3+Ia2eDT5XTg92+TL+KU9tfIueOWdW87JdC0VEhc/w
 9r9Xb5+khQ4mt1JcapftP5HVSU34iFBwT22tcvqQ5vtJ5/+2kMeeUAZXyXP2olnpmf83S3
 jqjq/11ZbX8hPmosPamgbEutcLU9LVA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-ZV3AjEcJOfuRyTKCqgzvGQ-1; Tue, 30 Aug 2022 14:40:49 -0400
X-MC-Unique: ZV3AjEcJOfuRyTKCqgzvGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B24C3800C2E;
 Tue, 30 Aug 2022 18:40:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE3601410DD5;
 Tue, 30 Aug 2022 18:40:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Subject: [PULL 20/23] docs/devel/testing: fix minor typo
Date: Tue, 30 Aug 2022 20:40:09 +0200
Message-Id: <20220830184012.77978-21-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Message-Id: <421fb28678d1077c0b14978e359b4e1469cc0168.1661262376.git.quic_mathbern@quicinc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 3f6ebd5073..f35f117d95 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -297,7 +297,7 @@ build and test QEMU in predefined and widely accessible Linux
 environments. This makes it possible to expand the test coverage
 across distros, toolchain flavors and library versions. The support
 was originally written for Docker although we also support Podman as
-an alternative container runtime. Although the many of the target
+an alternative container runtime. Although many of the target
 names and scripts are prefixed with "docker" the system will
 automatically run on whichever is configured.
 
-- 
2.31.1


