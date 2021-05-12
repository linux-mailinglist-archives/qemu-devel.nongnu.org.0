Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F837BAD3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:38:26 +0200 (CEST)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmG1-0006Fh-MC
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzO-0003tt-Qn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzN-0003jf-0d
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id q5so3583874wrs.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yICXcB9Xc8sS5oqCx+QbGc9GZYDuZZrT+QLlCYTqMtM=;
 b=K0aoahjRUf9DsO9fZsnpyVNzl9+Ffrf5nDnWTeJuxaqQf/lvp8V0GRgm65+dEu1B3V
 AfmhkPkFohQ4W8ZnuTxCbjtw+B4acx1b7NGBHFJRQPVZAxHuzGPRXOlzNUU3RRymyDkD
 96LclPUffB/owSk5M3xE5CmDlLMho+/4rIpwGKH9WjjL4CwvzCofNPcdGUmMtWG56Q3e
 IArz3n+5du0uu2Dn2RM1nS1kfklf1DL3qoadn8RU9aAWLxqmrAr+lE2hCsPLoP1e6fOs
 /VqUn+3K0Dh51qpch7VNeFBi3Y5O51S9qQrvjscDOLX/ufKENumVpwVrrH3DyAa+IGav
 viTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yICXcB9Xc8sS5oqCx+QbGc9GZYDuZZrT+QLlCYTqMtM=;
 b=OK/m+W9tHB0zVmecSZkKLeQDOqAaDFLnrswuN1kX6t/y8WLfw08uNKrMfO74GLSHBu
 gOwvJF79WRVyZH5lhFsOjc9dcAmRcycmMgDI3y4n/a0e26/3o512Msw4Y1voStGlIpX8
 wtZi/mgDCL5o/FK33Vk+UdonrSXtY1IaRPVfnrNY4zDXqUKfuqjeu6EknTor2BC7NLoJ
 tgmPr/BpdUYGKJwBDpbep38eWfCM7he5vBy5aX+EViNm+Ss70NU/p89P4ioC9dwbzLMF
 ELMuYjwuPhbwi9U6rUQJ2Pul2fD8IItr3o8pccFDWHNtdDQ6QA9mIL0/m1bg0EF1pPoy
 Lvxg==
X-Gm-Message-State: AOAM532kbuXl3lB89KOypewvni9v9fbnHkYFcNLXSqhkOIfjdymiTrbT
 YUoiInX6qKeONyDqn1IIyIDrng==
X-Google-Smtp-Source: ABdhPJyTEKI820XD910/iVuyl7m+e9bD/HvMxvILiXxfrKdN7Oq3faDbAECg39VB1UJ0twzdAVfPZg==
X-Received: by 2002:adf:f78d:: with SMTP id q13mr9401803wrp.405.1620814871603; 
 Wed, 12 May 2021 03:21:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m6sm31453243wrp.29.2021.05.12.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:21:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BB5A1FF9E;
 Wed, 12 May 2021 11:20:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 15/31] configure: Emit HOST_CC to config-host.mak
Date: Wed, 12 May 2021 11:20:35 +0100
Message-Id: <20210512102051.12134-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this is needed by the tricore-tcg-tests as tricore-gcc is not easily
available. Thus we rely on the HOST_CC to do the preprocessing of the
tricore assembly files.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-6-kbastian@mail.uni-paderborn.de>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index f3fe75db9d..1bf53961c2 100755
--- a/configure
+++ b/configure
@@ -6172,6 +6172,7 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
   echo "CONFIG_IASL=$iasl" >> $config_host_mak
 fi
-- 
2.20.1


