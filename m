Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651193728B5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:20:21 +0200 (CEST)
Received: from localhost ([::1]:55278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsA8-00061p-DO
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzk-0002U2-A0
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:36 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzi-0006lT-5t
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id x7so8727926wrw.10
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=stNIA9RM4jSLh1xeH6t+QvbJvkHUddlJF4eVEmZyRGU=;
 b=Gp1Z4pzLq4MUX56IxY335f+26Q8JNVOOYvLZcHHpC118utDSCMVF7iDCLfnNT4UEuN
 x09uaeRa3h+nKlJnJA6p/QZRE1vSTUR41wEZA7PZwhNEaef5E7MeOoB9elvJx/zy5ABB
 DDOf+Btis+truywR92tx+GS4BOMfz5SyhfW8ZJ4PBYV6GBg43f3TYDSXQ0sYbk1m7vgQ
 egUweBYuHITPWGYmOEkTCjqiiRHmArzdVZ2Q+A6b4afr2+wvxWRfoOGZrWzN4l9mjvxL
 os07LTy2WyTLE3lWocNEcaEwgD9jmBF40XXCeDeJqW4HlXL+6+oaMVsdPZ8nu6Qlbc04
 KZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=stNIA9RM4jSLh1xeH6t+QvbJvkHUddlJF4eVEmZyRGU=;
 b=uACuiyLoC3akXzFU8VoHMMtoX+eUoXPSKiwa4iAzQco76cTHcxb2PK6WR/zWKiD/MN
 a1F4qqs70tVOhpnZmcq3X1o/xif8lg3MmETqxL4CefcgaBKMXH5AUm3x7/LoYFEZi/re
 IXyeSJk9MueiHpFMyBqAomVF2lRkJyZuNrK2utV96Km1GxUoCl+LjSPcy/XxCEZzXM0N
 /WEsU5te4Z2mVnsbsDklcTfWpnOuqy+1RDxuU/l5vKvpfwYj2X6xEXE5xewM6EjvDKKY
 JTj8FfilEtOoXkTkc0zw7qoVVJnJzjcUu44dkgoOgQR6x40/YHYBgpYpqElQ1AZidvQt
 lWYg==
X-Gm-Message-State: AOAM530VbBwFlcqjpvSHfM4FCTXFPs1M2/u2O768yIOxpHAPz5SoVut7
 GWfXD74+cA0ADxUE2CYti9jFSg==
X-Google-Smtp-Source: ABdhPJxV9Qboc+ZYss9o4eEuZrOAF48oc03dIc6sZ+ICPfTLoGrIlI1rrhu8w/KbJXFeo+1r7HQWnQ==
X-Received: by 2002:a5d:4145:: with SMTP id c5mr30668882wrq.252.1620122972703; 
 Tue, 04 May 2021 03:09:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o62sm2386538wmo.3.2021.05.04.03.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C79B61FFB7;
 Tue,  4 May 2021 11:02:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 30/30] configure: use cc,
 not host_cc to set cross_cc for build arch
Date: Tue,  4 May 2021 11:02:23 +0100
Message-Id: <20210504100223.25427-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise you run into hilarity like trying when cross compiling a 32
bit ARM build on a 64 bit system trying to use host_cc to build 32 bit
test cases.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index bb86c72479..aef53cd8bb 100755
--- a/configure
+++ b/configure
@@ -1648,7 +1648,7 @@ case "$cpu" in
     # No special flags required for other host CPUs
 esac
 
-eval "cross_cc_${cpu}=\$host_cc"
+eval "cross_cc_${cpu}=\$cc"
 cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
 QEMU_CFLAGS="$CPU_CFLAGS $QEMU_CFLAGS"
 
-- 
2.20.1


