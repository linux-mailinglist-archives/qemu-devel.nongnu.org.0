Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB8445ADCA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 22:03:17 +0100 (CET)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpcwe-0001Ra-Iu
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 16:03:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrG-000296-88
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:42 -0500
Received: from [2a00:1450:4864:20::435] (port=40868
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrE-0006Nz-M5
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:41 -0500
Received: by mail-wr1-x435.google.com with SMTP id r8so187518wra.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBN1thr4DbsWscceeDNQ1S5QjZOFYsoqFTbRgiy3bvY=;
 b=UlP7ZU/y+i03eDZtijPjXGrmhtWML1CfJfgROhdb61AYtcBWKoKpiTWoUK3Uns3cSr
 6G5rMCLgxT1ksA97MZ0pBprEcHhiO01dqk/+nKbo3VW9fICKbWmEYQyuCftBL2LIip/q
 /XvSRJBlQb84rkGMfE4MDFLMzhTJg5jR1oHe5Ctkj2BJu5i8rYC3up2T5LEZwuMMKUQh
 5tQAdkazx7YGexX/QX1oeozHdXRXzkYwlTO9MRonFx554gLbCTJeXq68Kpk3lQqcg06u
 dHJUyHTh+HaYce4FBKitbdnCCFTl7s373nab4NSHxwjG9A01D0XSX9voNruboMPBmjto
 wbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBN1thr4DbsWscceeDNQ1S5QjZOFYsoqFTbRgiy3bvY=;
 b=BU9OnvHpwoDI/yGDGvQkUBczwyGd8Vpi2qZPt7I7MK6xNPsdtjrdlgcGnZxGcS4RS6
 hLDDoraPZGbT9xY6Eh6C9aU5dJd4BICGzGhlIfk91RiiK7LlHxXbzy+boLrsSOCZvRcH
 PTrlU39ERtweGP9QVsCKXsCZ3IvKxRtCL/9pbWcmCVkSL6VipioV8XMtGZocsMskFOHB
 FwUAl6Xmp9AGVyAYTQUNNxWDUbnbekaeoZQoBkJYIfEK39o5Gh3UKVXUyKQJpw9e5nUU
 aa9AIzh0f6vszr4exgETFtZDtF74xmrB+Hd+lgPOEMy4D/I5uiNbYSmKhgdzG3fQEODx
 /eaA==
X-Gm-Message-State: AOAM532AHzS0nCFPhDVatWmNnMFLu3HvQ9DLhy2ogiyLyJkC55+HMd8c
 C8Q4AktwYuGYFIU6PkDdgce/Sw==
X-Google-Smtp-Source: ABdhPJxCmLMzthoncX29lC7fD/FDT50mxLTEfmKcYKrVsk1a1CWz3DQSW5WSjvPAWwz8ko8qxify3A==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr10481928wrt.122.1637701059344; 
 Tue, 23 Nov 2021 12:57:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d7sm12611253wrw.87.2021.11.23.12.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A5EC11FF9E;
 Tue, 23 Nov 2021 20:57:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/7] MAINTAINERS: Add section for Aarch64 GitLab custom
 runner
Date: Tue, 23 Nov 2021 20:57:29 +0000
Message-Id: <20211123205729.2205806-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123205729.2205806-1-alex.bennee@linaro.org>
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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


