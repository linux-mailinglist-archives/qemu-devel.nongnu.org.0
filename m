Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4CD376756
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:59:00 +0200 (CEST)
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1wR-0006F1-3m
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1iH-0007uG-To
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1iD-0000t3-9r
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTsvX/otw5M7TG+3dUKEvSePlS48V26N+Mr55ie/fDA=;
 b=Q5ALLYdqkbtvgdor1xU7NN1i68mFvzcPItsP3k01nAsChVoqNSOcxtWtpzaxNJNerZy4VN
 2nEISdhu35UBcIM3Rc0Wg5xk0vyZW7VKhsZ/EsfhM+sm8D6NkcL7dYTHL+8WtNLHfAGg3X
 Wvh3nXq1tF4B9ONIQiefn0Oq/dRfcXg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-o4OMZ7OrNzuhMTx99WkZ1g-1; Fri, 07 May 2021 10:44:11 -0400
X-MC-Unique: o4OMZ7OrNzuhMTx99WkZ1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso3990950wme.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LTsvX/otw5M7TG+3dUKEvSePlS48V26N+Mr55ie/fDA=;
 b=SXwO/PkIakUf/iA2+KIwmeSr4PrYJRokZhLdwMRBeXaYdNrHzEVObkPMZnusFL2BxK
 UR4jc51/6MtqY/mDHVB5sxqKyq4vgh91ZfbRdzPG9OlFgl/Kt+UZT8K7GXsgWmQwAJME
 Sd+LOR1LVLNB04LiJT7wf4gKBxzv6nw97y+D6Bkc7iZT4pI3oloUJDfZZ1LZtYYJrKTD
 OkqObC97gWC1BU4hCNnoJGpwYBcf/oJXi52ycV3Xi8t6a21fWczelNzbinh/Fasu2TDB
 v8bWYuXMLKLUt/KYpuMpylJnn7HhB3tcUwcJ6Zaj2A569cZ9LWqQEDZuLsOt7w65vY8W
 GWcA==
X-Gm-Message-State: AOAM533y9Qfh7ccSUCOjQa0ndsCgHkzDA4WmrNmMGQ5zQbSdNOkx4olS
 UdVbKDeyrTUCnht8C24fkTufPLR1kfGlbBK1bR/jke8fPsl8R6AWMglWqAEjxZRm9enhQBf7UXx
 d+RJpJiYorXYsFrCJtOF+DY94/Gsd6ER/5+1AAFkvpUdGfc2ZmZghFCgJaDispKpj
X-Received: by 2002:a5d:498c:: with SMTP id r12mr12851521wrq.31.1620398650447; 
 Fri, 07 May 2021 07:44:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTUSY9yat3Yq68EUlkMCcRoADc9UMIi0CNyQErfTSuxO4A4BB59fJXUwarlSImz3l6WDzCOA==
X-Received: by 2002:a5d:498c:: with SMTP id r12mr12851489wrq.31.1620398650237; 
 Fri, 07 May 2021 07:44:10 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id w25sm6720771wmk.39.2021.05.07.07.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:44:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/17] backends/tpm: Replace g_alloca() by g_malloc()
Date: Fri,  7 May 2021 16:43:09 +0200
Message-Id: <20210507144315.1994337-12-philmd@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace a g_alloca() call by a autofree g_malloc() one,
moving the allocation before the MUTEX guarded block.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 backends/tpm/tpm_emulator.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc1934..9553cdd891f 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -123,12 +123,11 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     CharBackend *dev = &tpm->ctrl_chr;
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
-    uint8_t *buf = NULL;
+    g_autofree uint8_t *buf = g_malloc(n);
     int ret = -1;
 
     qemu_mutex_lock(&tpm->mutex);
 
-    buf = g_alloca(n);
     memcpy(buf, &cmd_no, sizeof(cmd_no));
     memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-- 
2.26.3


