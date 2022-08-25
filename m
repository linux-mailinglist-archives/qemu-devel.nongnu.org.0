Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364F95A1548
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:10:36 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREV9-00019F-7Z
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERs-0003yJ-No
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:12 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERr-0002MM-3E
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id h24so25006954wrb.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=JiN1luN3YeavHyuwP6WbtnNpnk7z37GeHVcVmF5DqF0=;
 b=nkdmCpbAI9VsDyH8tJdTk6/xarCBpEBIKW1AwuzoGz5u74jUXFoszHyG1Jy2UooExu
 ua+ozd2TGtEqSKWun7xNEn101t7Xe9h7rx6xzN/zhJmdRhTtF0CKlx10Sbh3tBv5DLdK
 DCODhfg4U+2Ro4CJ348XvJBa7PaKcMTC0lDl42I1mGFkti3a5E0u9w85+aRX5SQC0OUx
 uVsRzjpJVhejwCMgcYTT6kbiPTGXEuIrCICnzsV9o8WObqVKpU/PTBL0NyCvnz90Z2vm
 M7vY+S5iGp10XKwg+ldboM3e3jnoJaw5GXvekdVb4/Qh97iwVVipZur8Vf3O8Vk5yz4/
 B77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=JiN1luN3YeavHyuwP6WbtnNpnk7z37GeHVcVmF5DqF0=;
 b=hDJGJYZ6lLczOM1LYBHNYH9LVFus7ive46U09/FnUWSs3P9E0Jo/bC1uP/W+yEQwoD
 NVCZFvRT0AlaC+n4FiC1limOq7MAXxEo74GNKnfYZKdrppOlSK+S1LsU2ZUFALOiCzFd
 6oLAAUhFWoIgGe6O2gLm6USwsHBwY5tAnwL+xESs/u0tfgYyKxrT6qvh939SXfEahXIP
 9Ent/ttTli1asKR21Ns8JU4WRkW2WDVizDvH4RIKzxS3MtFCjSwrZTQWImqS3CRupfjh
 0kdFNY6GciSuaSd6NNgop9Qlw/BmavusBslcjoTafnLbnKG3rk/ETR3CZG+VB3+YCstj
 RfeA==
X-Gm-Message-State: ACgBeo0NwuohlKcINYeGoTrbplyr0BVMkxvDVZNZUU3ubnld50TIA9hW
 7xiUo3B3yyiU4NUHlZIGZwkajBonqDb0HA==
X-Google-Smtp-Source: AA6agR7FL2g1HOlRUIs6xMAQ6YFsTbjpVVQiABtjxw2pDhsTeVhOY7xJmO6j0ogDe0HywZVCz5CFUQ==
X-Received: by 2002:a05:6000:1448:b0:225:63f2:2421 with SMTP id
 v8-20020a056000144800b0022563f22421mr2438638wrx.527.1661440029623; 
 Thu, 25 Aug 2022 08:07:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm1064638wrb.106.2022.08.25.08.07.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:07:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] configure: Add './' on front of glob of
 */config-devices.mak.d
Date: Thu, 25 Aug 2022 16:07:00 +0100
Message-Id: <20220825150703.4074125-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Shellcheck warns that in
 rm -f */config-devices.mak.d
the glob might expand to something with a '-' in it, which would
then be misinterpreted as an option to rm. Fix this by adding './'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 894642554c3..d5b6546ae81 100755
--- a/configure
+++ b/configure
@@ -1093,7 +1093,7 @@ exit 0
 fi
 
 # Remove old dependency files to make sure that they get properly regenerated
-rm -f */config-devices.mak.d
+rm -f ./*/config-devices.mak.d
 
 if test -z "$python"
 then
-- 
2.25.1


