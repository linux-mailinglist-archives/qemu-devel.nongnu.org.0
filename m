Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D2A015C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:11:38 +0200 (CEST)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2wnY-0002ur-JP
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wke-0001Qj-K5
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2wkd-0003zy-Hx
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:36 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37520)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2wkd-0003zd-C2
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:08:35 -0400
Received: by mail-wr1-x433.google.com with SMTP id z11so2243916wrt.4
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 05:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUExrHFNvDDWB8ZI7TeI5fqa+GiUSS9y/dm2gcc+xvU=;
 b=L2GOAYrHHDr4tsvI9zd1lN38SfQAkgm87fqYDduI3jstzioHSxvk9FY78EQY2dIzM1
 LP27DomS4qDprWKZcq29RpjB9mUkE8Wxza6KmjWapaun8DE/auE4SY2NOTEPrt3BMc6J
 Nl++9346ccunupQK/f7SiD/8OM4kjGEjPNV+8frX5VaNlYMPQ68ADkq+acVEaBHLWfZD
 TQ7LrBn/G8phJUZb41gTBZtnfI1gdDP5vK4kswy1sotn6KdFksNRYEmJd9Vn61TDwtwZ
 K3UD7gQK/oQSPid6B5z7DjfAGJKfZsYn9VK64DR9NP61OihOhv39/2ohy2SCS9kK56HD
 8aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUExrHFNvDDWB8ZI7TeI5fqa+GiUSS9y/dm2gcc+xvU=;
 b=BwAyoJzVuLxsYx6ASJJQnJBr7GheT7MSuEiWy652EJ1/tlLNxXTz0qKV7bU19N2p9V
 XyA1xLaPQ/3uCFhMbTwIahj4wZYA6LXj/A+h2udDUPNfos8eD5I5Rr77XYAot9dR1CNk
 J7nOtVxPw/87aiRRsyryggKW6kK5MQGkaqpzEhamefcxFacPjIqpke66Lte1q97ylhzy
 Jn9m+hl0FanDFaglJW1xnlfckxN1fENau62dU8nwYO/MxiVADouyRYA9jY3EZINak3fo
 W+y4Mql7hKOpOX3E+snSNcAQfVLLRgS6O+A0tH/CB9Sxpn7qAUVm07SsJmKWHJSOaYs3
 otFw==
X-Gm-Message-State: APjAAAWz8p954eGwiTb7cjyFIZ2wYoD33X4o+Df0VhCjzn+GqBAk6QP6
 i8A2C+snC9xYQfTAaa0wDmfHWw==
X-Google-Smtp-Source: APXvYqz1seIubW9T5U+7tqg5Xw00Wfpz2iDT8KBnyNDNrQyqlNomN0ziLVno9nkZT3ohYmTVnw1Qvw==
X-Received: by 2002:adf:f186:: with SMTP id h6mr4202678wro.274.1566994114309; 
 Wed, 28 Aug 2019 05:08:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h23sm2978345wml.43.2019.08.28.05.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:08:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91E5E1FF8C;
 Wed, 28 Aug 2019 13:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 13:08:25 +0100
Message-Id: <20190828120832.9208-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190828120832.9208-1-alex.bennee@linaro.org>
References: <20190828120832.9208-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
Subject: [Qemu-devel] [PATCH v1 1/8] contrib/gitdm: filetype interface is
 not in order, fix
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
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

gitm prints the rather cryptic message "interface not found, appended
to the last order".  This is because filetypes.txt has filetype
interface, but neglects to mention it in order.  Fix that.

Fixes: 2f28271d807edfcdc47a280c06999dd866dcae10
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190822122350.29852-2-armbru@redhat.com>
---
 contrib/gitdm/filetypes.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
index 165b71b3f9a..2d5002fea0c 100644
--- a/contrib/gitdm/filetypes.txt
+++ b/contrib/gitdm/filetypes.txt
@@ -34,7 +34,7 @@
 #   If there is an filetype which is not in order but has values, it will
 #   be added at the end.
 #
-order build,tests,code,documentation,devel-doc,blobs
+order build,interface,tests,code,documentation,devel-doc,blobs
 
 #
 #
-- 
2.20.1


