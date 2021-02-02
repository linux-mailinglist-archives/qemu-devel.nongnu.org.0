Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5CE30CD98
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:05:53 +0100 (CET)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72rw-0008JC-FR
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lc-0002HY-7z
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72la-00075z-HZ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRNuuWWnGzS751tz77gVwZLSy3CEk47CqPxoZeCkviw=;
 b=VMUNFS/KoVL3GaOoou1jZJYwou5uuul2Uz0YshA8QDeq68nIiBE9GIAnspKlRQ//tcvo6X
 9K67i3JrKBVINKfw/TrNae4Tw5+QwlDlx3LSdh4ezq0JaABmlfYS7k+PtdK+kqdfsxYdJa
 XzVG/eBTPmM40ze85xWHVZjjT3WDkJA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-jHIiiasYOlu-TGE9Yrsk4A-1; Tue, 02 Feb 2021 15:59:15 -0500
X-MC-Unique: jHIiiasYOlu-TGE9Yrsk4A-1
Received: by mail-ej1-f71.google.com with SMTP id bx12so3321614ejc.15
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRNuuWWnGzS751tz77gVwZLSy3CEk47CqPxoZeCkviw=;
 b=OyczZOyaY4fGBhp8moRfgDId1NHxEmrZn/JF8j4MiujdEMMyDR5ZC3Z6rDl4MqJnOO
 dT7zxUW34knjQ6BcU2GDSM1jeFHTHVF9zp0emBkITJDwH9RW9aO1cpjGylkmVAQVLJGb
 2+9qVhpY2W9lvBV9vJQ874JK4EjuvsA4LIuP4hl4HN464X9n9xMM4/Gfdy+DNvQJhgTb
 P7+cjANvfzFR6XCs8MCTDL+nDWfQHxKrM5nEWTaYq3qmYVlfzKCm1tEQvUZFIx7nR1g/
 t46URCWhjWTiO/GBQwThHJD08m0BYvipTcO7HX9uw6E2B7BtC7sFCl98EI7DACBm4w+U
 p+CQ==
X-Gm-Message-State: AOAM531yeXg4stUYQNUNLDEXU3XqfjOKppcFTfaFIexbJvBvf1RqxQko
 U/CLevj12g9DDw45iVn0jEOVa/7WiDDDQdFnf+oJs1HLVEuAkpEHjIbfbWCi4b5EpZ+XZ8Tvqa8
 MC13lrgCWZgC1H8gHCOcCp66HrjeVqKZ0kJazdBdt4Omc10CSxg0r+fcJZXTD2sRP
X-Received: by 2002:a17:906:2a8b:: with SMTP id
 l11mr23958953eje.1.1612299554315; 
 Tue, 02 Feb 2021 12:59:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxE/WXY7pnoMkxWO2IgrEqk3qYmnF/l7DPVszzBT8rQjJvRYIhfJ0lW//xnXZ8l83sldEueWQ==
X-Received: by 2002:a17:906:2a8b:: with SMTP id
 l11mr23958931eje.1.1612299554148; 
 Tue, 02 Feb 2021 12:59:14 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id g4sm1215549edv.59.2021.02.02.12.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/12] scripts/tracetool: Replace the word 'whitelist'
Date: Tue,  2 Feb 2021 21:58:18 +0100
Message-Id: <20210202205824.1085853-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

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


