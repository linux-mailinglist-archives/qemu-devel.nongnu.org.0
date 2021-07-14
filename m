Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54083C8AD3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:25:55 +0200 (CEST)
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jZy-00043t-LY
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVR-0003iV-P3
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVP-00025J-PI
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:13 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l4-20020a05600c4f04b0290220f8455631so2035317wmq.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v9elhEn5dGe6nnCZcLStwUOXNSfexm8Vp+CdmpkCHXE=;
 b=lKA+hTCACovUv/i7v+zP96kpLrqVih8Gdex/FeZK97Kb8ux4IqS8aQ+dGO5tJLesZC
 lsxjvZzXb0HdatPcIvB4N5Ug1yKWRBuM6OD0FSh99vc2+IV0dPnW2qblapWiz3Zbm29S
 FcUkDUVdPEGTbggwcmS5ZMawFpNjusSuD2ugTxY9pJCkx/fREBMghZJnXkDiDG2yLNDw
 tqk6CO/KrNI4Iz3jpnFa8vupkTxmOXlwLTpxeOZznYwXhZ1WQEcryKZhwrrjf1eYdYXA
 3rlE/D3ZO9NGKG4kbc1A1xgtaCjCma6DBtcIpdwm94svior7K3WxqbNRHArRq5vJ0piT
 4NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v9elhEn5dGe6nnCZcLStwUOXNSfexm8Vp+CdmpkCHXE=;
 b=kG+a+6ENccq1oslB98rcpf5d1dmXi6uBVP2nq6S4OaSTlpVmkAjNKupzmCrLVkDcGp
 S2PNTh01flGsJB9xo4UUl0ZaDaDPWjZ/duWWLW3jlEUQUdK6ZxlCLQPcB+F9bwD0hLVL
 xnXwCt3RG6RHVQ0IpfM/nuWAKsl2qWg/VAyguNLPdcITxPySnoC1by3gy5wfVMzFpiPd
 chJ4+WyXK1f+kgdMGl2B2KPbs+36Rczf7rZhPlbbJ8FZu1XuDl04BUvip1tcZ6U8grUs
 ysyqz1UNz/L/yLUbTEJ7h943F/iiZ3qjlhAHbtEk1fpir7fZsvzVSxd/9/n0k51NNIuj
 j8BA==
X-Gm-Message-State: AOAM531uRM+/7SjoOPWwW07Gf12pURIzQt3ryn5eZMMEIf1i0cG5N8N3
 /gztoUQdlfI35Wa2yBbhFG1l1C7dvf29tQ==
X-Google-Smtp-Source: ABdhPJxZBk8JpwZwUVL6fRCbaVub4Iu7iel9EolLz+CoLR6tn1WGtAdknRJ2nkrRy5R/yBz/KMM7Vg==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr12592673wmi.21.1626286870392; 
 Wed, 14 Jul 2021 11:21:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p11sm3459201wrw.53.2021.07.14.11.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75BCE1FF98;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 09/21] gitdm.config: sort the corporate GroupMap entries
Date: Wed, 14 Jul 2021 19:20:44 +0100
Message-Id: <20210714182056.25888-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Message-Id: <20210714093638.21077-10-alex.bennee@linaro.org>
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


