Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002B52863AB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 18:23:05 +0200 (CEST)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQCDY-0002Qk-W8
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 12:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQC0l-0004Gk-V7
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 12:09:51 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQC0j-0003Cd-8z
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 12:09:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id f21so2923719wml.3
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLW+WFxYuV+/JL3KLfJgS68DPnL2AjABzgvMUp1N8QM=;
 b=t4NBk/7DXzKeELG7iQ55KEz2nOtp/Ni6UqE0y9VLV9rWyVNq19qb4aSzbpPB+JL5dG
 /aVAOEZPcH/OCIN/oiWbPi7iMuGrh6UtB87nnBU8a/fh7cJ2L3NZU9BBV7QH/hAATXTH
 5hU2nc4v5i9nkuxPl8r39757aLxQH4eFfXKekhdHjrBdsi8Pqhl23maKREiz3mPo4orO
 Xcn29jQh9D6qHdyJAkSe8FgvA/iEO8CPcrC0euo79sig1CdMiz7BoRrDAf00lbbxkO9R
 5olDHAUKFW2Wtw3ixn4iKxZRhjVgK+Sk3RC3xeGhivJp+/qRhmV+1pXjo6PUNggLnBoR
 yEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLW+WFxYuV+/JL3KLfJgS68DPnL2AjABzgvMUp1N8QM=;
 b=tRci6PMvpvIxqi4qbq8U+qxWDMCk+kIc97ifYfLCTzRwCKQIT4mqPwebz03cZEXR8q
 1PyaQT6JlG4UolyLI6hQdD3pj4BveHm57r15cxM4q1oTbha1kyRaxRHD/decw6LXcrwW
 lVdMAsstdXVBPOs+He1lfaxbP/Ol9JTQfc+SmehI+I+GXmm4MpQTR6fdpPaa7PBKdrEW
 wpcehTC5/jgvz3seSoRsCF4ETxGM6Jyh/MNGblx8En9pNvccmzSLlg7/lqt8Y9Z0Xitt
 3IBd/IwpMrCoobDAwYR6XnDcNlHcABIRhvnEtETCcKrpfzQM4orugIUCZPcIgGhxLAXQ
 ZN7A==
X-Gm-Message-State: AOAM532/GhamNMuTAbjvFinu+ps4eDR9lA6iPWS51TbOGJZj3VmrxGce
 snnOVQbs5Z4GHdi0MpB3/2mPIQ==
X-Google-Smtp-Source: ABdhPJyoniFqxh/dDgKMbNwXQJ42abbtLT2FuPpjN6jp8E+KI1HW1Dci6qqkeMDqY1TViXX8qRhiAQ==
X-Received: by 2002:a1c:a793:: with SMTP id q141mr4239967wme.137.1602086987831; 
 Wed, 07 Oct 2020 09:09:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 13sm2837247wmk.20.2020.10.07.09.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:09:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 653501FF9D;
 Wed,  7 Oct 2020 17:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/22] contrib/gitdm: Add Nir Soffer to Red Hat domain
Date: Wed,  7 Oct 2020 17:00:30 +0100
Message-Id: <20201007160038.26953-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201007160038.26953-1-alex.bennee@linaro.org>
References: <20201007160038.26953-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Nir Soffer <nirsof@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Nir Soffer <nirsof@gmail.com>
Message-Id: <20201006160653.2391972-9-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-redhat | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-redhat b/contrib/gitdm/group-map-redhat
index d15db2d35e..02507b7b53 100644
--- a/contrib/gitdm/group-map-redhat
+++ b/contrib/gitdm/group-map-redhat
@@ -6,3 +6,4 @@ david@gibson.dropbear.id.au
 laurent@vivier.eu
 pjp@fedoraproject.org
 armbru@pond.sub.org
+nirsof@gmail.com
-- 
2.20.1


