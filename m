Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9F2B1527
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 05:42:18 +0100 (CET)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdQuf-00048n-4S
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 23:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdQtJ-0003KG-3E
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 23:40:53 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kdQtE-00018k-5e
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 23:40:52 -0500
Received: by mail-pf1-x429.google.com with SMTP id x15so5253150pfm.9
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 20:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xGktH6awoirh6QCj5VHQ4o7YvYuX04IWGX7neNfct8s=;
 b=NbB2DwNXXL0ZkR1ca5/bjzwTkw2y8BzJHpUePJarpds/sa9zDoHm6JrMQ5O2aSQL07
 H7DLOjKAkH8r8fDGkfjU4LRrKFwFzGhIVv/JupUaZa+7qb1KAg0sKJZDbpgt+V0QZyRP
 m+A0RHMwNFAHNFgOftHknpqaUFYWXJ3UtyhnKHUDWafXXaHakZtNzbFyIXyG/YRcG4O+
 55fUScrTH6nMsOjAAjROb6vE/2QHFLUgIfiyjXSsk0a/3jLJGEzcTT+f9NMa6qBF4OZ4
 wBv2RMmtEDdeuzHk/FaEeez0m01yYRfl1B3njxJkeFB2cArvbGVdJB9UJdB97Ycjyv9k
 jMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xGktH6awoirh6QCj5VHQ4o7YvYuX04IWGX7neNfct8s=;
 b=pFlcsrh/k/E0vOdUzXKPOXniAM9qB/dn13V7jTvYczCV/a/cMroEmBv4XqoersghSL
 /MCC8aEAb5OUK5E2FGkB/7pe3ciFE/j54radfcKkOL6/GdZKQCKyajF5HQtlNyUI2Xzr
 qQfCTbQLb9PRiuShM6o8OnrHopEZ4HrkaRUsP6N1YCZCxY2lIW6z+yPykWLcy5+rgP0Y
 8s0TzZ0QyFxGvnDejreaOyA5VsN/6x8Qx0trqz5qhJeo5jwfFbxSuFBN23OWjWCYrnfQ
 Hwy3G2unqK3Tv/aQOHltY1v3pg0PfZdxm27vnE5zr24asPiE2o+mT1oXh7DO+jMwLxy5
 2e5A==
X-Gm-Message-State: AOAM533phat3cFiYWMFBPzGlbL3uP73PeXgoHxvDnGHgl4UNR55wAFvj
 Aw2u3CWGMa7d5oG+12bm4Mlf5daDc/oMLQ==
X-Google-Smtp-Source: ABdhPJyCJpZhUU3hR4+kM7EUWiBJ/w4pbD1ku/QqIkyiEH/hXs6az5joHnO9NJ7JtKRuNZzCwnWRkQ==
X-Received: by 2002:a63:2d41:: with SMTP id t62mr639571pgt.292.1605242446237; 
 Thu, 12 Nov 2020 20:40:46 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b129sm1101627pga.3.2020.11.12.20.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 20:40:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-5.2 0/1] MAINTAINERS: Replace my twiddle.net address
Date: Thu, 12 Nov 2020 20:40:42 -0800
Message-Id: <20201113044044.782249-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cb5d19e8294486551c422759260883ed290226d9:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-macppc-20201112' into staging (2020-11-12 11:33:26 +0000)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-tcg-20201112

for you to fetch changes up to 336f744e148a7b9d50ebf205d5dba7b0fec271d9:

  MAINTAINERS: Replace my twiddle.net address (2020-11-12 20:35:43 -0800)

----------------------------------------------------------------
Use richard.henderson@linaro.org in MAINTAINERS

----------------------------------------------------------------
Richard Henderson (1):
      MAINTAINERS: Replace my twiddle.net address

 MAINTAINERS | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

