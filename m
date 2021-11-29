Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A144617EF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:23:00 +0100 (CET)
Received: from localhost ([::1]:37232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhYZ-0002Cf-6J
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLl-0001MN-QU
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:45 -0500
Received: from [2a00:1450:4864:20::42b] (port=43808
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLj-0006W2-LV
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:45 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v11so37084200wrw.10
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RyIHG7rbgW4Ax4rztavLtHw3c5eLl5GAByR6z8d2y5A=;
 b=PlfctvyAuSm/NmQ03mobkKCoMnJVg+7DfPA0Pp6KIEaM8hsDBm0x3+81xh2X6SRq/W
 yfZMWjbba04U2X3C+UdB5KycwWaMjdUhL2aTSlsR0fHAAC0eD4oWiKe2ZPp7pr49aDQ6
 8NZtWsmsdZOX0wX088spbq+lWnexhZeUTP1gFfl9Wu2SuEL2A/ZEtFvWI2CWpk1IXR+L
 jUTv1Ohiaux7M5ojo1B+FbnrJdxRSLcTWSBW0Tl1z8MSPNfyCEh6cdQ30f+qdZjJ/0J2
 jysTsPuQyAD1ojaq/33wSDv8qXq177KS7t9PwsjhSeOc53gspC21sPtOxFrdR3LDLX8a
 XDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RyIHG7rbgW4Ax4rztavLtHw3c5eLl5GAByR6z8d2y5A=;
 b=olqlWWG+DbVhfBjmROSR/AtQi29Ijv8QrTis2GqwcqkvtQcud26MQR808ArsTFYDI7
 Y5PS8+cUMaaZ4lwmn+kD66+y1h27iZoLd5S2lLlCyiym6DU4lUxVYVdz5X/hA2ko04fA
 tSRZm1liWeWu/EvvHUuwOm7YcdrpiS90/KJhmwV/W5IvSQhIXpqE8jMC2BY9oLeQZaGS
 N6te1uRvcztHFhOXETHawnoRaAXVzxNsOgZJ9fmpuIOBeNTwHUmJbY7y2N6GI89/2WcK
 L3XhOZTR7FliXdRkcp+er2rtNzaTpjFvNXd9gpLCxvHkbsOWQ2wBuLRT86exZazwx05v
 JmBw==
X-Gm-Message-State: AOAM532sP7PJjz/RWutCpimBLDPXT2LdX28GyjlxO/3QjnI2CHjQBxwP
 Q+7XjNQ2dd5vhzImzL68ex+dfQ==
X-Google-Smtp-Source: ABdhPJxMijliy5TF1HjZQVgItOk1ShpyUwe/SomF1kKjkKmb3X3ugvegOFNuG2AfpUWG3VqZ45iFyg==
X-Received: by 2002:a5d:658c:: with SMTP id q12mr34347340wru.34.1638194982055; 
 Mon, 29 Nov 2021 06:09:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b13sm10506316wrh.32.2021.11.29.06.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 84A701FF9E;
 Mon, 29 Nov 2021 14:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] MAINTAINERS: Add section for Aarch64 GitLab custom
 runner
Date: Mon, 29 Nov 2021 14:09:31 +0000
Message-Id: <20211129140932.4115115-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129140932.4115115-1-alex.bennee@linaro.org>
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a MAINTAINERS section to cover the GitLab YAML config file
containing the jobs run on the custom runner sponsored by the
Works On Arm project [*].

[*] https://developer.arm.com/solutions/infrastructure/works-on-arm

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211116163226.2719320-1-f4bug@amsat.org>
Message-Id: <20211123205729.2205806-8-alex.bennee@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f5156bfa7..006a2293ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3511,6 +3511,12 @@ R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
+GitLab custom runner (Works On Arm Sponsored)
+M: Alex Bennée <alex.bennee@linaro.org>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Maintained
+F: .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+
 Documentation
 -------------
 Build system architecture
-- 
2.30.2


