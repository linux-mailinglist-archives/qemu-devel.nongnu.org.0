Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16531F0F1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:25:46 +0100 (CET)
Received: from localhost ([::1]:34210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCprt-00055Y-Ki
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <388ouYAMKCkwrxsu22uzs.q204s08-rs9sz121u18.25u@flex--dje.bounces.google.com>)
 id 1lCpiY-0005T3-TI
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:06 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:45487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <388ouYAMKCkwrxsu22uzs.q204s08-rs9sz121u18.25u@flex--dje.bounces.google.com>)
 id 1lCpiW-0000Ko-Gp
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:06 -0500
Received: by mail-pl1-x64a.google.com with SMTP id t13so1755068plg.12
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 12:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=ZC9jUXpTzNcPCsu2PJOcHXoJlOzyNZtWM8mHExz9c4E=;
 b=KuxbzKX9quFXaCNhA8q1az/7Dfu0T0u0kMRcgs5W9U/5AEIx2+XB7D6TNrzY6pdV9L
 QOyE4V00DWHdOKWIZBIAYTMLZXL+tuwEd6TtwJIzFA8ae7eYrm4hyw4jgF4E3JN97Lub
 +2HEraO9Okhr7048L9iN02gUo7Vgo3qx7QLVgTlNfgDD19p42Klx17Y6xVbHfwswyWn/
 ggQTIpkuc8p5xZE7HABUpeeNEJndke+FRBPCIn5mFvXQjKXjDtGNSNei0uxZ7wumLk3N
 JPjbqRoRf3MLnrq03DTkJelwDqq4U97eyu/CWPzNqjXTDaOKKlMcveZiSQ89Xn8BJKNo
 xPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ZC9jUXpTzNcPCsu2PJOcHXoJlOzyNZtWM8mHExz9c4E=;
 b=oAOzsi/KK/CCgOsZ+gaH2EQ+r0V0TjGkUhxTmla3wQ1UDkd8LINr7R4zlWHY4BSP9T
 LkTgqCcj5eexHF86QOKslgrOgwmsTmUzWcw0e5BAf81rNtSX2FtHDKlTzB69qDGYvj72
 kTQ7CtZE5E+fuAV7jSrOjMgNUbrglrMbHEdnyo1/Ptr805rG5g+GeKAhlB30SfxwlX9D
 V/Gdo+uzeatcEXbyt6RM0fxx+HuyHtUrKTR2dq1rEEzptiRvJskH1mKKTq9iji0kDcxm
 5+o5yy52MNFnbB5R8is0ph566+hFO530V3Dh6IsoIBdwe3wTm0on/eKduyzJ6MQPB0xu
 pqeA==
X-Gm-Message-State: AOAM532B0+XEdcS49C7t4JlB3kOPZ6zGqbj3sFdSBJBHFQ4ElpqusfkN
 4jZp8XyGHPtPBAcbjMcwo4IEgx42K2ndGGOU9NUApX5TpE4dXqLNEpZpDmVYbTWi5Xcac6pY15a
 4JkPhv9gpuKz1a1E2F42TMZAJQHbGhxP+dR8uJ5r/6RAb3FwNKWVh
X-Google-Smtp-Source: ABdhPJxTwebcom6EEkBNTtXDYj4RtVQvfoBAZQOixcxXQX3oGTI4P5nPmVT7dgXuxHyqQjMply2y8nc=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4cc1:c5e:b49d:b16f])
 (user=dje job=sendgmr) by 2002:a17:90a:8e83:: with SMTP id
 f3mr5854886pjo.70.1613679347871; Thu, 18 Feb 2021 12:15:47 -0800 (PST)
Date: Thu, 18 Feb 2021 12:15:35 -0800
In-Reply-To: <20210218201538.701509-1-dje@google.com>
Message-Id: <20210218201538.701509-2-dje@google.com>
Mime-Version: 1.0
References: <20210218201538.701509-1-dje@google.com>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v4 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=388ouYAMKCkwrxsu22uzs.q204s08-rs9sz121u18.25u@flex--dje.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

Signed-off-by: Doug Evans <dje@google.com>
---

Changes from v3:
- pick up latest libslirp patch to reject ipv6 addr-any for guest address
  - libslirp currently only provides a stateless DHCPv6 server, which means
    it can't know in advance what the guest's IP address is, and thus
    cannot do the "addr-any -> guest ip address" translation that is done
    for ipv4

Changes from v2:
- this patch is new in v3, split out from v2

 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 8f43a99191..26ae658a83 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
+Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa
-- 
2.30.0.617.g56c4b15f3c-goog


