Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36543D3E5B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:18:36 +0200 (CEST)
Received: from localhost ([::1]:55384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yok-0007kM-1P
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg3-0005No-Kv
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:42878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg1-0008B6-MF
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 j34-20020a05600c1c22b029024e75084404so1079192wms.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVllw4G3VLdizwGZ4sCcrxdtmMGIRx7ASnx/SuGuZu4=;
 b=yPTvl9tYoRVhOt5Jm4yPnbLlL9M09hqwSZ5YBFq2q8WYXH27Bpyu92qQWzf493BWBD
 xI3+GAyGwKRALKIS1iBlk1NbJS4vQdDZgmun7tMpwoh/d+4vIVRklekAauqmiuuFcl8d
 wonGZzvON8J1ZHButExVLviEAkSCr28Ys0Hlb3NAww//POSowtMZJwh7MuU4OxjUV+tp
 fIQwiXivjjl/v1BMOYHl2AOct6bS5Ep5C61BPHdZoOYW0w9LpOR9a3Xfo0xn8KnM6J56
 ZqCYF22sfUJzmB04UlxGnGShVhJTQYZ+OfY+FS5Q0gwaD9lOxnf7SejyPDb1alEQKnmp
 cqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVllw4G3VLdizwGZ4sCcrxdtmMGIRx7ASnx/SuGuZu4=;
 b=AwePj7QEqAV5LNa6FNKiXF04Ouif33VEIZarMAp/VRK4Z6aK3YTtMFKWcxirzDjMVQ
 K8G/1SSWcOvaGVoqVmGRSWSx9BuStAJjEBgJlZvdB0JcQWbfsoTUoJ7kuWE0RCp0MAzk
 i4yZ2hS5wEEddA+BVG+6qfRC90KKB+t0EdbKh41P544hBUzVqavVIbfSSX62fPxJmFqH
 ytJKA74+1CkAlU/FE0cfa2px5YVncvvbFl6e0ADdxsCmOpMI3M9b0X8A8+D+h03mosJV
 F3zeNdUgBVhcCFb/MkEb5XRkLgcEqfneqJRh4x0BeE7yY6FrFUtqN7ViYNMJvh2SSDA7
 cqfA==
X-Gm-Message-State: AOAM5334AH5zpj49WPYUq/Jl/s6UKMR4Q8MHU8bb1uQUAJaujvB9ltfX
 Rc8ESxoUfpimuSJQjdDhH3oX5A==
X-Google-Smtp-Source: ABdhPJwhvTTTjSlhlRqn7hchv3POFQOlECdFCsZV/XK+ZkFpmzISNF92t8fWJAorrUxl3ESmInRccw==
X-Received: by 2002:a05:600c:4656:: with SMTP id
 n22mr5434171wmo.37.1627060171864; 
 Fri, 23 Jul 2021 10:09:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d24sm5606727wmb.42.2021.07.23.10.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 931921FF9E;
 Fri, 23 Jul 2021 18:03:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/28] contrib/gitdm: add domain-map for NVIDIA
Date: Fri, 23 Jul 2021 18:03:41 +0100
Message-Id: <20210723170354.18975-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>
Message-Id: <20210720232703.10650-16-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index e42861cd11..2800d9f986 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -24,6 +24,7 @@ microsoft.com   Microsoft
 mvista.com      MontaVista
 nokia.com       Nokia
 nuviainc.com    NUVIA
+nvidia.com      NVIDIA
 oracle.com      Oracle
 proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
-- 
2.20.1


