Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEDD1B61AE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 19:15:05 +0200 (CEST)
Received: from localhost ([::1]:33070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRfRI-0002jO-1c
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 13:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jRfIp-0001UD-Ot
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jRfIp-0005gs-7n
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:06:19 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jRfIo-0005en-Og
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:06:18 -0400
Received: by mail-wr1-x442.google.com with SMTP id k1so7729284wrx.4
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kf0p55kOiK118/utgn//7jUqdaKpdOOWjZERXX6I/SQ=;
 b=AZzKG99Whs7a+qEtXmQJDjjsjjJUf4ImMMzXkhOw5NSM+eEzwecO8a4J+xhFpSP2NW
 pjs835vZ3vO5XAqbnRIMikBUsTECJrTjbZ07F6ZNKKrMMQFxfwEamUCXpI3PInksHKoU
 0xBKS6BKWrOmdDGDu9OwVoq310T9S5smUuj+Nckqamh7R7BIHCRvPkZhE597i8CLUrzn
 Q9OI4J/Dr9antlIiLFVNfibqrFKXlL3eXULvkmn4v+IArzDvEmdoapZhNczY4NkFa3Rt
 FSaZEskLd+njvdvEOfS/EWxYlb2FxX1yYKW6RtuCV2BAT83v+OXGQxF3DKZdN4QEbfqL
 wQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kf0p55kOiK118/utgn//7jUqdaKpdOOWjZERXX6I/SQ=;
 b=fCehrksZtmC+EVpMH/zdJwCjnwk6sYRFfWJfGMYuk1z1AUfSHFaZCoVJGrdyDtEWFS
 3dO4eL1So1qaY5SLYduIJQvJ8Co4R0eqtlQWCGTDb8TyJ1aTarZnMjs9KMdt7AzQar1Q
 kgLaEELf01RvmyNK8dCeewCBxEXx4qyKnUzkYWfR82HXhU318FquIeIov1+ujcAdGCp0
 3epnPd2i2jAbiSKI/0OEmbvPNEBswCURdummVyT1YZLRNsASA2BfTZxS+djk25oL21o6
 B4ShXsycGARRscUUGt/YMnGpiX1XNf0oVSD6JRsv5yV6ksXpM9ndjfR4613JCmd5R0y/
 4nOA==
X-Gm-Message-State: AGi0Pub5d3kDunYSfrkRLNgWT/WM11fk1cHeIqpxVr/O9PI3cueA4raI
 AY3MadcMeM9qDDP7bw/WEx/zLQ==
X-Google-Smtp-Source: APiQypKK9lDjuTZ/ViaFxiD+hUIr7WXSoY3+bSEkPuPH2pIvqIwr6aO1po75nSRsQi9ApuBPAgnWtQ==
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr5895094wrr.160.1587661577395; 
 Thu, 23 Apr 2020 10:06:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm4946050wrc.82.2020.04.23.10.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 10:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D4EE1FF9C;
 Thu, 23 Apr 2020 18:05:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 13/14] .travis.yml: show free disk space at end of run
Date: Thu, 23 Apr 2020 18:05:56 +0100
Message-Id: <20200423170557.31106-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423170557.31106-1-alex.bennee@linaro.org>
References: <20200423170557.31106-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::442
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


