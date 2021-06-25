Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2363B401D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:16:08 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhwV-00037H-7Q
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuT-0000S6-Qi
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:56271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwhuQ-0002sz-SU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:14:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id c84so5777792wme.5
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziq8Q+65yXs85QgnyMAfaIYXuYjNk9uwdvgV6eM+uzI=;
 b=Ur2AAx8npu5Tf/gcX+0hEvjPdB02yc/T8yq+9ylTUucwMnSwlP7rHcqPBnk6bMkScw
 tDWso5HZHvFeRZiMP+8KgDOKc4I4Vqp7HeLEE2OROARGE965J2ou3xaZodLJR+y6BDLs
 tD95jLtpvqWZivHagu+gGFUmlZ+U9/JThRiZtNZyr0L6drKOh+xjPMN9d+slYpz6jWnU
 fJGsP39SR+B4pqHHHWHzBb7vghj1mRW2sLMSkAlGnhehsaNZQqQSO/OWAhX1iwzjeisO
 TxMRKC9YGMwn7R4H1s4uay+ZVOILlwfUpue9/FlFS7we5pFFS3X+aOioJ2r/yAkxWFyc
 6tnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziq8Q+65yXs85QgnyMAfaIYXuYjNk9uwdvgV6eM+uzI=;
 b=bhwTT4T+j5klD8mA2G9BGULztLgEs1jDMWP7N+zz1ihbHtyOvdFozo0MvjV6CCMTrj
 txcLwJslDpKQnUuAVN/w+Qa+jG4km+i3Tjow/H7NBjQAfS0tJ1A/qPk/2YPOFYfR/I8M
 49kX56AvqVu6jRSW4XgsMg5ZTMIrgc4Imvi1oZ6YcoUcKwqoO3/jN8pXC9dl2lJfzE6E
 CWUnE3Gnzq8iEPX2n0GWG+mheR+xxXqe7hfcBM69lJ9nlhnC9vlumz0N1KWJnlgdXLmh
 aVgUARNCKLORZoGQXZGn58wC/AX+JNhbfpewrTXxid9t9aT1Li6zDPd3uRykv+qit2Ko
 p67Q==
X-Gm-Message-State: AOAM530R+KQ6ZFeJGtMdfPmHW+yQxMMLwpsg+S+NbJvke6k0rRvYffL4
 sPCYYCx8mjAOPod9PuQYsHfoi98ckI2ceg==
X-Google-Smtp-Source: ABdhPJzJZ0H3iTJIYV0dZEeyYMA356Bv1coajOU/iZs2vi2OAMwIGQc+8h/8rg0VRz+jwtLU28+clA==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr9690130wmq.153.1624612437629; 
 Fri, 25 Jun 2021 02:13:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 9sm11730020wmf.3.2021.06.25.02.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:13:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 903451FF8C;
 Fri, 25 Jun 2021 10:13:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/7] docs/devel: Add a single top-level header to MTTCG's doc
Date: Fri, 25 Jun 2021 10:13:50 +0100
Message-Id: <20210625091355.25673-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625091355.25673-1-alex.bennee@linaro.org>
References: <20210625091355.25673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Without a single top-level header in the .rst file, the index ended
up linking to all of the top-level headers separately. Now the index
links to the top-level header at the beginning of the document and
any inner headers are correctly linked as sub-items in the index.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210528123526.144065-1-luis.pires@eldorado.org.br>
Message-Id: <20210623102749.25686-3-alex.bennee@linaro.org>

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 92a9eba13c..5b446ee08b 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -4,8 +4,9 @@
   This work is licensed under the terms of the GNU GPL, version 2 or
   later. See the COPYING file in the top-level directory.
 
-Introduction
-============
+==================
+Multi-threaded TCG
+==================
 
 This document outlines the design for multi-threaded TCG (a.k.a MTTCG)
 system-mode emulation. user-mode emulation has always mirrored the
-- 
2.20.1


