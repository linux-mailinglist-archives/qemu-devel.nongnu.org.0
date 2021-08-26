Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B713F8FD2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:17:51 +0200 (CEST)
Received: from localhost ([::1]:47338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMkw-0005R8-Uz
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfl-0005WJ-76
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:29 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:41499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfj-0006jj-Oj
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:28 -0400
Received: by mail-il1-x141.google.com with SMTP id l10so4718455ilh.8
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lv7qzc+bwvqvCUY7KRQHdm4K9UxT525dj3NdW6F5N3A=;
 b=dEcQ8hcGlbtBEQ3bVuZbSLNwhvYXfbv3TdqlrNTZ8RHW3kseNLYlvm0Nvr6Cyoyifv
 12jbC2x3M74mjBgUEyHKDZ7mX8V1Qrh6mhekXhxwudrSfXIk+rpac4G+TzT8Yuchh0EJ
 Cz+SCSZeCly3kLFmnmzJrcIxa4BbotFuqx+vcwSMT7owL2r9IQjZo8lzm8JRmLrWQ7WF
 QPor7WyRFO+TpeJC93ZG94tUcOpHmRAMksKnC1dyIUZK2OIbLPJInQ8LfNgM6cmgiAam
 /WmTvLVNeE9V79HKsSbJ7L4fvkm4VyBGO56wkd0zg3sBvBKQLKEs632jm1KnonHFejyv
 vamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lv7qzc+bwvqvCUY7KRQHdm4K9UxT525dj3NdW6F5N3A=;
 b=KMLtLiJgN7rfZG2p7CpPJlB3RLvmAObER43AUy1KJKsUkiCl8uXlZjNgDM6FA3vwWS
 hmfnQ8sT4SvQqSOWEDoSwBhJzWGzg70chAOoOZR/5KBewFKYokfWvTVSUOoQNZXOLU6q
 aGnDR3ZXvtGjUEHQlf3w8lHSMbrnnYrG5HdA4Hul9rU0ncpy/5xMVAjQ213k/p009Z9w
 wRfVAhFBU6LgXlCSub8IR6LlARAI1Yc/W3KDI6WMt2+1TGr2Ex95EN/JtJZdiAFdGadi
 BOkcNxWbQuA+I8mjyda2FmdDyZlndM34ZTJH+nJ9d2bFWj2Q/Iu6le7dzgdr8xW0jWDE
 0twQ==
X-Gm-Message-State: AOAM531m6g036bZqZWzts7U+cHQifyYFaUCTuVZKzCuRTrUThNd8S6sH
 TxWrmaqiShsXnhJUo2w+LmdNL+QUTpyV4bK0
X-Google-Smtp-Source: ABdhPJytGQzsWPzGXaOyWUSaZ/niHk+YJnd2+qWzIiLXJYKdgYuvq6LO4zIfpkrvacZVqseRJZXp5Q==
X-Received: by 2002:a92:ca0a:: with SMTP id j10mr4074482ils.192.1630012346402; 
 Thu, 26 Aug 2021 14:12:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:25 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/43] bsd-user: add license to bsdload.c
Date: Thu, 26 Aug 2021 15:11:22 -0600
Message-Id: <20210826211201.98877-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::141;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x141.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Pull in the license statement at the top of the bsdload.c file
from the bsd-user fork version of this file. No functional changes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 8d83f21eda..0ade58b9e2 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -1,4 +1,19 @@
-/* Code for loading BSD executables.  Mostly linux kernel code.  */
+/*
+ *  Load BSD executables.
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


