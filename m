Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E88495FDC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:39:59 +0100 (CET)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAu8z-0001dz-VO
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:39:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtZ1-0008OB-E4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:01 -0500
Received: from [2a00:1450:4864:20::335] (port=43522
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtYv-0000HO-Mc
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:02:44 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so22265760wmq.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 05:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QHeqOg1fCgtx7ni/iHjS3u5wy+2uDfP4jJvs5BysbmY=;
 b=mc+yvOnEBJi5SSRmjjhU4qgQpVtcPaWJTBXmgs2/fPaO/ZujHFqBx94rrm+j1E8wEC
 aF/VYqil7dpumVajgBt6C0tPYRJZmTWtb0aRTTOi8/v39PQmcP7TM+9EVfFOoTjug1jw
 oVdKSyVhzY4Qx51QSP0H7gghNtkr9azAUDW7RbqqhSbkRBuBNa75kt+RsD3ARa58++VH
 UEROUoXU4gYyOW5x6i+fl1WFjDzdsSqWFsHNS20G26ZN24duV7oOQ8MPpPquuwvJfRHp
 QAKxdntAk+Y/pRAbPDAHOWomI6JpZgpMii3j+3Rscso0MVxGf/jwcQpSXKKDq4Fu7Mgk
 Yz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QHeqOg1fCgtx7ni/iHjS3u5wy+2uDfP4jJvs5BysbmY=;
 b=GTlBNTNhkR0D5M2cl0hIkXetzpYrmNwa+NU4CzQ+lYUBqfomMLS8TYCUugCZkh3Gnv
 ZXNyJTtqPtjEXGCoaBcssG1JmVeU0Y2G2WF0M7q8iFsIIQhfW4yB5HcZW4jOJsP5rtlP
 v9pDi1LN+1mPZ06BzFgCDE8asTyXnNpTKJdbCoCgmg36Zdcm/jjp+79zSVA2bmW8NKoI
 vSxVmG4fwznltaZYxweiPIWVe7tlxuuTsdPG7T5xY9qhHlAoCxAYiVziOuhBxFatZ97s
 RQYg3lSbfq6bIN7JzVy2kYHneRAIE2qShq5PpI5bjPYL8DN5lP6Yy1TttmwK6ww8wZ79
 BwmQ==
X-Gm-Message-State: AOAM531G4iXlkE9b+WlfyDFCTvkMPGKkmR+Izp8etWycy4XcHiBgaPno
 m8ydJ7EZyWXIUXkAbg8vON70MQoLZHE=
X-Google-Smtp-Source: ABdhPJxr/6mViFnjgUViw2Bjlp1uNQFPbVOstGhWIY0U8HCnJVSGWmZIb21L0S5s30a7T2vB5xejGQ==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr3699076wru.645.1642770154777; 
 Fri, 21 Jan 2022 05:02:34 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 12sm4937637wmf.18.2022.01.21.05.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 05:02:34 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 2/7] gitmodules: Correct libvirt-ci submodule URL
Date: Fri, 21 Jan 2022 14:02:17 +0100
Message-Id: <20220121130222.302540-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121130222.302540-1-f4bug@amsat.org>
References: <20220121130222.302540-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Correct the libvirt-ci repository URL to avoid this warning when
cloning / refreshing the submodule:

  warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/

Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitmodules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitmodules b/.gitmodules
index 84425d87e28..f4b6a9b4012 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -66,4 +66,4 @@
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
-	url = http://gitlab.com/libvirt/libvirt-ci
+	url = https://gitlab.com/libvirt/libvirt-ci.git
-- 
2.34.1


