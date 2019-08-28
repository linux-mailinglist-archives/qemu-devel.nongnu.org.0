Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078A9A015D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:11:43 +0200 (CEST)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2wnd-00030H-Ha
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wkh-0001RI-A7
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wkg-000418-9Q
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38315)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2wkg-00040q-3q
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e16so2246882wro.5
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 05:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfUWe7KQQj1p8swLDmsNZv29S//p51ZE3T5ORSYbWOA=;
 b=Z1+mqSdPxXlMvVtBnN5UCLeiG+YaDeIbQh1gwHkxmvM3ytWV7Gj0dAIJuujhfaMlp6
 Jg99IcNf7SMn0KUqgxTa4+9wYxz45h4TIrQoN3QdVPDeKELmlOPb2eGhhobztHCck2+b
 978vsWzGyC1v332RoPwEY+gIkpuFMPD3X8ZKB48RApJeZT0m5VIJzDMwtQoxUQ0uCweL
 FNitqpd6OLcg19m/cgaNoFCy7t/MNl3jvIPTURyMJcZ4cTX9J2uva544/q9y23D79Djk
 50UDTj+A046ktbRZgE++uf/bEab9uwbEIni+c8VsS+AnFDlJ7WUXbLNCh6UYyo/Dfamc
 iW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfUWe7KQQj1p8swLDmsNZv29S//p51ZE3T5ORSYbWOA=;
 b=Bin4m7Ywwhn6R9C0kCEQIZ/jN2nwOiF5OhgDXuzk+hPnD+/WxChi9zVXa3UFlxGYaU
 886uH5aZNZ0x+V/aoimGckrfDKA0/vzL4jn9O7Qf8uqi7QwnwE84CjvjZmEqQKIQXnLh
 e1ZxKOJWrfS9jbZ5swhrau8T7EVmZ4NuAlUrxhA/eb1pf/+9rJ1rlpfvK5xyD0bwpSkP
 IYuPvorTxWLMs7u04zLi8t7qBAxGwAx/ZP/Ygzmzph/XGnTSOOLzP8CZOJbiqGjyG5wx
 gZu3xaRwWmF7JTzsWm0dA58q0Q52TYdPOJgF/+RnsMmFhG5ShXOid5+3KnI35VshoJnh
 gG5w==
X-Gm-Message-State: APjAAAWslsSpPn79vbEDFyLV+EP3S9rOwcDclR0XLI0ZXMXVUn6BoxeQ
 FTQj/3tbiYepX4k5RHF+MIqgQg==
X-Google-Smtp-Source: APXvYqzpUSa3gwQRENcUrwtM8gk5I6SN1U0JtPTIkNH7EfgHHBf2ez02As+ORNgKS6zAbSi//ewtzg==
X-Received: by 2002:a5d:55d1:: with SMTP id i17mr4250539wrw.139.1566994117014; 
 Wed, 28 Aug 2019 05:08:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y7sm1670911wmm.19.2019.08.28.05.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:08:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE56F1FF91;
 Wed, 28 Aug 2019 13:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 13:08:28 +0100
Message-Id: <20190828120832.9208-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828120832.9208-1-alex.bennee@linaro.org>
References: <20190828120832.9208-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
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


