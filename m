Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0537BA51
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:27:24 +0200 (CEST)
Received: from localhost ([::1]:50208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgm5L-00033a-PE
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglz7-00038q-UZ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:20:57 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglz6-0003T5-8E
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:20:57 -0400
Received: by mail-wm1-x336.google.com with SMTP id u133so1223062wmg.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkHtkDFEKBaCfxsckkEHPNxsTtMBckHgpjARuueXkuQ=;
 b=MMFB7rBELciHip+7gOHzZLoHK93UOVNjiSBGLX5b/F4p4LohIqhPCpTqZoIF0alCXv
 y7WMbqwLzeavhg7IZzHS9Xk42G97nxAuSlLsWn3l4N7TqKLP8Pw5jeHESmrqZjFO6BVU
 aik7rDNg+VEZkanFtzc66XABoBhuCFNdAiyGNwvJlIYuy3vaugncdGOUUPI4JiUgi1lD
 6r2Gxwjj1Tk0Mj69anLtruLDsAf31Dg6fg94UmSUGTSO0xz5bt8oxxEsChtojeft5Ock
 WZnoNQOO4EX3jgMgpKXg2JLI/0Nf5iFpk1FXzRHUqFGkwLuXcuEkS/U1NiEzvvYPn7fF
 QD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkHtkDFEKBaCfxsckkEHPNxsTtMBckHgpjARuueXkuQ=;
 b=RZQOBZz2Nok46p7PjULjIW8IdKBW+J2nrBjNPerZvwvqEET+5xuj1U5P0iMVXHvKAy
 cwUplAbWom1ViMmEV8CvTlg5Ns+xlByC838VX8MGCsCkl3w20m/5Iwpvzj1mOMmZk0AQ
 m6MFvFgYypkZTaGLnm3chpN2L1dIvG1NfJHNwZV+B2rNYs5oSDTQ3v+NeJItsy3xkBE7
 mHQzSdlFimIWvD/Kp9SzZCb5WPe7g9b5nqiEVYvHiBLOk3RkBUSGZpDbh9eD26LHHAgZ
 HYc945ddVJzlBHN7pab4iUUiMkZCPzz0nAfEeGpeKlNpZYjroGTor90OpddZaBf99YHi
 YIAA==
X-Gm-Message-State: AOAM53009DSmAaNW++n16LpzKaQlswQamgK+Cbx8Z/PSiqVTtTTdtZaK
 AEDJO08tgpPhqE4bAp/xVzVCUA==
X-Google-Smtp-Source: ABdhPJxT0pVOezRNNMMTyP7ERmojknm8bZtTOIt0ol5TT1p4TQdZfb9tnaX1ZshO0WUYGGM8cxPs5A==
X-Received: by 2002:a05:600c:293:: with SMTP id
 19mr38178261wmk.144.1620814854399; 
 Wed, 12 May 2021 03:20:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m13sm30700035wrw.86.2021.05.12.03.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3955D1FF87;
 Wed, 12 May 2021 11:20:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 01/31] checkpatch: Fix use of uninitialized value
Date: Wed, 12 May 2021 11:20:21 +0100
Message-Id: <20210512102051.12134-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: fam@euphon.net, Isaku Yamahata <isaku.yamahata@intel.com>,
 berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

checkfilename() doesn't always set $acpi_testexpected. Fix the following
warning:

Use of uninitialized value $acpi_testexpected in string eq at
 ./scripts/checkpatch.pl line 1529.

Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acpi data files")
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210408164610.14229-1-alex.bennee@linaro.org>
Message-Id: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f7053ec9b..3d185cceac 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1532,6 +1532,7 @@ sub process {
 		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
 		      (defined($1) || defined($2)))) &&
                       !(($realfile ne '') &&
+                        defined($acpi_testexpected) &&
                         ($realfile eq $acpi_testexpected))) {
 			$reported_maintainer_file = 1;
 			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
-- 
2.20.1


