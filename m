Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4198F528BC3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:17:29 +0200 (CEST)
Received: from localhost ([::1]:42522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeLY-0002D9-1L
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5V-0002w2-7n
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd5T-0003Qk-HH
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OK0to00hZr33g+bacbdfmnWtmxWLDNzWz7vj6utljHg=;
 b=QmVVRJZWVhkBLq3i2fmEBydbVNVefGcE4qHyuxprDV/JzayGCpVVzxj3i/2XIjhm/8jXz/
 m5FjNt8ScvXX9k/jVOnPtgkOoJBjfrZ+o7lSQ6q6BfZmClz2qJhSlOA/JPw32ZQnjFwu23
 YkfGFFy5Arfa6zKmUQljRDisoyxd91U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-_Ox6IOqjOyWVvcNKQXTGyQ-1; Mon, 16 May 2022 11:56:45 -0400
X-MC-Unique: _Ox6IOqjOyWVvcNKQXTGyQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 ch28-20020a0564021bdc00b00425cb227ab4so10047745edb.4
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OK0to00hZr33g+bacbdfmnWtmxWLDNzWz7vj6utljHg=;
 b=OKgMNEaVQWoQfHCgSmKxsslagChgLNQeuFoaYA39oiuqrXn7apLZl/GPNDPkT0SVOG
 LqwmIj4SoiJl3B7U0yUPG8tYQ4vU555gQ2IpW4WH29Q3A3TW5uF42Hog3ce3I2dCHrc/
 I+/RG7AWKEzW178Jl/n1K0HF39rsPu3vl1/tF9Anaqbhsd+yoi9ftsxF9UdN7aV7PVa6
 V7AqIIj922+HXqc8HRK51w1MBS6yq4117hukpR87q6kKmk8Ys/M1v6WgklU2HyXCC4Rt
 xQCrLIXUWEAcM0YydyF3GP3ZB5XX6JRQ+pwyJSBMx7KWvfUXEFo3WqlwQTOZt84wu1q7
 eLCg==
X-Gm-Message-State: AOAM5316Lo+U4uGWowECJgiZJl2NJyytvijbrnNHQ+a+h1M+BuEYHlBV
 z0zdIqEJrff/PWxaaLf7+wPaXnHCWFT3OU7KXX3PaT+/MzR31YigPKLwmGfDUr38Py8i8kpa8h2
 AjLOKL/G7GfMKqKy3WgFEpNc+X9Dz42lw7psBJ52kF8FE1t5SBKb2Lcal+mGW0uvUdDU=
X-Received: by 2002:aa7:da83:0:b0:42a:b7c9:1a7b with SMTP id
 q3-20020aa7da83000000b0042ab7c91a7bmr3671428eds.359.1652716603991; 
 Mon, 16 May 2022 08:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpYk8uCLcauoV7+XpxuGYeHc+cm1Mks7Rfz3mdJjnRqmuNx6iRIaNb774Wup8RiX18RO5dLA==
X-Received: by 2002:aa7:da83:0:b0:42a:b7c9:1a7b with SMTP id
 q3-20020aa7da83000000b0042ab7c91a7bmr3671407eds.359.1652716603780; 
 Mon, 16 May 2022 08:56:43 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 zp1-20020a17090684e100b006f3ef214e28sm38004ejb.142.2022.05.16.08.56.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/23] build: remove useless dependency
Date: Mon, 16 May 2022 17:56:01 +0200
Message-Id: <20220516155603.1234712-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-plugins.symbols is now processed in Meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index e5fd1ebdf6..b842dbccdb 100644
--- a/Makefile
+++ b/Makefile
@@ -165,10 +165,7 @@ ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
 endif
 endif
 
-# Force configure to re-run if the API symbols are updated
 ifeq ($(CONFIG_PLUGIN),y)
-config-host.mak: $(SRC_PATH)/plugins/qemu-plugins.symbols
-
 .PHONY: plugins
 plugins:
 	$(call quiet-command,\
-- 
2.36.0


