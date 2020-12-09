Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C12D49A7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:59:50 +0100 (CET)
Received: from localhost ([::1]:47308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4gn-0007dB-DK
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vI-0004WW-9X
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vD-0000IS-9N
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cmy8dzKxb5dkMOpVo6KH3hOeRH+OpUhJIkOvuYngI4A=;
 b=FeLs1hMDHLZqYe8zlcqFRYloL25LXMXloeNik62aM5KL/Jhr781MQUg/zwrXcyVFcQYdA6
 RLrbytSMQYJ0la4x7RvPMNkqBx+RQRtahR281iIo8NziB9mm+7sC0bpXoDU7grqzhCM30t
 k4nPw2egAEhAezt8doWiM807HAPak28=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-DPhgHuVLOVGzo6t4Kxs8zw-1; Wed, 09 Dec 2020 13:10:31 -0500
X-MC-Unique: DPhgHuVLOVGzo6t4Kxs8zw-1
Received: by mail-wr1-f72.google.com with SMTP id u29so961086wru.6
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Cmy8dzKxb5dkMOpVo6KH3hOeRH+OpUhJIkOvuYngI4A=;
 b=c0VWHiU5eO5beTMNcte5nXSBwBuuuMlU2tuOPO/EMzKUqGjWSrjdsWab4/fKCRHlE4
 xHsvbSXobnKfBIF/iIlycpKj9C3nj9ZvckzFyiuZLWyyixS5ynKZZneFT1Uqz6hSu9+i
 1AQjD8DcSRKVsgz389Dc7RPHkZ0zaJnrbZZtA3YPvhp6g9ocljkeTAQwEkowBcai97QN
 j3DP8XXMCzQY/hflJfUKkkRc8a5mRe3i2CGeA4n0f5+GY11V9ZIIBeRbhj35kLzjgAjz
 Ohha3j1wLCyb41IPJfN87Gp++V6UpKdZ0aesBpxyA6k6kBMDYBgY1msphZaHRamuAJq9
 WUNw==
X-Gm-Message-State: AOAM532y2acPfldNWAAhf9QuULGiIDvBSWao4Mw8bwnkHwTsiwCgnMO2
 1h0sq8ZjvxtAr511aZHcDa+gB3GyIhlIRvHm1jpMb9Ao5WMEquNQ7Pi0nePmQHN5Rw4czhLc3DD
 70+MY+maRSbTy+aMyIrONDXEzcW+sUuRbEKfnO7TR/NmgSkKgPfqC4RmQWXJ0
X-Received: by 2002:a1c:287:: with SMTP id 129mr4110093wmc.133.1607537429789; 
 Wed, 09 Dec 2020 10:10:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKrW82g4cke4f296hrpPx+jS4gHANKCe2mp/m2vEoeLSZLwcf8HepCZi9/q+CGSZX/4IBmrA==
X-Received: by 2002:a1c:287:: with SMTP id 129mr4110064wmc.133.1607537429617; 
 Wed, 09 Dec 2020 10:10:29 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id b73sm4953411wmb.0.2020.12.09.10.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:10:29 -0800 (PST)
Date: Wed, 9 Dec 2020 13:10:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 50/65] .gitlab-ci: add build-libvhost-user
Message-ID: <20201209180546.721296-51-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-9-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 .gitlab-ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b1..e517506c35 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -455,6 +455,17 @@ check-dco:
   variables:
     GIT_DEPTH: 1000
 
+build-libvhost-user:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
+  before_script:
+    - dnf install -y meson ninja-build
+  script:
+    - mkdir subprojects/libvhost-user/build
+    - cd subprojects/libvhost-user/build
+    - meson
+    - ninja
+
 pages:
   image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
   stage: test
-- 
MST


