Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D8D48FEE0
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 21:48:28 +0100 (CET)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9CRv-00080K-0T
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 15:48:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n9COF-0004EL-4s
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:44:40 -0500
Received: from [2607:f8b0:4864:20::d29] (port=46935
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n9COA-0003z9-7j
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:44:38 -0500
Received: by mail-io1-xd29.google.com with SMTP id w9so18982433iol.13
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 12:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+VxXnxDuxJfrupzeMTzbLXuJLCG5XURcPjDcwr1Agxk=;
 b=f/yTsa80TIfMzFM9mFg1dOVTsrz6mi+3yBV/zZxiEmA6B03RKOazZ9Kkh1iYY+Sfc1
 K6PjUnCxJ3Nxqm9CSeys31x+i+CReGZ+YsAhWPKFDyGUUJ1gYspTy7RmSiCZJWi8B3WO
 oiCX8cFl4oHoFA3f8J0brGtJBLLB30e9jAI1MfsWPNzYPCfIWY6cLPlmZwiCBMIRKWdq
 BNfjy2HOLIdFdBU2/BqPygJUdSmqdGTBOjm4nYV/arTYQayZNhFfWrdYstwYWIcWufR8
 SSqk0Vry7xGJVnS6NY6Xk3R6PkdGE021oHu8lgxhKSq6PuFi5/XHnYFSc4DuSY6URtFk
 VdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+VxXnxDuxJfrupzeMTzbLXuJLCG5XURcPjDcwr1Agxk=;
 b=KJUgPVAUMZmwpJmzj9K3TenXmO0uRiem+isFK5vZILKpcAX3Al429nPhUH9Pn1tEjX
 Q54jitqWsmLExhUUEULk3KrYlhg4MtF7D37lUf8fq6AF5/d3MiOY876s5ohtUlqtjwUk
 2+eKy3d+ll1CP9PAaZBeYsbULbRZDh/1qtF+59Yexu4b4gx8Py1vJZ0VFnSSfO8kN2ek
 kP/e++m90qsHKFAMDXVVTuzZDYQ9vrvuTtlj5Raua2fDreJXWRsaMTTsaovkkAGxxP4P
 Y7Pbu4vXhyCEflb9KUBVovsQhnuNjCIdDOC7Y8GBl4NEqTIL4tAwMmmtbXnHkOzqaqVf
 K1+Q==
X-Gm-Message-State: AOAM533RHkQV7sLORyFsSQCGU3Kug89H92HF/a01MTYxC16Mv936EoDU
 JARsqFTE6cZ+cZn0RUtFriC0fdzlDVKVVhGz
X-Google-Smtp-Source: ABdhPJx0mN4GL3zuLEpKpjAO8PPqDa99rQyQYVzbLJ0z8tmFkHTQO81863SLAFWjYARG0XoOCZ5sdQ==
X-Received: by 2002:a02:a106:: with SMTP id f6mr8048283jag.303.1642365871859; 
 Sun, 16 Jan 2022 12:44:31 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id s6sm8275018ild.5.2022.01.16.12.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 12:44:31 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] linux-user: Two minor patches
Date: Sun, 16 Jan 2022 13:44:21 -0700
Message-Id: <20220116204423.16133-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's two, almost trivial patches that arose out of the review of bsd-user.
There's a chance that one or both of these were submitted already...

Warner Losh (2):
  linx-user: Remove MAX_SIGQUEUE_SIZE
  linxu-user: Change return type of queue_signal to void

 linux-user/qemu.h          | 2 --
 linux-user/signal-common.h | 4 ++--
 linux-user/signal.c        | 5 ++---
 3 files changed, 4 insertions(+), 7 deletions(-)

-- 
2.33.1


