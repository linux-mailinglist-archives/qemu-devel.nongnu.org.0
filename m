Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572FE455B88
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 13:31:17 +0100 (CET)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mngZP-0001RX-TJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 07:31:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngXg-0000c0-58
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:29:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mngXZ-00083F-2p
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 07:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637238560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AEW/feLmXQheLs9TsgWTwphTRPpBIvQq4hfqglb1c9o=;
 b=TGobwS+1y8TbD6YBEJYlGm2y/hhRObEOxFdMprnKxXaxIF1AQG7Dnh/uTNiyilK+5R2GTr
 ZFxEncu43AxHZMV0Y0ToE9ooDpEYTIB/NU2r2FxRQ6n3O1cvnN4zXLn5/WPwu/N0TOc2xm
 YmIlH8LDP7h4j0T+gE1CH7HLcfSQOk0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-xv8PjkOyOnipZHdRTUuGgQ-1; Thu, 18 Nov 2021 07:29:15 -0500
X-MC-Unique: xv8PjkOyOnipZHdRTUuGgQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so1038758wrp.8
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 04:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AEW/feLmXQheLs9TsgWTwphTRPpBIvQq4hfqglb1c9o=;
 b=Nd5iVnUGJYJG4P8c/rBX4zRqBAlB3LAhlpWQL+M9T8CGJttNOJj2D2bpUYwO8eK/hj
 iFPIS9IE6vCXGiVKvNqjZBhnq/sT5tanPv+kmNKSKtcZgJH2e9cGmij1I3jGQG6K7iIu
 nvYhHOvXWQpOOOSL1ER+21NHQa5LUUPVk3cj9ItUW/dOSkW+uGC63WsdqXUIWLnrgXZs
 cRa/hrCiRsNrSg6wr506o9cJYczNM/hGYcbB55AdnNKRy2TmS7EGboCsZCorhANw3Ydx
 Fn+x3axKtJKrxiMJA9xaDNbJlxAHUvyzf89fsrcTvePJrKLkA/4LmcAjqu7QaJnQSWT7
 pU6Q==
X-Gm-Message-State: AOAM5302jD6O8EZWQ5/0xG4KUQMPACoO/7HjZ2Tw1fuk59LeBrTMHI7Z
 LYg9sm2BVCvvmErbL+VJ64JJjQAvb79TR1QIKy7UTIOVbpywsTy8R9Hi1yS1zg2us/tpioN47q1
 NrBef2jkhTI4Lfi9dijnOV0/WvtjaEMXfYqZDmxxJqRhnRGf0YvReh75zx8H36bUx
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr30473413wri.308.1637238553896; 
 Thu, 18 Nov 2021 04:29:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEYj42Dk0Jh2x42/7LE0iaQhkaoCLBBIm7OGpmrHO4lUOjHv4J9o5R7OOMXpmiir7cz4Ibaw==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr30473367wri.308.1637238553630; 
 Thu, 18 Nov 2021 04:29:13 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j40sm3501499wms.16.2021.11.18.04.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 04:29:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH v2] Add Sponsors page
Date: Thu, 18 Nov 2021 13:29:12 +0100
Message-Id: <20211118122912.4051779-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
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
Since v1:
- move to footer (Daniel)
- only list sponsor who asked to be listed (Stefan)
---
 _includes/footer.html | 3 +++
 assets/css/style.css  | 6 +++++-
 sponsors.md           | 9 +++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)
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
index 0000000..1c097c8
--- /dev/null
+++ b/sponsors.md
@@ -0,0 +1,9 @@
+---
+title: QEMU sponsors
+permalink: /sponsors/
+---
+
+QEMU has sponsors!
+
+For continuous integration and testing, hardware is provided by:
+- [Fosshost](https://fosshost.org/)
-- 
2.31.1


