Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E6036A203
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:17:28 +0200 (CEST)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKyF-0000LN-PD
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi6-0005ZA-EB
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:46 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhy-0004EJ-MO
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:46 -0400
Received: by mail-io1-xd34.google.com with SMTP id p8so3348895iol.11
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mw+kFPTVaTTcnceuhbsFPa+58+NOTGYx6sghR1AquDw=;
 b=xPRIgNcqYRgHQJRrGpQY+JAL73jdxnn/wqGrWsArEq4bCvY8MbOyEItYmlxdCb0EIq
 FH1VxU3r9k35rYpxbTYvo8OzZ1TCYqcOLizxzbfmeL5l0w+3DDqmzn4UB+nxVQQvm8wV
 8Q1jExhN42DT6HyJpYyV9fYE+FaGSAJq9fKTNJk+6yt6UJH+4rGfiIoDiRmyiBXdlv10
 RcYX8D5BnHUBWVaeDs76WvNyTgLMdqfBhi23sqUk58mkY/YW2Wd/U2Q8XiDriefVArDD
 Pfh+RUVnjf8tCSEoJ5AEVjtmrFciY7fcFWP89elBLusVEgApDnZlJVC9Sx4RlYvmhf3c
 8TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mw+kFPTVaTTcnceuhbsFPa+58+NOTGYx6sghR1AquDw=;
 b=Oe7zZ/qzBglr244n6b4DxY0AuU6M5NmYQw6MTIv4QH/8ZqhOLIfiT1RxA0J3r4L4ny
 /0ypFxjSceOUHs3Yo8SQw4lxtHzV37VG4fWaCVm4Vs37JSs7mcUlWj3nZlP5fT9Sktno
 WjMFmtr38hi5wYxg7RMZnbSS6MdoyRHMVESG6hQEfS9GduYRE6gjPGAzQb4eq6UWWK79
 KPyI+b4hKAtFWZP9w2Hhp2GDwHMxdsWJE90+kVjUW5I3jFWOjkgNXM0vs762tu2QUliq
 xRIUQlGvsibyUsOIuD4gqMwY71t8SgkO+dMDpZ8/MYb5P8c4XctAVsEDrmxgBWKJ5iaA
 XbXQ==
X-Gm-Message-State: AOAM533rpoVRHOlcxPGhP6y3P7dtWa7mNxe9xAUu+7YKR4bHYXPQd1GV
 2V7B50erzGsexEKi5VGPLdBfAjy3jbeosQWv
X-Google-Smtp-Source: ABdhPJzbeJMrU+gbkVDYRuuP6z4Hob7NdUHPFCYadsDj+aggnt1lnhh53C1x+coty+gRUy+5yETGWA==
X-Received: by 2002:a02:cd8a:: with SMTP id l10mr8432292jap.6.1619280037354;
 Sat, 24 Apr 2021 09:00:37 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:36 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/48] bsd-user: style tweak: Remove #if 0'd code
Date: Sat, 24 Apr 2021 09:59:41 -0600
Message-Id: <20210424160016.15200-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/strace.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 2c3b59caf0..be40b8a20c 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -128,14 +128,6 @@ static void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
     }
 }
 
-#if 0 /* currently unused */
-static void
-print_syscall_ret_raw(struct syscallname *name, abi_long ret)
-{
-        gemu_log(" = 0x" TARGET_ABI_FMT_lx "\n", ret);
-}
-#endif
-
 /*
  * An array of all of the syscalls we know about
  */
-- 
2.22.1


