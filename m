Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3258308836
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:23:46 +0100 (CET)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RsQ-0001Jx-1i
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnT-0004lT-7s
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:39 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnR-00064N-Lt
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:38 -0500
Received: by mail-ed1-x52b.google.com with SMTP id a14so10126141edu.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wh5EmA8AJ+dbguUcmgrU6UUWAV7n6Xaj2Ghuf3FVxNM=;
 b=abn5ZKUheQBU6UBjQygT7SkGtrmnAkju63SxkAqzndz5go9luiMYOTwdqbeDohvBSQ
 BBTbxHccjvGpy0uGOGfOznhVS+fbJdFk3mjZS/SspeO8KLW7aINnIkdvHZe9lamhdoX8
 HUls6gAGg37QKSM0pMrnP75/WFNWPTG7auvTX8LjHff0eYvvPKt7fKuAe1OpsrVlqrbM
 nOASY6Bmf6e5DSbIUKGWZ27EdLXLRe83B7I3IJizX3hUY5rLVg01YueXVUWVSXSKf+g4
 nPrOz/nvhGv+Lapss5Bo5EQxFg9yiRTL+6hk+LbsAvOgGLosj2aY1nbV4PfeUiuieGve
 VMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wh5EmA8AJ+dbguUcmgrU6UUWAV7n6Xaj2Ghuf3FVxNM=;
 b=jhaL++EAXbTwn/Y7AsEizun4bG5E27WmKHjwC8bN6C4ssfNSTHuniwQYoSeNc+wZYo
 lj3RNNOKCzmm7/mGvjJG7/WyfSD9W6D0bek3RpxkBBH7nu4qO3Pdi188qygoBIvP8Oem
 ckxyPYtvzXwbsE4bERb0sPoBE9xj4wi2pFhglWz94waSiGBgsgdZPz6c9AGDn/FEY2cv
 xqOQULVquQ7QQPsQgTEy2k7Z7g+BGOq0+L4i9cTHmHuVyQFLxPmj+MJ2b/PxfQMdGtZS
 nlFW13B5Z6FzMI5YXfwYptK403eW6HyT+ieoj4lnscnl8YawEm9scbKUBd6+/RYmOc2Y
 12rQ==
X-Gm-Message-State: AOAM530ux3XoXtxHQFwKTD7R/PLix5LSzzLQAd4vSn9XIULKQW0BIJT4
 dikheFn7AzqHe7shVliKGF3d7cXBmfu3vA==
X-Google-Smtp-Source: ABdhPJwFbIQasrdaauDGiRNDnGYd62Ir2ZQZU2BrPDrLthbqSSJZ/f3xlQeDz9W6CQ8WXx/Ab01jiQ==
X-Received: by 2002:a50:b746:: with SMTP id g64mr4512118ede.33.1611919116426; 
 Fri, 29 Jan 2021 03:18:36 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/36] slirp: update to git master
Date: Fri, 29 Jan 2021 12:18:01 +0100
Message-Id: <20210129111814.566629-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

git cherry-diff:

Commits on bacb71f1c3ed5f40e393afd8be81bedfba13a401 branch that is not on 8f43a99191afb47ca3f3c6972f6306209f367ece branch
+ 1021b0dc38d39f1dc95a296fe3e05a24a087cdc6 disable_dns option
+ 0f94ceec752592e4ac632a24e3c64a97dd09bf4c limit vnameserver_addr to port 53
+ b57bafa852ef16b133907a13678ec69e9531f177 libslirp.h: fix SlirpConfig v3 documentation
+ 1abf18b2b5edb462797629ed47ad4515a195686e Update CHANGELOG
+ ff4ecf9b6c6542b24b4ac6ea178be9d44e159f79 Release v4.3.0
+ 21f1d933050a40d62612c6274c32de60b811d9ea changelog: post-release
+ 376187c4b14c795763d472214812826eebe7e9c2 Release v4.3.1
+ 73336e08902a7e826f7d960453df037380266186 changelog: post-release
+ 5c1c9d43be61571608e9b14615045b67b830daf5 udp, udp6, icmp: handle TTL value
+ 73ed49ab71998d4288e71e954ef6214b70f23d79 icmp, icmp6: Add icmp_forward_error and icmp6_forward_error
+ 7a4840a57ec7dbc37cca1ab96f058a9610b26950 udp, udp6, icmp, icmp6: Enable forwarding errors on Linux
+ e9b2bc19ae652a2907f247e621b2e4773bdd2aab TCPIPHDR_DELTA: Fix potential negative value
+ 39f9a363eec082f04513413046321abd04163148 .gitlab-ci: add a Coverity stage
+ 1b0093b973cfa0dc041522e5d4e6f576b2df642e sosendoob: better document what urgc is used for
+ 5b9ad89ebbb8afa50162c9156fabd5fc56291088 Add G_GNUC_PRINTF to local function slirp_vsnprintf
+ 8a808aa493980e212b4d5f5465330905c8294e59 meson: remove meson-dist script
+ 0b669b5fbe4d3c25a682a67f1059d8633c963b3d meson: support compiling as subproject
+ 9f82a47b81f2864422b82c1e40e51a2ed9c6ac32 Add DNS resolving for iOS
+ c0eac03e8ce1b9a743231f2fe21e7cb579fc9339 Remove the QEMU-special make build-system
+ 1bfd4d9368f9fa2e4f0731e1266bec05bbc83a80 socket: consume empty packets
+ 92413be68914f8cae2f5bad4bf3ab8491dcbc5d7 Release v4.4.0
+ 07e8cfac69766081871ab620d9f16a630543d302 changelog: post-release
+ 4c4e035813313d02b63fdeb920d56fb2fdc0a5b1 Remove some needless (void)casts
+ eee9db9d115d91aa82f33685c4e76d656db92976 fork_exec_child_setup: improve signal handling
+ 216f434a018b3af182a4f31bbe5a00daee170343 Fix unused variables

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210125073427.3970606-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 8f43a99191..5dce846e3e 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 5dce846e3ee82d93462bc637bb0db2fd49f0fc5a
-- 
2.29.2



