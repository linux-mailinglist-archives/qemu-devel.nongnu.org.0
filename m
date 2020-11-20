Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6052BAEAD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:24:00 +0100 (CET)
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8GV-0006Qn-MW
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8ER-0004y9-Vy; Fri, 20 Nov 2020 10:21:52 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8EQ-0001tQ-G5; Fri, 20 Nov 2020 10:21:51 -0500
Received: by mail-wm1-x333.google.com with SMTP id p22so10689518wmg.3;
 Fri, 20 Nov 2020 07:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jcf04043Pi+V90LbOoBTsrGE/AFMzu7sIT3aD0E2cO4=;
 b=r8vW9KRrHnfDHdd9xhlIwYxo3dA7LCrc//rGNdiBvLjcWhy36oTEKj86ra4w/ZCBGa
 Eig5w2n50E3/JDs89Q79SdcS7Jy1Dblnd2B92ssCatBk35P4HI2BAnQccNbrhZ5Tx/ZZ
 pmXmwM3vs2g+kycmUNx0G5Re9DXW8nOQD7rCWeE/b7obVNEOJ9yfS8MBktQdBq9rItJV
 Ur4f6+uFUdpWGyQPvsCqpglUxfgm1jcSrq16hVQ5Qsz8BNftLRG/INmol7CVW+yOQTLk
 880O8bLB8uu/yPyT0Spg5hoexuJtBTDuRZs2Wv5dOXxIxfeBAyfGZprBlxHtj6FsqqoJ
 bn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jcf04043Pi+V90LbOoBTsrGE/AFMzu7sIT3aD0E2cO4=;
 b=DVOv5netiJslCsp6nv1aFSb+sU13VtoXHsOs0Nx1XVKv+PYA0gUGY7Ml/wPOXOZO08
 +Dhdb25xMLKP+8y2OZfHRt0JJM/M8mjVv3ndvz+jI6F8fw6JsgtfnEKm6358wArN7dgW
 wuw4DlHc7xPkm0S9H0QAZBAHl2Stl5I7ncIJJPfEKVOcAbmyN7vOxWrzHZISkgSNQshb
 R1G0/y9y2JApquvwNmTHHRuBDAjMgxGQwN1lBKLSNVnnPO/0wVc3yiIvbVrfW9UmLL0S
 /sqwMffC/NCHnY2RliG+JP2KSf7SwALmN+HLRbUiblSNe2LZDnIiOeT6xZ4tm9cGcUxH
 ExOw==
X-Gm-Message-State: AOAM530Q8lOG8ppINhcZEBSwh0WjKVall5g3m62LEFEWkOyDe9t1tt9p
 phw4noLTf+CZJXAY0JSVLQdkETAC23k=
X-Google-Smtp-Source: ABdhPJx27nzRQGRjd1B84Ma4Xow8Rz06LZTSUvf812In121mg/MSMScFyKxQR0YYInyoXQVTOXWTzg==
X-Received: by 2002:a1c:3142:: with SMTP id x63mr10300239wmx.168.1605885708146; 
 Fri, 20 Nov 2020 07:21:48 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g11sm5684123wrq.7.2020.11.20.07.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:21:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 1/4] docs/system: Deprecate raspi2/raspi3 machine
 aliases
Date: Fri, 20 Nov 2020 16:21:37 +0100
Message-Id: <20201120152140.2493197-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120152140.2493197-1-f4bug@amsat.org>
References: <20201120152140.2493197-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Krempa <pkrempa@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit aa35ec2213b ("hw/arm/raspi: Use more specific
machine names") the raspi2/raspi3 machines have been renamed
as raspi2b/raspi3b.

Note, rather than the raspi3b, the raspi3ap introduced in
commit 5be94252d34 ("hw/arm/raspi: Add the Raspberry Pi 3
model A+") is a closer match to what QEMU models, but only
provides 512 MB of RAM.

As more Raspberry Pi 2/3 models are emulated, in order
to avoid confusion, deprecate the raspi2/raspi3 machine
aliases.

ACKed-by: Peter Krempa <pkrempa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/deprecated.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index d98464098f5..d1bc03d7e61 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -346,6 +346,13 @@ This machine has been renamed ``fuloong2e``.
 These machine types are very old and likely can not be used for live migration
 from old QEMU versions anymore. A newer machine type should be used instead.
 
+Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
+to distinct which model is used, the ``raspi2`` and ``raspi3`` machines  have
+been respectively renamed ``raspi2b`` and ``raspi3b``.
+
 Device options
 --------------
 
-- 
2.26.2


