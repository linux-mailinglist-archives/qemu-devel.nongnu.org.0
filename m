Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E3437BAD2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:38:07 +0200 (CEST)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmFd-000503-KQ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8W-0000Y2-Lo
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8Q-0000aN-Gd
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id d11so23064282wrw.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KcSppdWoWdBtZqATd+Yueqjnp9HE8N2cdlmtTmEhLUY=;
 b=xb8nEC9DvYabLCgK0939aTmSTTjfSLIr6mhwMlZo94VbCtaV3YoU8SSAkj3GSOOGfn
 EPmOLLoK07U+M5AXeIiwuwlkv0nTcpHoZ2yxCzif5/BETWT0epInKg9kFTqV6o6aEZnI
 TeA7cV5lcaqjOwpizPG/R0W9qEpwwq8jW+mkMuad/XZkcXv2K+x88Ez5GFgNopIpJN24
 m22FHywgI4/Xpmt3mtaaUnnGVmBzoBpnX5Pd12kIr4UWGhh8RC8j8jRW0fqhH0kKdREI
 QPZCPBsYyKU/DwKm4DXLNP0DD/5x91hg8ur0DkTW1otf3pa9MGpPuEG+A5sPoPBJOrYo
 0Mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcSppdWoWdBtZqATd+Yueqjnp9HE8N2cdlmtTmEhLUY=;
 b=RKVDM1Xp9lUHe+V1Bi4VwQbFAkFO3rZUijINgiYJuSO61ADM8OrTzed3XpSsGmdkCk
 7l2gysY0Q8AL4i2XGEhCQ1YNmauLh+JPxwVzvUV+wgJafiQH1TDVFNZ646CLEfdXfvXz
 XK8tf3UZfKdgigQ5ZvCP83dmhr0X9EGR0BFXAN3TEf6ESTFZS35qD92gI0WdrW9SzB+T
 4t+qUXAjPuizPkGeeXIHr104o1OGECaQVM+WHpRnRsvphSlZshlmnN4worPUUpnZ5bgi
 YL30EovBr9bwmsLi6z2bLE3eGz0ZFdlv9tk+J6VlJX9hAkVBudzuEtfEj7syr9H2jV4y
 plTg==
X-Gm-Message-State: AOAM530YPxNCk5jzMfxfSgQCM38C/cqokhlTN+6hIcfu97sW7M8jCn2J
 gc7GV8wmxrQS3zPkKQRKzhqoMg==
X-Google-Smtp-Source: ABdhPJyazEqL3U72vwyUdvMuNr3UYz0yh88xWzHGyFjaDVsZZbQ4kOLfKLPC0MnZKWYn0jWSizj6TA==
X-Received: by 2002:a05:6000:12cc:: with SMTP id
 l12mr6300745wrx.91.1620815431883; 
 Wed, 12 May 2021 03:30:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm29420558wrw.26.2021.05.12.03.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4BE311FFB8;
 Wed, 12 May 2021 11:20:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 31/31] configure: use cc,
 not host_cc to set cross_cc for build arch
Date: Wed, 12 May 2021 11:20:51 +0100
Message-Id: <20210512102051.12134-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise you run into hilarity like trying when cross compiling a 32
bit ARM build on a 64 bit system trying to use host_cc to build 32 bit
test cases.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 1bf53961c2..daa1aa69be 100755
--- a/configure
+++ b/configure
@@ -1656,7 +1656,7 @@ case "$cpu" in
     # No special flags required for other host CPUs
 esac
 
-eval "cross_cc_${cpu}=\$host_cc"
+eval "cross_cc_${cpu}=\$cc"
 cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
 QEMU_CFLAGS="$CPU_CFLAGS $QEMU_CFLAGS"
 
-- 
2.20.1


