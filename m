Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF92DFD4E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:15:03 +0100 (CET)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMtq-0005xy-SI
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRD-0004rQ-0T
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR8-0007ks-Bg
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:26 -0500
Received: by mail-wm1-x329.google.com with SMTP id g185so11155922wmf.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7RAuAOiHtCEg/kAzL1aVWGDPXJpz9DMSzL+PQoGrz8I=;
 b=Y7MpI3gCpoy1MhCGs2UQxG/zfq7//LHAmbRCZJ4wCFRvqQIzXVuul3aYq1ZsKdkWI9
 Wyf335BvR7IX/aRhBVPROhP6tr40956WaS23NN2ucrGUfTcrmtJprwuw26NxFp3RagAi
 ODSoGMEbM8kFzWtT9HA3QoUx2LfUWI9zwpEhtcSm7UtiK8cNFegeNguf28Vb/WuK70ok
 dwlup+s08IPqfqDbMY5XrFs9L9sNG9sHIYjyAaAxOLb34bxrPHd7WPTgcLuHV1zengjP
 +3uoenDCZLza+KfwrObNrP0sZ+PwK6/nZ9KXxRXSiqKsGdZGaTG89VgMhkpdis8ntr3i
 lhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7RAuAOiHtCEg/kAzL1aVWGDPXJpz9DMSzL+PQoGrz8I=;
 b=Q5Qe008rfMwZIm1zdYHbqruDUakY1dVYVpUaKZvkZit/E5Z0L/fTWWIjw06Gw7yWz9
 dZLNX+jCb5vuH6cWyvski5GH4WdHBPKz1XhrJBT5TG4N4NFfhGP6mrbgSKZd5bWNFLGC
 93MU9Tmuk19pI6bEyM7zSECEftAaVz7dYJUUY2wYDMpAN6torIJIfKceq2Q52Zd44k+T
 Q907S9MKVsLiSXMJG5h57yrjxCf/xx/UQRkx4kKjtsKydMnZhBBsebJOwwrUKk94bT+c
 2340ZcA1eCzWpiJm+DSdGGAsMx5o8l6Wenx4KHPldSHvX7O/pZfINeOr67DcWPj6FdiP
 OdSA==
X-Gm-Message-State: AOAM533SuGHRMcfKDPe7kq+96Q8v8qd8ADCKLoaJTnuwt+N8Aq+9wOy5
 a0OTZz/La+ZlBFkYjmfwU+FQR6eAcuw=
X-Google-Smtp-Source: ABdhPJxhHd3hS8KL6gF5ZHpisbyPdrbhsTRSwt1FZ8ZCaNNsjIWKfCfNkyC1rkvI1A2kKKlG4Ybwkg==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr17138797wmh.29.1608561911271; 
 Mon, 21 Dec 2020 06:45:11 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/55] Makefile: add dummy target for build.ninja dependencies
Date: Mon, 21 Dec 2020 15:44:17 +0100
Message-Id: <20201221144447.26161-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The dummy targets ensure that incremental build can be done after
deleting a meson.build file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 76dbb917f5..fb9923ff22 100644
--- a/Makefile
+++ b/Makefile
@@ -133,6 +133,7 @@ Makefile.ninja: build.ninja
 
 # A separate rule is needed for Makefile dependencies to avoid -n
 build.ninja: build.ninja.stamp
+$(build-files):
 build.ninja.stamp: meson.stamp $(build-files)
 	$(NINJA) $(if $V,-v,) build.ninja && touch $@
 endif
-- 
2.29.2



