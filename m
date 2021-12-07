Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26446BDFB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 15:40:56 +0100 (CET)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mubeI-0007vl-Oy
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 09:40:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mubd9-00072y-22
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:39:43 -0500
Received: from [2607:f8b0:4864:20::531] (port=43595
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mubd7-0008Ex-7m
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:39:42 -0500
Received: by mail-pg1-x531.google.com with SMTP id q16so14005549pgq.10
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 06:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4pcswgMutpKzT4GJvLJjnWheH0JjR9aOvJcxoWfosgQ=;
 b=ZrmfpaOSiwr3tJzRKCb0/YRW5hkVxQEj7Ac03Qn9zugmP+JrYt2BjII7bPB62Fx3hD
 t557f5Qvgn99zZypKqwomTZ/xJZ9udiwQwu8biU9kt+ISOljT+yluda4L432z985jnx8
 lVzgXpfLznWPzC36GqrB2SBRVG2LwgkpdMGmOKTbhFFq+wwesSmAQcVJQ+yhEm/NHil7
 SV8B9JJq+JUpCGv/yXlsvjjnyBUsEMh40lX+kRkncv+zbM4RqbdW2pLw18hwb4SGzeB4
 G3eZ0WsqzlRDq7zz+P+0+fDgqzg6sBeGaxggrttfIcqplJHJo8pUjN3pfZn+xte6ilwS
 AZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4pcswgMutpKzT4GJvLJjnWheH0JjR9aOvJcxoWfosgQ=;
 b=djDy0rbMI1rG9+2aaB8eG5zr1tgIUnXyPN9EZ4SUsMeO5Rkcjp/p46el9PCT7jkctW
 WO+V4KtZUDCc+wLl3HsHu1JR6mr0P93OqkAO0mitqUkOh6qOU7x0Kw1HcjwjD6jF7Oe3
 h6hrhl6K8OT7UhM7zBfNKj2bzT/8G4ZKahD+emfaI1BwtgwfTGLIqpse5cJxlrFYmm+N
 q9tHuS3/QfLqhvkS6NrD0AXlPGoPJ2wLx+sA1NNUB+JGFuYIm4PoAgYZPigz5lBu/T+i
 8rkUmpquhnUfmWELTLKfmHgQFZ8aS8mSx4LAgxZqzWNFGtYJTpf/vk/nDyOp6YMUyMHh
 KGVA==
X-Gm-Message-State: AOAM531xCQZENNGl8boKODvdoPiQFkSRGWC4RDih+nSWJXvqMouphzds
 RqAwIIDmss1pHAM2uJTOsDh/Izzx+85A+w==
X-Google-Smtp-Source: ABdhPJy+RaB4HsLrVt0IRkEk+ZMtwbhgAPoJ5dAAwhItHCwhBqW2FJ1yVNCikiWmoqfF1qgZn5zO4w==
X-Received: by 2002:a05:6a00:1946:b0:492:64f1:61b5 with SMTP id
 s6-20020a056a00194600b0049264f161b5mr43449678pfk.52.1638887978596; 
 Tue, 07 Dec 2021 06:39:38 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w142sm16105490pfc.115.2021.12.07.06.39.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 06:39:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] tcg patch queue for 6.2
Date: Tue,  7 Dec 2021 06:39:35 -0800
Message-Id: <20211207143936.258418-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7635eff97104242d618400e4b6746d0a5c97af82:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-06 11:18:06 -0800)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211207

for you to fetch changes up to b9537d5904f6e3df896264a6144883ab07db9608:

  tcg/arm: Reduce vector alignment requirement for NEON (2021-12-07 06:32:09 -0800)

----------------------------------------------------------------
Fix stack spills for arm neon.

----------------------------------------------------------------
Richard Henderson (1):
      tcg/arm: Reduce vector alignment requirement for NEON

 tcg/tcg.c                |  8 +++++++-
 tcg/arm/tcg-target.c.inc | 13 +++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

