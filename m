Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB434667F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:37:32 +0100 (CET)
Received: from localhost ([::1]:45116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkyB-0002Ao-BI
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHK-0006jR-Gs
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:14 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHI-0002md-Ts
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:14 -0400
Received: by mail-ej1-x629.google.com with SMTP id ce10so28236160ejb.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SFKqwWA28mZoYIjZ0ZOK5EiDbcG9dnnim+9hGp91sS0=;
 b=WTW9MqNOXGNmMOd3t8aIoO0okHhcZF+wXpsBs3m1cJXi1+M2Fgt/2gOH6INSexNzeG
 YDFdsUVaUJctComUueN6iNpRfpLhLI7LnvyIjZ2soZtpL7CiVz3SAOKiyZf01P7QxDEA
 Yu0dDfKxOCxbtfSrSjE25dnrsP0rDuhy1MXKHV6daykeD9YZNorPCwZjPFamXBrA7hSR
 fP1tomMjoUF0FHk6HaMao41AemIlBV387/pM6wDNjR8JZJGk6HSrI3H8vXSRw8VCSU7f
 LExmwq3QgsoWFfyM8tUPaRgYoI7qGK7BMNpDVFjADke4pytkVa0fNgtcZbW3lUcVIvVP
 gl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SFKqwWA28mZoYIjZ0ZOK5EiDbcG9dnnim+9hGp91sS0=;
 b=C0PaOIfaFx6RAJ27YJdHaftXeuUzM7s/XM9pz+yHlWbokJhmld6f+7kGh0H4fYwduC
 W5NZOCW2qzzSj/MPGyp2pbaB9ftb+LpbOReym5ysjgagpnaVegeTNQ1O3NU/M614Pp52
 DuIlBViuQUds5gHGr5eQBhPX9uybqfwrZRNypmbu7dqYz2VT5UBM+eYF1FzZsL7JmX6P
 CeCd2XpJ36lzJLgR+O7EUKq+djReRHRYoUPxnMKCInHX0dyR8BVIv5oGOatNhS2r5QMo
 LjfxcotJtCEwaWG95E2m28DLzzOHTjnev2xvYLCnTT7C9Jf7r7qv57ZWCHFf2Hf+A9GG
 sTsg==
X-Gm-Message-State: AOAM530d9OaC7Prhsx6ynk9Qon//tJS7PPQRroMy6SNVhL2fC8dTBzIX
 +XuLHN3JAr8eGiCqSHa3AYzmbQ==
X-Google-Smtp-Source: ABdhPJxyPz/F4eFGeld+UmzLuwsV8Ywg3J8hC2gXSFZaicM9wF2O+K3MRJqJfNJYpM9/vqzTxuqJzQ==
X-Received: by 2002:a17:906:3750:: with SMTP id
 e16mr5799198ejc.75.1616518390954; 
 Tue, 23 Mar 2021 09:53:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm12870554edt.64.2021.03.23.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B72A61FF87;
 Tue, 23 Mar 2021 16:53:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/22] scripts/kernel-doc: strip QEMU_ from function
 definitions
Date: Tue, 23 Mar 2021 16:52:47 +0000
Message-Id: <20210323165308.15244-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some packaged versions of Sphinx (fedora33/alpine so far) have issues
with the annotated C code that kernel-doc spits out. Without knowing
about things like QEMU_PLUGIN_EXPORT it chokes trying to understand
the code. Evidently this is a problem for the kernel as well as the
long stream of regex substitutions we add to in this patch can attest.

Fortunately we have a fairly common format for all our compiler
shenanigans as applied to functions so lets just filter them all out.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210320133706.21475-2-alex.bennee@linaro.org>
---
 scripts/kernel-doc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 4b19851b2d..240923d509 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1745,6 +1745,9 @@ sub dump_function($$) {
             )+
           \)\)\s+//x;
 
+    # Strip QEMU specific compiler annotations
+    $prototype =~ s/QEMU_[A-Z_]+ +//;
+
     # Yes, this truly is vile.  We are looking for:
     # 1. Return type (may be nothing if we're looking at a macro)
     # 2. Function name
-- 
2.20.1


