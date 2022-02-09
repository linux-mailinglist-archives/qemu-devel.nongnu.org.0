Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702474AF5E2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:59:16 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpND-0006Ef-HA
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:59:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnll-00030F-7D
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:29 -0500
Received: from [2a00:1450:4864:20::631] (port=34704
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlK-0007rG-9e
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:09 -0500
Received: by mail-ej1-x631.google.com with SMTP id p24so7810569ejo.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k1fwnv0lJtUDhO6TOwyQLpcKEghGQfqMke/Cqw90EnE=;
 b=MzWXzUr1Zwyr/9hvh5W4y28yti4RZtTUg48WkjFPsvfIZsK6VVaXb760GFUCbCSlOA
 PNdiOABr7ND0Sdg56BkprrTo4w/LspkGM2owwkV4XtowQFxuTaFTNGf2vQ1n35jIH+Ia
 q0DqAfxCOGWL0bkK7D9AfafYVb+M72MVWM3tALBGO+NlgTjBarR5t3VReiNk3u1f9lxW
 vAJpmSoBmEABTbkYo3RQcQ+/N1Ra6zbPAF0QmHRrnG28QCQKS0YhalUbF/tl5ElAvmuN
 kuah9QQ+nXwtCSrtaJ4izFbQcVRyZsfkY3HPK++8opOMBbPEG9vH6aDB7esAcwWHb3Ql
 2d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k1fwnv0lJtUDhO6TOwyQLpcKEghGQfqMke/Cqw90EnE=;
 b=iHq47O2JgTcB7i97whyrC/dLBGulvAwXc4dfjkw9FpUTjSrMc7oZ8Z/YKGv2MLS62z
 bgLxIDPo87aeRapIozte+9HlHrEt4jR9ghbfhXvxdp8RWX1rGfcdU90r6lSyBOT6fyZ9
 rZMFr/RyZdYZwjws4cxPcfW4TM9xy0Cua20568HJhvA/8CG2ApKw2SYE4rIN+gyUxq4k
 CPntTzEaJoRZliKIRE8BjppC1F+mKIlj2gN0SATTgzY7RqNAdsViUem4knTTUiSOlGeF
 qAGN30fYafr1OIlC5BYixpR3GA5fpMxQyrloHJg15dD7rW3pH2RSU4MlzV0Jl5GdVk59
 MRoA==
X-Gm-Message-State: AOAM531OjBIbOAV44Qj3/UCdCnEH2ipkPMtIl+ITN+h32vCKNQ0CveJq
 Pv5QG34Dova2texjyjqsaTMefw==
X-Google-Smtp-Source: ABdhPJzPdF+JD5Oc82GsFgmxOtTgRYGEQ2ylTuO7TyLPySjuTa9OYzElLIAnK++vi57ysx4+8QXfRA==
X-Received: by 2002:a17:907:990c:: with SMTP id
 ka12mr2121199ejc.146.1644416140437; 
 Wed, 09 Feb 2022 06:15:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y23sm194721ejp.116.2022.02.09.06.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A18761FFBD;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/28] MAINTAINERS: Cover lcitool submodule with build test /
 automation
Date: Wed,  9 Feb 2022 14:15:06 +0000
Message-Id: <20220209141529.3418384-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

lcitool is used by build test / automation, we want maintainers
to get notified if the submodule is updated.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-2-f4bug@amsat.org>
Message-Id: <20220204204335.1689602-6-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 9814580975..b0b845f445 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3585,6 +3585,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.30.2


