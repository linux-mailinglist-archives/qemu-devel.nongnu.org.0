Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFA3347ACC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:34:06 +0100 (CET)
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4aC-0007vJ-KU
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wi-0006F1-Tt
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wh-0007IN-9N
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso1334067wmi.0
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LoR6KdJgI9L3QJjbSS34AyLS8mbG6iWvfcan+tzTXxg=;
 b=nGw+qVQeuntjzJRrP+ha2+vzGueFH1oxODHuM4U/yBZLNXyiVKr78QaRvWLGaT4s8n
 0AKJcv6yyJyzd/VMKC9W0LkkOIQxDhOOcSDrHefwr/PX15hvAf/2jyZRQoywhoq7BkP8
 i/gr3TKmyCSrRifhO05CfdBjQf6KYYmuFgXbhj2snLw/UvyVoqxNKB+b8xA23+Kg1SXW
 EBKeF5LYiHT7PqrqqG/B3d6x/V4U+mCV6+dlPncPr7KKdHr9ec6unDJN5LNa0et6CtTw
 6gP1u46Znqc/cLFDw2UqFHXsEa7WWfsRaZRqytZzEYZ0kE6rmlOEf+1vQw/Wc+QSCUV1
 Sx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LoR6KdJgI9L3QJjbSS34AyLS8mbG6iWvfcan+tzTXxg=;
 b=eapeWSPXUw1mpYgkuK3LJTkG5UQgW6SVo0874k/v55+fvfe7WhMwJvtobmoZkj5Jx6
 K42YkbA3MnwVHyhoUhWx5860z29YFJw0qkFae3L7yhKDqSsfd0V4Cx9lUANHZcIjFt3o
 3a/hRes6EJFYUlW1BCI6cUYabxVe3LjwjVGqa9mP06ESe4geeagIWBG2NkGsyk9W4ize
 lLEn2j+tP/QSoV+PpmZyNep2tLbp6ylQU/v3dOft/XupMRoc0TiomZmTbw3bCvYVKYem
 WnZbb/DaNoVy/NdTXQgzAcwRMIglARtGFFVrTKpHAEit9LmnGj87e3fjUp3DcNvOO8Nz
 UVEQ==
X-Gm-Message-State: AOAM5315LA1Yc1E0oYh0ZWCD4jA2etWFYJVwf9bvWDP4jbPs/ee6QAF/
 cNGLQaZ4xRVpWmFs+f3E+ZsAAq4Yir2DFOY0
X-Google-Smtp-Source: ABdhPJz3do60GupdtH7XbItJcFDmcmhYpFJlKYi4iywX1wBckYSs9n0AvZxxJWobBH/lYzDrsS2Kow==
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr3266788wmj.185.1616596225927; 
 Wed, 24 Mar 2021 07:30:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j123sm2746986wmb.1.2021.03.24.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DCE5C1FF8C;
 Wed, 24 Mar 2021 14:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/22] docs/devel: include the plugin API information from the
 headers
Date: Wed, 24 Mar 2021 14:30:01 +0000
Message-Id: <20210324143021.8560-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have kerneldoc tags for the headers so we might as well extract
them into our developer documentation whilst we are at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Message-Id: <20210323165308.15244-3-alex.bennee@linaro.org>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 39ce86ed96..18c6581d85 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -63,6 +63,11 @@ valid during the lifetime of the callback so it is important that any
 information that is needed is extracted during the callback and saved
 by the plugin.
 
+API
+===
+
+.. kernel-doc:: include/qemu/qemu-plugin.h
+
 Usage
 =====
 
-- 
2.20.1


