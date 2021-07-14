Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FDD3C81E7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:42:53 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bPo-0002EL-VT
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK3-00022h-Bd
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK1-0004LU-QH
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:55 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso3465414wmh.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1EVjp93iyy+fsZ4pGlqUTgPVvJF7tVC1WY/cwqgCcuM=;
 b=dQcCJcAmJDtKux5zRbp3fop6zQY1AdTr04UI5PesGKRzrSeHiE7+/oNrrs6bQ/ZRCq
 yBdX5DgG09M8vPnNhg/TDvIPQbuQCEXtk1o99ySzLDBwfXsQsESeUESsMDc1P8DqVy9c
 kM9IWYX4ZjYlRD3/G6/J675zhY82WzoJBpyF8iyl9XK6rzbn9VMqFWZlT4Qhdfyhhln7
 Hq8DKIonJMMVCzrec79yHOaYsUPRHq2MosAReDILhuhf+eN7Y4/mZWfn8Uzg/SSdporh
 3YNKHtkqFDBycTDf9r+QGYQ5kh0no8Ywk1yrWG7/dY5G9wN5QyLOvrsUu426g2J62euR
 uM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1EVjp93iyy+fsZ4pGlqUTgPVvJF7tVC1WY/cwqgCcuM=;
 b=hKWRsQkaP4oYtubteS9jec47PC9+pqWEBi83uDxDirOMT9DJB2DJ1mDmo87ZbDUt6R
 aPQmCoR51SoZpFenmZ2PbWIowtp8kBO3xDezpiMxGmVnq5HnIjhLsw7K744cFmNZOIhD
 es8V6asAatgZKmMJocYZeqxG322+SyV3tkW5y78BAvX+Qk0OR6cWYAHNxnnNOTlMsVuH
 wD7KxMkyGKoOzBgruj6P16aXRabMLUDb9UwN84aVRK49FvYvtwIcG6lMDfn3YqcH8RJ7
 0ZDjR7ZMUVX0I4W4jR88yUEs9O99tUc2pWIEak5T/SHKCdSY6gSotpCVV7edniwhjyvu
 rNew==
X-Gm-Message-State: AOAM531ODqgW/indW9jDCloYAgFaJBtZCjcUYdC2knPszwU1bygA7HeU
 iDDNGO93hYsjdcQ7+P2Cb/uH8g==
X-Google-Smtp-Source: ABdhPJxpbfwMlUaLIbPhie2WiZgDXTCKVI8aYXNGUlOgZ8i2nDg9LMcQlAJolJwXVIRbFTrvuHJ0vg==
X-Received: by 2002:a05:600c:8a9:: with SMTP id
 l41mr3070713wmp.152.1626255412462; 
 Wed, 14 Jul 2021 02:36:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t16sm1827356wrp.44.2021.07.14.02.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B5E991FF98;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/21] gitdm.config: sort the corporate GroupMap entries
Date: Wed, 14 Jul 2021 10:36:26 +0100
Message-Id: <20210714093638.21077-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets try and keep them that way.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gitdm.config | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/gitdm.config b/gitdm.config
index 7378238c20..a3542d2fc7 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -28,15 +28,15 @@ EmailMap contrib/gitdm/domain-map
 #
 # Use GroupMap to map a file full of addresses to the
 # same employer. This is used for people that don't post from easily
-# identifiable corporate emails.
+# identifiable corporate emails. Please keep this list sorted.
 #
 
-GroupMap contrib/gitdm/group-map-redhat Red Hat
-GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
+GroupMap contrib/gitdm/group-map-redhat Red Hat
+GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
 # and those working under academic auspices
-- 
2.20.1


