Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7CE1F7D54
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 21:05:19 +0200 (CEST)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjozO-0002iN-Di
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 15:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjox2-0000kX-VU
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 15:02:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40798)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jjox1-0006sa-CM
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 15:02:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h5so10828789wrc.7
 for <qemu-devel@nongnu.org>; Fri, 12 Jun 2020 12:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VvsWLFzW89Fr/+a2K5qJoeB4GeJHRtOSlXNKQS2LjDI=;
 b=p+M/mfiTCmYM8kCkSwmRyFZ3pMO9TwEWnWkAmTqoh7p9npi0fwoCeYdiXur5sluiBr
 i4AIgPORdYsdN/KKjt/Pv1tPGmfdl2d8bwhLe+fIOhw7ysmzYOcNsRgDDh3u3DhJI/XV
 WbXaeXpAO9qcNr9MX+O4QNQOt3XO/20DBvYE0FZh3mH9bwHwxTlHjFWnE/2mMDGhzODT
 l8VhcgklZQuygrjsnFfyn3fnCpuXShbqN6EbDDM10RPMVGd/gYadk0+uNFeLpVJfGkfE
 c7p0EEj8+BupMxu7IJiosEu387FLOzAvHGCM4PPTFHaxEhG9jGVEQjPwTXhATLS9w/wY
 Jz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VvsWLFzW89Fr/+a2K5qJoeB4GeJHRtOSlXNKQS2LjDI=;
 b=ulQ/hR6RfbjS2lAbLza6uSD4Octr5FqHBXxdNI+5TthqSrfFBznWPbbyv4eRu+VOx8
 OEaI5C0WzVGKpqJXoX+QldNAVc0A9g+UbRM66AXJizJ9Q9qvpmLYd3mdVQyZ//34529f
 RnfDSSliDeXzQh2S/rne3UR8UNwHTTYcYEmM1BYL6ACjG1DPughMcCzKV0/Y0yVYkXyR
 ValCRgtxiVyQ6rt0sV7FjTVDNFKAf4ionLdymMKCJ3irG4x2uYr8yEjEAYBC4gDaY8ry
 QG7ES1prtobSPYqva2LTaveJ/+frETjNcrZc2olSI4AUQkYJQubqpdD/FQGCsJkWFBfJ
 X/Iw==
X-Gm-Message-State: AOAM532QbOn5WNaxxtxeAnWl4xYFnz2pmhijdnoL7ZcVqBH8IHwgVqMU
 ePkE7b8S4w5PE6GvorjZqPY5eA==
X-Google-Smtp-Source: ABdhPJwRPfY9GLXOYm1U92EvIWYb0keXL2s2SS3iXZ4EJ8ov1BPa2ON885QSbnTtxwUHEC4dnwZAuw==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr375566wmc.10.1591988561459;
 Fri, 12 Jun 2020 12:02:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm11458716wra.86.2020.06.12.12.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 12:02:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE6D71FF87;
 Fri, 12 Jun 2020 20:02:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/18] tests/docker: bump fedora to 32
Date: Fri, 12 Jun 2020 20:02:20 +0100
Message-Id: <20200612190237.30436-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612190237.30436-1-alex.bennee@linaro.org>
References: <20200612190237.30436-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should be keeping this up to date as Fedora goes out of support
quite quickly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 92b6e11c8a8..798ddd2c3e0 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,4 +1,4 @@
-FROM fedora:30
+FROM fedora:32
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
-- 
2.20.1


