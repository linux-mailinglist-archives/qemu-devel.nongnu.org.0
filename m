Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73342313DA3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:36:18 +0100 (CET)
Received: from localhost ([::1]:45366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BOT-0007A8-Bj
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pk-0003jy-8R
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:04 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pO-0007jk-L7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id t142so10290400wmt.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RoLaaNadYsRBQ0vAb9s/24y/SZHflLdIOBsYDO7si7Q=;
 b=SFh46pUv8bG11H+AGpkQlYuJrSimUADigf1IARd0lGq/KtAlJjPeDz3REJQpIafiXu
 Q4dLVSde9LHqlUOuiEsRGiLA/E0X0OGVgH6k9vt5NmZusTMvLw8qiRc8y4GmItwfVhSX
 d0Dal10C6ekh/IUNbQc2m1Qc4dqPsiDwLPF4tkRH2kKArfXraRmCEIxEZzGNmzArSyrt
 tY9pcrOPRNZlQ1Yc/LwOBHb1aHjo9P9DcTXR1NtEJ2Bv+RjEP3WuE55USDQuu4gIOQ5y
 hGwQdOrWYcFot6zAhf+yWu9KTm2p3GaBrMNFSvTPPDvR5IYnBdkXnOtQLyFfF3C/wFSc
 PKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RoLaaNadYsRBQ0vAb9s/24y/SZHflLdIOBsYDO7si7Q=;
 b=ZFBXN6+4oSVNJwKsiRj4hxnC2FaKOoUsHf6LXDtkpX6tqXnw+Lj78g8hh/OEhSe7aR
 7Qm0B7fuZoBAdzmaRn43Gl+Fsr9w0Bb7IC3m0IvOfF9B7kIygW67jFd+T4uo5AIGMzD2
 Nbt47xK9A+DyRyH5R0e7NZbJJHDIY+CBboBivnpQ0cYh92cHYHbo+r17YS+1FkOXLqOO
 0EMuybKwhEwoz0d6UNGyBrKmHLDt81uRJsn2G0focUu8Ts6OCLQxMjuryzMoSazEXMoF
 FVvB9ilPkXd0IEKek/+r/iUDg2VdRYL6bcqT3aGQqVhY548bk1EwX6WjYWTZYbFTMoEh
 5QXg==
X-Gm-Message-State: AOAM533ZQ6CcGx3pljqyxBb+bx6Yg8K5bqwLcq6xDshUBqk666rA9HZG
 YanMJr+2t+e1IhO3A34oCSI0CndbZ99cvMYn
X-Google-Smtp-Source: ABdhPJwR2BkMZgaJ+WzOSnZ9wVw67DJY7CBYxmF+64EoWRcWNulnRdKxnLbFOugKZSbLjiItCmXMDA==
X-Received: by 2002:a1c:ab57:: with SMTP id u84mr15045031wme.115.1612787918007; 
 Mon, 08 Feb 2021 04:38:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a132sm21159311wmf.42.2021.02.08.04.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7ACDE1FF96;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/16] configure: make version_ge more tolerant of shady
 version input
Date: Mon,  8 Feb 2021 12:38:13 +0000
Message-Id: <20210208123821.19818-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When checking GDB versions we have to tolerate all sorts of random
distro extensions to the version string. While we already attempt to
do some of that before we call version_ge is makes sense to try and
regularise the first input by stripping extraneous -'s. While we at it
convert the old-style shell quoting into a cleaner form t shut up my
editors linter lest it confuse me by underlining the whole line.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210202134001.25738-8-alex.bennee@linaro.org>

diff --git a/configure b/configure
index a34f91171d..36036aa2f2 100755
--- a/configure
+++ b/configure
@@ -198,8 +198,8 @@ has() {
 }
 
 version_ge () {
-    local_ver1=`echo $1 | tr . ' '`
-    local_ver2=`echo $2 | tr . ' '`
+    local_ver1=$(expr "$1" : '\([0-9.]*\)' | tr . ' ')
+    local_ver2=$(echo "$2" | tr . ' ')
     while true; do
         set x $local_ver1
         local_first=${2-0}
-- 
2.20.1


