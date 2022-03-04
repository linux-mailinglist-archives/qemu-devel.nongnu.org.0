Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495174CD387
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:33:30 +0100 (CET)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6Bd-0007vO-2w
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:33:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ609-0002dQ-K0
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:37 -0500
Received: from [2a00:1450:4864:20::330] (port=39804
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ607-0004fd-S6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 o18-20020a05600c4fd200b003826701f847so6417499wmq.4
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mcsPtmWVkD2iOC6zuv9lO7mH5DMh4k1zBSF/wMzprBs=;
 b=Sm6UdJ83Sqx8eMJ48iUyUo3ay0OTyiZullh8e7t/vxyzPHHbbOx4MCjN3DahoehJNq
 UxgWyb8ScdT2TokckQz63IU70kJ3jx0PlpcBsl448xET7Q4fJ9LtNYJbHBTolc3cTDy5
 BmUYAqL4cqtgZie8scApN879/oH8lgf/Xq37DzCAG7R/YJgkqw1OlKrnhaCo6LsBjuOo
 zttu1kuaYjvGd/isR2lc2JJqG2xoozQezJsILg2CSmY/zF2DrjILTmqsLL5thL7uEEOi
 XYzjMKrdKDVu2d3sRb+AsWe52wiZGiq5/eaf8ACRhL2Pd1JUkNeFxpnQ+VSX4LJxNjrv
 Enyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mcsPtmWVkD2iOC6zuv9lO7mH5DMh4k1zBSF/wMzprBs=;
 b=RJDOmhUSvktt3ygcCYwfLlR8ms2ol1O5oQOVBo6J5/YrLpvfMkJdwOBLv/N4HnQ6IK
 sauEBkGED5yVI/i8WC875xulLYZA/CU1ebwcop0qKmK2RYi/6fS7yZlZJDYI8IFshyTQ
 7AaftOEPAXt+mcQqAwJuvYHVhmxtNvHk+8NHPKBuja9JiJxsPrpAZCvu9V1/hNilcQHV
 VwT/SrWS0bOhzosgCckoNET3Rr/fAzF7vJ9SENrxemkEJTBucA+Cq5qS8DbH/wIi2VqO
 AjufrLGJeKgYCXa4up2MOmN5yr1KzQoFube/aIS+284HRvxvoxImpH1raHY1aMipgk9N
 rwPg==
X-Gm-Message-State: AOAM532aXyADBIz1q/RldOwHMPmxwwPOehh+YKxtefAE8aBcrRUFmr9d
 bzV2BKc037MTepT69Z31NIMtE+xDgchChg==
X-Google-Smtp-Source: ABdhPJy7IkOVkAxHMOzIw0mMyEn3uOgsDWkuqnTLgBAxXQAA9710NAm+bHuWZYfB/VejnW67ZX2emQ==
X-Received: by 2002:a05:600c:264e:b0:389:802e:c7fa with SMTP id
 14-20020a05600c264e00b00389802ec7famr1813725wmy.93.1646392894532; 
 Fri, 04 Mar 2022 03:21:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm4148651wro.26.2022.03.04.03.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:21:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] meson.build: Don't misdetect posix_memalign() on
 Windows
Date: Fri,  4 Mar 2022 11:21:22 +0000
Message-Id: <20220304112126.2261039-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304112126.2261039-1-peter.maydell@linaro.org>
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we incorrectly think that posix_memalign() exists on
Windows.  This is because of a combination of:

 * the msys2/mingw toolchain/libc claim to have a
   __builtin_posix_memalign when there isn't a builtin of that name
 * meson will assume that if you have a __builtin_foo that
   counts for has_function('foo')

Specifying a specific include file via prefix: causes meson to not
treat builtins as sufficient and actually look for the function
itself; see this meson pull request which added that as the official
way to get the right answer:
  https://github.com/mesonbuild/meson/pull/1150

Currently this misdectection doesn't cause problems because we only
use CONFIG_POSIX_MEMALIGN in oslib-posix.c; however that will change
in a following commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220226180723.1706285-6-peter.maydell@linaro.org
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index a5b63e62cdc..73fd17a0523 100644
--- a/meson.build
+++ b/meson.build
@@ -1619,7 +1619,9 @@ config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
 config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
 config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
 config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
-config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
+# Note that we need to specify prefix: here to avoid incorrectly
+# thinking that Windows has posix_memalign()
+config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix: '#include <stdlib.h>'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
-- 
2.25.1


