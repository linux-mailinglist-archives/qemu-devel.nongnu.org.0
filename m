Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078613D05C4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:43:09 +0200 (CEST)
Received: from localhost ([::1]:40436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zOF-0000TT-WD
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z97-0003vp-3e
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:47090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z95-0005ml-9Q
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id d12so138870wre.13
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=St2yjIT/JwM+2i91aMlh517bmBW/G38gWNDyuaQIAVE=;
 b=I05SKIeeIEhp6QVV855kKGFI7Zca91OMrORKcpYkmoZcqFQc5TPc9akhmnbnLpFACc
 sA8djXlbd9EFbAuMbNGWO6QG/4j9gM2h57WgSq1Z7a2RHV3IkQQfXNwr+pgKoqaJHEfQ
 8JZyFEerGrdLT10im5aVsXi5lKGobifBHQtH6KkCW+dN7dBXw+5fjVz5/qTSrrF2qMaO
 AcBXc1AWxNyyeQH1zliCKA0yYQMXB4/U++4KuFbfDhjRQTX7yDloIcBCf89WqEVxdqia
 2/Q7i/31hHSWr+YZjk+Uc9tnaJp7Mfv4jEjGLI1SbFTtdpGfvMh9LSIw2WWyArSLtbVV
 mwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=St2yjIT/JwM+2i91aMlh517bmBW/G38gWNDyuaQIAVE=;
 b=irF6vI4+/OSxW3v4B7tp+tlcavceiHXWXQ4VyWx9tkinoWorOjeEYUDINBgsJFwvVJ
 Au6ky8nCWo1XVgoFiYmipVefja+rcHmTqL27rAzIFz4FCwRznW4yNqjCQ+DPXJuvcKpT
 4WbAzi052OPhPdZxeKor3NibZC8jxigR6XoDt3d/9sfCSlD90x3W4qFUW9T3aqQQrda8
 fxWd3ZgGDmMOf5rTt0yJ86qO3w/RZixVy7aLcSGYoFbgBfNSob6A19bIRDhjeF0L+itc
 9oAODJWJnWSUVtKhncztE8zt8Hs5p/9/+28nESht9K9zqQTaEdY9qkEenGNJLV/L04CN
 sX3g==
X-Gm-Message-State: AOAM530DUw0qhTs5WYjXK/NriHzBnNx0aPVK7Rd89zK4190RbBzAoKPZ
 +x+sIZdr17fuQJrgtH763W3bHw==
X-Google-Smtp-Source: ABdhPJxDhqIau79Z9+IoVThlgG7qXHLQe/jAOZPhNdc18XC19cmYdog44fN2AyGkueFGjJByN4dnCg==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr39312025wrn.420.1626823645931; 
 Tue, 20 Jul 2021 16:27:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o7sm17592517wrs.52.2021.07.20.16.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB0ED1FF9A;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 11/29] contrib/gitdm: add domain-map for Eldorado
Date: Wed, 21 Jul 2021 00:26:45 +0100
Message-Id: <20210720232703.10650-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Luis Pires <luis.pires@eldorado.org.br>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net, Bruno Larsen <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Luis acked on IRC:

  #qemu@znc-oftc_2021-07-13.txt:[15:00:02] <lffpires> stsquad: "eldorado.org.br Eldorado" is fine

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Luis Pires <luis.pires@eldorado.org.br>
Cc: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210714182056.25888-12-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index beeb24341e..41875c9e75 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -9,6 +9,7 @@ baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
+eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
 greensocs.com   GreenSocs
-- 
2.32.0.264.g75ae10bc75


