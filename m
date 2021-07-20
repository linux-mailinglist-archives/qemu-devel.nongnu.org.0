Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF393D05DB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:51:26 +0200 (CEST)
Received: from localhost ([::1]:39278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zWH-0001ja-9u
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFy-0004Lf-UT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFu-0001hC-JI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d12so150043wre.13
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHVsCfAc/Xzw+A5JpiM4mOmvx+0P4K0niA2sGViAgEU=;
 b=jKLvRwVTpv8aB/pXc7sFexJcecY7+jp9ezcBQtnHv+GkxntmlvqUbxkdWZuE6PuYwX
 rp3qYqnQ2dfHUsk9GM8kTcrOgvj2M9R1g386LAYqXUPtFUJy005GAGPvzAtJElwLlwuL
 rO4pie9WfwExHUhOdqxubsnBUTR9COGMI7OloZd8cI9ByGtWxqu0zXeseW93gevLLYrS
 nObNwHubApj+G+HwO6hixfm5Tmr+p0ZkHo7uwBkhtw8bgaQEaEf/lykGCo0ire2J/QHy
 yHClnsFk2IbsgnCzNeHXefiAktLwBbdSougUoujZzERemCFDAa/A/lAiciQzvuaYFDnS
 TOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHVsCfAc/Xzw+A5JpiM4mOmvx+0P4K0niA2sGViAgEU=;
 b=eSoWfa6YVYbwV0rgoCocYL0AGUOY0FWLnGpF6xH6FH+JV9dbpsIlxzEQBuIVecHToX
 NiZpn9vY0odZJDtNCKxOegTME59cDbY1eaEAA4nwnXFe15q2ZgEP6iK8RqEldyaEJvYl
 i97IHMgdRpEbvk7PlQKAppw13dwSfSh7sqBCP5Q1vbSi2PXyxjjCrPC/owXIxyQgCAzi
 y3wmN8O+/2T+RNnf+h23+qFpSBbihPeYSqFlVfGxflpsNs/5B1BWlb6Ok5ohLyq0icyG
 apLiYmXmDq+EmX3aOvH7WKtXejiU1ckonyZ5yyeA3JhddzuwB7TKnfa5m8t68OLfjm7U
 gjsQ==
X-Gm-Message-State: AOAM531k84r2zrrCKKYKqRc7iZRjZCLm3UJ9eTwXMCz23H/w02kwhs9a
 1ivLYWCdoDqm39I2YJ0DDHffcQ==
X-Google-Smtp-Source: ABdhPJx7kW2+XgqXn+g8sHhxdmaLpuWvdJ1n+wWWzrYhxx2aQd5Ra+fk51RkecuHf71N1dAbeTcJQA==
X-Received: by 2002:a5d:4748:: with SMTP id o8mr32202639wrs.202.1626824069260; 
 Tue, 20 Jul 2021 16:34:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m15sm21085655wmc.20.2021.07.20.16.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B0B11FF9D;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/29] contrib/gitdm: add domain-map for Crudebyte
Date: Wed, 21 Jul 2021 00:26:48 +0100
Message-Id: <20210720232703.10650-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-Id: <20210714182056.25888-15-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 5ac8288716..e42861cd11 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -9,6 +9,7 @@ baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
+crudebyte.com   Crudebyte
 eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
-- 
2.32.0.264.g75ae10bc75


