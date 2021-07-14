Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35DB3C8271
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:09:50 +0200 (CEST)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bpu-0000ok-0z
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQK-0005JU-Qa
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQH-0000Fc-8M
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so2172687wmf.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mkveh20OoO1fJ2jJIzs+75pAwAXlywpfOsc7TNI4PTQ=;
 b=iQXO4NwpRQ6aViXS1XZYUXb3hZN6kZ75yfx82DWeXLBFGo4GO3AS5tR+sWkhXcSf7R
 XJ0/7hNCkJ0Pe23W7284f91MjGHOpZRUAGP52A/RQambLCMVQpH9jeS4mZblAL1xZaIa
 +RDaFSGPNgFVYJWJFiN7SIFXLYZ9j7Ubhs3b3/vpl/Sg36ygpOPlRu/sN+J4Ef+4kYM/
 i6gjDRYZy1qNjWWoAMcBsninccc5BKcQwzluynbarHQMu4BYvcsgduhMegIFUKhhn3G2
 w6rRkg/LYuMl3ie9+RdJCvhJpvFA+hLyGiG/WIVYjuYteNq+KSyPhWh/Jl7ZGK1kCupJ
 nDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mkveh20OoO1fJ2jJIzs+75pAwAXlywpfOsc7TNI4PTQ=;
 b=hsj0GfJdqggxV8QhEds08O+T05jsZH2WbwfqpPci7mgkUHDe+anUFiZWF2a8lnpRRF
 +eCox5zp3WatpxfUWoRAEt7OL7OkB9DJf7J7lb2trMm16YoDnRiznzswNYQx7+YBln0T
 5PdAkEkPuf04Sc53MrGM5PMJEu7vmY4+emYg0KMM6RWyh0UHk3NAC+Eu1c7hqtC3kYed
 BCDcYONThwjPZx7et/idWh4WqRdGl+BHF8ba0WzRvqjmYjDlJrNWQYhusv0OZx7tBeAo
 LLKBJuhiB5wDgLaNAAKxNHyJbtyTFMZ7PJm0Aviw573jHr+gadiI9b7QN1HJyeL3cvK7
 gIlw==
X-Gm-Message-State: AOAM533Q24QTcLyH6Tog7B7BG/X4PcoMVtqzKHiLcvsIasEMvlTKVBi0
 mxgAuZZ/e31mqiPYeSgZDl0cxA==
X-Google-Smtp-Source: ABdhPJym61fd1wEYXoliHX4euDgoPxZ7UZWr6DV9v+xyeVB0UVggpJggYGgujkmPEgYDm78rzkZR3g==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr110628wmb.71.1626255799900;
 Wed, 14 Jul 2021 02:43:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 6sm4921261wmi.3.2021.07.14.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E99C51FF91;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/21] contrib/gitdm: add domain-map for Crudebyte
Date: Wed, 14 Jul 2021 10:37:12 +0100
Message-Id: <20210714093719.21429-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let me know if you want to be moved to individual contributor or you
want to keep with the work domain mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
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
2.20.1


