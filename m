Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBB51A8BF1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 22:09:45 +0200 (CEST)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jORsO-0002l5-IG
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 16:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jORpW-00064A-KY
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:06:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jORpV-0005xT-MO
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:06:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39582)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jORpV-0005x7-G5
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 16:06:45 -0400
Received: by mail-wm1-x335.google.com with SMTP id y24so15738120wma.4
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 13:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FYvvrpeRy/LpnKiPLY9U4dRrQSytS7+4553ef7RHis=;
 b=a5FhvHPSnbz49vwvqN6tg0HjcRVazxSCvzlxcb2fT5PfmNhJ01yiF/0YSJE9araXze
 g/JrrvOAHvsGA5RM7weOKqHY8eSwUN8vC/wSp4soJJJusOWVYvqlL7JvRoqfvFZiAVSM
 hxgK02WJa2TsSXm5ohzqopiTnj9wSxjL5qQUVC8FsEDk5ydc4MlSd+32NILb0tAPiBlT
 ULFOwAJGZlqaWETvzWI1QnkXqkenbUEhD7+sgauJxS9+NusEugSzburpKDpeStb+CE+1
 SMTUQCJos1KABaGitA0Humma4cGqqQunPMmxsDIE9xFX/NCvXUaJVdRWv4K2MZ3NP5p7
 SCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FYvvrpeRy/LpnKiPLY9U4dRrQSytS7+4553ef7RHis=;
 b=LEo9iI92Frapdjg4mz0foaJ+t007w9sWtaI+U9qADDDqKIQJTtB5+kUoYfvd3BbvjC
 NC8ZywYKwNn0lJbpkac5MakK6E8P/a9PgoYRGa8O0xJGAwlcacP/FnUg9TPJuocXx5GU
 giE++DlZM47JvGSllNixYBvg5YTH0rgrIOETZH0b41yG0Pneaxh7TKE2/KdOf26X3uCo
 f903qy1OWKaUTrwlkayvPNBlJrlzyt+taXwLaj53vmuLC9O67lR2tbrJtKGDEF4LTUq/
 8o0MivI2Qu4nJqfnN1ldmGxbrf7fDNGy/Jbb5rmV28IQkeSUyTEcQIQJe8gEz8p9sD4H
 REtQ==
X-Gm-Message-State: AGi0PuaMwxb0SWlm2047rxiQyoT27y/eWwIFaqNtD6iERqFInlTxTu/U
 Q5N8+s8Pk/A7uDs2+wJ3ql2h5g==
X-Google-Smtp-Source: APiQypLf9BTLqA40ujGrcRWGd9c0MJ5tOnig9BWpiNQKtirkJXY5Lntam7VSivb9V+yA0gJ3Fc1r3g==
X-Received: by 2002:a1c:bc02:: with SMTP id m2mr1485187wmf.60.1586894804495;
 Tue, 14 Apr 2020 13:06:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d133sm21285043wmc.27.2020.04.14.13.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:06:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D53081FF96;
 Tue, 14 Apr 2020 21:06:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 08/17] configure: disable PIE for Windows builds
Date: Tue, 14 Apr 2020 21:06:22 +0100
Message-Id: <20200414200631.12799-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414200631.12799-1-alex.bennee@linaro.org>
References: <20200414200631.12799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
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
Cc: Bug 1871798 <1871798@bugs.launchpad.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 James Le Cuirot <chewi@aura-online.co.uk>,
 Howard Spoelstra <hsp.cat7@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems on some compilers the test can pass but still give you
broken binaries.

Fixes: d2cd29e30736
Fixes: https://bugs.launchpad.net/qemu/+bug/1871798
Cc: Bug 1871798 <1871798@bugs.launchpad.net>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Howard Spoelstra <hsp.cat7@gmail.com>
Tested-by: James Le Cuirot <chewi@aura-online.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 25f7d915720..23b5e93752b 100755
--- a/configure
+++ b/configure
@@ -807,6 +807,7 @@ MINGW32*)
     audio_drv_list=""
   fi
   supported_os="yes"
+  pie="no"
 ;;
 GNU/kFreeBSD)
   bsd="yes"
-- 
2.20.1


