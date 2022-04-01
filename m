Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21234EF3A3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:26:37 +0200 (CEST)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naJAa-0003TA-Kw
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:26:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7e-0000z2-Bb
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1naJ7c-0000qr-0S
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648826611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUFthdLADyGYhqg960Ti2tj+IEQt1bOcOPf+CdvzN2Y=;
 b=M6hxX4iMCcMXgs8BZy6dNPHgvQJVlexam9TAx9PtsGVSs7pkYLjM+TNtVBgqm2RxVhpR3v
 jSMPAbqZaEP3Vu7B7gdypGnfcO6e1W4xHcYdf/NHQxNST4ZbwTIvCT3XWcemHTVpdM3HFo
 mBlcAd+bAufhXTV0Gyc3iFwCLbcSM88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-zp7BYuAMMd-HUSMUzlnD6Q-1; Fri, 01 Apr 2022 11:23:28 -0400
X-MC-Unique: zp7BYuAMMd-HUSMUzlnD6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27B3F811E7A;
 Fri,  1 Apr 2022 15:23:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C377A2166B4E;
 Fri,  1 Apr 2022 15:23:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] misc: Fixes MAINTAINERS's path
 .github/workflows/lockdown.yml
Date: Fri,  1 Apr 2022 17:23:18 +0200
Message-Id: <20220401152323.52519-2-thuth@redhat.com>
In-Reply-To: <20220401152323.52519-1-thuth@redhat.com>
References: <20220401152323.52519-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20220323080755.156-4-luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef7..d8b2601981 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3615,7 +3615,7 @@ M: Thomas Huth <thuth@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 R: Beraldo Leal <bleal@redhat.com>
 S: Maintained
-F: .github/lockdown.yml
+F: .github/workflows/lockdown.yml
 F: .gitlab-ci.yml
 F: .gitlab-ci.d/
 F: .travis.yml
-- 
2.27.0


