Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE0730F84C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:46:43 +0100 (CET)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hmE-0007eX-1A
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:46:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l7hbn-00036h-J9
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:35:55 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:41370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l7hbm-0002V9-1k
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:35:55 -0500
Received: by mail-lf1-x12b.google.com with SMTP id a8so5426823lfi.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4WI16CTOIH3OYsFhn8s8asBAXjvcK1IPlUFFZNLp6qM=;
 b=jVRnJC5/sf0nf352t3fX3TX48Kl2NNB2VjgSFGX5jyeT2J2whX1lmFSIHC/zOJqBC8
 S5WJ0N7h92Kk2zYv4cQvCwPOxrVUZFiWPiBBVfbqpJDJoWWsdHe5mYuIMR6UFuOW8jCt
 aX/Ke4KQQBzxGZ7T0XRw6DwQnQKVfjIm4/TEBomXUcOibaaw8p/hR3HKmrlvzvQAGmRW
 RkUJtK6GQuCWdxp4bJ15sjR5HVjDGtEwJtoMSd/jEinbf3QwXvJZScOh21X6Riy8Mqix
 r6+MJBboa2GAkoIwEg8zrElu1RLO0FzcS4WE3rosXt7+hzyBJsgMuCbMay5GsxR0ozVo
 2BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4WI16CTOIH3OYsFhn8s8asBAXjvcK1IPlUFFZNLp6qM=;
 b=m1OvD3QRaYYr+/jx4i23JUGP/Y/M1kvZoDTTEW0vISGz5rAX+H1f3fo6V9yQA7s0iD
 Kqk590OG96ANVZa1SPlmZ5JckXtCPqkyaj+Q9eZA6a477KN90kbO11AD4b5/fY5LBZ9e
 mdaw0WyOjZINUtq6PqWeKgNKigo/9HptCdXr3QiucpNeoNYqqy2TENX6d46KQiw0pxhl
 6RXDnSvb+JqwpYJVY3x2Wy0XnLTcRcI2B66FiiGUQD1eE9RL+BV9Kvreu78qSj0mmuKq
 hztmtV5bZ2jIGfDqJKppDmb18IAA5S3B0q22GELzpqP3VbY8Xm7Ubov2tyieHmGLzgU8
 sP+Q==
X-Gm-Message-State: AOAM530P0MTBHUnHYJZQ8MxCTm5PeOHcAFEo1VdAcQCCPFTnR1HS9Z4I
 1h7ANbvbh/80NTw8WTfu14bIKw==
X-Google-Smtp-Source: ABdhPJx00HUbTZlTsswRRmsWo5FVxOwcicXIuJMDTiqnPfmrEFC370rHgdp8OjD/yUE/J5/aZeXQTQ==
X-Received: by 2002:ac2:510a:: with SMTP id q10mr138036lfb.48.1612456552204;
 Thu, 04 Feb 2021 08:35:52 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id c123sm668172lfd.95.2021.02.04.08.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 08:35:51 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v4 7/7] MAINTAINERS: Added eBPF maintainers information.
Date: Thu,  4 Feb 2021 19:09:51 +0200
Message-Id: <20210204170951.91805-8-andrew@daynix.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204170951.91805-1-andrew@daynix.com>
References: <20210204170951.91805-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12b;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00626941f1..5ca9e8f304 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3194,6 +3194,14 @@ S: Maintained
 F: hw/semihosting/
 F: include/hw/semihosting/
 
+EBPF:
+M: Jason Wang <jasowang@redhat.com>
+R: Andrew Melnychenko <andrew@daynix.com>
+R: Yuri Benditovich <yuri.benditovich@daynix.com>
+S: Maintained
+F: ebpf/*
+F: tools/ebpf/*
+
 Build and test automation
 -------------------------
 Build and test automation
-- 
2.30.0


