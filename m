Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DE3FFCF8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:21:46 +0200 (CEST)
Received: from localhost ([::1]:56078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5OL-0006fi-Bc
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F9-0003zR-K5
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F7-0003yg-2P
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso3301843wmb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7c3CQhXYMZaS6qp/bjoVLss0w/WAp6ZgK2nwF/t3WI=;
 b=KTLImDIKVzpe7xpzpS2F9Sb8sf0oMAY6L/FfiA9dGkXv771kpiJONuyRyp2RWuPtdR
 49b8nPohP5TpLJFLr7aTvAy7ONdy+QOKAiogAQTt3JxJx6woZqQ8lmb4uMG9u5p4/wAz
 glUZfFJgXczhRTpXM8Jk6xVXOAaDLuH3fVogJ6ghi2aJmt5q+zeRXe41orMxwbOOpVSc
 jNGsIeNUPPUG3EC5lleYPXJjwYy1T2BIq03OXWAPX1n5ahTY0/U6+dH4oj1pd0LMWngj
 jNY5fmYIQDdX8Z8Q46KTfM2uyq9sEW/yFUhsgeNp5+9PoSkAwJN7J9PVmgszw9nObtOU
 QYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z7c3CQhXYMZaS6qp/bjoVLss0w/WAp6ZgK2nwF/t3WI=;
 b=bf37dZB6V9vhMuMWwBPbOnk9CUKdiVXYF0OktI5/OCWB04kLKd7n81NyAZgtvZSyQA
 5E3DyQBVxL7cEN2LBfJgueQU9bImdejzPipprYML2mVD7YMkDesNBftJ7YwQ7zqfSJJB
 vJ3z/oJgNgPi+wiGAjQ9QByrBLOimz/orMAn/RnUDfw6UiM0UYf9OtYORVTtIZr4qdPY
 aWxEm5T7EokELIAfc+3lrryGvcwXBt4HCTX43BbNesMkE1Ua3VN3cPWvsZc60lHIhOEl
 pH36eG+7Xuug9uoAdO7KdHBgKrdN0eX1q6aN2Rcam+iM6tKwvZa74vcg7fHE239SSGBd
 vzCA==
X-Gm-Message-State: AOAM530EZDOssxQE375mKQOqwtdBnqmQlmodgu7aBWn6bG6UgRRNPfNL
 CRUjvNqsgTv5Z+LhOWHPnPzmqQ==
X-Google-Smtp-Source: ABdhPJycqMHB6oVvdAFj+BlwLwkOW/tvam4HYLi1i3J4hSc/rMyCQZJFn27UghX7AXq6TmDNBnNYag==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr2276916wml.58.1630660331738; 
 Fri, 03 Sep 2021 02:12:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x11sm4117905wro.83.2021.09.03.02.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:12:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E1141FFB7;
 Fri,  3 Sep 2021 10:03:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 21/22] docs/deprecated: deprecate passing plugin args through
 `arg=`
Date: Fri,  3 Sep 2021 10:03:38 +0100
Message-Id: <20210903090339.1074887-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210802134414.52037-1-ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
[AJB: fixed up move of deprecated.rst]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1e1a5e96ad..6e88a84bba 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -139,6 +139,18 @@ The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
 should be used instead.
 
 
+Plugin argument passing through ``arg=<string>`` (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Passing TCG plugins arguments through ``arg=`` is redundant is makes the
+command-line less readable, especially when the argument itself consist of a
+name and a value, e.g. ``-plugin plugin_name,arg="arg_name=arg_value"``.
+Therefore, the usage of ``arg`` is redundant. Single-word arguments are treated
+as short-form boolean values, and passed to plugins as ``arg_name=on``.
+However, short-form booleans are deprecated and full explicit ``arg_name=on``
+form is preferred.
+
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
-- 
2.30.2


