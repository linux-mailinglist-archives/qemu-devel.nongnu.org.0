Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102B373799
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:33:02 +0200 (CEST)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDtt-000169-MM
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDka-0000wO-Qi
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:24 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkO-0005Ar-3H
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:24 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 a10-20020a05600c068ab029014dcda1971aso879342wmn.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=djikfsvzpevIoT9ZhL//tIh35KLunxCT5zbeziHmb1o=;
 b=RaWqM373kh+NfkiwzPJZ9jon/Wo8I9ynFTowezuYvqOo852c5BUARA9KIwcdHfUgdT
 UHhzyF82jMhFXksVx7/87ibsG+lvlgUb7aGCVg25kLpzTNtfujA/c1JiyRb/sT0ZLAWS
 MBCavFxUDbiSB5SooEzR/7IBhkegnEZv9tDenoIjHu0A992rG14e7Q1WJsIUHU0F++S+
 xwkMI6EhYpc09ccuoVBFGUH9cAMWccZ8JAKA+L0SDLpVcMvNHli/TZtPFnKhejUeIu12
 hiZPBhQ7rVyY92b8iKEq1+NDtUmqSOedIOl6GSPfE4fvhTK+hcNcW1lqN5rxB5EIsNBy
 Zggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=djikfsvzpevIoT9ZhL//tIh35KLunxCT5zbeziHmb1o=;
 b=oSdiziud/kqVa9Vs3XjMW5d2ibRwkq9EaeROyMOUUeopiFmF9USJbCx5tefHoObBpX
 u3rpNmuBDyO0htDUmejGrIvJ7h2Zaw6y8kYRZHBHiFukOd8OYrszsV7WqhKTZkXxauVY
 g/EnksG93S3cmVomxbVCJ5ogaYBTlPBF2IlT59ahX0Gyc2ZiBB03M/VVnUVRkpl4FzTi
 JxSxFR1EIespX3JSMa0ESt5RgxZ2f0xbIViWi1cLQkpyoV3TmGyFxjELB1xaKHGCa0ek
 pyV7m369rt9wI4gXI54+qCuqQLE//Ay1oHwoD7lBvRnrDR6OTTovMIEQ0enZP4LWprO+
 PMfg==
X-Gm-Message-State: AOAM533jwQplpZ9d74cr/FR2Ln5N/aMPYRapfj0QGA5/2H0GvXlPsFxp
 yDnxjdnK/FlaiB2s20vcN9jy4w==
X-Google-Smtp-Source: ABdhPJx1SHeNu3qDX2ml4vSmvFrnfK6rpiSfO2qJFMtTFjB64mkVkqqNWsmTziDB3/gbffAYXlMbog==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr8482662wmi.87.1620206590380; 
 Wed, 05 May 2021 02:23:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm19374075wrg.34.2021.05.05.02.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:23:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 455AD1FF91;
 Wed,  5 May 2021 10:23:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/7] docs: mark intention to deprecate TCG tracing
 functionality
Date: Wed,  5 May 2021 10:22:57 +0100
Message-Id: <20210505092259.8202-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505092259.8202-1-alex.bennee@linaro.org>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently attempts to add a new TCG trace events results in failures
to build. Previous discussions have suggested maybe it's time to mark
the feature as deprecated and push people towards using plugins.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/devel/tcg-plugins.rst |  2 ++
 docs/devel/tracing.rst     |  7 +++++++
 docs/system/deprecated.rst | 13 +++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 18c6581d85..edf04e3091 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -3,6 +3,8 @@
    Copyright (c) 2019, Linaro Limited
    Written by Emilio Cota and Alex Bennée
 
+.. _tcgplugin-ref:
+
 ================
 QEMU TCG Plugins
 ================
diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
index ba83954899..6b0f46cd54 100644
--- a/docs/devel/tracing.rst
+++ b/docs/devel/tracing.rst
@@ -414,6 +414,13 @@ disabled, this check will have no performance impact.
 "tcg"
 -----
 
+.. warning::
+   The ability to add new TCG trace points relies on a having a good
+   understanding of the TCG internals. In the meantime TCG plugins
+   have been introduced which solve many of the same problems with
+   more of a focus on analysing guest code. See :ref:`tcgplugin-ref`
+   for more details.
+
 Guest code generated by TCG can be traced by defining an event with the "tcg"
 event property. Internally, this property generates two events:
 "<eventname>_trans" to trace the event at translation time, and
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae86252..0c9d3c1e1e 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -312,6 +312,19 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
 (the ISA has never been upstreamed to a compiler toolchain). Therefore
 this CPU is also deprecated.
 
+TCG introspection features
+--------------------------
+
+TCG trace-events (since 6.1)
+''''''''''''''''''''''''''''
+
+The ability to add new TCG trace points has bit rotted and as the
+feature can be replicated with TCG plugins it will be deprecated. If
+any user is currently using this feature and needs help with
+converting to using TCG plugins they should contact the qemu-devel
+mailing list.
+
+
 Related binaries
 ----------------
 
-- 
2.20.1


