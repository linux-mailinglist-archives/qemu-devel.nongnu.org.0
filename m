Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E98C453DAE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 02:22:51 +0100 (CET)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn9f0-0002AQ-G7
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 20:22:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mn9aG-0000hT-WF; Tue, 16 Nov 2021 20:17:57 -0500
Received: from [2607:f8b0:4864:20::22e] (port=33584
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mn9aE-0003wC-VZ; Tue, 16 Nov 2021 20:17:56 -0500
Received: by mail-oi1-x22e.google.com with SMTP id q25so2751551oiw.0;
 Tue, 16 Nov 2021 17:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROWwkMOO28CndFbZEJPlwLlrvfFh2YqGYg7uXNY07Do=;
 b=BNzQJKaPiRtfK3S7VgF9DShGfWOWmsgniyULMr+Pd3v89znB85vgp5P5NvhahV9g0Y
 WH8f8UUBP7RD2SBXyELoreKRVfJix/B4lD+Z+zX4eMtL6jmsAGlIQPtTV8PwlCDUTKmq
 +rWJwLxD+3UnBIiOfodFJtO/Xe0gz6yM22n/wUEsqRUc+UpfR9bMvU07ioqqP7hMdPuO
 QaZAI+wi/cHuJlbCwdkTcnh/CPaB/A6oA13WGj5Tu52DBGxZxc9cCTQP92cwKj9FIOvc
 ElUSph561ggoUFhW3f2r5TqbRyHgslE6U2NffiQaN4UvDmkX0CTd+8vaG63b+QI2rgR5
 kL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ROWwkMOO28CndFbZEJPlwLlrvfFh2YqGYg7uXNY07Do=;
 b=dp9gOX30UzOTCirTKOJAYVP0nhGspdxHtpRnl56J2IiONNT2I8OAorPac2uNgUr37R
 aY8phO8nORRsT25q9OjDFyX/8vDWJ4oFJyxJxJnF3ntFVbV+lEeoxWukm4SEgXNKj+Sc
 /NUYEr+2bWeIAIjhUyyahOn9Q3r/8jA18AQNzrb8Gqdh7WXT9aXwkCvQXtNwmLMLccXn
 /bEhu/9QW6OkQNdfAu7KvYpbKzKUCQJYzzJzZq4RqHZ/3PhnQ9Nr7orF0c0t765IJ7HO
 HNXR8BTphOyRhu3LCrChkOzkxPdR9ET9fTV6NsoXOJUK2WFfnN+1V/dnc/x8+E6VHyiF
 FNtw==
X-Gm-Message-State: AOAM531S51j3b5T9SE0z/pwvJ5BWzjTqaeq/FO/svdGDuVXe7OaGbiEF
 wa3E6i2leW1vJnbvWQUj/XJWITQAZdfko38+
X-Google-Smtp-Source: ABdhPJyDAv3rNc9AS20IgmmkY7yaLLKJQalhELQfjKJX4fLlcjezL01dtmrdcDAH7/Tst2q7MxltOg==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr4272858pjt.168.1637111406831; 
 Tue, 16 Nov 2021 17:10:06 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id z16sm15211376pgl.29.2021.11.16.17.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 17:10:06 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [RESEND PATCH 2/3] docs: aspeed: Update OpenBMC image URL
Date: Wed, 17 Nov 2021 09:09:46 +0800
Message-Id: <20211117010947.297540-3-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211117010947.297540-1-joel@jms.id.au>
References: <20211117010947.297540-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=joel.stan@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the latest URL for the OpenBMC CI. The old URL still works, but
redirects.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/aspeed.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index b091c0c61dec..4bed7b5221b4 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -81,7 +81,7 @@ The Aspeed machines can be started using the ``-kernel`` option to
 load a Linux kernel or from a firmware. Images can be downloaded from
 the OpenBMC jenkins :
 
-   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/distro=ubuntu,label=docker-builder
+   https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
 
 or directly from the OpenBMC GitHub release repository :
 
-- 
2.33.0


