Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3563376740
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:52:01 +0200 (CEST)
Received: from localhost ([::1]:52470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1pg-0006PQ-KR
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hr-0007hb-Qs
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1hh-0000hd-Mq
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Q+1JmkmHePwynNhULjY5tlZHv+f3d17hAW4SIJc660=;
 b=T4RiVvDIsugnH8QYf7EtaNA6TDsGSgyjnEhDhhIe6sXlCOL/k+zkJwt+Rxhq20rM8PR3ko
 gJyP35CVkwehN5RfafacaQhNg6tR8RPMlXMN+Q4rQIS6C+FAI084drmPNP64PgSnqMJOF4
 EGUA2uQh+U7oPfTuKYux0OTT+uWZGUM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-OOUbTT5DNKS9HXWrc-s-Mw-1; Fri, 07 May 2021 10:43:43 -0400
X-MC-Unique: OOUbTT5DNKS9HXWrc-s-Mw-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so3654274wrm.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Q+1JmkmHePwynNhULjY5tlZHv+f3d17hAW4SIJc660=;
 b=ZVVgMt7xNGkZA75wnbiArWxNhY187UJXc22PCSCkkSBU2OX17qmBYMO2F1I/NyLkkD
 mrXl2xBomfRXXnjxHWU/quY+hrqLiXhZgjWSCPTuVfE5njYVRmzCffSXy14aRz7mHeEP
 EWBcBXIHMfZFT4tKSSvBX/SkyegAQBZxROblZHuiSuxAPz7MlIyUQECtuoh2glsea86W
 ZWVAAUKGToQg9B70adXnvi/CLARy+IeBV/pSfJUtIedT5a2Zk4reok2OPzvOpKfUNWZL
 fb5s9Sl0RQ+aeUfqviZ/jHs0nY8n0AHDziNYxsolwA+HrJuWK++AbL3uBjGy2P+CBK0J
 EmcQ==
X-Gm-Message-State: AOAM532lW92EeFU2HS1YAu+aSnZERMkaWkisno2CJq/2qxOfdAHy8aut
 x4zFvQBuRGV2RrF7P+pIp0qUVF06tGXRw/l3jOGv0/4k/KxXWmF6V9yVAW0rajDprAy0U99k48T
 7inIPt5eIEkg+sCzghvZ29OvHPGUaYCp/aUApS1xN6yiHtzrWZa7d18oydsYKrKGj
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr12745262wri.366.1620398621603; 
 Fri, 07 May 2021 07:43:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq+8a9eTWd9LLo0lKbFnav+n6uJJCUttMkNpC1ladPYpd+vHRsfQgfmgc2chAdH48leiYagg==
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr12745233wri.366.1620398621414; 
 Fri, 07 May 2021 07:43:41 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id i2sm10411140wro.0.2021.05.07.07.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:43:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/17] linux-user: Replace alloca() by g_try_new() in
 ppoll() syscall
Date: Fri,  7 May 2021 16:43:03 +0200
Message-Id: <20210507144315.1994337-6-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2fa6b89b3de..0bf4273fc7a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1605,11 +1605,10 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
 {
     struct target_pollfd *target_pfd;
     unsigned int nfds = arg2;
-    struct pollfd *pfd;
+    g_autofree struct pollfd *pfd = NULL;
     unsigned int i;
     abi_long ret;
 
-    pfd = NULL;
     target_pfd = NULL;
     if (nfds) {
         if (nfds > (INT_MAX / sizeof(struct target_pollfd))) {
@@ -1621,7 +1620,10 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
             return -TARGET_EFAULT;
         }
 
-        pfd = alloca(sizeof(struct pollfd) * nfds);
+        pfd = g_try_new(struct pollfd, nfds);
+        if (!pfd) {
+            return -TARGET_ENOMEM;
+        }
         for (i = 0; i < nfds; i++) {
             pfd[i].fd = tswap32(target_pfd[i].fd);
             pfd[i].events = tswap16(target_pfd[i].events);
-- 
2.26.3


