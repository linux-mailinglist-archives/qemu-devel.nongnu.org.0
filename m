Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB965BCD5F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 15:36:17 +0200 (CEST)
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaGwa-0007aU-AY
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 09:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaGeU-0008Om-0b
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaGeQ-00068x-Ed
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 09:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663593448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+qG6qdgR8Jto65cTPgnYEY9MvMDpxeVZ+fynp1vP//c=;
 b=Rhjl+9/8dcUtMF27tyiGGmQCE3O4tO/hYHHy54/4G/1mRubxwhqaEJqcr4eRLiwCHkPtKy
 K2LX3TRYY2TcKnD+C2KHOywOjfadQHkjUxPrUMfBeKHA8H4jgFS97E/gFMc5Jbp3Lz1VTP
 iL1jKRIhwTEnHSDiTk1p5Y1zMO7xEiY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-e8cbMtN_Mc2Z1QQ7htjPrQ-1; Mon, 19 Sep 2022 09:17:26 -0400
X-MC-Unique: e8cbMtN_Mc2Z1QQ7htjPrQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adfab11000000b0022a44f0c5d9so6224830wrc.2
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 06:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=+qG6qdgR8Jto65cTPgnYEY9MvMDpxeVZ+fynp1vP//c=;
 b=CMgKzpc9+xGmAzNLNbbizIWLkacq7/otmjmQXg8DMogOP146v99ItwFGBBBFRrAI00
 315HjnwXHmm+VCezvVqtnLue2bEIGE+TsEKxYRTlexsPACDx+eq3Kw8m/4Eff1H2To0/
 ozrF/W0IDIjzCxuvSj4T7BbXxcMrS1ORDjNfsqOb7YMOZx06xojgkLAcufBHtk+QyH8w
 ixuMq+EqnNLw087DLqUazHbGBkkSIpHflhUG/QQSJFhA7lklNtOZWzqyLzXlr8fyirYZ
 S85YlF3hkiSMHb8IDPQ21dCjlWaYZ2/oj5aFusYqg6uMXEjjvbwhRXyItzUcDj12YPvJ
 q77w==
X-Gm-Message-State: ACrzQf3/wNf7e8/LNkKhHZW2WEIceTfaoLADNNxNJavBJ7rZ5Qnp3qn3
 0ElQkyhpM/nToZS6ZtVrtEdnculEYeJaBeVzBikNY+2a3qokLqy6ixqqJJwgtS4kyo56qmqWZd/
 lZvwJZfmGN/WA56Ts/BeIRc9KtLzc8zCdRM34OrZrhvfzGSnX3raG5gsWvN8RFT2EqlY=
X-Received: by 2002:a5d:504c:0:b0:228:db0e:a4c9 with SMTP id
 h12-20020a5d504c000000b00228db0ea4c9mr10922301wrt.272.1663593445230; 
 Mon, 19 Sep 2022 06:17:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JSqAKejA9lMUUgRVLx/bBnwUFsVQ8ne3sRuIaRY3kR7zifLd/6X6QNNtKcaEv+YMcYuK3Wg==
X-Received: by 2002:a5d:504c:0:b0:228:db0e:a4c9 with SMTP id
 h12-20020a5d504c000000b00228db0ea4c9mr10922269wrt.272.1663593444623; 
 Mon, 19 Sep 2022 06:17:24 -0700 (PDT)
Received: from goa-sendmail ([93.56.164.28]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c1c1000b003b492338f45sm14955302wms.39.2022.09.19.06.17.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 06:17:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build: remove extra parentheses causing missing rebuilds
Date: Mon, 19 Sep 2022 15:17:23 +0200
Message-Id: <20220919131723.73749-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because of two stray parentheses at the end of the definition of
ninja-cmd-goals, the test that is last in the .check-TESTSUITENAME.deps
variable will not be rebuilt.  Fix that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 13234f2aa4..b576cba5a8 100644
--- a/Makefile
+++ b/Makefile
@@ -145,7 +145,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
         -d keepdepfile
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
-ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))))
+ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))
 
 makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
 # "ninja -t targets" also lists all prerequisites.  If build system
-- 
2.37.2


