Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D558B330C1A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:19:06 +0100 (CET)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDuj-0007uw-Tw
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJDsq-0006q2-Bo
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:17:08 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJDsn-0002BO-2N
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:17:08 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l11so7609703wrp.7
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MO79JBKW4TjMhW0Kep40xCMVdBOGcJTCggQBfKbGO+8=;
 b=BnxBEdUq1OCgT4S+BgKmQmNmkC07c81WjQ+L741yXiEAjpvreAdpIVWpm6XrxSua60
 bVkNVm4rFtcpuc8bc+qQIchRW3UxmP2+20AOogwq9w20UDbERtgJHdt+D0IB9U9/bUv5
 pnq23kJkxMoTkmYVDS3FB9gix+PmYwoRbopBFLIXJJkimH3sOEqjz1yNF2PBZOREn5jK
 g/4WFWe4Os4NTk2iwjp1vMuNqFXc0wI92ciZTB43dmJNECFWuq9AGjmfoxI3YzqewPyc
 MtfMEduHgfMglpY8x63pdgAs768HjKUpBHdDUfNfG3pZlA/uJ7fkLPwW4LPYXKKU4qMA
 fiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MO79JBKW4TjMhW0Kep40xCMVdBOGcJTCggQBfKbGO+8=;
 b=KMiUsK4yXj9WjpymebpgodOoCpuclHZtprX4ImlvYZ//TXfVrezFVSh1irwj7lYz0V
 nk+EcyV19Qc4QglEMKPPzwPMN06ot9dB6cVOQY8HSOdnwJgRuR73dnQ0rf72GdXpG+rl
 f7DddqQUQH4KjQK597fuHwUFapsO9Nk7SvWcH7zhfX1JHmvGNq5RZty7mqt1mDZDOUBN
 hqnwsyomt0u9MJoA2PAkfhwZwuSpH5rQa+jiM/+Xz5LIz1WBlho1Nd3hdkJJgupIXQBQ
 F42q7CcdHvDf8irxW9uBzdf99RFHbXuuV7yXMhwSrNCuGcsBxh8pxXQLEKrwmFBRqizF
 BzPA==
X-Gm-Message-State: AOAM531qxB2x5/AUD13NvQJSE9It9qgJ2QQt8lUA4CNGEvcTwlpm5LV1
 INEyb9tcNiJmVJnTHPz+Wc7lIw==
X-Google-Smtp-Source: ABdhPJxyCMDWFp+NJH3X2pkPudiY6/fyzjHZ7VzPJcx+vPByGlea6sfIac6DHnfCINBbAZHZuNib7A==
X-Received: by 2002:adf:dfc3:: with SMTP id q3mr22798588wrn.121.1615202221152; 
 Mon, 08 Mar 2021 03:17:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m2sm17739607wml.34.2021.03.08.03.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 03:17:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 712A61FF7E;
 Mon,  8 Mar 2021 11:16:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [qemu-web RFC PATCH] _download/source.html: show the GPG fingerprint
 for releases
Date: Mon,  8 Mar 2021 11:16:49 +0000
Message-Id: <20210308111649.14898-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the moment we mention the signature but don't actually say what it
is or how to check it. Lets surface the fingerprint on the information
along with a guide of how to verify the download.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 _download/source.html | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/_download/source.html b/_download/source.html
index 35fd156..6c2f6f6 100644
--- a/_download/source.html
+++ b/_download/source.html
@@ -8,14 +8,21 @@
 	<div id="releases">
 	{% include releases.html %}
 	</div>
-	<p>or stay on the bleeding edge with the
-	   <a href="https://gitlab.com/qemu-project/qemu">git repository!</a></p>
-
+	<p>
+          Our source code tarballs are signed with the release
+          managers key, fingerprint:
+          <pre><code>CEAC C9E1 5534 EBAB B82D  3FA0 3353 C9CE F108 B584</code></pre>.
+          Alternatively stay on the bleeding edge with the
+	  <a href="https://gitlab.com/qemu-project/qemu">git repository!</a></p>
 	<h2>Build instructions</h2>
 
 	{% for release in site.data.releases offset: 0 limit: 1 %}
 	<p>To download and build QEMU {{release.branch}}.{{release.patch}}:</p>
 <pre>wget https://download.qemu.org/qemu-{{release.branch}}.{{release.patch}}.tar.xz
+# optional verify signature
+wget https://download.qemu.org/qemu-{{release.branch}}.{{release.patch}}.tar.xz.sig
+gpg --output qemu-{{release.branch}}.{{release.patch}}.tar.xz --verify qemu-{{release.branch}}.{{release.patch}}.tar.xz.sig
+# extract and build
 tar xvJf qemu-{{release.branch}}.{{release.patch}}.tar.xz
 cd qemu-{{release.branch}}.{{release.patch}}
 ./configure
-- 
2.20.1


