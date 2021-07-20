Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF9E3D0570
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:32:11 +0200 (CEST)
Received: from localhost ([::1]:35642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zDe-0003ir-31
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z95-0003r7-Sw
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z93-0005lo-MF
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id n1so150356wri.10
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UHjVRJmVxLsnQUBYHmZSPyExmH02c4lV7ChUZ5IixcE=;
 b=dRLeO0zksQpd7LxjulJlSwttfi1WHEqnj9/HJIM57TyyiqJVojjJdi1YrVgxkl4J7J
 ZZYk2ir2Yv3r15oTYWFexzH6SqKlsMXOOxB6M0lQWffC5NYGECFT0vwvURwJA/cRJkHS
 wIA32CEL4v85xlXE/4zvh3b3HZCiWgPWooMEQSOgJkbilIefkzcWdIX9dXdIAQLKr7Qw
 HxJSooZ55Fmj+2sj3asbkJbIZiR+6soppDSH7+OnnNJ9GJ7m4tBPCNFqo66vpHMoGhK2
 lgJHCjCrRzSGrWk3xUO5ALZDakWj+LjLEuk6UctScNiXrfleSwik2OIViUWiC10tctEM
 3F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UHjVRJmVxLsnQUBYHmZSPyExmH02c4lV7ChUZ5IixcE=;
 b=HEHH1VFkAGY8dztRtDlfNPGYqGM7nxjwbdvAVXz3cJJEAo7iJh36Hcbfkkue7mSnWx
 riqGX2LHza+tJ/QVgB7f+Hj/qqhruX34xT6aFgIufco+mzVZdeY6WPkYFvlQKi8x1gxa
 hYhNRGdM9lOYKuU671xJKXzkv11WYmWedGW715zWyeBkMtBBJPUj2ygx5KEcEAyvriHd
 M/d2fIInHURaf3LQbWywdExJqyzaAGj3ITqiI4bYvj1yapL9karrTf5F4tfjPXT9Bu+D
 EHhB2FMlW5WZeyGYuMqtj0gc1O//pM0/K07Iwu3eCCCwbXSSeRggsC08p2elYPFUw6n8
 xb1A==
X-Gm-Message-State: AOAM531eJvjyRrPD7si3YwTMwCA3zLBVtE6DJHWj9SuOlQGht37umMEV
 L8RIUDcSxALMUtKQ6TgKvT3zLg==
X-Google-Smtp-Source: ABdhPJy5S/BC3liIBkXIfR6T9gco74CDlLWTS8YDj0UBCuCOSlk+3GuFsAZ1KbOwex4x3LCkisZL0Q==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr39312156wri.38.1626823644082; 
 Tue, 20 Jul 2021 16:27:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j12sm25733469wrq.83.2021.07.20.16.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3D271FF99;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/29] contrib/gitdm: add domain-map/group-map mappings for
 Samsung
Date: Wed, 21 Jul 2021 00:26:44 +0100
Message-Id: <20210720232703.10650-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, f4bug@amsat.org,
 Minwoo Im <minwoo.im.dev@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minwoo's work from their personal address are treated as personal
contributions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Klaus Jensen <k.jensen@samsung.com>
Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Message-Id: <20210714182056.25888-11-alex.bennee@linaro.org>

---
vPrePr
  - removed extraneous groupmap
---
 contrib/gitdm/domain-map            | 1 +
 contrib/gitdm/group-map-individuals | 1 +
 2 files changed, 2 insertions(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index efbbb15643..beeb24341e 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -26,6 +26,7 @@ proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
 redhat.com      Red Hat
 rt-rk.com       RT-RK
+samsung.com     Samsung
 siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 36bbb77c39..4ac2f98823 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -29,3 +29,4 @@ mrolnik@gmail.com
 huth@tuxfamily.org
 jhogan@kernel.org
 atar4qemu@gmail.com
+minwoo.im.dev@gmail.com
-- 
2.32.0.264.g75ae10bc75


