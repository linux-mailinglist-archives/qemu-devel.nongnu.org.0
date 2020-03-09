Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888A217EB9A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 23:02:03 +0100 (CET)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBQTK-00074D-HQ
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 18:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46791)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBQPo-0003AD-Ak
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 17:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBQPn-0005cv-9i
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 17:58:24 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53676)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBQPn-0005c6-3n
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 17:58:23 -0400
Received: by mail-wm1-x330.google.com with SMTP id g134so1192898wme.3
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/bWoXSuiIZ/NdLhIJtlxSIZm8FTmVmD4iHSdiTEX+nU=;
 b=kbLskNbBt81qwQ0rt5iCUgsOj1dftPLGLlKH7JDY5M3PY2XCEVjcIcby8hg0bF8pz0
 OuqpG/1+w2bi7q1Qqu3jYDh3GSR51C3X1+3AigOo4IQ2SXtNaxAKIiyXoRBkrSvECatK
 ac7WVUBOrEt0NQRX7HXPNQyUuBBhXF3wR5smEdUYOVWPNbx9yXsWXQqzpYt8ukY3hMxR
 raX+w+nWW4k0MbpvFiGtgJ4EkjIiiAf6htNmn29Im/tvspuCoVk5wrESSkO12X1XxNzZ
 a8JZPye+CbUajAokz1mrLfLX9HPDBzkx3Erv1oXAUlxCwu2uhxFg5SfefBVh7PE0vIaV
 Rkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bWoXSuiIZ/NdLhIJtlxSIZm8FTmVmD4iHSdiTEX+nU=;
 b=FqugKlgU//InIMMT68g6KY4WPMMpe4vOZY2jOmC4o8M1BRcvu9CajZZpn9sFQ08SNR
 uqeTRgy4eOn8tcgAYN69zQArlv8Fkf9pmmIsJ5q3TRnC/l51HlF2c77PcE+/T9tc9BMU
 TnirLShsYvl9VgEhVWqdLK6f5436kq8rIeXOl7UsBu82pzRAozyZ8cnfWMAOorw2rZgt
 2ZGe++wvP0WgFdQ5iQD0tn/LRwVvQTpzcuGGgQKmMsyZgv7UkAUhhS17YybQg6shB0fd
 O+0qE4jYRiujcCTUAZaOAGKXyjV0i3FmiMDtWuL0Rq5Dy6Mo+8syOluKfV+Ly2Q9GoNz
 tz/g==
X-Gm-Message-State: ANhLgQ3iDqJd/V96VO89IScUblvqLABd9vOcoGV3zM85SrlO9MSB6C6Q
 ISIkQmfkDOWQqycjl6jQAxS44AbtEzx/mg==
X-Google-Smtp-Source: ADFU+vvVKvvvwbx/2iNf0hqzBS5GPs4/Z2n6V1B9vzn2seOSCP08AhbYsgyUe2Ri5eD1nw0nZJVROg==
X-Received: by 2002:a1c:7f8e:: with SMTP id a136mr1212979wmd.143.1583791102149; 
 Mon, 09 Mar 2020 14:58:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f17sm42207068wrm.3.2020.03.09.14.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 14:58:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] Makefile: Allow for subdirectories in Sphinx manual
 dependencies
Date: Mon,  9 Mar 2020 21:58:14 +0000
Message-Id: <20200309215818.2021-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309215818.2021-1-peter.maydell@linaro.org>
References: <20200309215818.2021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we put 'docs/foo/*.rst' in the Make list of dependencies
for the Sphinx 'foo' manual, which means all the files must be
in the top level of that manual's directory. We'd like to be
able to have subdirectories inside some of the manuals, so add
'docs/foo/*/*.rst' to the dependencies too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2e930688942..5dba949947a 100644
--- a/Makefile
+++ b/Makefile
@@ -1081,7 +1081,7 @@ sphinxdocs: $(MANUAL_BUILDDIR)/devel/index.html \
 # a single doctree: https://github.com/sphinx-doc/sphinx/issues/2946
 build-manual = $(call quiet-command,CONFDIR="$(qemu_confdir)" $(SPHINX_BUILD) $(if $(V),,-q) -W -b $2 -D version=$(VERSION) -D release="$(FULL_VERSION)" -d .doctrees/$1-$2 $(SRC_PATH)/docs/$1 $(MANUAL_BUILDDIR)/$1 ,"SPHINX","$(MANUAL_BUILDDIR)/$1")
 # We assume all RST files in the manual's directory are used in it
-manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst) \
+manual-deps = $(wildcard $(SRC_PATH)/docs/$1/*.rst $(SRC_PATH)/docs/$1/*/*.rst) \
               $(SRC_PATH)/docs/defs.rst.inc \
               $(SRC_PATH)/docs/$1/conf.py $(SRC_PATH)/docs/conf.py
 # Macro to write out the rule and dependencies for building manpages
-- 
2.20.1


