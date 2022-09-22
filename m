Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E095E698C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:23:42 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPvJ-0004kY-Mg
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBK-0002GA-Ff
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:14 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0005Tj-Bl
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n10so16378685wrw.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=TG32nrt188N9s066qYdYkNxMuVya1mUQYmfslcHcgmc=;
 b=QmtySLhlRbGNGvpxUadMsLHRBIidix0PPha4fE4FoxK4T4RIbL4Y5lU0ALh4wjegcs
 JuZFkW1MG8BHnWZzP4OtGOmDUx9Ed+2/GvqlHdFrgw0fiATaFSOEYoYgPA0XOPq82UGd
 530WNCNqH/6slyue/ZdGzi/d+xXTt6t9ypfbBDZjLGIZS4jVGYIee+JiRqVlNxXMtrfP
 2sboC/85Nnj5IrXpDbig7h8M/PbanZhNhlgHwqutE/DEFNM4fRX6wwDCJcyIdTSpi0bM
 8fBVgHrFKFwliWSH9Ic2BlFEseqosWS3pH7SA74iCZX+jf+ijhDsMe8EanHFxL88IqoR
 oylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TG32nrt188N9s066qYdYkNxMuVya1mUQYmfslcHcgmc=;
 b=W4G0/7o5pWLbJg++UtAt1zzOUUx03EaDaueAONdEpVKJKBNiwrXD+j++GYl4HSeViR
 kulyIWozI/61EC3iWgTaupwFDawjWw7zQREb0fg6fYaka1IR2nhi57HIm0EPUVLCuIeT
 SBCuehPPj++4OCKXkfZugpfYtoD5B1yTz2v78xELq6I37EmPd2zwT5QM5tt3PSqOdvbq
 xG6XTxoMF4gLCQNX5BjTQnEqMDq5OGtnrx8Kg+zIuTNvercNhiSVqQWEUx+fA6wszQXD
 Sx7vp80Hln2taXZX4YrtGJ+LIPtRIICmEqjrkN+Y8ODYkDHoDIANWsdVoZU//6znJSof
 FKcQ==
X-Gm-Message-State: ACrzQf3fyNXQvjQ596xk+GPH7FjPcp3RJwLIoa4XCPT2m9JixEpT/l2v
 mtW57wjHYXjW6FVrGUIr8jCfcI/Bt/xzSQ==
X-Google-Smtp-Source: AMsMyM4um5cZCbNrvxxShuhFx4q0JN7gtPZtSkWhcqIx36Z/AnMmkJGhqcza6XQ4yKieJaC39eR9Tg==
X-Received: by 2002:a5d:6050:0:b0:228:6128:b0fb with SMTP id
 j16-20020a5d6050000000b002286128b0fbmr2536181wrt.424.1663864561897; 
 Thu, 22 Sep 2022 09:36:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.36.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:36:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/39] configure: Remove use of backtick `...` syntax
Date: Thu, 22 Sep 2022 17:35:34 +0100
Message-Id: <20220922163536.1096175-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

There's only one place in configure where we use `...` to execute a
command and capture the result.  Switch to $() to match the rest of
the script. This silences a shellcheck warning.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220825150703.4074125-6-peter.maydell@linaro.org
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 482497e9743..8b48e72a135 100755
--- a/configure
+++ b/configure
@@ -2311,7 +2311,7 @@ LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
 for f in $LINKS ; do
     if [ -e "$source_path/$f" ]; then
-        mkdir -p `dirname ./$f`
+        mkdir -p "$(dirname ./"$f")"
         symlink "$source_path/$f" "$f"
     fi
 done
-- 
2.25.1


