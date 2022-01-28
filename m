Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B56FB4A04FF
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:04:57 +0100 (CET)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbEe-00059f-Iw
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:04:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDag4-0000tL-3v
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:12 -0500
Received: from [2607:f8b0:4864:20::12c] (port=44992
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bO-SV
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: by mail-il1-x12c.google.com with SMTP id p7so2671791ilp.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pumpyPycN9DoXDBuQYFrkloUl4gD+5Jdk6jBPn6GXxc=;
 b=W7Uy4/BlWJUPIZED1wTDImcoappz76S2KHAveYqXmM83LE2kRjduJGoRWxRHl/nRWw
 sxVkFu0IAwlzWaYn6kNgMANR0G7JbVuu1eReXUCV5a/SI36jaDQVwPwGUQe42y0KAIgD
 1wfB94s7FZ/AFLnO922SH0fJW0m7kUNob/Lre1AICsDAIVj0W/y6iImmNkkFsMcBeFim
 XrLjb+ZPegVPfwrnG0U1okC5TSzSnOC5KS0uFpnLT0JiHL6YqBz+dLJsJBbl9ikLP3Is
 xJNomsKWab+Q8mmeGXxwGllGevaxoqWUsIHz6CMZFrG+cxuY9KGrfVRh2t1Qzgb96C/X
 +1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pumpyPycN9DoXDBuQYFrkloUl4gD+5Jdk6jBPn6GXxc=;
 b=e2xJbp2oHpxknarrj42BlPeSSPyNNmY5QSLw6SNsywVl3si87p0PHwaHHHUJLQB2tu
 AdzpG8iaPmwWWu50bZPGyoFZ6NRGS6m2w5D68nHHXgIp3c6ibw8H95JCeq3mmbPbXaB5
 JP5zBinhwDsiGcGGu4gQ3o7qNghuC106sWpGOYmtiFYTTk0KinMYDBi/TFTfiO17tyAq
 GvAAa7DIfHKAqRG+MzAtwPsIyId5oIzlPTCtuHEM1VF1rXDztn1zoPAi5GQyfY7R0TyQ
 IfCDmYi+x72pOjsosTQjD+mXP1Z5k0G4FVWjWyegjNxotoHeAT1xNny3PqUzs+78WkQf
 ULpw==
X-Gm-Message-State: AOAM5300I/FJS9hJ6GpSrdTYi0r5Sio/7ySjlbxNJ4Bkm0ymJ9v8yGHq
 lJEmBkLA0b0JpD6IIWIJnPEpkLfvZCkL4w==
X-Google-Smtp-Source: ABdhPJzZhb1o2ScudWMHmcbkFjHHFY7hj42osivFiE9q/OzVjiTUau5+V6TgnRuWR2ePiuNrah3xjQ==
X-Received: by 2002:a92:8748:: with SMTP id d8mr7348050ilm.186.1643412524709; 
 Fri, 28 Jan 2022 15:28:44 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:44 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 38/40] MAINTAINERS: Add tests/vm/*bsd to the list to get
 reviews on
Date: Fri, 28 Jan 2022 16:28:03 -0700
Message-Id: <20220128232805.86191-39-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/vm/*bsd (especailly tests/vm/freebsd) are adjacent to the bsd-user
stuff and we're keen on keeping them working as well.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf4..b7487f9b54b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3181,6 +3181,7 @@ R: Kyle Evans <kevans@freebsd.org>
 S: Maintained
 F: bsd-user/
 F: configs/targets/*-bsd-user.mak
+F: tests/vm/*bsd
 T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
 
 Linux user
-- 
2.33.1


