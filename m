Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F12BA016E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:16:39 +0200 (CEST)
Received: from localhost ([::1]:35702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2wsP-0006ih-TE
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wkh-0001Rh-PD
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wkf-00040c-46
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:39 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2wke-00040F-UB
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id e8so4703235wme.1
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPlBiunhfKpTczKApGa0BHboWJTJ/S0U2B+sG6MNmqU=;
 b=m2mffISPOOdNCIUy7ok5x/SZqXWmZ6YoDO85lVQTQXW439SM4fGKjE9hDqEFrbCnoX
 vYJYWHatRIc2bpeiSO0vCIVw/lZ3lBlYRbakJm6vbOZh3SMfnEogCFhKNrGs/Ouj653j
 Wp0yV9Ql4NS0F/PhFfk9mbDZhX2AVW2PvDXE1XwZlf4mqAYk4v8meZQ9fszybgd2aS3m
 e2bpN6xJZ3SY/9TWhlMXWwqzokMek31w6+/akk6CH77J5U2lBeSxvaPy8wqTokIxV4Rv
 V6P3piq6rceqXt+rSW+lqGzVi0k0qAnA9UVUTvXuJ4LhS9mpnmufkviDegE0mUwEKKLJ
 /9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPlBiunhfKpTczKApGa0BHboWJTJ/S0U2B+sG6MNmqU=;
 b=rpxdn/WHxxoDkUQ//x74/TuCVJis+FZKpFcwfOp2g/sMqF68gGHEnoc3pVH2gEYixc
 WQdXBRsvD/YDFZRgqvVCB9BGpoecu64X6GVXW1FDXdi7rq4EaN6uZYhWVFx78SRpO161
 qsFwfDx05xtwqZHTfE/xwYBJe6yxuQWS4LpWZQ4bLB5PJ9jrKIO3ghLfB04stG+lWCdz
 wRDkrwnPAzC+VTJRe4nC/DTCSHGL8e6rLHP4tCDUoRKjxP+6PWKaJe4C5RW1IDwfKxpP
 JKY7TbecKzU6JjoJHsYfdX7vgEijdEtLjwAe9szhbm6vwcBt/HmS99gQC4uNkkAMYknq
 6kiQ==
X-Gm-Message-State: APjAAAU1XL0rKLxNhAHaHGOI0fHh1Qt0Wj7FEYKXVrdPkwjTxnj32TjQ
 D1Tt6x3Ecz/WeLqZSzrePgbRCwD5pSU=
X-Google-Smtp-Source: APXvYqzMj1Agrb00hTj6bRbRovw9355x5LdHuCGIO+FbJIpMYQwLIGKU6XLhgI7WtLoWM4ndKIympA==
X-Received: by 2002:a1c:e710:: with SMTP id e16mr4668315wmh.38.1566994115814; 
 Wed, 28 Aug 2019 05:08:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm2898925wrn.48.2019.08.28.05.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:08:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB25D1FF90;
 Wed, 28 Aug 2019 13:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 13:08:27 +0100
Message-Id: <20190828120832.9208-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828120832.9208-1-alex.bennee@linaro.org>
References: <20190828120832.9208-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
Subject: [Qemu-devel] [PATCH  v1 3/8] mailmap: Reorder by sections
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Our mailmap currently has 4 sections somehow documented.
Reorder few entries not related to "addresses from the original
git import" into the 3rd section, and add a comment to describe
it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20190822230916.576-2-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .mailmap | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/.mailmap b/.mailmap
index b8e08297c90..e1fdc88d25d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -4,20 +4,12 @@
 # into proper addresses so that they are counted properly by git shortlog.
 Andrzej Zaborowski <balrogg@gmail.com> balrog <balrog@c046a42c-6fe2-441c-8c8c-71466251a162>
 Anthony Liguori <anthony@codemonkey.ws> aliguori <aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
-Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Aurelien Jarno <aurelien@aurel32.net> aurel32 <aurel32@c046a42c-6fe2-441c-8c8c-71466251a162>
 Blue Swirl <blauwirbel@gmail.com> blueswir1 <blueswir1@c046a42c-6fe2-441c-8c8c-71466251a162>
 Edgar E. Iglesias <edgar.iglesias@gmail.com> edgar_igl <edgar_igl@c046a42c-6fe2-441c-8c8c-71466251a162>
 Fabrice Bellard <fabrice@bellard.org> bellard <bellard@c046a42c-6fe2-441c-8c8c-71466251a162>
-James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
 Jocelyn Mayer <l_indien@magic.fr> j_mayer <j_mayer@c046a42c-6fe2-441c-8c8c-71466251a162>
 Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
-Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
-Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@mips.com>
-Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgtec.com>
-Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
-Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
-Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 
@@ -32,6 +24,15 @@ Ian McKellar <ianloic@google.com> Ian McKellar via Qemu-devel <qemu-devel@nongnu
 Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qemu-devel <qemu-devel@nongnu.org>
 Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-devel <qemu-devel@nongnu.org>
 
+# Next, replace old addresses by a more recent one.
+Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
+James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
+Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@mips.com>
+Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgtec.com>
+Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
+Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
+Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
+Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 
 # Also list preferred name forms where people have changed their
 # git author config, or had utf8/latin1 encoding issues.
-- 
2.20.1


