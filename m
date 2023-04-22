Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506116EBAAA
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:29:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqH2b-0006vU-8F; Sat, 22 Apr 2023 13:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFxy-00023I-8V
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:02 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFxw-0007HV-2w
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:01 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2472a3bfd23so2145610a91.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682180392; x=1684772392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJuOJ6VH++PAQzzFCf+AgyYeqIW4I0RKMTPwWjaO9sw=;
 b=KoFXuEt2E4lVmaeLv4i75Rp5EoCsGHfmjw1vDeYfRfmlxS5UvfFvOKJgAf7T9sbjcK
 rQoMU+xrOamTUSnvhmEadqf68uQNFMMCPNICTMgmuvMxYxTTUrsddBkbyLu24cMa4Vev
 6xrCXX+HqE+OrpXm1KTBBBMlDWCgaDPZwnpTfPDo3AZ7YHkxpZ38FBVL44ZFN/e15Nwf
 FRZFyD/O2ebM0COYFLBGfcWk5y+vtfsXJXDGavTjnoKJwVabrY60E6ppdLOKVfFdjywB
 UkDQsGHtwOqDoMyC9BigcD17qqFOWPEHFrOc5B3hiXdA6A4rOJPRR9GelUyAc6G+6Nce
 dQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682180392; x=1684772392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJuOJ6VH++PAQzzFCf+AgyYeqIW4I0RKMTPwWjaO9sw=;
 b=J0el8Y2rohWPKZj1J5tr8U2imL6+I3h2nKLlPUqWNLMbEHe6lDqWlLmMC0rRAKgDe3
 35P91+W0hHK1Sc3p8BIm2Nrge+4rkXtYpToI2VpejLF6yXFeidWqk7ukGyNDbEzmXRGD
 lt5gzrlsXrxzj6HYzoRcSW1ENZvsqwxpaz0fcqf9u++YScLNrJeMw2JZEijgQGFyLJG0
 BByStmDu7Xc4//UpTd6F4TbvBbKHVfJFIVNMslxZi29SeVT5CBHBe5tYOHFFXF/c+60F
 2A2u1VSkFoDCYp4l4CUajpHH2XhanwRCeeOp6DJ5IdImhwJm+NG+F/HU8dyYiInBWCta
 W+fg==
X-Gm-Message-State: AAQBX9dBO0w6dI8Qt/43LND5YFcTEtBcm+n4iOv3DTcck34pPCUP8eon
 3x7mBa69YGoj83DhBsDMfrNYrHRrkNZKgAAd
X-Google-Smtp-Source: AKy350Yd1h2Js4mcnWJiOEzt1y74grWRQnFhvbakEJQoRfngRQFZ6cbJ2YkdHfzXTd1hznjkjdBmLg==
X-Received: by 2002:a17:90a:72c5:b0:23f:e4b7:afb3 with SMTP id
 l5-20020a17090a72c500b0023fe4b7afb3mr8835388pjk.9.1682180392471; 
 Sat, 22 Apr 2023 09:19:52 -0700 (PDT)
Received: from apple.localdomain ([182.65.27.4])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a655b8e000000b0051f14839bf3sm4241667pgr.34.2023.04.22.09.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 09:19:52 -0700 (PDT)
From: Ajeets6 <itachis6234@gmail.com>
To: itachis6234@gmail.com,
	qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 3/7] Add clock_nanosleep
Date: Sat, 22 Apr 2023 21:49:30 +0530
Message-Id: <20230422161934.2311-3-itachis6234@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230422161934.2311-1-itachis6234@gmail.com>
References: <20230422161934.2311-1-itachis6234@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=itachis6234@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 22 Apr 2023 13:28:49 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kyle Evans <kevans@freebsd.org>

+Add clock_nanosleep(2)
Provide sleep interval in nanoseconds and allows to choose which clock
to measure it against.
Signed-off-by: Ajeets6 <itachis6234@gmail.com>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
---
 bsd-user/freebsd/os-time.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/bsd-user/freebsd/os-time.h b/bsd-user/freebsd/os-time.h
index 18c9e1dd12..29d2c8d02a 100644
--- a/bsd-user/freebsd/os-time.h
+++ b/bsd-user/freebsd/os-time.h
@@ -42,3 +42,24 @@ static inline abi_long do_freebsd_nanosleep(abi_long arg1, abi_long arg2)
 
     return ret;
 }
+/* clock_nanosleep(2) */
+static inline abi_long do_freebsd_clock_nanosleep(abi_long arg1, abi_long arg2,
+    abi_long arg3, abi_long arg4)
+{
+    struct timespec req, rem;
+    abi_long ret;
+    int clkid, flags;
+
+    clkid = arg1;
+    /* XXX Translate? */
+    flags = arg2;
+    ret = t2h_freebsd_timespec(&req, arg3);
+    if (!is_error(ret)) {
+        ret = get_errno(safe_clock_nanosleep(clkid, flags, &req, &rem));
+        if (ret == -TARGET_EINTR && arg4) {
+            h2t_freebsd_timespec(arg4, &rem);
+        }
+    }
+
+    return ret;
+}
-- 
2.34.1


