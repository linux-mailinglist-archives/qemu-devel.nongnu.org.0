Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32852864B1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 18:40:34 +0200 (CEST)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQCUT-0004aZ-TE
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 12:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQBsO-0005Ny-B8
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 12:01:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQBsG-00015Y-0z
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 12:01:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id p15so2888737wmi.4
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 09:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tso/H/TRyGNDQ0w+/aqVpFFDrfL0GJurAGbAqAXmKho=;
 b=nvqgKzS2ggiMCbIOsqxtaSXWEZer+FV7YeLbzSZuaJnV6wiw2ljX5vfPqaGckmR7QO
 aXDcKPfQepuUKvW0dwX3ctbe9TdIPJIZIO4Jd6XHUJs2ZxJb7hmM5mLNCsO50pvcmOMT
 0AXJB5vRcrL1X0CRyZBcztX2GBnNKKskfUQvgJw/K7wbSYuMgAkDAR6EuJoMA+9tSN20
 9GEsWx3NFdD31DfQIUXUCX3Fga19rroTYkg3Fg54I4/iejCxa3cZeedYOH5eJ4hSSvoU
 0REpY4/CczvZ7AQYH0vKmJlNRkKQ/QOPkUPqLc+GFQbVlWtJQrEBqnaeSGDEg6wju+fm
 Hbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tso/H/TRyGNDQ0w+/aqVpFFDrfL0GJurAGbAqAXmKho=;
 b=p8UB1QTe/P8Z3U5mNWuyi39gDPGS2PJQVAG/sh9UTgbEFtaeVxol8U8KO2CXUCnayq
 rTq0J1Iuj+cBuITpAU3AkstkEaSJpT6kkiUTkLNOLINLonOwza3a5kXAB7B5HSsdvYKp
 TZCYNl3wV4ZNovHV4IJD+Nu0jGscG5WZTKml8tcln+fEV3ytHML1sbyGRAvbrKsVJ6YK
 mM/G/N2lnooClGt6gopQcCRtnslWdA+8vHnfUR4+/F+JMHaQhMdiXtkYMBxM3L6y9KZ4
 rCI+2rjbJzzn/wFpB/5xM/6lD9TmBke6Nj13c+mUVGvDb/c/raPIwgprFe362R/uyQ/G
 SROg==
X-Gm-Message-State: AOAM533VBGckQQAZ8rqoZdJ30kQLCFOIm5Qz85W/0Sw3ZGrJwJiEPw9i
 uvt7RuiE/2DewpN1qCa6Lnf1yyrstGf/HA==
X-Google-Smtp-Source: ABdhPJz1e03dKRUqzob7GCqVkCE/wl/61a+8ezCYlYiFqI8GHfCH4FgTOgQ6v7ZT/TJG/5HLM6c+yA==
X-Received: by 2002:a1c:b657:: with SMTP id g84mr4047796wmf.0.1602086459674;
 Wed, 07 Oct 2020 09:00:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 76sm3307600wma.42.2020.10.07.09.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:00:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A7931FF9B;
 Wed,  7 Oct 2020 17:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 12/22] contrib/gitdm: Add Nuvia to the domain map
Date: Wed,  7 Oct 2020 17:00:28 +0100
Message-Id: <20201007160038.26953-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007160038.26953-1-alex.bennee@linaro.org>
References: <20201007160038.26953-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Graeme Gregory <graeme@nuviainc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

There is a number of contributions from this domain,
add its own entry to the gitdm domain map.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Graeme Gregory <graeme@nuviainc.com>
Message-Id: <20201006160653.2391972-7-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 72dc65f2b5..14c0582060 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -19,6 +19,7 @@ intel.com       Intel
 linaro.org      Linaro
 microsoft.com   Microsoft
 nokia.com       Nokia
+nuviainc.com    NUVIA
 oracle.com      Oracle
 proxmox.com     Proxmox
 redhat.com      Red Hat
-- 
2.20.1


