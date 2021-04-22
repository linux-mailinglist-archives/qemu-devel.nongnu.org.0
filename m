Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24D4367A09
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:43:46 +0200 (CEST)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZT3y-0006zJ-2f
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZT1v-0005pq-Pv
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:41:43 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZT1t-0008Mn-MA
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:41:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so2493099wmh.0
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 23:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d4HDeJyPqjZEzODBtmbe1jNMuACFjo+tIKMEPK30PBA=;
 b=PVi3GfVVHTfaB4E9nDcyH/TnuRhH+z6YHa3ZHCvkyU429HNhqbLbnE/MM/JKoXsh97
 K38bZHcA4kHsrN0+EJAqWs0CvSYzyTlsRfoxBXzMqoACubQ9pFHLk8/174ssvPubHx7u
 10wj3titJbwXVFuHL05kn/Qa1D8S46JbL49vhQ7xto24zH6vbJfCHZhYJ0SX8arrYbyX
 upk36553UOvI1JvuuK1su32ABnxCp3p3cb6VDPADQCf3nx0DL4jUuVnCNYhZtFzJCmV6
 EQ0Pb4WvdJR3X8r8M0cl0Uc4X0WerlLRKseprjdNnRNC3HTz9xWap0WzDABWF6IgC61o
 n8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d4HDeJyPqjZEzODBtmbe1jNMuACFjo+tIKMEPK30PBA=;
 b=cYx/uXnrMCS4ZKRTIR0MeHXP9tC4Me2gciSA1ea0GcdToLEzco2Cl6xd4O6oeI4yRf
 mv7EpieMlGMehaeVKZg+0moDQ/Wl7sy6fkvraltHB+ob5Bsq1kaLXUx+pKFxPaOo+/fB
 ysv86rxI5Chlxp4AEBeNz0F5gBh6Yt8XfZJdzTXz45s4DOCh1rg1TsBmDacha8zg8GOo
 hMZf/NddJ420cmMQe/UcAegstb7mL8tJYD12aEYR2Jkz/dttx94oEaxAuo0ufxBjj/c3
 HthdhA84Ybh2V/rSL37csZG63n5ipZoUy+tYj7I4ikWxy7QsILY6YJ47fP+7qjZQBSky
 U7fA==
X-Gm-Message-State: AOAM532xkCM+kiotw7xPQeuNklPsgxp+t8oLpLyQy2tHbQyH/ywH4H0r
 ZcAedjHuw97aLZvu0i3qupX8jWNT2GHRtA==
X-Google-Smtp-Source: ABdhPJy2ChX5BcAMdlgK4braELJa78ZirW97DUYfa6cU4zimSAqOMRSqdb+e1l/h1Xxed8GtmlhbuQ==
X-Received: by 2002:a1c:f701:: with SMTP id v1mr13823404wmh.69.1619073695472; 
 Wed, 21 Apr 2021 23:41:35 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a7sm1968978wrn.50.2021.04.21.23.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 23:41:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] MAINTAINERS: Add include/exec/gen-icount.h to 'Main Loop'
 section
Date: Thu, 22 Apr 2021 08:41:27 +0200
Message-Id: <20210422064128.2318616-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422064128.2318616-1-f4bug@amsat.org>
References: <20210422064128.2318616-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the 'Main Loop' section covers softmmu/icount.c,
add "exec/gen-icount.h" there too.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 36055f14c59..b91419ef08d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2445,6 +2445,7 @@ F: ui/cocoa.m
 Main loop
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
+F: include/exec/gen-icount.h
 F: include/qemu/main-loop.h
 F: include/sysemu/runstate.h
 F: include/sysemu/runstate-action.h
-- 
2.26.3


