Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA6639A54D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:06:50 +0200 (CEST)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loprt-0006B6-L9
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkb-00088s-Ku
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:17 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkZ-0006q9-Ne
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:17 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so3031640wmc.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y4A3loAc70aEORydGmS/pvr+AOBQjqbEeWONRvfjxfI=;
 b=gLZe1vL9Hrz9LlbSzVMEymjSuGRPPEjyRgPVdZIIYhFPYVk/nUHIPiLmq0aOkUmku/
 L4PrkNHrDtTS6MexTHbyEw72LYtW+CjEnMJfs+CLVqaLdKYyGG8+2hiI4nlb9nBgLxs7
 og0N4PZoKxj6rqk0+lRZ0kvONCkM7rN14TpwQfDl1kuiRNi3pxjEW/PrEtmAi4qUj+Oe
 hSqGD+81d1fL7SWK6gndlOSGARDy48kbVCz3VUT3MyhN8oV6tSbjLMYQuq314rCGtkvj
 7jZMIhkvZ4kBKsXELyu4MVzD9p7DXe4commYL80iIhcqk87qfhzb2SMroRbxbtjwGimp
 OoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4A3loAc70aEORydGmS/pvr+AOBQjqbEeWONRvfjxfI=;
 b=U/LPtHUqR+D6ySaWfr6Q9H/+YHeEp8c1SlkKXX7tT8hg9LT0WQIOgQ81quP5cWlcQl
 3f8ONzBA7KGR4HmTixBE/d1a3WMHSBcQav6nUtCdrA3HhulC+9tdU0erdplhEVnMU2O5
 XpfFFz0eTl5+PW66ftmS8VMNBGSvhSHyo1WnP6KdhUVsBqj7D9857zHwdcYON6aJd2l0
 KK+6lcORbDUJgPnCEjD2v83o2pElinqeZ1Mfe4QtzSHNIfyJfBu1sFGwjkGo1PYpRQld
 34l7bexFI6096OgB81tLdR5UIoMMtUktQ85t9Gh+w+fbfG4Bwzx99XR447VIFyyFaZY8
 4ZVA==
X-Gm-Message-State: AOAM532lycU2z4t+oTuJV/NAq60rgWKvrte7k86qvTzT8kHVWY8SH3nz
 ms/oNNDEckRTNYn6OLmPwbR0eIWWkhVRukMC
X-Google-Smtp-Source: ABdhPJxHPtQ1bdAUF9lBkdGgdrBqhmbH/pqA10JZkdTP5FIbAenUlv2XFE+b5Bnk4DY+M4UzLsR2Uw==
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr23132246wmj.6.1622735954278; 
 Thu, 03 Jun 2021 08:59:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/45] docs: Fix installation of man pages with Sphinx 4.x
Date: Thu,  3 Jun 2021 16:58:29 +0100
Message-Id: <20210603155904.26021-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Damien Goutte-Gattat <dgouttegattat@incenp.org>

The 4.x branch of Sphinx introduces a breaking change, as generated man
pages are now written to subdirectories corresponding to the manual
section they belong to. This results in `make install` erroring out when
attempting to install the man pages, because they are not where it
expects to find them.

This patch restores the behavior of Sphinx 3.x regarding man pages.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/256
Signed-off-by: Damien Goutte-Gattat <dgouttegattat@incenp.org>
Message-id: 20210503161422.15028-1-dgouttegattat@incenp.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/conf.py b/docs/conf.py
index 00cf66ab546..42729e22bbe 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -279,6 +279,7 @@
      ['Stefan Hajnoczi <stefanha@redhat.com>',
       'Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>'], 1),
 ]
+man_make_section_directory = False
 
 # -- Options for Texinfo output -------------------------------------------
 
-- 
2.20.1


