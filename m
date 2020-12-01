Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CCE2CA092
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:56:55 +0100 (CET)
Received: from localhost ([::1]:57644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3L0-00066r-Mk
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30V-0002eh-DB
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30G-0003tf-Lt
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kSjg7m+HaAHtujriKl1vHsebKVqWjUJdu+/lbf1VQG0=;
 b=DPd5WP1xJgG6iZlkI/gbpbH4hcmCG64JGOZ4TrSfZdau9LjNuxElVfsvy+6bzSqqasiFIq
 2/MEOV0sSPwV/AJ+HBmqiQMglq9bZNQFRl0cb9Yk7zf+z8gC7vKBUeL6sq+qVy4JqecSNk
 d0ZOxOa92fquDTjgZ4aKoieiHuGUthw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-Gg1C_w7XNiSACDxeCtJpnA-1; Tue, 01 Dec 2020 05:35:18 -0500
X-MC-Unique: Gg1C_w7XNiSACDxeCtJpnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42E7C805BE6;
 Tue,  1 Dec 2020 10:35:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA5AB60BE5;
 Tue,  1 Dec 2020 10:35:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/32] scripts: kernel-doc: use :c:union when needed
Date: Tue,  1 Dec 2020 05:35:00 -0500
Message-Id: <20201201103502.4024573-31-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sphinx C domain code after 3.2.1 will start complaning if :c:struct
would be used for an union type:

	.../Documentation/gpu/drm-kms-helpers:352: ../drivers/video/hdmi.c:851: WARNING: C 'identifier' cross-reference uses wrong tag: reference name is 'union hdmi_infoframe' but found name is 'struct hdmi_infoframe'. Full reference name is 'union hdmi_infoframe'. Full found name is 'struct hdmi_infoframe'.

So, let's address this issue too in advance, in order to
avoid future issues.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/6e4ec3eec914df62389a299797a3880ae4490f35.1603791716.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-30-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 524fc626ed..b95bae3654 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1092,7 +1092,11 @@ sub output_struct_rst(%) {
 	print "\n\n.. c:type:: " . $name . "\n\n";
     } else {
 	my $name = $args{'struct'};
-	print "\n\n.. c:struct:: " . $name . "\n\n";
+	if ($args{'type'} eq 'union') {
+	    print "\n\n.. c:union:: " . $name . "\n\n";
+	} else {
+	    print "\n\n.. c:struct:: " . $name . "\n\n";
+	}
     }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
-- 
2.26.2



