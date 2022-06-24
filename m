Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE455A42F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 00:06:51 +0200 (CEST)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rRy-0002DM-Sx
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 18:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9H-0002qV-Dy
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:31 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:33454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9F-0007Wj-Ul
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:31 -0400
Received: by mail-il1-x135.google.com with SMTP id p13so2366536ilq.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iRRKSO1rSwzhJvNkiVF11IeWLxX/jjQkuC6nogP90gA=;
 b=JUDV/Cg6FXZvDR24Lv3m0gamK+enNqTC9yJqZzq3baCX/SgOzmLCcS1hMxzYYPUHof
 I3Lf+NBA5LfRjfVbvo6B0yt0Yb9WBrfTh0U9lxSVHuQXAJqdHhwuY6/FyMKb/bTy1NcP
 wTuVo/505hrym5BXCCMyCNDAWKR3LxYsZcsNsyfAftUw9nQhSigYggrPY5t3Td1TqElw
 MNVX/rhh+Zodva21Rpujx+xzTNlyGoccf/kory67e4/JoDrwCZsjKMKVlKLNPqJR/+Sk
 o4W6ID4hHzPhGWzZBblbWnM7lNxBhCIeEelOYNglXjr9L+l5nk5HwC2z3g2CaXNsluks
 Gznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iRRKSO1rSwzhJvNkiVF11IeWLxX/jjQkuC6nogP90gA=;
 b=lQZ7I0vKlbZXblYKq6hcOhNR1VGR9l0syQlXh4jRAZMst1s91s+luPbPyhDWBNaCWW
 VjiCxTxWduvRSnAcVtfELgv0EC2/MI4P3TauZ2628FnupO/kfOpO3pkmC38uc7XcnkMe
 ADoC9CMNmdsf/t6Yg0E+AgDmaTOXzNIFB+YjYrpWqGI9eyoWE0+jI8Uens8BNXsA09cM
 SsMToP8CatcWdSPBrR92i0EOx+UzQUA9zE3OR+jvmiMp8AjNTyjySGL6l/VbXZMF2G9+
 1+Mwr6GzeYymNmVgsCoyMwQyFBDsNuVCV2g8Sa4Njy9me8JFreMABPxBfZORVMBXpAU4
 XBGw==
X-Gm-Message-State: AJIora9yO/iGgHf6djHwVElMKyzeb87uaChl4hd0RLH7g7qko0MKPP98
 OPf5ax8L/u2F6Bl3VJ9qhnTFIpALDTq8FQ==
X-Google-Smtp-Source: AGRyM1tCsVvKYWqVHqZ/lptPI5NK5rBHebEM4kF829MFFiqq6UIk1wZz21jbD0wgEWIcWpr0FNRVoA==
X-Received: by 2002:a05:6e02:1908:b0:2d9:5288:bd04 with SMTP id
 w8-20020a056e02190800b002d95288bd04mr623555ilu.148.1656107248682; 
 Fri, 24 Jun 2022 14:47:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:28 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>,
	Warner Losh <imp@bsdimp.com>
Subject: [PATCH v2 11/11] bsd-user: Remove stray 'inline' from do_bsd_close
Date: Fri, 24 Jun 2022 15:47:42 -0600
Message-Id: <20220624214742.89229-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In the last series, I inadvertantly didn't remove this inline, but did
all the others. Remove it for consistency.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 108a5061850..588e0c50d45 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -252,7 +252,7 @@ static abi_long do_bsd_openat(abi_long arg1, abi_long arg2,
 }
 
 /* close(2) */
-static inline abi_long do_bsd_close(abi_long arg1)
+static abi_long do_bsd_close(abi_long arg1)
 {
     return get_errno(close(arg1));
 }
-- 
2.33.1


