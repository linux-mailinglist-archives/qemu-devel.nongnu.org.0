Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E6347AD2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:35:37 +0100 (CET)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4bg-0002tN-8g
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wi-0006EF-9T
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wf-0007Gv-MH
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1305239wmy.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SZD7khucdGcSc+2blD6LJsOrnrnjjxBS/+7VFFzHNQM=;
 b=ZO9bLnNXlkbd0inXyl3/CIme+EGPn3P3JvTOlpaEzvZaJto3P4uPuLAh2ms8wFCNBW
 YMXzxcK2vvOKurQj+eAzd9G+dvWvwwQ6ORuKR5+KrvJGgiWNr7M7tGsOzw8Yuvk8NbQ1
 6+0rviZcRsDgyYaWKAUcnbe/bLdikF0Vse/KAmSNW9g4xi0eAI5YglFuASG7rE1ia2oL
 omM182IN9XVhPObN91Ju4nXQ2mHp003UqTWRtpXtvtFeFKoDUyx9AuU7/wAFs4AG5gk4
 9dWhDjzjuGXZx6ennWtKdkCY+7/oNb+A5OUFsA69UFi7B2o/pr6qHXGQZOqTsMtvIedW
 LAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SZD7khucdGcSc+2blD6LJsOrnrnjjxBS/+7VFFzHNQM=;
 b=Fw6RYla/F+boXr8+4TAc2QYvSF8cVm5gaIkRVpyghXuJBcuIFyFjh2Luz2qTY/duKX
 QcfNLwrrV9nl9nKB5nH4Gq1J3Gi+cMxUG6Iwiw7PfLOnLK0rHu/m7pRncQDhESWUPRQL
 gMUO5h58Wepuq6qfDxpCYPN2mPtIDHrLT/jxhAsSStjBZVsgeKUK2I4SdlpaG2vB+NwD
 mKqdsvlQhSJFjSew10q+be2SRbybjm727SBgnloStRk5hxGYnbk42Bq5Wv1v2OEIv+H2
 E9YDnwTyttzR2O0ICyQl/JjqAP/EZPs95hYsuU4I5Cu6R1fW/t6munlWb7NrFsyg8dEI
 kr4Q==
X-Gm-Message-State: AOAM530m8j+XJdV9CpomwwTJ/gZi69GZxvFhN5k17cQ2JL6ITsuIzVyc
 C0KimZLdU5kyZHW9fjyijSIrSw==
X-Google-Smtp-Source: ABdhPJw7kVXwgksjRY+cz/jFLBk6gghwX0T0QTNLkbHwTKCE/dlwW74jQYsLNJNVeTWWilJ8MzYelw==
X-Received: by 2002:a1c:a74b:: with SMTP id q72mr3213874wme.158.1616596223886; 
 Wed, 24 Mar 2021 07:30:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u2sm3525600wrp.12.2021.03.24.07.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C652B1FF87;
 Wed, 24 Mar 2021 14:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/22] scripts/kernel-doc: strip QEMU_ from function definitions
Date: Wed, 24 Mar 2021 14:30:00 +0000
Message-Id: <20210324143021.8560-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
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
Message-Id: <20210323165308.15244-2-alex.bennee@linaro.org>

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


