Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D6A3754F6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:41:20 +0200 (CEST)
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeFj-0001ad-Fp
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCw-0007LJ-Un
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeCu-0007or-Cj
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dXiqUMGNseF8aEoCidrrmNydk4TNmOpI8OAZgIN0M9M=;
 b=JKv9W8c+otDIvMW9Oi/K6hh1/LN1J8HTiWiB6+ieI6YmLwQx8dQbplkh1Abm3HXcDFTgoK
 uTKS194Q+rWv/VnJgnLqCGIFOH5UhKE8rxTCSC1DKlMTq1neWUWlIZDFxl4iiTUPH6tIrM
 MkouantzdCkNwMdL90eeys5y6KamHPI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-795Iham4OaSZw0SVhU2jEA-1; Thu, 06 May 2021 09:38:22 -0400
X-MC-Unique: 795Iham4OaSZw0SVhU2jEA-1
Received: by mail-wr1-f70.google.com with SMTP id
 93-20020adf93e60000b029010d9bb1923eso2221236wrp.4
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dXiqUMGNseF8aEoCidrrmNydk4TNmOpI8OAZgIN0M9M=;
 b=d5XCMtHemA1ZKyLo4PWTe02NhKCrGX6Mw8L5SeQrpeCp6VxqbwQF58YjSmbVSA9u9F
 e3Ax1fuJO5uxA+gUOSAhYtM3Q9qLtNwcoudiQ7Ko20enHF8DGUDHcmZ2Glx3XeXpZS2E
 t7yg1LPbMFi+bLWXOeZLVew37E4v2RZMH0GXTs1vj/0Qwkm5aAhKuitRpumI42Xqhn+3
 f8yxEHk/6o+Aa4fKb6GDXI0fT5aAvVJbg/Rlevy+URwtNgS1AwFQdtJuCs6gma2WDfaG
 YPsT9lOi5vMf61GkwdOlCsMoBKr9MqZcoMdyXOhMwXos9KneBmVMZgifBKXp0ObKKCR+
 kgeA==
X-Gm-Message-State: AOAM531PjG9wG16SnSQPoZcLiMZGl6q+LpL9tKWfRECo/0K1/UYxrci0
 Ah9JUtcZpk3WKTvRIMUd5REv6hHWeL7sfMdMAjkuWMVj1TiLGA0zoW3R1sV+TGzipHkRpCWRm0Y
 CeClmt2aHHmNzRu5uvQUiCTIsZfERCcnifDO1SLQHicXVw9xo5GEfB3u5ugmGG3MZ
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr5147693wrv.239.1620308299982; 
 Thu, 06 May 2021 06:38:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyAZIfvg++T6fTYKrEquhu6tnCC62wCEQ30o8S5aLEgqSCKFWctM9XzEDZQWk7c63Etg+U8g==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr5147655wrv.239.1620308299780; 
 Thu, 06 May 2021 06:38:19 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id m13sm4432533wrw.86.2021.05.06.06.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
Date: Thu,  6 May 2021 15:37:53 +0200
Message-Id: <20210506133758.1749233-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace it by a g_new() call.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 bsd-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 4abff796c76..dbee0385ceb 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -355,9 +355,8 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     case TARGET_FREEBSD_NR_writev:
         {
             int count = arg3;
-            struct iovec *vec;
+            g_autofree struct iovec *vec = g_new(struct iovec, count);
 
-            vec = alloca(count * sizeof(struct iovec));
             if (lock_iovec(VERIFY_READ, vec, arg2, count, 1) < 0)
                 goto efault;
             ret = get_errno(writev(arg1, vec, count));
-- 
2.26.3


