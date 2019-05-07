Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D143A1635E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 14:03:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNyof-0000S9-Vt
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 08:03:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNylp-0007ZM-Pe
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNylo-0003oE-Ld
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:29 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42624)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hNylo-0003lD-E7
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:28 -0400
Received: by mail-wr1-x442.google.com with SMTP id l2so21966180wrb.9
	for <qemu-devel@nongnu.org>; Tue, 07 May 2019 05:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QJnsO/e2aUvBsiJ7AzOUR4tR/12UDD/kLgyFI8NTW1o=;
	b=BnAEaXTFUWO2yvGLvWI9wI8DHMKde2icoVLoAdD48eNUKUXCWoOyK0Q2WZomDNrDHI
	ro7dJaY0h+ZP+bC5iTlTTuVpRgV/o7LYuvtrVRSxvioGc3KtNcjd50Nfw6Qugrkx5H40
	MIeR22qsjo0PKlix+b9I1DRfo2DkfqGCGx/eKz5sDho4HR96eMhvwXreKcKZr658c143
	4XqG4Ajty59yRLHWSzoECECmZbnLobrMz0zdjI9Im98aqWsESmUkiBmnU9WpWFvCtoA4
	pHjFMZSd4B5iVkCiWDuAo8vwLlTm/vkD41f2S3WmXU0txVt2G/gnn12HSudlwNujKbES
	v0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QJnsO/e2aUvBsiJ7AzOUR4tR/12UDD/kLgyFI8NTW1o=;
	b=gSyPFPL6MzSb9Uf5hgO1gYcMoso8MjRq/oftjuPMI2N8jg8BGg4lyGZGCOgiDl6s/m
	A+aI65LXgFGTZozqQwgM52eGHe3VDv1G5qVmo+NF7TPhG8WNuiFmuL1QjOgyl+p7UfiE
	1fF0L87Rf9zvBcNXRE4tS2BiU8dIXbDAuyT4kE5s/DncJcRFQKUuPM8G4gcCkpn3nAjQ
	SwSigXeXOqlb6l4ZBKMhQubpJqwXkZTzlxuBJ5G9y+/FAE8f6efZsKdRVeMLvfEMoEh/
	Mgq7/qhCZe3X17d2Iya99iUfEzocnF0VDo1OydLfWFSLEm0IDmdVHhGbK2VmBwfu6jkj
	pZMw==
X-Gm-Message-State: APjAAAUIr3i3OlyrwP/7ZezNNGt2I75M/vr/i5t2ODZW6XS0vL4bTEpg
	pFPiBUwwLEy+GOBbbsM5AS2nI/LeDU4=
X-Google-Smtp-Source: APXvYqzaMP7ZRENqyaUyR64Q2s0TEIZL3QvogtDfQ25vhbqyWbVny5RSHdB4mDDYCTyfW9L38m7qjA==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr21489298wrw.41.1557230427088; 
	Tue, 07 May 2019 05:00:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id g3sm12348596wmf.9.2019.05.07.05.00.26
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 05:00:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 13:00:05 +0100
Message-Id: <20190507120011.18100-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507120011.18100-1-peter.maydell@linaro.org>
References: <20190507120011.18100-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PULL 09/15] util/cacheinfo: Use uint64_t on LLP64
 model to satisfy Windows ARM64
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cao Jiaxi <driver1998@foxmail.com>

Windows ARM64 uses LLP64 model, which breaks current assumptions.

Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20190503003707.10185-1-driver1998@foxmail.com
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/cacheinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/cacheinfo.c b/util/cacheinfo.c
index 3cd080b83d1..eebe1ce9c5d 100644
--- a/util/cacheinfo.c
+++ b/util/cacheinfo.c
@@ -107,7 +107,7 @@ static void sys_cache_info(int *isize, int *dsize)
 static void arch_cache_info(int *isize, int *dsize)
 {
     if (*isize == 0 || *dsize == 0) {
-        unsigned long ctr;
+        uint64_t ctr;
 
         /* The real cache geometry is in CCSIDR_EL1/CLIDR_EL1/CSSELR_EL1,
            but (at least under Linux) these are marked protected by the
-- 
2.20.1


