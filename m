Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E9D45B63C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 09:08:45 +0100 (CET)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpnKe-0000W8-Fb
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 03:08:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpnHa-0006rM-PJ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:05:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpnHW-0002dZ-H7
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 03:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637741129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CY9ZfBfA1w6FqFdaa+IFUgc8lXx8HEclLb0W1gqff1E=;
 b=MmvZlKmBksmHytfDlavtc23jZXmr2AWAHsFlBaOYlyZbud9il7LL0SWQ93MTU1Qb/CRecz
 pr5DPuXuXOSqPcis24VXORW02VFyStAfq3/5KWPCbCHOch9RgMC/F7DRnkC6LiwWEpKWoH
 SfYhlNmg4QK7FuY894ON4jcJyOliHTI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-Of8hNPIkNQyIch5Rsu44Jg-1; Wed, 24 Nov 2021 03:05:23 -0500
X-MC-Unique: Of8hNPIkNQyIch5Rsu44Jg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m14-20020a05600c3b0e00b0033308dcc933so967735wms.7
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 00:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CY9ZfBfA1w6FqFdaa+IFUgc8lXx8HEclLb0W1gqff1E=;
 b=Dw3/MkLKh0FVZ0YewypN8GYx5K5o9fu8mofEPeIpxpikRjMeKFmUo/Iqa6tWxULwoc
 6zLHY52Niix96XymA2AyFYJUCVWT4skcyK+wGGv6t4z8qUJUB7XzcuZJT9PQHKn/s/QE
 TkSnShuKNCWx7s8SLppIg6YO1l/LXZ8Rb6FxKtOgIUrTf68zc6C/ww4ZoCvzOQBIy0A5
 pY5V7K6rwIcNVZttKMh+yNijmelNn1YvyBVAlt2gBfs+hwW1Jejoq2U1m7fFF7Rn4HGt
 3ys3ub3VQ9AK/czLuhctQ+1kGZ3GJn34F5Wg+Kut2O+0lFqXsFzHJ8v1xWMk21yPsmwS
 i/1g==
X-Gm-Message-State: AOAM532o4ZZpyxxrGKgtSYMHr/k50vOtTrMmUUAUbSxQBavKbZAdvxbJ
 qLVWGm7ZQQA0fovqlXNC8Nk1p/hFWKngKst/VUtbHEGB4S4Xj3EspGB5DysL0so7ZGcuwNwT/qc
 TIrnmm0RMOQIPTqBizAQ3T/w3++yVKEiqGdTwLby4vgpcYB//UqX0j0UhKKFgaAaf
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr16282294wry.66.1637741122378; 
 Wed, 24 Nov 2021 00:05:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4EeL6L83lZhiAJk59rlcz2fn/ytdjYqsTDj/gyv78dMA3afhELnRUCIHoIfQPLDK98To1yw==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr16282225wry.66.1637741121976; 
 Wed, 24 Nov 2021 00:05:21 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e12sm17642741wrq.20.2021.11.24.00.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 00:05:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v3] Add Sponsors page
Date: Wed, 24 Nov 2021 09:05:19 +0100
Message-Id: <20211124080519.440677-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Markey <admin@fosshost.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a page listing QEMU sponsors.

For now, only mention Fosshost which requested to be listed:
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html

Cc: Thomas Markey <admin@fosshost.org>
Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v2:
- don't explicitly state /what/ we're using the resource for,
  just that we've been granted it (danpb)
- list Azure Cloud credits (Daniel)
- list PLCT Lab (Paolo)
- list Wow/CIP United again, since other are listed (Phil)
  therefore do not include Stefan R-b tag.
---
 _includes/footer.html |  3 +++
 assets/css/style.css  |  6 +++++-
 sponsors.md           | 21 +++++++++++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 sponsors.md

diff --git a/_includes/footer.html b/_includes/footer.html
index 1a0b960..b1f3f0c 100644
--- a/_includes/footer.html
+++ b/_includes/footer.html
@@ -15,6 +15,9 @@
 	<div id="conservancy">
 		QEMU is a member of <a href="{{ relative_root }}/conservancy/">Software Freedom Conservancy</a>
 	</div>
+	<div id="sponsors">
+		QEMU has <a href="{{ relative_root }}/sponsors/">sponsors</a>
+	</div>
 	<div id="licenses">
 		<a href="{{ relative_root }}/license.html">Website licenses</a>
 	</div>
diff --git a/assets/css/style.css b/assets/css/style.css
index 88f7e85..aede79a 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -533,7 +533,7 @@
 		padding-left: 1em;
 	}
 
-	#licenses, #conservancy, #edit-page {
+	#licenses, #conservancy, #sponsors, #edit-page {
 		padding: 0em;
 		padding-left: 1em;
 		padding-right: 1em;
@@ -552,6 +552,10 @@
 		float: left;
 	}
 
+	#sponsors {
+		float: left;
+	}
+
 	#edit-page a {
 		overflow: hidden;
 		background: url(../images/edit-page.png);
diff --git a/sponsors.md b/sponsors.md
new file mode 100644
index 0000000..29ce66c
--- /dev/null
+++ b/sponsors.md
@@ -0,0 +1,21 @@
+---
+title: QEMU sponsors
+permalink: /sponsors/
+---
+
+QEMU has sponsors!
+
+[Works on Arm](https://developer.arm.com/solutions/infrastructure/works-on-arm)
+has provided QEMU access to a dedicated physical compute host.
+
+[Fosshost](https://fosshost.org/) has provided QEMU access to a dedicated
+physical compute host.
+
+[CIP United](https://www.cipunited.com/) has provided QEMU access to a
+dedicated physical compute host.
+
+[PLCT Lab](https://github.com/plctlab) has provided QEMU access to RISC-V
+boards.
+
+[Microsoft](https://microsoft.com) has provided QEMU credits for use on Azure
+Cloud.
-- 
2.33.1


