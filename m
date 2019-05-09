Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344FA18EC1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 19:14:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOmdA-0003IW-BJ
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 13:14:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hOmOB-00073l-PL
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hOmOA-0004vs-PE
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:59:23 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54251)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hOmOA-0004vZ-IJ
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:59:22 -0400
Received: by mail-wm1-x343.google.com with SMTP id 198so4146300wme.3
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Cq0hWZXgOdvqzfyTAW4dZk0efyH3GC8saHgcK0H4+rE=;
	b=dH2ScjvwIaLM9oqnqdt8ADQvAPw3IjuFp4PzYnyT5VYP58hchyLO+Zg+oHd3yLeGis
	lB7IhLMICW6s5xuzh2KCmR+Gt5BnAQFIQz+MIvNuyGUCWRazq82Qkb0pm/+ke0k8TeFP
	ggfBBecjViB7/p6Gu09wXl5PZH8Q4t9qt7uYhHQvUUB7HtCO2LtTb42VbKYmjkC9ciAd
	YCXXTTnrvK0kovwREeSSCC8ngEkMFGNG9UaNjT4klelnA19CmqipeScQht19NMbzUyzN
	8/SVGMykUok4RSO+wEOSOcSPc7mlhNyXMxY3yjCrAMVYFXyIt77HoQnS3GB9vKokIMdm
	hiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Cq0hWZXgOdvqzfyTAW4dZk0efyH3GC8saHgcK0H4+rE=;
	b=E0qK2WzOVeW4aLK+Uvx/18BOPY8a3q+qJlkT5twNBA3nQBgTHDX/5t2TbLuR12ZI+s
	zyOGRA/Tj92poQhY93dG1H0muCHL6TFv1P8gVodAQKWy29fSREyfpZ6ByirT2wdQKe/b
	Qq0OgEEq7vO2LNEHoVLitGiaYeI8E0JKEp90B/0yySPpDu+U7gs3f3zXCJgsv4dkpFII
	NHSM3qKgKcI/MLq8KMLmgowcVHo4qDndE8nbRXclVZL22RmKhbQmyyGobQjNbpnxONOL
	OkwxvmtuMkf1wr9Z3uF5cejNHQJHZcVcxkgSZHjCuGX58SP/HSqiXWGnscHWOh4pZaXd
	pFMQ==
X-Gm-Message-State: APjAAAWbPNizmmrA+Mp/nlNc76APsL4LfjJwqJ0DK0eKoNZ8P+FMnD0m
	UVljgPPMD+MKBQDWXNucoAt6J08WuTw=
X-Google-Smtp-Source: APXvYqwsRl91vpKH3CcTAt+7Xj0SQqVDMNpUxwTCBSH3ON3oMoeL5hmSCVfEGg8At5xQXOy9if4Jcw==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr3741346wmb.82.1557421161594; 
	Thu, 09 May 2019 09:59:21 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id u8sm1605915wmc.14.2019.05.09.09.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 May 2019 09:59:17 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B0FDA1FF98;
	Thu,  9 May 2019 17:59:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  9 May 2019 17:58:56 +0100
Message-Id: <20190509165912.10512-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509165912.10512-1-alex.bennee@linaro.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v1 08/23] tests/tcg/multiarch: move the system
 memory test
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing inherently architecture specific about the memory
test although we may have to manage different restrictions of
unaligned access across architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/{i386 => multiarch}/system/memory.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tests/tcg/{i386 => multiarch}/system/memory.c (100%)

diff --git a/tests/tcg/i386/system/memory.c b/tests/tcg/multiarch/system/memory.c
similarity index 100%
rename from tests/tcg/i386/system/memory.c
rename to tests/tcg/multiarch/system/memory.c
-- 
2.20.1


