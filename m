Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CFF310FA5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:13:53 +0100 (CET)
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85c8-0004Do-VK
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84kq-0000uS-Dy
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:18:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l84kn-0003QM-Az
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612545523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XE1qpDXSxBNLgyX0fJYBkKe6H7ZMcFTck+t+2JkZ/Xc=;
 b=e9nOJ7WtklY9CSq1IYvOezTp1TukCWMXjsh4hA0sFTWTRhL9787I1Vde5EZX0EadxcdjQ+
 7/KZPVga/+2F9uwlmyJdSDr16rM2mwnmECZ4fnGNplF5iKk6KwgNJvaAFMNyKTjH9YXy8j
 Isix+Z4yC2MK4hvgwp+uKhWX7mkRCmg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-AbO-K6tENIC0CSCwwTCOBw-1; Fri, 05 Feb 2021 12:18:40 -0500
X-MC-Unique: AbO-K6tENIC0CSCwwTCOBw-1
Received: by mail-ej1-f70.google.com with SMTP id yd11so7008080ejb.9
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XE1qpDXSxBNLgyX0fJYBkKe6H7ZMcFTck+t+2JkZ/Xc=;
 b=hA6kqei3GY9LfJ/J2bwdooOb5Nu8eHvbhayr6oveUEtQ4vIHIXZulsVsWvOLx+Fiq7
 UmuIY/6vucR+myvO1pOnDdwsBlB/s43y7w2rV3lVy2AkqlSAMRXM+gqjLH1VIwzJbSD3
 /qdCwYRwTrGDQLpRD4vT13hIHh8qURBzlbTl2W5TPLYQFOe/Ahf8WC+OLFTuUmw23g17
 Vyo6d4MzRiBN65hx2hSOYd7zpbkLWToXvz+ybAiseBFUl34Z8R/YHDVGPi14hv1aUyOj
 rZrRMVug5HD0uTCgNwdiKGw2+3LDLL7b8LFoR5NOuztHJsIG8LXaaGBWvIzXnduk7GEB
 7YVA==
X-Gm-Message-State: AOAM531C+6fsR7tBmhbP3CuPfQqks9N5PflT+o58exnHt+PP38gh2frp
 4Ow6ICWeWJt0OoUqT3RuBMgUa3WUaf98xjB8lzPykWWgJMykzVabIdTP+qhEfogVkQJOfv3zOqV
 OWcXiM9EG405Wd5SYcjFZyVcpX6gQ2wmngig5v/ZcXDr/GEj1O3AwKuuqBAyeT3fc
X-Received: by 2002:a05:6402:6d6:: with SMTP id
 n22mr4523059edy.128.1612545518840; 
 Fri, 05 Feb 2021 09:18:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpa0pWNNWgt4BwZL/HcAG/ibRnam4nElxaBBeXObp0Ee31lhj6RXHNTc9SXdwlJdZ9PBC9hg==
X-Received: by 2002:a05:6402:6d6:: with SMTP id
 n22mr4523022edy.128.1612545518668; 
 Fri, 05 Feb 2021 09:18:38 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v26sm4343637edw.23.2021.02.05.09.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:18:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] scripts/tracetool: Replace the word 'whitelist'
Date: Fri,  5 Feb 2021 18:18:12 +0100
Message-Id: <20210205171817.2108907-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205171817.2108907-1-philmd@redhat.com>
References: <20210205171817.2108907-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/tracetool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 96b1cd69a52..5bc94d95cfc 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -100,7 +100,7 @@ def validate_type(name):
         if bit == "const":
             continue
         if bit not in ALLOWED_TYPES:
-            raise ValueError("Argument type '%s' is not in whitelist. "
+            raise ValueError("Argument type '%s' is not allowed. "
                              "Only standard C types and fixed size integer "
                              "types should be used. struct, union, and "
                              "other complex pointer types should be "
-- 
2.26.2


