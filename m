Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FC1D529C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 16:54:22 +0200 (CEST)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZbjB-0008Le-LK
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 10:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jZbZZ-0002TX-1o
 for qemu-devel@nongnu.org; Fri, 15 May 2020 10:44:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jZbZY-00010f-0P
 for qemu-devel@nongnu.org; Fri, 15 May 2020 10:44:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id z72so2963894wmc.2
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KIiMOFkFR1RmW/iOKb+Q1Re9AaDQXvi4+44fXAW725w=;
 b=iVrCgythiyjZNR1VRaz5Jvueln1XQIX7WFkM9j7/WxnYDCzIyjsSHZOSEXcQ2jsqyZ
 cIgYsyd+MZpDLWSVPj7SZWu1LHh7X6HaqzS3kF5NGg9zuXEcIqk/GX9Xrj/dk5h4CwlH
 BvWSKaoCgz/uG5Ep+lIMkddx2Ki8r23C3voClnzujhD7K7voo3uWH78EiJYpj8kQPNlM
 tV16RdiLSpbbY+IzVxk6UppQmJyl/8F7sb+Ksk8rUQ+Z0yEVHKlUyz2DKJuWEPYzqGEg
 3ASke35YK6ferGGN2OW/yelPayqeixI4vTk9kSfWnjm4J4E5pJwMsbxf2OFg7D/mpTHO
 /QWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KIiMOFkFR1RmW/iOKb+Q1Re9AaDQXvi4+44fXAW725w=;
 b=moZCMAUfZP1DUflWw61VYUmZAmKDvt7hbLU/K3DFpGmkEF6CKK0+/7YaIEyNpo76Cj
 wvHMJhWjiCiMW9XeISF49mIrhtGTvJerEl3VLgd2TmhYtmMz7tgSMA/a7Kf/SSGMbBof
 1mjEsMLsztZF1Vf0MUu0vHS4s4S2npLEGz7NW3tmOZk5gOVpje39H/75ZB0NrdsimV4w
 0UyOfVKygeg32kFmGFnq9Ti+Mys1nNWiRnu1llwxspwzg3qpbb435tNOl5Ybod+gHO84
 SWEgTUqSAjiDBKEYnlzzLApejUTvfoWaB2hcyHy76/+ZclAdtLIHAnckvlNqMB3QnHBH
 OZXQ==
X-Gm-Message-State: AOAM530o262C+cp8hWkXNs5vFovWC5a07ZqcLNWPJ9hxgnp1FUGKi8MC
 LbVMviRzmMM1k36owVaO8xbm7A==
X-Google-Smtp-Source: ABdhPJxZt5skKDlrsjaqV2hI4hK6LbgwPfryq+fKkNZqKD/wCCi9LfA8oSiS2V7Z6F0vavQFqrQHdw==
X-Received: by 2002:a1c:1b44:: with SMTP id b65mr4550513wmb.181.1589553862523; 
 Fri, 15 May 2020 07:44:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z124sm2598547wmg.20.2020.05.15.07.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:44:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C1E81FF9C;
 Fri, 15 May 2020 15:44:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 13/13] MAINTAINERS: update the orphaned cpus-common.c file
Date: Fri, 15 May 2020 15:44:05 +0100
Message-Id: <20200515144405.20580-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515144405.20580-1-alex.bennee@linaro.org>
References: <20200515144405.20580-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We forgot to update MAINTAINERS when this code was re-factored.

Fixes: 267f685b8b
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200513173200.11830-5-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index f02e2907023..47ef3139e6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -115,6 +115,7 @@ M: Richard Henderson <rth@twiddle.net>
 R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: cpus.c
+F: cpus-common.c
 F: exec.c
 F: accel/tcg/
 F: accel/stubs/tcg-stub.c
-- 
2.20.1


