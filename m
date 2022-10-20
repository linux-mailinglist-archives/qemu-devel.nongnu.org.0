Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342DA6060C8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:59:19 +0200 (CEST)
Received: from localhost ([::1]:50216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV8S-0007sn-VC
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:59:02 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV41-0004Cv-MI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU67-0002e5-Be
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU61-0000oc-Mh
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id bv10so33914771wrb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0F9rxKn3WyeYR6Nw4DlRXjaGHdV7xjAKqhTqdoDJFbA=;
 b=do9bs56wi393U3SqN4g9206PdFt8zZTsrGAWM+mEAz7oRl5SnSXgIhgja5AE2RhB9+
 fUTLIWTjpSwEtCXxCdvBPV3zte2Yc+hVklnidd7tvSwVDr/Vs9nvY2aerwCzJtkkyi2z
 nU2wHkVQtUOyV9pd+AbaKoVs26Eh2wVPuZB7V0+zX8DWYOEMlQwv7F+S+DJOXI0ihcjr
 xttpoL1VSoBXsuw7EJFT4sMJ3QlY2EODSjG7xeDveUa/ola//GGO3PpweKD66itw5Zd5
 XOBuVHxxbvT7gAWZDqO/uUdrc0F2CNILaCcu3wCP9RAM6Ra244JVekHGpZGUbIKZZrtM
 JZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0F9rxKn3WyeYR6Nw4DlRXjaGHdV7xjAKqhTqdoDJFbA=;
 b=42P8J6gbZiROw5VmqrMqHd2NmDzxaWHqykyyLdoSiAY3CRsUrq8GG+kVef0P5kROBj
 nP7nhf379CDILm35WGYQCda0ZEb52fh/PTeuv4oLksplivAnsnKIRJ9lG3P1GpgGp8+0
 UPU4yA3Aba1NgGhK7bd5yXMLl+OFHY/Z5ecEkcGPu0JowGP10psJzFS+uxkeBpjXDiYq
 3ZLvfDVPkHtp99lOo8sZ4kNb/m/z3URmMiCFADwvFoLCEw5kNj7VIUljwILnUZRPeKor
 kThlXu/ZHQ3zUed+BxyXBp8dNC9ZrqncYoL/iRptK3QHYzbm2Rxd45qEtKoXIFseiXJQ
 7Drg==
X-Gm-Message-State: ACrzQf0WGX3ooA/N/c5EgyBnZTxe+i97emMBhMi6w3rFQJ9KtVO1fnWw
 ygqmHuaGE6PT5ffZBes0MhQMXA==
X-Google-Smtp-Source: AMsMyM55Jpvr8w3iaQokmkFSMWe+/00gy/3BhUJte3J5jmmBexuy7woeq7ML1+fKtbPSEKx+H2JRtg==
X-Received: by 2002:adf:e187:0:b0:234:6c1b:cf7e with SMTP id
 az7-20020adfe187000000b002346c1bcf7emr3932958wrb.395.1666266739831; 
 Thu, 20 Oct 2022 04:52:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a5d5190000000b00236488f62d6sm834812wrv.79.2022.10.20.04.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0227C1FFC1;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v3 10/26] tcg: Avoid using hardcoded /tmp
Date: Thu, 20 Oct 2022 12:51:53 +0100
Message-Id: <20221020115209.1761864-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221006151927.2079583-3-bmeng.cn@gmail.com>
---
 tcg/tcg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 612a12f58f..84921b64f7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4729,7 +4729,8 @@ static void tcg_register_jit_int(const void *buf_ptr, size_t buf_size,
     /* Enable this block to be able to debug the ELF image file creation.
        One can use readelf, objdump, or other inspection utilities.  */
     {
-        FILE *f = fopen("/tmp/qemu.jit", "w+b");
+        g_autofree char *jit = g_strdup_printf("%s/qemu.jit", g_get_tmp_dir());
+        FILE *f = fopen(jit, "w+b");
         if (f) {
             if (fwrite(img, img_size, 1, f) != img_size) {
                 /* Avoid stupid unused return value warning for fwrite.  */
-- 
2.34.1


