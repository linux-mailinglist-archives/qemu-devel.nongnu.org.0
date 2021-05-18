Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A639B387542
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:36:23 +0200 (CEST)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw9G-0007Jq-Oh
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livpC-00057d-MD
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:39 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livow-00012M-66
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:37 -0400
Received: by mail-wr1-x430.google.com with SMTP id d11so9344579wrw.8
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Agdx3G/Ci/HmPNt/TIfwdrNu8lRgFz7owXgkXOV3/r0=;
 b=sC7DO1SCnSM9+8djo2q80o2jS2TVj4z/hoWtUbIgQrqdHFIrmqfRzAKw174EvSE2Fc
 MkPlCLtCSFE7MKuopDYHgc9/rN8wpJyskvWTwUDTekLvv8MGVj4kg+amaSIn3269t9Or
 LztXsX7kzVzOq3EhCiNgb0baW0EFwJITF1dtS8qHcvsFWRuzq9abCvUt5EZcRXgmh2Od
 LmGUaDL1gFJPKxVubF3CmQtHzQxlAcRCXG7Eu8qZ5YioLkAyQPNqAaFuPgqkTTTTn6yM
 1tLA706/1cN1v2kIaH9kKt9KWVk/zmaI9q93t6ZuwgJlm1zGziPbkqIvnFGzvhMftqt1
 Hr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Agdx3G/Ci/HmPNt/TIfwdrNu8lRgFz7owXgkXOV3/r0=;
 b=IcFsqdKLYtPfDLsBRdBCaq8Myt4pkbVJ1hor/WxgwihXnE3XgK9CEd5KmQWxTrYBhW
 uy76KFR02MEsxZPYEcbO11jpw0hxfTHHDGEVbFbv+WThLNUaQ+9eqMPArWqBXvZNG5H7
 BbfQVHquDM6bm1yQaW7jaz0s1ivHXXYjjiPRjP4CbGjLvoja1ZBm3spuzpyMEAR7rOVo
 lxJqL3uqBqTHjGMw2m4MTDpmA1D7rQzuOfo4nK1mAq8G92G0yDHXBM2RFGwy5CFfOx/r
 CBpADVSZjg/DRUikOh4rOWQk92z76UtmfY4X5YkEOokELVD+422DQV0Qfv8zEoKWXSAm
 O4jA==
X-Gm-Message-State: AOAM530cvg8nM+Eg6cFAJYTwKyUmUNQhD1ypyCu6sEWlkEIn7L41P5zn
 hXVWBqCIujdLfHtqo7fXD9dGFw==
X-Google-Smtp-Source: ABdhPJzw7UQo8QsuaN14klaqAFMHr5zUz5wJ/12dEO6ea6A8gCimWF2NWdL3+hkjl6rJKVmuevuRLQ==
X-Received: by 2002:adf:faca:: with SMTP id a10mr5610502wrs.9.1621329319796;
 Tue, 18 May 2021 02:15:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y14sm1908548wmj.37.2021.05.18.02.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DC8D1FF9D;
 Tue, 18 May 2021 10:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 14/29] configure: Emit HOST_CC to config-host.mak
Date: Tue, 18 May 2021 10:07:05 +0100
Message-Id: <20210518090720.21915-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this is needed by the tricore-tcg-tests as tricore-gcc is not easily
available. Thus we rely on the HOST_CC to do the preprocessing of the
tricore assembly files.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-6-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-16-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 0e4233fd8a..df11c8bad0 100755
--- a/configure
+++ b/configure
@@ -6164,6 +6164,7 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
   echo "CONFIG_IASL=$iasl" >> $config_host_mak
 fi
-- 
2.20.1


