Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A7B4AF606
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:06:54 +0100 (CET)
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpUb-0002nF-9K
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:06:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnll-00030P-E6
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:30 -0500
Received: from [2a00:1450:4864:20::62b] (port=36591
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlK-0007s0-Cc
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:18 -0500
Received: by mail-ej1-x62b.google.com with SMTP id u20so3442054ejx.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vf9iTlTyab3aq8/aOgAjLPkNDIjXIy+BHgS2c00FPUI=;
 b=NKehSxMJ8BRqpMuqTRhX7kh1DfAXSkZSQFbGKjiFZyhDU97mdnAwcXomCSOPEipUw4
 aQwyOQRoe6Eiun2+WaaCfOFMUI6jDuDJ4mn9dBfkNnnV0y21MIobVb1/PKSFXNJTEdom
 Hfavo1u2W6Z5WSzDGIyTPQlOVko3MPOcx9koxhjYYlJQ2sNIzt5CWTmbgHC4XotX5jt5
 LvflX1ZTfMV/XCxm8pVb4qI4hSz5EwSRhsby8tT7XCuSW4urYMLgSJTaNURmRp/+b2yt
 P2gTLCTwkwmxCnrgvRWaWHEcYX57CRVftiqgokNbkWedHOTn5XDdrYVYqq+BXwY2cwvh
 BMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vf9iTlTyab3aq8/aOgAjLPkNDIjXIy+BHgS2c00FPUI=;
 b=F4kI2goemo/aipUdfJdLOOKcsHWWpo2TP7TppJsM4TBgYTLmyNLtt1kgCCCcAdGnnb
 xulobLfBHcRZDZ002oXAmwFqXQTY0CQw6cdLF6QWv32y8I8usSjxx6Y6j1x9CQH6r3u2
 tiW8VnKzP4EwOtTIHMYGtsF9cYqKpTO633QcZFjFzGthLVlGg0eyB6cArkmKR8cQuyxU
 btExVrPpI6j6rvs+ndPQHBPMa1fBKfs9BQQDNCSl0fpfyJKgTXFXCLG32Qe0hN9cUt4J
 e4qBS9JUvs2tZ4c+Oi1CtqZWIzsMnBR/yQtMVEJOGGa7BdLAcUvlTaXBs9ZbxcOhXL4r
 N18Q==
X-Gm-Message-State: AOAM532jJsJXa3MUt4gg9B0PeSgyrse8KmHzkvl3wtHJzlFXOJ6rZ4ZS
 ykAMGyopRqxazNyJnyZpJzjbkA==
X-Google-Smtp-Source: ABdhPJx6HDLHMURlc2SRNYBbNMQlU2snQcXSlFEIWzsNuw93Jvhm3+QIkoGI4f46tpcAUi4+8r4tuQ==
X-Received: by 2002:a17:906:3c18:: with SMTP id
 h24mr2199654ejg.403.1644416144739; 
 Wed, 09 Feb 2022 06:15:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d4sm3353229eje.21.2022.02.09.06.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 686AB1FFC4;
 Wed,  9 Feb 2022 14:15:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/28] docs/devel: mention our .editorconfig
Date: Wed,  9 Feb 2022 14:15:13 +0000
Message-Id: <20220209141529.3418384-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ideally we should keep all our automatic formatting gubins in here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220204204335.1689602-13-alex.bennee@linaro.org>

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 793a8d4280..9e66d133e1 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -12,6 +12,10 @@ patches before submitting.
 Formatting and style
 ********************
 
+The repository includes a ``.editorconfig`` file which can help with
+getting the right settings for your preferred $EDITOR. See
+`<https://editorconfig.org/>`_ for details.
+
 Whitespace
 ==========
 
-- 
2.30.2


