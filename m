Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91BE2646BC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 15:18:48 +0200 (CEST)
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGMTP-0000t1-QH
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 09:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kGMQ3-0004Df-Mn
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:15:19 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kGMQ1-0006BI-Uu
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 09:15:19 -0400
Received: by mail-wm1-x344.google.com with SMTP id a65so5589801wme.5
 for <qemu-devel@nongnu.org>; Thu, 10 Sep 2020 06:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4f+hM45++u5gmHF5wGmAw5i5AWpIMBzMXfEaibABW8=;
 b=sInO4zePqNtT3dsOvWzJnXceYmhdmFcbet9JWP4CH8Fo7MOPqjhaUzatGPGmeTsbad
 XC+RhWLTIFPWUUFjCjrQTKp/C4nL9ahSakMfczblvn8bB5KJCBxkBkjCMYkjfotuyjuv
 usdGYi7oXP/r/MkLOGfin2txQDjAb8Pc2hYLVqo7wTPuoMsm0nqdstSMc6ovyYd6ywqP
 kKHfHiXXKpnAeAmvIzyXkPvI4fI85huHQp7l+/mwxOM8EAQ0jTCcf9Dxny/Aq5pmwB44
 vJIikvvQry+ZFWoq0hBj2Vq+TTG8Qt27XIC4/BeIKeIHqS0kprzVJ4VEiWxO3+9MBoXI
 UCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4f+hM45++u5gmHF5wGmAw5i5AWpIMBzMXfEaibABW8=;
 b=WLWOnHByaVi166k1XHw6T2Rpu1aM5NQrGlR+dJr0e6RJEU2RxmhRw11MUPfQ5JDUmP
 SWm2TnbieMEva+V2pAKaee0Kk8K/bWaI3RHu/tNA0jZfITZ9M6L+Bjb+AQ524Jtj39AP
 3nPC8Uebzo85NYOVqwB79GZSOv85svGKXIAlFuDvAooP05TeoBbhz/53FAHgIpr11WNH
 1uC/Oy6RTYIobvt2XTAfgu9DzMBT8rsmli4tbFJ+yTN7lkQaRjZz3grzORHrlYqUbPY2
 GjFdUkK36pN4VzeX6JkwZmUbLdmpOg3sEcfz1EDG6+x+BxVAvbFCD2cWvpLJsC2wIleh
 7eug==
X-Gm-Message-State: AOAM530UuqphWRHlo+M0U5tDcpS6unWfvCqc/gpZVDrquk2ZGYEDJ934
 40ppj8sQ/yZgOMxTNCuWRRt5X0+lcqsZ/w==
X-Google-Smtp-Source: ABdhPJzAqqBQYGBXv+XXGG1f80EiahC9zaTUecPedFDyWjijger5Om9XYPi9SSA/3j24WcheimwOhA==
X-Received: by 2002:a1c:2e4b:: with SMTP id u72mr14905wmu.69.1599743716478;
 Thu, 10 Sep 2020 06:15:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c18sm9469436wrx.63.2020.09.10.06.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:15:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 074F81FF93;
 Thu, 10 Sep 2020 14:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/10] hw/i386: make explicit clearing of pch_rev_id
Date: Thu, 10 Sep 2020 14:15:01 +0100
Message-Id: <20200910131504.11341-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910131504.11341-1-alex.bennee@linaro.org>
References: <20200910131504.11341-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some compilers (notably the Xenial gcc in Travis) fail to spot that
this will always be set if pch_dev_id != 0xffff. Given this is setup
code and using _Pragma to override is equally as ugly lets just remove
the doubt from the compilers mind.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200909112742.25730-8-alex.bennee@linaro.org>

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 32b1453e6a8..33fa035fb7f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -930,7 +930,7 @@ void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
     struct PCIDevice *bridge_dev;
     int i, num;
     uint16_t pch_dev_id = 0xffff;
-    uint8_t pch_rev_id;
+    uint8_t pch_rev_id = 0;
 
     num = ARRAY_SIZE(igd_combo_id_infos);
     for (i = 0; i < num; i++) {
-- 
2.20.1


