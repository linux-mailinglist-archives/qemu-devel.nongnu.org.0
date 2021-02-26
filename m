Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78952325ED5
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:23:46 +0100 (CET)
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYPZ-0002Vs-Gw
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY88-0001q6-Qm
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:34816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY87-0004AZ-3M
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:44 -0500
Received: by mail-wm1-x334.google.com with SMTP id o16so6955643wmh.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7vxQpXVPhVJex6fCepeRyx3Or84hKClWAQ2rJefeJ+E=;
 b=BSQNoN9sA5KopClM3ahy9G2cvJY+x2Vk/H17IxZM0QODQMkbiHWuMTnFM3uAIXHcZa
 sbOgGwwzCs/DABiKyDREp2DC5G1KN6js7wiPMLjHdWMRPEWMjlJFX/laCuhc5TXVeC1d
 j13g32h/i0A+Qw0NNzemBMyCj1mpko2gJYCt3l46wJFtSzgfnV4bTEXV41RvLp6useKK
 lceqCEBhElkvg6JeZkEDQiwtgT9w2waqJm1/nrYdinn5CZTHvcPPBhAQlaTLvgIPgnnw
 beCmpgnPz6u24NoJSL6DalgRU+HTXDT4/jAliIMqHforoeh7Hi4kweFIQbQ4Mo3JeWDS
 yg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7vxQpXVPhVJex6fCepeRyx3Or84hKClWAQ2rJefeJ+E=;
 b=qIbRUfY2PvsWsag6SnfoptwrIfVvT0Y8PEpymFx7Im/0M0mFCR/CFEiaRgMTCUUU3U
 VW0M3QtLbFwq8Clbp99AYUgi3Hmdq1wgwweJjIyODeEcp9B1uMR2EDC+ck9pU0Y6+jku
 Rca7drIPVio9LdpZ/hVrWLIz9vRag11RNwSWTryMkhRa6f5pvdngcebxRnXpiLG7pLp8
 Q4qZWiKbrgErma7MFZo4QJ0RgMWHr6o9ZwRBrbCKNhnAveoakac3ExDvFwBjyQXYE3sZ
 e64Kb1ZEZiMzh8LCI01wP/fUkOcCKHDcXQq19OZHpiHyG94bpG1mDfdse8uFkGhldVUq
 u0Dg==
X-Gm-Message-State: AOAM532n15OqsxFnE7D83Gw6R5ef94X0dbhW5dPlw4T7wjHFhtwCRNFJ
 gJqwurHStxZYc7yqvRwh8imcW/ZgnRE=
X-Google-Smtp-Source: ABdhPJynTixVaySr+gTFhhCWttw2L4ETpU1YMLFmVz/ZO4JFyVP6M/hrwevgigKUsXAdEYvA9HUWNA==
X-Received: by 2002:a05:600c:220b:: with SMTP id
 z11mr1554012wml.151.1614326740081; 
 Fri, 26 Feb 2021 00:05:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/29] qemu-options: update to show preferred boolean syntax
 for -incoming
Date: Fri, 26 Feb 2021 09:05:16 +0100
Message-Id: <20210226080526.651705-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The preferred syntax is to use "foo=on|off", rather than a bare
"foo" or "nofoo".

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210216191027.595031-6-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index fb2050cda9..da0ddf8a3a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4135,8 +4135,8 @@ SRST
 ERST
 
 DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
-    "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
-    "-incoming rdma:host:port[,ipv4][,ipv6]\n" \
+    "-incoming tcp:[host]:port[,to=maxport][,ipv4=on|off][,ipv6=on|off]\n" \
+    "-incoming rdma:host:port[,ipv4=on|off][,ipv6=on|off]\n" \
     "-incoming unix:socketpath\n" \
     "                prepare for incoming migration, listen on\n" \
     "                specified protocol and socket address\n" \
@@ -4148,9 +4148,9 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
     "                wait for the URI to be specified via migrate_incoming\n",
     QEMU_ARCH_ALL)
 SRST
-``-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]``
+``-incoming tcp:[host]:port[,to=maxport][,ipv4=on|off][,ipv6=on|off]``
   \ 
-``-incoming rdma:host:port[,ipv4][,ipv6]``
+``-incoming rdma:host:port[,ipv4=on|off][,ipv6=on|off]``
     Prepare for incoming migration, listen on a given tcp port.
 
 ``-incoming unix:socketpath``
-- 
2.29.2



