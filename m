Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FB376752
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:58:03 +0200 (CEST)
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1vW-0005Ia-3J
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1iU-00080V-Jy
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1iP-00010r-Ez
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCw70biCZtmrujveEn0uP9uiPeh7MzcdOYuA3fJ6mTo=;
 b=HUWWL7eg4mmxqZTApji8l28Ldnju2ZLtC0eSGAohTRiG9/D5/aasyDII3lEa2EjdCl6Zo1
 +CoxQxwqSIpuRZ08c7ZRlHmP3hnQfaJ22Qvd6Sz1FCbStUZwISs6WcqmXK8qJAoq6mX2KY
 +52ywsn6HtwAVdw/hH4sISk58P8ZxyY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-Bq-Unt5-MW2RnpMGEbn7wQ-1; Fri, 07 May 2021 10:44:26 -0400
X-MC-Unique: Bq-Unt5-MW2RnpMGEbn7wQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso3984717wml.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCw70biCZtmrujveEn0uP9uiPeh7MzcdOYuA3fJ6mTo=;
 b=WVUUMoBTzP0Q6QyF8Sj4FcQMj/RAbGbC6LvK7BaTHDDxV/CxnCYIDSot4L9z8popkq
 qt4ERJzYQwPo8j1/CeilXgXPbTU+yuwevA2nIkM4e8O2zbwlAznUDb5xlBBJFEACLPlT
 sqeVxCLmqUtA9wfki9uNs4KGnj1VQeTJNNIT+heEHG5OZJcHqhKySQUy5Bjd2X12IXbA
 9jMHG26vd6xaEnv8HU2UaH0zUI65H0YNHqjj8oqO7OF+BDUEINib/+uZVRfRVwPYbBtU
 UKi0UUYL/998qJgKnz7Nv0jadYejP8To1giMKp7PtaJX4r/sgRhuYWl8qUeHpOyyal44
 sQ7g==
X-Gm-Message-State: AOAM532qlCF3wo+w8ZqRRVHSXHRI7YdR3EJTKCiY4xfIAkmSewIhjtkn
 9ZleHWeAnFdVJ/FCmrh1fdUX10ng7j9kYy0pz+0f5z//pucm/FllktGg1C/rs/04uEWfFk+tucC
 qaecEsVlc/ebLmJIN11pVrAcpBCivGyQvH3GQKM3SYQCl20UyMf0E233NZMia9pXU
X-Received: by 2002:adf:eb82:: with SMTP id t2mr9296103wrn.337.1620398665189; 
 Fri, 07 May 2021 07:44:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSRPyNjkkgTHtIXUz9NIoTTHnH7rmh5hjO3wk8/LS9dlME7+ZDoSyRfzMsFicSB1f9FbtI1A==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr9296078wrn.337.1620398665044; 
 Fri, 07 May 2021 07:44:25 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id l22sm12827268wmq.28.2021.05.07.07.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:44:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/17] hw/misc/pca9552: Replace g_newa() by g_new()
Date: Fri,  7 May 2021 16:43:12 +0200
Message-Id: <20210507144315.1994337-15-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead, replacing g_newa() by g_new().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/misc/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index b7686e27d7f..facf103cbfb 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -71,7 +71,7 @@ static void pca955x_display_pins_status(PCA955xState *s,
         return;
     }
     if (trace_event_get_state_backends(TRACE_PCA955X_GPIO_STATUS)) {
-        char *buf = g_newa(char, k->pin_count + 1);
+        g_autofree char *buf = g_new(char, k->pin_count + 1);
 
         for (i = 0; i < k->pin_count; i++) {
             if (extract32(pins_status, i, 1)) {
-- 
2.26.3


