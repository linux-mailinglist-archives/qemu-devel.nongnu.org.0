Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110043874F4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:21:08 +0200 (CEST)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livuV-0002aq-16
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhR-00086u-CE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhP-0005Vw-GY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id p7so5598465wru.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOubj9I0hfuhKMAhvEchXd3pEKvLduIygi3tQKq1LBQ=;
 b=lXSVAMkf304Cu72vpEz3mLWiGeWK0Q58MYdQBQJ6c+mGuiPMZNVKHoGEtGBSItr/7e
 oeDnbd84DJI9EVESnxFia0IQdwwTVA8edwCGJOyzothfXxu56o+67ZxkPW+BQNS6rX/G
 EuWj4DT+dMx7R4QfJ55RTqbR5WNUxM/w6ZJ5DT4shMuO/7vx8eDnPMo69t/TXn8H9pbO
 PLhLTzNU/otTsUc8ruEdGAxXgQLOSdTJsCixjfPSL70izsXWgWio3u5W3hUzvJ+AHDLv
 Q8gGWy2v9UvE/CJd0HE/JXyTrTdD2x5ToleN+Wcuit4EYHrPdTepfz8aWa6lMoTPA5rK
 z1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WOubj9I0hfuhKMAhvEchXd3pEKvLduIygi3tQKq1LBQ=;
 b=jfHxki+J2u7ySOvQja0GVXABjrLCkamSwEm31yfHa22wvalk4C630wxYTdbNc3L+Vj
 l0HoWCbWtz3IpD9+HASiV5PM6bT69D3qbIuZBFsAtK6I2umrj1i3DUllsdQHNRNtqNhU
 URR5g9ovFa/kKaHiaJMVidPwliT7aefcHscfNCdA+uOTHYnpr3yTLOzoz0ODNIbIvLO+
 hg2qohzgxsrV8y49RgVizFzzWp212yNoGNihdmS3Wr7miOPN3mMlAoma1rnHVKKKfr7o
 Of5sCDTa2lwa+3YM6lwW2z0QioTGugEyMG1JguyI6+Kf/dLlV4IUoIJpj69RLPmTF4qH
 zS8g==
X-Gm-Message-State: AOAM530LPGDDMvUi+MJ7vFIuGPVzX7w5u8dJptv1xrs24ekYi76RQHmx
 Xf80vvzDRMNH9yNmtSUwQCndvg==
X-Google-Smtp-Source: ABdhPJx9yZElX0dHmf/FVk0pZzskJPq9sOVEsyvOgk1R3uJO9olsWtiSnMd44U7UTLOC5Tc9PRT1ww==
X-Received: by 2002:a05:6000:2cf:: with SMTP id
 o15mr5508177wry.243.1621328853443; 
 Tue, 18 May 2021 02:07:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p187sm6411406wmp.28.2021.05.18.02.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8118E1FF92;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 06/29] tests/tcg: Use Hexagon Docker image
Date: Tue, 18 May 2021 10:06:57 +0100
Message-Id: <20210518090720.21915-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Split from 'Add Hexagon Docker image' patch]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[AJB: add container_hosts]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
Message-Id: <20210512102051.12134-8-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 8f20ce065d..cf6062a15f 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -128,6 +128,11 @@ for target in $target_list; do
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
+    hexagon-*)
+      container_hosts=x86_64
+      container_image=debian-hexagon-cross
+      container_cross_cc=hexagon-unknown-linux-musl-clang
+      ;;
     hppa-*)
       container_hosts=x86_64
       container_image=debian-hppa-cross
-- 
2.20.1


