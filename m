Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C93D0577
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:36:09 +0200 (CEST)
Received: from localhost ([::1]:51622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zHT-0005qj-VJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z91-0003dx-SD
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:23 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z90-0005jR-F4
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id l7so164024wrv.7
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gKe/hOsKc2+Ym0xc9Jfkr35kuIWwD8+V9+nG4UZ4/Co=;
 b=mZdTHV1EWSJwTCVgcb+n4OWYcxIN2Lw8y607wvcljLo311i7KD2Wq/8QWfoWB2u94W
 c7mZBLoJ3IZ5LfpeZ9TnDMsEig5GBDJkqJ6aQulpRH99SwIcKV00KSiPHvWdM6pk47HF
 yMFlLO8NfJE70wrOfG5d9s54gIEkpDMBurrwSlMLvUB9MuOphGnXfvum5hPodhEh53Fr
 2TIc8gSzGa6hiezOJo9gJlJJJ/K4UN4VJ1gHSZWID/hhro78Grho0BBes+ok+6m956O0
 MfW/ymfb0ky/Mcn6xTwqZingjZNp0yC1yILWkn/giJOkDRlI+6vi3wwNbUsm0qPigju4
 TLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gKe/hOsKc2+Ym0xc9Jfkr35kuIWwD8+V9+nG4UZ4/Co=;
 b=dvkqaZubLTEIE2N14zuZ4Y7/VR91mE7T8QMX/3qeK7pl38eYMmajjttgq7iEV5xGPS
 1ZHt3EDDgTWvKmb2RPi8h/BdvRY67jEvsvmTy/u+QCXR3Zq71rzJLOXiFCyCsRd4vbPa
 uzNlM+fPpiGwK2WEulQ669uFr+Wj0RbSmSj4WXH/C8XUtA32kQ9GXfLWyvl8MHtebMxr
 GwRbZG3Sl/S9iaTW+bclNpsc3LZ0JBRgfKwUHYu/chyx+/NyLJO+Y+Oi9OVxOGNJtkio
 nZatT7VtFcbDQg9Yrn9X2d/M48clQaUD7xBExFelq2Aw+qzM1SBYuLiOaXRB9Cqw8K8I
 uqxQ==
X-Gm-Message-State: AOAM532KtPviA4z+V0UgvCNzk/iIEXciikXbvvNLdUA59YSJ1msWNygg
 Gbp6yBCPC3Xg8FXh5gQe7yhjPQ==
X-Google-Smtp-Source: ABdhPJze1O9eOEXQ37Ga7wSc9FRJVu1qo2NRWMACa5znESWPNWNA5drkh7byiI27RFdxnJVJzfa0zg==
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr40664063wrw.105.1626823641098; 
 Tue, 20 Jul 2021 16:27:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k22sm20072348wms.47.2021.07.20.16.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C54A1FF98;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/29] gitdm.config: sort the corporate GroupMap entries
Date: Wed, 21 Jul 2021 00:26:43 +0100
Message-Id: <20210720232703.10650-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets try and keep them that way.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714182056.25888-10-alex.bennee@linaro.org>
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
2.32.0.264.g75ae10bc75


