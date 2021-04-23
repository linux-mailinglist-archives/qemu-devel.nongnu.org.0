Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C4369B90
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:50:38 +0200 (CEST)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2l3-0000gj-5Y
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b1-0005s9-V2
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:16 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2az-0008AY-G1
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:15 -0400
Received: by mail-il1-x135.google.com with SMTP id y10so1020512ilv.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zp+PiVP+jZsUiUjaf9U9BA3ABGWIL9WHkgBnMTWpPeU=;
 b=collzNdF2Vw713NTLXVhw1xQ2nW+7GfYcSHbW+8q1h3yrsyPflXMKP4FQXbRARnTma
 yaTZcHwbVAmTM74q2MB40+wdkYkei/i+tTVQgQVVVv9eFXmdKRGm6/VT6vdQv23geB7p
 rLU0ZgvCDpPAhyvr16Mln2t33nX2GQFi9mhiM+P0r8MBQR8bSXO8u1aq7T3w3zhdMtaf
 v3XUaVUlp/PnS9+mruHm3T6V7AdwouHgKeYjrlj3CQ8cgqbGRjru0sQSlU0zuxr9nAoK
 0PhLa2+sOGXJmtNFVfTQzfTPS4kEdOkmvn2n8GVTHtqOuj7V+HwQ1Q4CuUQkFetsChVx
 HauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zp+PiVP+jZsUiUjaf9U9BA3ABGWIL9WHkgBnMTWpPeU=;
 b=gvU8urRO5MkMwPs8czSM85zG8hH+yMkJytQmORn4Fs4GVhUmSF4mGhX/814K8SHVOL
 fXtGfz8Jvtdd7zcznVgjOEgmgz/+uqFA5pE6RDsLElZY0SNl/cKqSQGSODWOHaCAPLGG
 lLBIxdRbHPvo8bdimrJlatOyzpr8doIj9ZXoxwUHIB8epxziFLLQsYoVs3IwUk5zOqKI
 az0tEzQ8LR4o1UavqzQRHugWT+Z+jaXYCiMkcDvw+9ZP3R5hwv9ZyIbuCY9UgAAIBiIA
 KUCMGRWfAHIZ0jK8IhT6LxjWPXRsc5G44d605+N3pFDQd/qq/zmfhvLuTnLrAmiYp7qC
 WByg==
X-Gm-Message-State: AOAM532Jai8lYoaKdSXIi6cOFY/Q0z3VKeSgB8nanoF/oJ2rG6vF+elR
 fQ/0zmtHK0QnO+udItmdIB+oELjRjrSQiFQS
X-Google-Smtp-Source: ABdhPJyxEmEEEtAwwuOtdohPswDTIN7BHqobtDVrzzxWIy+8+No4xbhnmtVlnsokgAWtH2PoN4foqA==
X-Received: by 2002:a92:d711:: with SMTP id m17mr4488222iln.12.1619210412013; 
 Fri, 23 Apr 2021 13:40:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:11 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 13/24] bsd-user: style tweak: if 0 -> ifdef notyet for code
 needed in future
Date: Fri, 23 Apr 2021 14:39:48 -0600
Message-Id: <20210423203959.78275-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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
 bsd-user/strace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index 2c3b59caf0..6a78dd7efa 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -128,7 +128,7 @@ static void print_syscall_ret_addr(const struct syscallname *name, abi_long ret)
     }
 }
 
-#if 0 /* currently unused */
+#ifdef notyet /* currently unused */
 static void
 print_syscall_ret_raw(struct syscallname *name, abi_long ret)
 {
-- 
2.22.1


