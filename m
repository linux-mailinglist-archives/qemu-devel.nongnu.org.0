Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4446E2B07C4
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:47:04 +0100 (CET)
Received: from localhost ([::1]:46082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDsN-0007GA-8n
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmQ-0000lB-Jn
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmO-0003mG-Pf
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:54 -0500
Received: by mail-wm1-x32f.google.com with SMTP id w24so5765543wmi.0
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CLXLkaYqg0DCYCi9CWDIZl935r9PPF+JVFlXeVjwHwU=;
 b=cA0dX8gu+p9NwjbzGNLHtdfRp2J006l6FUDBrUEbf5sqvpSUQN2wj/vgB31ueCH1tF
 Acwcve2ut3x63uk8NX76xUXieELFXrZQtMbMZYEE8KM3rLzVu+ZRLV9GlQ1ULzqi3RiW
 FSVcWFiTLKZxJuBPkuLJHHXnEFujpX6+kg1dDEp+/HB9Z+5mIe5r0CV0GoLKlQMf1TUa
 s3qNXuKwzXL5wcwppykTNbu1OvnUQ8lTFt+0GkBbtYhnUt3FlXPuRtrxSXXjk0ZF3eoN
 dbpY+hMnyBaWnaJn8vat36OtEooxhNXiEH1y20dpZC9/IgOe+UBs8VPTdlL+Ltj2xvw/
 q/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CLXLkaYqg0DCYCi9CWDIZl935r9PPF+JVFlXeVjwHwU=;
 b=iJD2Q1an9Dczb9Z+Z+NpycxBl7sfVQLRvVn+1HVrOk/k4oue8CuM4hRoR+zaODoEML
 2IdkVsc+Zlr8Zf9uhHdnT+xmoFdl76hODq/hvrfFYBBjj/55ZfAV0+76qwAl8f2deE1u
 ybzXG7UK8Eo9K+sUwNM02pgQ5HsGp3Jh+qkxZin7lMuPN7l/NEanuJtwQeC23tTPFUH/
 0/gH1tznNekG1dsyHB5CznS2CIV8xNWg5ZSv6Gf0SeVekBu/S9j71Xt88Xa9Usy3fA8J
 1QHCHWDR6WVZNHYDS+Ajw7PA9vg1r5nhbvnKTLIupzSUnuvcYw49i3VyV90A9dSBQsTJ
 3m7A==
X-Gm-Message-State: AOAM531ngh3gz6sIoZggVQlP68F/pE8XigZ18bv1AxB62WiZVHeIYVWk
 qOIowVSnRze7avrvsfqa7IWf3XJ9p98Yrw==
X-Google-Smtp-Source: ABdhPJwxhPoKfKpjiRYHhiM1HJ+8YDEyjEUxAGK0AAmVqFJIMnt6bXrRBHXfliG8EldASrofTddDSQ==
X-Received: by 2002:a1c:1906:: with SMTP id 6mr11455wmz.87.1605192051153;
 Thu, 12 Nov 2020 06:40:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 6/9] docs: Move microvm.rst into the system manual
Date: Thu, 12 Nov 2020 14:40:38 +0000
Message-Id: <20201112144041.32278-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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


