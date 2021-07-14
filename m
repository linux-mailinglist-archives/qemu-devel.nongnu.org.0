Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50E3C874C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:24:54 +0200 (CEST)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gkn-0002Ws-1J
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geX-00053z-K2
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:25 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geS-0002MR-8K
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:25 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so3691088wrw.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GihtklE5UcjSoCl0u8euNMAqZbs+NhlpVqf3WDqQFI=;
 b=n5WHgXlcqbiJOCPqboWoU1uz2b/wss9hv7ta2Qeah9RAkoe4eRFLv8jwDXcCpyE4EJ
 aIbxmFtc3ryI+26HMt4a+pE+aD7J/GtD1yfb7fNeMRykFTS5qii362DQskqi1Go6EHd8
 F4B9QXCmAV+mldyxXmHQ5DXx0u6mreJO4wf0W+CXLvGcHGhr3bufeZLZ3wRuRED3b4Yv
 PpT+PgwEUZK2AS9n+knCsS6kK4uJxQvAuW8TzLS3uPpim4O3PFhve9SV6udlzW9D4goD
 +/+VyH1++UWFZjDFiuLobcpZnSA8+dwfaClIaVvtIqCE2ACi2Tpl+2StrTyEvhktRNQo
 ViQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+GihtklE5UcjSoCl0u8euNMAqZbs+NhlpVqf3WDqQFI=;
 b=n6ib/1cgBazOYLqjcaih3j2FMkKher4kMBnvI9duMRS3MVkGCCZVDUeYv6sp1JaZpM
 mIZaa0uuwwxIhMlb6VcV2rcSHvhRijNvELlWYUbJRnv+Sl8ictg5X4HNe4mrnSF/N6up
 OqZsvNyHWYykslUeC+hxBXCJQp7QD4oqvrHBaG29K8cj0y7raxbj++Af6U6G9myqMXZz
 HFHCN9ktcbX3VpqkPQOSE/XDkNG3jf9DS4ggQNE7y17WIvTlDDpI4eiHaLB5gDqhyUBy
 MYgIOV9uHaoNbtxf2Rk/kKG4GUAF3DXoN4egsEP7EQwrtfr3DUBegtwux/zRV7H48Xn1
 pNcg==
X-Gm-Message-State: AOAM532EpPGezsS3y3gz7JBoPJ3/RGOSPQaaTkwoAT1JRi4cB4dFTgGW
 Y2H+OKP5nS3A9JHgnOdiuqTh5Q==
X-Google-Smtp-Source: ABdhPJzhgTD0AisAQc3E6P+aqdb8AqRAR15yCsQluUIABYHXINrta5WXwEXgbHgFbm7IpL9udgdNsw==
X-Received: by 2002:adf:f892:: with SMTP id u18mr13598450wrp.64.1626275898834; 
 Wed, 14 Jul 2021 08:18:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z16sm3154364wrl.8.2021.07.14.08.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75CC01FFBD;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 35/44] configure: stop user enabling plugins on Windows for
 now
Date: Wed, 14 Jul 2021 16:00:27 +0100
Message-Id: <20210714150036.21060-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some patches on the list that enable plugins on Windows but
they still need some changes to be ready:

  https://patchew.org/QEMU/20201013002806.1447-1-luoyonggang@gmail.com/

In the meantime lets stop the user from being able to configure the
support so they don't get confused by the weird linker error messages
later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20210709143005.1554-32-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 2c39ccf8e1..e7f2fcd02c 100755
--- a/configure
+++ b/configure
@@ -708,6 +708,7 @@ MINGW32*)
     audio_drv_list=""
   fi
   supported_os="yes"
+  plugins="no"
   pie="no"
 ;;
 GNU/kFreeBSD)
@@ -1522,7 +1523,11 @@ for opt do
   ;;
   --disable-xkbcommon) xkbcommon="disabled"
   ;;
-  --enable-plugins) plugins="yes"
+  --enable-plugins) if test "$mingw32" = "yes"; then
+                        error_exit "TCG plugins not currently supported on Windows platforms"
+                    else
+                        plugins="yes"
+                    fi
   ;;
   --disable-plugins) plugins="no"
   ;;
-- 
2.20.1


