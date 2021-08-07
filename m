Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB84D3E3725
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:44:30 +0200 (CEST)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCU7J-0000Zp-9q
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5p-00067s-Ee
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:42:57 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:33422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5m-0004g1-Ha
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:42:57 -0400
Received: by mail-io1-xd42.google.com with SMTP id n19so20054407ioz.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QksrBu28ckIho2yVl203igA97c5wMaCvQfUOlaWYLx0=;
 b=AX3hBIRrThyzoxNrxQrChXEb0SxybbUfqeQAjZp68qhs74HdilTTm1LJzoXmK73K3r
 IB4nVbOT+Rg1nUXYkmab6B51FxqLf5CVBP53sYEnMPNEq4IRN2zKXNeuBvTHAzntfb2i
 6345WTYaeZpA1yKieaH48KvHjT3jnJlgw5WRJsqetWfeL5ZUw4/Ra2JvjCdo3yBjdBlE
 kMlmG0NsFkuCAhQ34wqmSPoUoHvVWWkAYt9dgI54ZdIp4NJoY2esoAchqDr56TWQGEZE
 GLz04iCx4mSOWvWxA44awb4uvFeVQ3xOZ+ORQ4hNkBT5fyTncM6i18hvOQXV9f/PGvIu
 NmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QksrBu28ckIho2yVl203igA97c5wMaCvQfUOlaWYLx0=;
 b=miX60tNgvD/dIcHtxIae8bzO2H/eaegpX/oW5WoH7iyMY2j8H/PIWiscVNCGEqGJVj
 tbyUWOIOvtlaMekkHVir+dplDjUSv/cxsZXWNiQ1cdfuhdTr9US+ctFRXOfOq2893ivz
 DQyKG9oirQ776SwUHNgHrK4XiBcVyy/BwvklVKNgcBgRW5tfpMxdUE3sXRKcFYSV6ugB
 zga2hwNEknWk8l/aXJxFDlnWE/Ez9UFs7aDvQlRDpMoaQcH12Qn3jQQPea4nE26rycu0
 nIS+8gyDEN2F+ay684f/l/ZzpmB9i0VbzdQtX8hQankd4WMdDC0wFDfcR7I8Kb38tqGH
 5eog==
X-Gm-Message-State: AOAM5300OqUxcSsBJzBEAJsrRfiHQnnvTILVmc9g5kdQNftz3b8SUZxQ
 c3V9qSmMhVpXRNd9s39iuNziPSjXxdSi+G+x
X-Google-Smtp-Source: ABdhPJwkkc+CnF1ijycFUsPzDRJgoesYnA9JTQxy5fj7UdCEAIJ0mn8566nPeW6ro/fbrtUAFgXcKQ==
X-Received: by 2002:a5d:8e11:: with SMTP id e17mr39328iod.138.1628372573369;
 Sat, 07 Aug 2021 14:42:53 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:42:52 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 02/49] bsd-user: add copyright header to elfload.c
Date: Sat,  7 Aug 2021 15:41:55 -0600
Message-Id: <20210807214242.82385-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d42;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd42.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add Stacey's copyright to elfload.c

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 6edceb3ea6..ae62f3aab3 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1,4 +1,21 @@
-/* This is the Linux kernel elf-loading code, ported into user space */
+/*
+ *  ELF loading code
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
 
 #include "qemu/osdep.h"
 
-- 
2.32.0


