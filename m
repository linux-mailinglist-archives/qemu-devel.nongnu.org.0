Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC93391D97
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:10:28 +0200 (CEST)
Received: from localhost ([::1]:60964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llx35-0002fE-P2
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwya-0007MZ-Sl
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwyU-0004O9-5O
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
 b=IxB41d1Ub5xiHvRC4V77AgO6Ik3yCQFgLFh3qm2pd3cU340Pk0S7eZ1HlIMs9VHayQHLkN
 +iedwAZXrVwmdQu//mn9uTkeHwjCEukSVdh2UsusRygyKFm784vw0pj/uQxijGVpvIZyWd
 ouFufmywVfNs4QcTOhKZ9+1oCxYt0Ng=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-3kF9jo6kMkGqzPEErmeifA-1; Wed, 26 May 2021 13:05:36 -0400
X-MC-Unique: 3kF9jo6kMkGqzPEErmeifA-1
Received: by mail-wm1-f72.google.com with SMTP id
 h9-20020a1cb7090000b029016d3f0b6ce4so621188wmf.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
 b=c/sSeM8jHkC8pryCRWcE+hTYfhAfiBzKKYVLtPoqFBTm+kBVmfiAh6bLpmB4DbL+0C
 lFlHzdew+2nQcGDtd5IVYq0Qg12pa4oJ8PHA3mFaDy3jh8/M1juXZqI7W7k4j/pwDa4S
 FmiESWUAAq0KHdeSgSIk/wuntpTTuqtiaP35qozgdegsjZkVs3UQWL8Gz2YiQ+7ADiGv
 W1JkcH89Yj9aNRwU+RMFN/9N2QJKO2oCC0U2bRW/UwVXdf5veTv2q3Yr4fMlKdEuvvQl
 s1zAgRH43WUwRCHQKqVg9BLQiKrlRmXThtjIEomdPP/02QfM/oHJ1hrjBN4Aqth0S/th
 Y3qA==
X-Gm-Message-State: AOAM530HFL8U431qkI566dXqjHAScT1/nZxREITsOBS9tuAe5AB7MfsO
 ucE2UOmXGJ6vMV3y4TQbf/dajBMIHnoEmQXWexxlrTBiGQ7GGEQY5sEqM/y3QEZzpyJG/uMXqT0
 5nbyPuGnCBhwBgcbPniTM93tMWEEna/Cek7P266+WOnJFnC58NFOIjAiUGIJ5HNuN
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr35102858wry.14.1622048734864; 
 Wed, 26 May 2021 10:05:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP6aNvdBMSRqkm8AafJGVA5fY66I6sXZksfURgiqrMBrfwU6Lyarisy43Y271/g2VFNtc1vg==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr35102817wry.14.1622048734589; 
 Wed, 26 May 2021 10:05:34 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id a16sm20462434wrw.62.2021.05.26.10.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:05:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/12] qtest/arm-cpu-features: Remove TCG fallback to KVM
 specific tests
Date: Wed, 26 May 2021 19:04:26 +0200
Message-Id: <20210526170432.343588-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
tests are now only being run if KVM is available. Drop the TCG
fallback.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 66300c3bc20..b1d406542f7 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
-- 
2.26.3


