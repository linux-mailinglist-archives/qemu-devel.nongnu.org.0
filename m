Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB6D25E5D8
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 08:30:12 +0200 (CEST)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kERiF-0006ma-Va
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 02:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kERcc-0007Iu-VC; Sat, 05 Sep 2020 02:24:22 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kERcb-0003Yi-5q; Sat, 05 Sep 2020 02:24:22 -0400
Received: by mail-pg1-x543.google.com with SMTP id e33so5435900pgm.0;
 Fri, 04 Sep 2020 23:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/soWbwhyXIQvyhXLT89cpgQV3vO3BDPhxGB8xLxnnps=;
 b=XoKHfsD5apDeI6vKAScjSIkWVr85sdTufj5elAMdNbFx49e+po5LvYsiXWj1Oa3ChD
 1yWqEfQafp8iD7v/UIO1MBg6/3Tl6RrcIDUfvh6Sy5e5yaSEjQ1rO9PTz9bN62LEQHlt
 Kjnp6uUL8gnUsLitbxqiZO9LiVLKZ73kfc7exA6zDqLLr25dB8nq/9VupxZ0NLoY9UEs
 45oh3R0xGoyBlDBWN8R2t8537CGXDQwWWUp3383Phpu77kbrQSp+uonEFkumttcuxzGK
 CcyUpFk8s+0vDZrWfFdcera96hdxYGCaKvTinK6HfKUmbc+cJJOTQNgrZRptL96PCNmu
 ey1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/soWbwhyXIQvyhXLT89cpgQV3vO3BDPhxGB8xLxnnps=;
 b=P+6BUVuS8zPFSD96MVsvtap0j52d9CgAIbXAxKxj0rm2EXaPK33QfVGPNAJoLE5/ha
 npCA3oNruGZr89O/RCopsPTfInq0koL0cc8AmGwvN3uclrwXw4NNwydWUVuXZMJwcr2c
 cFN1wLVqc+aEdbov/p8+OWRB5AYD6FJIRxl+0yfYxuzIz8LSp+3bachnu7K2qP1CnvrZ
 9eh8QsYUelsgztuQ3RwgjUrS+aN95sHmSR3bgsJgTBpQWYZs32N2wnRH6mMWkT5A16p/
 SLpKI4qDk+gxaf6mGJpRSNHVjDElRSO078R+ivPHy+ZJNnw5kHZuIyAUEey9bsQiMXW6
 zWpQ==
X-Gm-Message-State: AOAM530JnAjKu8+/ESM6fS499YjUHDxdqlhLS9zrbcE52ne4zvl1O0oI
 MXr3835lNiIbO3M/DvL61WrVTMbz6IRZyGJf
X-Google-Smtp-Source: ABdhPJyXWItJfDicUN6q5RkHu+5yWQnfCsu18VldMLtTTULt7quJtcpsjFqvSKgCyWCsSl1dvoW24A==
X-Received: by 2002:a63:4621:: with SMTP id t33mr10124064pga.32.1599287058907; 
 Fri, 04 Sep 2020 23:24:18 -0700 (PDT)
Received: from localhost.localdomain ([222.95.248.6])
 by smtp.googlemail.com with ESMTPSA id v8sm21436381pju.1.2020.09.04.23.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 23:24:18 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/11] docker: Add win32/msys2/mingw64 docker
Date: Sat,  5 Sep 2020 14:23:32 +0800
Message-Id: <20200905062333.1087-11-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200905062333.1087-1-luoyonggang@gmail.com>
References: <20200905062333.1087-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Block <qemu-block@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, Peter Lieven <pl@kamp.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tests/docker/dockerfiles/msys2.docker | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 tests/docker/dockerfiles/msys2.docker

diff --git a/tests/docker/dockerfiles/msys2.docker b/tests/docker/dockerfiles/msys2.docker
new file mode 100644
index 0000000000..f898e0803d
--- /dev/null
+++ b/tests/docker/dockerfiles/msys2.docker
@@ -0,0 +1,11 @@
+FROM cirrusci/windowsservercore:cmake
+RUN echo | choco install -y --no-progress --ignore-package-exit-codes --params "/NoUpdate /InstallDir:C:\tools\msys64" msys2
+COPY msys2_install.sh C:/tools
+RUN C:\tools\msys64\usr\bin\bash.exe -lc "grep -rl 'repo.msys2.org/' /etc/pacman.d/mirrorlist.* | xargs sed -i 's/repo.msys2.org\//mirrors.ustc.edu.cn\/msys2\//g'"
+RUN C:\tools\msys64\usr\bin\bash.exe -lc "pacman -Sy"
+RUN C:\tools\msys64\usr\bin\bash.exe -lc "sh /c/tools/msys2_install.sh"
+RUN C:\tools\msys64\usr\bin\bash.exe -lc "rm -rf /var/cache/pacman/pkg/*"
+
+# docker build --tag lygstate/windowsservercore:msys2 -f "../../../tests/docker/dockerfiles/msys2.docker" .
+# docker run -it lygstate/windowsservercore:msys2 cmd
+# docker push lygstate/windowsservercore:msys2
-- 
2.28.0.windows.1


