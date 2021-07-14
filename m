Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30433C8ADD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:27:45 +0200 (CEST)
Received: from localhost ([::1]:33666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jbk-0000u9-Qw
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVT-0003ph-Tu
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVR-00026A-Sc
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id f190so604762wmf.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qgBn2fz5nBY4o5Qr5g07B9Id6x3+9goN0+LhPQJJdU=;
 b=cDQ2vw1w8vl/mmbhx4EVhhUhr3cde7V068I9bZgBNP2lWgUaxGe1NFwyOpbqxAZ5ki
 6BBQywC6C1pXVjQKMH+/Q4YQiHsfYw68jUIj/GgGRn0EYVLU2tNt5XAupziiYyDrmCLN
 KDbd2jpTDHJqJiUiTaDES7SymKvAYW5OOM9JsIXzlieizFwzALFRSBTQ/KO2COpMJzGA
 8eh5g75Pk2bVUa9i19ECMxCsxVHMb/VgeTkUkLn9inxFH3kPjCHumjv9qFdYIbzAdj0F
 /CcUVMhGQ6Of7TV9tSlP86zDwvn6k+ml1BeCR4wNEeCQJi2IRLbKn6PORWB3/Om6Es8z
 LJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qgBn2fz5nBY4o5Qr5g07B9Id6x3+9goN0+LhPQJJdU=;
 b=fLYPuvEGLx/Q9UhjzOQKWXKOw5tNf6PoRoPX7R2BP23XHMybcbquH9peML/+dKkumn
 SNbGiQdxtXX37SvjwksPrdZOBeGGa1zprgGAl4yQaEyyusb6yhCf/Wq+wcb8JjoiNTp+
 S7V0dejU6lqVpjP1b9AGL6/4bD/1z07o6PupeLyHgzowgv864uODl64U+bMmeBTY9aOJ
 slVtKK5hDG4EDIntla2DqX4HDZGqXMo6RPwgz96tuQ1YHUTrzM/p6SbEnSxS/aFp6yX8
 QXkoFCh7DXGbWPTdKCcK3iWSgCujruEiPmkSbFAt4BU92YT3u02OeD53QwMPSJ2Gp9JU
 I5sg==
X-Gm-Message-State: AOAM533Gx0DUe8tetw2QaMK49jfF5GQARaY5qMtwmZ4kHVV/mMZgtJb+
 VaEKnK9Ual5KYQR3DqxHQ9MO8Q==
X-Google-Smtp-Source: ABdhPJyMhWj+JPJnvLi73wv1grOvf2Bbei1YMJMIuv+QB5+nSAAIWGP0Tm3UIdNLfw+Lw4SoQ+YV8w==
X-Received: by 2002:a05:600c:4856:: with SMTP id
 j22mr5492490wmo.126.1626286872527; 
 Wed, 14 Jul 2021 11:21:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z16sm3581093wrh.58.2021.07.14.11.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 930681FF99;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/21] contrib/gitdm: add domain-map/group-map mappings for
 Samsung
Date: Wed, 14 Jul 2021 19:20:45 +0100
Message-Id: <20210714182056.25888-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minwoo's work from their personal address are treated as personal
contributions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Klaus Jensen <k.jensen@samsung.com>
Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Cc: Minwoo Im <minwoo.im.dev@gmail.com>
Message-Id: <220210714093719.21429-11-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map            | 1 +
 contrib/gitdm/group-map-individuals | 1 +
 contrib/gitdm/group-map-samsung     | 5 +++++
 gitdm.config                        | 1 +
 4 files changed, 8 insertions(+)
 create mode 100644 contrib/gitdm/group-map-samsung

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
diff --git a/contrib/gitdm/group-map-samsung b/contrib/gitdm/group-map-samsung
new file mode 100644
index 0000000000..e38c7eeeac
--- /dev/null
+++ b/contrib/gitdm/group-map-samsung
@@ -0,0 +1,5 @@
+#
+# Some Samsung contributors submit via another domain
+#
+
+minwoo.im.dev@gmail.com
diff --git a/gitdm.config b/gitdm.config
index a3542d2fc7..e7a744146e 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -36,6 +36,7 @@ GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-redhat Red Hat
+GroupMap contrib/gitdm/group-map-samsung Samsung
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
-- 
2.20.1


