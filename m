Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB52E3B456D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:20:27 +0200 (CEST)
Received: from localhost ([::1]:57736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmh0-0005XQ-S2
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf7-0002r4-12
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:29 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf5-000381-FO
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:28 -0400
Received: by mail-ej1-x62b.google.com with SMTP id hz1so15401364ejc.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NaoA/Gz5B3VaHjNe4o2mJuay6G0a5kmwmmXcYmBXU30=;
 b=s0v4rUTxS4ShvtlUiGZ5gwYgXvQ+/p3ttV0CSeTDRjjofHsAM/xEgxyEXTdE5fhSbM
 r9JjOlPdfxQBf1Z0ymPNvHKLBL15+b5CKSvA6YTdAVViDVdowc3KYwyuZ1fZ5yoJ1ev0
 5+wIHdQT7XyyHbH8GUv4PSRpxAYcjItdyGmJwDpCebwy+5qumxiUH1Jb0gHzygVXpNmi
 w6UL3YxLaSxt59BFWBUpj1trTc/KgG1Dqtd030diaObtJrZzxhq+iEbBpxcIwPWl6Ovm
 tJsEkke5Q3faw6URlRo6hNxdP/qGm13iroG72uNeJJjNVlFbZp3h0QPi5vuszIzhWkbt
 99wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NaoA/Gz5B3VaHjNe4o2mJuay6G0a5kmwmmXcYmBXU30=;
 b=fcx1kwl56ZQT0XkzD8vGeoLgmxVrTbo9IJ/nKyVut1nvGXqM4glboMf8KW1vS6to1/
 Jfb6OTuB8O855sFHCO1wIistva2E/v0dRjvoTEWIknOVyc/HdhdkffBuCI46kn8/RyRr
 GhaM9AcL9+FIs8R7nPYCRff8cb87UJ8+WqN39mizxX6pQk4osoIL3VN0iMP00LI2OzKg
 V9qk73+L6jag/VCj6hOV03ZMSSCpAQe6nxyKhVNSF+Ah2/CVmUVI8Ia+IJOnaWRs2pnU
 5suAGLfUaYS+NF6sF39+AdCpa+Om7TBxdzp0bM+Fs7A9r/w00a3O+01JWmjPXmQ7JPeK
 7BJg==
X-Gm-Message-State: AOAM533d/nAy7sAin4nPq60i0YvldUxEGd8MOQIFrjK8hEVNggeS2zIZ
 7JYFImjk3/k9lJ8gjyF3cKeI6ihXxw8=
X-Google-Smtp-Source: ABdhPJxvRDfpBqmtNHlU+Mz8It6z1eApSuadzcrR2q5A2ZqTfryveTar+TE9aL8yh8t5RYw3x2NpCg==
X-Received: by 2002:a17:906:49ce:: with SMTP id
 w14mr11195016ejv.273.1624630705719; 
 Fri, 25 Jun 2021 07:18:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/28] meson: drop unused CONFIG_GCRYPT_HMAC
Date: Fri, 25 Jun 2021 16:17:56 +0200
Message-Id: <20210625141822.1368639-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_GCRYPT_HMAC has been removed now that all supported distros have it.

Reviewed-by: Richard Henderson <richard.henderson@liaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index d8a92666fb..87147a5f3f 100644
--- a/meson.build
+++ b/meson.build
@@ -2664,7 +2664,6 @@ summary_info += {'GNUTLS support':    config_host.has_key('CONFIG_GNUTLS')}
 # TODO: add back version
 summary_info += {'libgcrypt':         config_host.has_key('CONFIG_GCRYPT')}
 if config_host.has_key('CONFIG_GCRYPT')
-   summary_info += {'  hmac':            config_host.has_key('CONFIG_GCRYPT_HMAC')}
    summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
 endif
 # TODO: add back version
-- 
2.31.1



