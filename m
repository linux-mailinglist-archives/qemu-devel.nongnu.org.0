Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2926B2383
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:58:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEtn-0004F5-EZ; Thu, 09 Mar 2023 06:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1paEtd-00047z-Bf
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:57:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1paEtb-0007sH-3z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678363038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHaf0huwT1ANYnvlva3zLolhjrAeCYOpFoXyiL608lw=;
 b=ETBQd9soy7QsWYfz16wPw0LntdJOYZj2NpX0s2eJmZdAWXAiYxPhuRe5xNGxGnQRUSan67
 4YxNOyz8NcQSobY+t0rU95y0fsmuejWL27CRzpYnQ5NDDPj3wq0288XdvXVU+wfxzIuPlR
 bv1LPzU/1m/y6mgcSuf/83ZiuVIfqOw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-KcixXQqxNc-hqOMvxzXk2w-1; Thu, 09 Mar 2023 06:57:16 -0500
X-MC-Unique: KcixXQqxNc-hqOMvxzXk2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54E682999B33;
 Thu,  9 Mar 2023 11:57:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F06E2026D4B;
 Thu,  9 Mar 2023 11:57:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5EFFC1800381; Thu,  9 Mar 2023 12:57:14 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 1/3] edk2: update submodule to edk2-stable202302
Date: Thu,  9 Mar 2023 12:57:12 +0100
Message-Id: <20230309115714.906369-2-kraxel@redhat.com>
In-Reply-To: <20230309115714.906369-1-kraxel@redhat.com>
References: <20230309115714.906369-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/edk2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/edk2 b/roms/edk2
index b24306f15daa..f80f052277c8 160000
--- a/roms/edk2
+++ b/roms/edk2
@@ -1 +1 @@
-Subproject commit b24306f15daa2ff8510b06702114724b33895d3c
+Subproject commit f80f052277c88a67c55e107b550f504eeea947d3
-- 
2.39.2


