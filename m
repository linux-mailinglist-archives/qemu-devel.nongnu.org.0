Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C82A2B6AD6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:01:19 +0100 (CET)
Received: from localhost ([::1]:43634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4M2-0005Rf-JO
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EQ-00023n-Hs
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:26 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:39177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EO-00074C-Lb
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:26 -0500
Received: by mail-ed1-x544.google.com with SMTP id e18so23206227edy.6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gNWJ/VEx1uTE8wxM/bFQps9+VkdXGSnUdRqMFFMtLWI=;
 b=rYInS5QIiVulKKyP3KjWYttA1MOwrN056PVQGDYCOTzKnqWufNzbFGvpKF/xVdSkXC
 PlAxUQUpvDWXx7m5TbRS0MfVgB0LdFgbMbR5s/otboTRjE1C/vuOiWydhAxtzlTb42So
 S0rQAMlmnDEQhT5webkub15bX3claOoCnD3JlmVxAg8DDJWkZz4XP7//zqgdneTC9fKz
 zCs1Lfa1sC1ZG+o4ANo0hfyGG3wALOLQu9bYICNf9EsKU8CM3itsTnT1XLRkYrbu8JSr
 0U9KvP7wDPCY/ZBZd3tCj3g78V9c/LLmt/QtF6fbX9+8iZ2HLVQO/Pdz38A6XMQYQUJt
 vOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gNWJ/VEx1uTE8wxM/bFQps9+VkdXGSnUdRqMFFMtLWI=;
 b=rWYMudIFgblCaG8C3UBKoPlX1Wy/lid7Uj+d9xzureKdFKmpMLKkUFJEGszh+BtACP
 5ui7iH5TvCfRROQUV9z1SGuOyrrSu6Iz6HGJUo3AsygiqBucJ1EIniTfu2FxC4vDvO/8
 81eqiTvNhLy13nrK5GCe417eMF6DarY8zBZdRirhI/olwfcYlEwvcAdR7vU5Fm5op9oE
 h8FceFiC3q0O5Pq+gdoh1MDZGwjLs1OzhQXSbUcGeA9RDOxh9WP9GR1RH7XG8COeNQoP
 QJ+hY32VkU7lrHbzbTu7TMMK3ncn0gSiRBklB79uat2fXFShFZOtlVo0Un6Q9z6AYeAm
 Ia9A==
X-Gm-Message-State: AOAM532KoDMroWJnMrLwg2XI1DlJrSYl6I26vFhDJisD9PqNBJaX6FLD
 eAkPaMVigs9MG09aRGggESHO/GcTHCs=
X-Google-Smtp-Source: ABdhPJxFXRFTnwia/1OwEcbBoBA8P+CKT+sCd4WwD5aLuSz42sObQ/PvnDcLRym4hmhHkbDJ6QrXfg==
X-Received: by 2002:a50:da4b:: with SMTP id a11mr4449648edk.364.1605632003055; 
 Tue, 17 Nov 2020 08:53:23 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/29] Replace HTTP links with HTTPS ones: documentation
Date: Tue, 17 Nov 2020 17:52:50 +0100
Message-Id: <20201117165312.118257-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Alexander A. Klimov" <grandmaster@al2klimov.de>

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  For each line:
    If doesn't contain `\bxmlns\b`:
      For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
        If both the HTTP and HTTPS versions
        return 200 OK and serve the same content:
          Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
Link: https://lore.kernel.org/r/20200526060544.25127-1-grandmaster@al2klimov.de
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 95f2d7adcf..fadc2f5b86 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -324,7 +324,7 @@ if (defined($ENV{'KBUILD_VERBOSE'})) {
 
 # Generated docbook code is inserted in a template at a point where
 # docbook v3.1 requires a non-zero sequence of RefEntry's; see:
-# http://www.oasis-open.org/docbook/documentation/reference/html/refentry.html
+# https://www.oasis-open.org/docbook/documentation/reference/html/refentry.html
 # We keep track of number of generated entries and generate a dummy
 # if needs be to ensure the expanded template can be postprocessed
 # into html.
-- 
2.28.0



