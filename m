Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC0370054
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:17:09 +0200 (CEST)
Received: from localhost ([::1]:33934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXhM-0005fx-Pz
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvu-0001FH-Nk
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:06 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lcWvs-0003nf-HZ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:28:06 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 p6-20020a4adc060000b02901f9a8fc324fso2026114oov.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L6Xf956Ggs9i29nhhZxcpOFa3qNKKv09WnMU85+P6h8=;
 b=uvZz5Ta22xKZRUKsxP0XoF0vUFUEojichcGTX34vJg+SE7nXYSdRZIoDpaopuAKbFx
 6TQQyTLVwvZxoHVJON6kyZoAadTzX9onxw9ZprafQ4hLE3SDiV/HjzGOsamx8eTn7RyD
 4Oq/c+y5k4jKq2jsIxefD3fgJyiyged6qQjOM03/1Uu0E8aC3vJeVeYpwwaEWgTlCXQm
 ACY7SkZMG1J7ZTgWKvya2BmzbRqMQVFA5oKX4jt51VFT2NS7Xawo/cAn9JvxCJVgNhe6
 tKSVxB3ojDUBXqKmL9Sqpxvgpx/MTbBnTIkWVi35slUDYu2Ln02yuPrq2CPJtzWwJIOw
 aGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L6Xf956Ggs9i29nhhZxcpOFa3qNKKv09WnMU85+P6h8=;
 b=R0woxaX5Ec0sD7bKp8uoUYRpe973zjbbueJkpxCRTjgZCsz2HobC/wMiBAuRILH5ys
 N9OhCXWULcNWj+baEdZ81r+2kJ1jgl94VkYwnn4w2srW/ki8WgIeyglc4JpDgBLga2cQ
 QDuU2v7MMASdfi+w9JwnVpF/kS/EodhwGLQnnzCuRZ6153DyEOactP/4etnSbKXeJb2D
 8+E0cfch2NgRjhpidz//MpOo/Lq+vIlCjzmO3VBGPeaN3hKDpodFsRW2RurBMLrS5zU2
 WMiSfNsDPRYR+SoZMrrbnXkrzHXC5BC0GxVPn/QrX7YjTpc63sHL2w+dqthXeP0eOK5g
 mriQ==
X-Gm-Message-State: AOAM53261X8kKeEA+XIKnO/1ogIEI0Q19CAEuRFnM4AxVc124Bpdx0i0
 leIePjvckfmsnuHBAse9YqkPl01gbPg5NA==
X-Google-Smtp-Source: ABdhPJxqAT0U6UAECQZeX0lamgXR1hMlzDZWSY5FSTm09Z2psMrrnAUTkOHgXQXMQgfmhlcKSlqrjw==
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr5404600oou.88.1619803683198; 
 Fri, 30 Apr 2021 10:28:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d207sm297587oob.7.2021.04.30.10.28.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 10:28:02 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] bsd-user: put back a break; that had gone missing...
Date: Fri, 30 Apr 2021 11:27:45 -0600
Message-Id: <20210430172746.99818-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210430172746.99818-1-imp@bsdimp.com>
References: <20210430172746.99818-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::c32;
 envelope-from=imp@bsdimp.com; helo=mail-oo1-xc32.google.com
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
 bsd-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index adc3d21b54..4abff796c7 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -199,6 +199,7 @@ static int sysctl_oldcvt(void *holdp, size_t holdlen, uint32_t kind)
 #else
     case CTLTYPE_LONG:
         *(uint64_t *)holdp = tswap64(*(long *)holdp);
+        break;
     case CTLTYPE_ULONG:
         *(uint64_t *)holdp = tswap64(*(unsigned long *)holdp);
         break;
-- 
2.22.1


