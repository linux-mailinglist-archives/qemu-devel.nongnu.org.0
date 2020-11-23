Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551562C04F4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:54:27 +0100 (CET)
Received: from localhost ([::1]:52698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAQL-0002vz-0e
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAG0-00050v-6Z
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFy-0002nZ-Ku
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id s8so18237520wrw.10
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4Ypxoy0mib2XWO0hP79LJLjw0b7ewwN2mmrbu/XzDlQ=;
 b=GyGpIgSNCVp8lB4iiGMMUJTgZ93TPBaNbiz3lrj8y3WaFL59KbYFzbYGYQX5p4YkQm
 KDsFs3c5PILRidxh3qHwzGIpSASEfb9hZXdeBQyDeOx1bewnQJ+4h2yiM7CBRgKLX7dW
 9b3dRzebLOjDbnDpJ3+pX+roJvpiUui4lQwxp4qQ936sn8y2d1vff9nhV/t5DBpf5Ogd
 Wi1VNDN42Witxrr1dbm0eJJFjLj+0AK7Xeyg60IdQk67KjrulJGZvH5vURFTStmajJzs
 eeH59z+5WvK6TezT4YPmx4qT0Py3Vgrgqttk8oDoSia0zyRs1IV3ASEyJHhDU5wt+P5m
 O3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Ypxoy0mib2XWO0hP79LJLjw0b7ewwN2mmrbu/XzDlQ=;
 b=MTGOfZY2+jyXCAgtTkpm6BUUuOCwMVA83sf5eXWFqMeiqRy3pFR8+lSnRbE6EPY+tU
 Merq0fAaMmP4EZGgGiuCosmz7OxYBPPw81yhij0w3OiGw2smt3+SeR+ahsvT2qNv6yt6
 TUSsa5U2G1HmAy/n5vJM6gO+KKCJ1cl1hmmzq8BNwVM9xjz4l5AwE9iGCVTrFb5krvXs
 TD5R4W0IK83fkFE87QbqMZnt0uh69i+Z0eSAIz2bPT0lHgNC7blb7s63QBqUq2TKnrjc
 fC5dZhvcgyyRGQ5TbDA8JUV5dIhSR64IgeYC21W/+wRx9u8OfcrFPY2e+WZAuighnm3u
 f9wg==
X-Gm-Message-State: AOAM531iGZohB0JHc1vw/szfT+pEMZ71+B9wD0jylUDaWO0rwTskuUGi
 Eu+aDNTA0F+xMZUfcVevGCC7/IxruWDkTQ==
X-Google-Smtp-Source: ABdhPJxik3KoTyYUzwtQiEoy23xNPOOzKmg0xAOk4dNYiIxD+Ywg5ChMQXi7iugHAtNYuIAOOPzBfw==
X-Received: by 2002:adf:de12:: with SMTP id b18mr31384783wrm.187.1606131821185; 
 Mon, 23 Nov 2020 03:43:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/24] docs: Move microvm.rst into the system manual
Date: Mon, 23 Nov 2020 11:43:12 +0000
Message-Id: <20201123114315.13372-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that target-i386.rst has a place to list documentation of
machines other than the 'pc' machine, we have a place we can
move the microvm documentation to.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/{ => system/i386}/microvm.rst | 5 ++---
 docs/system/target-i386.rst        | 1 +
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename docs/{ => system/i386}/microvm.rst (98%)

diff --git a/docs/microvm.rst b/docs/system/i386/microvm.rst
similarity index 98%
rename from docs/microvm.rst
rename to docs/system/i386/microvm.rst
index fcf41fc1f6f..1675e37d3e7 100644
--- a/docs/microvm.rst
+++ b/docs/system/i386/microvm.rst
@@ -1,6 +1,5 @@
-====================
-microvm Machine Type
-====================
+'microvm' virtual platform (``microvm``)
+========================================
 
 ``microvm`` is a machine type inspired by ``Firecracker`` and
 constructed after its machine model.
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 1612ddba907..22ba5ce2c0f 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -16,6 +16,7 @@ Board-specific documentation
 .. toctree::
    :maxdepth: 1
 
+   i386/microvm
    i386/pc
 
 .. include:: cpu-models-x86.rst.inc
-- 
2.20.1


