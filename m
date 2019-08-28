Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B7EA0178
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:19:26 +0200 (CEST)
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2wv6-0007u5-Qz
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47169)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wlT-0002IZ-Tl
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wlS-0004Dr-S8
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:09:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39964)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2wlS-0004DV-Mh
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:09:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id c3so2240798wrd.7
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 05:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfUWe7KQQj1p8swLDmsNZv29S//p51ZE3T5ORSYbWOA=;
 b=naH13Xg0k9yZgWkKtc7X9Iqwyd6us12ALE2zYfC9p1/F9crtJ9TQLZA6WGKJOdR1o/
 dagL0D9vO3dfn05vRQex6CRylnVzD67B5dLQwuMo4RYRYLbEugrATYMcLWYott1gW10k
 ulOu8U+pextDFRL0de979acjIZV1Gqd7ZuICkqMXhl+F+bLEfQ0EVNbKB9Z8OhEFyjWC
 u7ojYMzMJhFokwh+0Rj3k/aGfXFwtWqWWHe+qopi44tlqjYj2af1KI7TyeqEVN28Sp9c
 EZ0//AaC+kPOTWSNf6OSfrPpjX7aLZAFN8k3W/VAsFN9WLDAVGamDfF+ZvfWGvfGR5J4
 +I8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfUWe7KQQj1p8swLDmsNZv29S//p51ZE3T5ORSYbWOA=;
 b=JHNJbSw2JWI8KcVkqQnrjpJmmwwewUtqk3ysO6fLbHUFgNrOVwiHmT4mDnerBX4soD
 KQpZo7xrBOD7GxF2xEB06Ext/7cPSXcG88oB8EwCHShYA8PqRMhaxZPyryVuLNwTzvJL
 p9C5PxyEZKiEoAg9zbxePU0x6aFWOkJRUJlcM6ehXBLh9GEnEp73gQ8kq76iS8xbAEwD
 oEDLY698i4RCA5y43eZ+xQ7hzzfT8CxhisdkeEAIpwjChss0e9bsLif1blLvjjRrMOce
 XWmzB83Mmg9sN9+vXKNrOxLBWU3DZumA17alN6JuTlkhTX6QUlHlbdcXQm532VMnc/Uu
 BAew==
X-Gm-Message-State: APjAAAW5T0z2t+h0Pqqs5XfoPmYbr2BnqONwfNTk7ALWEJ+xbI57pTz8
 9pRhf/SphUhjecv5uDpgBBAzDw==
X-Google-Smtp-Source: APXvYqzzb+Bd3Q7uCFWHsBxXH+kz1z1fchI2uY5J97K4BCBP3NQugQDYpJ9tCHT40VgBRO2szyOSKg==
X-Received: by 2002:a5d:65c2:: with SMTP id e2mr4448798wrw.128.1566994165600; 
 Wed, 28 Aug 2019 05:09:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z7sm2498273wrh.67.2019.08.28.05.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:09:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 377761FF91;
 Wed, 28 Aug 2019 13:09:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 13:09:17 +0100
Message-Id: <20190828120921.9586-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828120921.9586-1-alex.bennee@linaro.org>
References: <20190828120921.9586-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
Subject: [Qemu-devel] [PATCH  v1 4/8] mailmap: Update philmd email address
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use the email address where I spend most of my time.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20190822230916.576-3-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index e1fdc88d25d..e68ddd26e67 100644
--- a/.mailmap
+++ b/.mailmap
@@ -32,6 +32,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
+Philippe Mathieu-Daudé <philmd@redhat.com> <f4bug@amsat.org>
 Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 
 # Also list preferred name forms where people have changed their
-- 
2.20.1


