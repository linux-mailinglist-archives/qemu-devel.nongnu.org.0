Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC801C116B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 13:18:35 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUTgg-0002G9-FV
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 07:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUTdP-0004aP-Aq
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUTdO-0002UX-Pf
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:11 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUTdO-0002RH-AF
 for qemu-devel@nongnu.org; Fri, 01 May 2020 07:15:10 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so6042924wra.7
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 04:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kf0p55kOiK118/utgn//7jUqdaKpdOOWjZERXX6I/SQ=;
 b=LEpdv6G69ZUij1JbdJuKiC+LhSiH+gL+sA0rJX7G7g9+7evHboauR/QDeVogc95A6f
 yoKkGln0HpQWrXX7MoBoBQhR/k9RhQZishAPjkylBH4qXb06thisnmypRB1/KLbdGUdW
 F6B1lPOU2Q7VEJ7bB4R4nSXoVVCz5+jMB9ocyiVdqB8HFxyMYE8oUmDilt5/Uy6nRK52
 DckxCHA/9OvSJEmoGFC+eTF+Iw3Gt3No4SAS+rLF3RvSHVvM0xWDIwl99aBzQZ4JjSYF
 g/a7vhjqKXF5Z0sv64bdcOFs9U6WpvMC9Fw6jaJHfMHYSv9iNzdrTIc1LhfyXO8oKNpy
 HcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kf0p55kOiK118/utgn//7jUqdaKpdOOWjZERXX6I/SQ=;
 b=aUt7m8mwQJjxz24/UiYgB6NOOKXXoh2dxXBtGC7YR+NAnNRk7MSn9oeNsPY6HC2Hvj
 fKvZN3Xb/hFesAe4oiLBRNTvG8JMkIguvdJC0ecK6YRnKdonP2w4jZdCA/3MxbcfJ+f3
 9VgKAVxRfdhtlot8Grt7lJ5+p0ClmGTPIgyZem7/BefEji1FOWmQv0eD+rHWauEBb5PD
 pBYklAYB9Mf+3vq9rkL8ntLnSli5ZI5cyJqoDqH006iZtGKGy7tAP7oSKar0KPJKwbs+
 b89i23UFfyzVl+gLBE2gMknCrsnr5aD9Pc8/A95E6rmZYGN44X8o1Hdo/ex+yZIp2qZr
 aXvQ==
X-Gm-Message-State: AGi0PuZjjTU5aDXLOtx1MnTJHHAW8tt7SvxM9MKXJJ1GjnXuA+Mjlko4
 ND9R50EDSWesTrrbXbjgk05aO6TwnZ4=
X-Google-Smtp-Source: APiQypI7lFccWIR88Pj6NrW4/SzzjEWggIpBv5hx4OVXxv7B0VmRbEEX6LDEpPhn3gXeaHNeAzeTBA==
X-Received: by 2002:adf:f40b:: with SMTP id g11mr3981631wro.178.1588331708867; 
 Fri, 01 May 2020 04:15:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 19sm3456043wmo.3.2020.05.01.04.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 04:15:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 90E561FF87;
 Fri,  1 May 2020 12:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/4] .travis.yml: show free disk space at end of run
Date: Fri,  1 May 2020 12:15:02 +0100
Message-Id: <20200501111505.4225-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200501111505.4225-1-alex.bennee@linaro.org>
References: <20200501111505.4225-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.travis.yml b/.travis.yml
index 2fd63eceaa..a4c3c6c805 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -113,6 +113,7 @@ script:
         $(exit $BUILD_RC);
     fi
 after_script:
+  - df -h
   - if command -v ccache ; then ccache --show-stats ; fi
 
 
-- 
2.20.1


