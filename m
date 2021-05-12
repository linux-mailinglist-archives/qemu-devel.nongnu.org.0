Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6A837CFE7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:38:08 +0200 (CEST)
Received: from localhost ([::1]:49694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsoB-0001VG-Qq
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUh-0007Sd-M1
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:59 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:39858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUX-0008OX-RX
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:59 -0400
Received: by mail-il1-x12b.google.com with SMTP id o9so15653856ilh.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CWQeDefbyCahK2RutY5l8BK3paDWDE19Ob7lheCkIw=;
 b=nBKgr5Lo0T03oRsGjWiG4y+GvuqkMK7F4aFESXLZG5fT2CsD7W+EbmVTHiGj2lC6Jw
 z2hkBv8PPQnR6u7BNkgTjWeP2Vtq+1QUKK2CO8QuPUlN9xFrV1dpQ5RrlR0Pw0bMLCTw
 ZnCWuOfdi2o3hga7TBKsXd1T9ybGClNpFVbKxGzqaed6Vip9Sp1O7NAFdiytsQwAbYlp
 G14Vef9EFR7KsbbTXZmPEKs8sbDVYHkyOwqg0PKeAZKiksD9yOmA0pw4jwnzqT6Fqkto
 oLIxJSeegnVEBxpxJl/iuOltMY73TOAdVjpeppwauVoQONR8uNbFP51EEyG3Y/+AfkuW
 dIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CWQeDefbyCahK2RutY5l8BK3paDWDE19Ob7lheCkIw=;
 b=a+N/AS24SudVSl7sb3V7gby6n3qj3o0iNWW3sJ3yY2GA0ItWCD3OTcgbpwSJ9C6mKD
 hWszq5kJJbGw1gK/ukkYTT5QM8t6r84p81r++ZFNthJ2E+hLk8uXi7arkIMtAvF1yAxL
 sZEXzRDRE2lrRCXW7xU6UBaHPRe3MICcKIqUstAsrYpbP/s2dDtFAPEtQLjX4N+A9qZx
 +8Ias0lRhjtLbchWleHt6Ru2AbLl6Ioa8onZHfsr3Kvzix9R9KTF3hWbeY56SiimSrfP
 KalKhehoh/juaxNtL13I20AP7C4SLfGwCV2HsHo/RtG6sZpo85Q2fQ+cRIICRBwpg9NT
 jcDA==
X-Gm-Message-State: AOAM531Xeoxkqs4W3l8C79iyZQcftvOCXaNOiqs0n/czf/aK64qmOmvo
 bCfcWEvxM/UaamdNRnaWbXPDmYQVji9cYg==
X-Google-Smtp-Source: ABdhPJzSpkmFbj65f27lrQ9Fiyh8A1H1IFJBYOVynFSNCgqP7CHeQkjn8pIqLVrkYEsWgZSbMU9Nzg==
X-Received: by 2002:a92:6804:: with SMTP id d4mr31972569ilc.5.1620839862727;
 Wed, 12 May 2021 10:17:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/20] bsd-user: style tweak: Remove #if 0'd code
Date: Wed, 12 May 2021 11:17:16 -0600
Message-Id: <20210512171720.46744-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


