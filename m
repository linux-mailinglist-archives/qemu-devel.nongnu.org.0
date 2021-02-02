Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F3930C027
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:51:32 +0100 (CET)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w5b-0007D7-GD
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vul-0003bk-2w
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:19 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vug-0007Ga-Kv
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:18 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m13so20506185wro.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vjlUl+V4o4se/GoX88M1i9xAX6ypqCjhOLD5bOI7jyE=;
 b=GO4joYs1H0TdlM/uIWWzkJm1Fk68KtG3LJXDnCU+XrQr27ZQMftbP7fT277r4AbrRF
 oz/1C2Viwo7X/wWJudpjhPh3upyb0dDvhmPhRfWbRa/t8pbRjYCUhcXtynMMMSeNslT+
 iBLie2xggmMNla5uTg5eCRWGuBWuYfGMd6hE+wvwjKJhIiqdpMo/ICAnqf+aoQXUUZ7l
 JDIsxkzRYa53sPKVx8MAHSDQdXvB+LpCJZFaN2+vb4IyoIpe67xBgzRgYWlry3tET0JF
 kcZNTIzPu1lvfLoVlZQCaSsucrZIvzgBD6+RJKL49DTIMGf50oHcPBOTTnkcvMLCmiCo
 r6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vjlUl+V4o4se/GoX88M1i9xAX6ypqCjhOLD5bOI7jyE=;
 b=QoLP3pmqyXET/MIv9+Q4CY+4qlmYe1iwRzBQBCVopn/1bcmecHOCQlX5bun2VUg0s/
 Cw8iWsDAmm81zlEKgGIGXbLzcxpRJ1BeaNGDxu8F/b7NtiKl7H47TtJpl+5EXC8rnadW
 4+hpR8hG+kvurHZB+0FxAHhXVZYovp6jsvN2jLCfF/Ni2hLjicdvjdhR3oCliUBuaPnB
 A7BlLSJANxL4rZ+F/tCZuvX7wn1fzkvBJlGGaUupRFpPRXuzuDpnFi3QdEPlS1vDPUbs
 6+okGJqIs5uXypKPbf9E6Ds10h+3A5nsLBy2WQEXu/IcBkr5jp2FLi4EB6EOAjNoNRMO
 NxLg==
X-Gm-Message-State: AOAM531lUv5LGX7P6Dl66v627/rmvG61/42ZL84a5Ylq8SZEpKWlT/0z
 NqDHld8KWUNclaAvnBDumkAB9g==
X-Google-Smtp-Source: ABdhPJw0uIpBiwHPPfOOS06bFRjT70uDVHDhiid8OSALh7epox9PMoWx2FppwibR/dwnJJu/cMzVrg==
X-Received: by 2002:adf:f9d0:: with SMTP id w16mr23721170wrr.137.1612273213291; 
 Tue, 02 Feb 2021 05:40:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y18sm30787517wrt.19.2021.02.02.05.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C6CE71FF96;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/15] configure: bump the minimum gdb version for
 check-tcg to 9.1
Date: Tue,  2 Feb 2021 13:39:53 +0000
Message-Id: <20210202134001.25738-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Luis Machado <luis.machado@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For SVE, currently the bulk of the GDB TCG tests, we need at least GDB
9.1 to support the "ieee_half" data type we report. This only affects
when GDB tests are run; users can still use lower versions of gdb as
long as they aren't talking to an SVE enabled model. The work around
is to either get a newer gdb or disable SVE for their CPU model.

Reported-by: Claudio Fontana <cfontana@suse.de>
Cc: Luis Machado <luis.machado@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 432b83fadf..6d419aac79 100755
--- a/configure
+++ b/configure
@@ -6115,7 +6115,7 @@ fi
 
 if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
-    if version_ge ${gdb_version##* } 8.3.1; then
+    if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
     fi
 fi
-- 
2.20.1


