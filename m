Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0178340307E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 23:56:24 +0200 (CEST)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNj4p-0008MB-23
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 17:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2G-0005VS-IO
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:44 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:33656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2D-0000gK-29
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:44 -0400
Received: by mail-io1-xd42.google.com with SMTP id f6so536052iox.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJRZgQI+QtTgjpShWzcLDKaF2c/eXvqYd/GhPRaiuEQ=;
 b=cVwOc3leCb1qBayKsoDvzsS7MSG4mbs6CbBwBqcwYER8EJeQxhI7No57J3lsVGnFwE
 KyoDlbN32kdoZ7gQ8S5qMmILJ1Ysodxa0tqsazQ3uHrrtNUCi6hJ741UPfQ00ik7qTHV
 7bdV/85jqlAYjpiaP+mVKqqFG69a9pt9da6CgQQgZYGXBARNNbovDEzf3cWYz1qvhQtp
 BzXZ3xG7VSO4GEibQMEV9KwPoV8Vz7iamuP5HWC35CPECPDh7tV+zhe7n7bsU4zxAPrE
 xZ/EZdBx6xp8tuyFSQBcmQ20UPeruE8pUTZwDsdcYpdSdN+mThbn/3zpbZ5TLDiRxxOX
 wasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJRZgQI+QtTgjpShWzcLDKaF2c/eXvqYd/GhPRaiuEQ=;
 b=i9+yKgDmKNMkusKbkvdU0HVLAUW1NEkATwa9P/WlvQ9i6+99cL8bkL4tseUGvYY8gi
 2UNQReN1d/fe3hbwXWgMa+RsXk50SKSUXojyqKiZKocuXbxrd7+pWTrg9aXaoUcJ7Bd9
 mOQ9uXnacfXFfi6TPDVAmQ0MssYzdypJAxbZ85VVOSsGXkxwnKdLz7Aud6Gqics6OyrJ
 NDZXtweWh2bzLB4BMilNTrNctyHAJR9AYjd5f0i/pVAZbnnrfNvEUt8FfDNx5sqyTmrK
 QlhdekhRXGeyLD3n6Ja1EkPzedJobSBYEpBqdxI8F9HywXfEsc77LbJCLhOzdlQE3635
 UYsA==
X-Gm-Message-State: AOAM533qLif+yT1wN9/pQEVIzi1jRL/Lsu2LfHyQ+/WqoCz41DbcX1U+
 oyJuILB7CqQR6QDoctcwTfrMRk5C1HnfNzSJ6z4=
X-Google-Smtp-Source: ABdhPJzqT9YX7AaSmppfDbxvnqQ6+c+E6/9SQtpk24q8l9tKDwV0F0aE4tc3tMnLTJQGBvxChISd7g==
X-Received: by 2002:a05:6602:20ce:: with SMTP id
 14mr285574ioz.204.1631051619853; 
 Tue, 07 Sep 2021 14:53:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:39 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 02/42] bsd-user: add copyright header to elfload.c
Date: Tue,  7 Sep 2021 15:52:52 -0600
Message-Id: <20210907215332.30737-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add Stacey's copyright to elfload.c

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


