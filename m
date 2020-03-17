Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E5188D96
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 20:03:03 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEHUU-0000Qr-Fd
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 15:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jEHRq-0007Bu-L3
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 15:00:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jEHRp-0003yV-8M
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 15:00:18 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37733)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jEHRp-0003r3-0M
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 15:00:17 -0400
Received: by mail-pl1-x62b.google.com with SMTP id f16so10024373plj.4
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 12:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9wwvIt/CXR/xgt6aqsRoj2r8bH6q/Xq+kxjkzVnIts=;
 b=xj2UhJS6cD6+6vKATt49YgqSbp+sFl9X46Oha45cHSTWQcdmNWcwEh2WoV+qhDS9sA
 NU+XEq6QfpQRtovOPu1rEYCqq8Xlgf3GP9EhNQx5MlSNkDuFpirvlY4hAJp0UDX9yPxa
 M/tB4pC6GKP4Tr50Zp1d9vQVZ47l9DvV2YSw2Qy+1eds8zO9qO4qz89mQxlh6p3j2VaX
 TqKa1zzVz41cXn5f1Da2+5mOJ8nNf+1MHhUPL0t1Y2m6DRy6r9ZXv3VUL9KnkAXy36L0
 Ef1S6/FH0q/0Hi2MsUtP+l+vhscF/uXugjOLD9MBKw4nkJfPbJSSKDw5fDufB2TvyWIt
 ko+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h9wwvIt/CXR/xgt6aqsRoj2r8bH6q/Xq+kxjkzVnIts=;
 b=ZAZKGbuc1a/t0tWoFP/Ava862jU1E0KJpQp9cVyp+z2f8Upu+fODjy6KGhWoJqihE6
 J3XnxQJuXrJTOsMBW4uwYJ3cn1MGA/OVjn9h+IPzkWAWTkYXwI9OaetubLdf6lZabb/C
 V1l+1HhWziSZBuwAhgiVoT6446UgMTxR9j6fCwScKcsmn+W5t4r7ypyDzaye8h9/5UN2
 gMwSRrRau4LVKmiciL9d34w0jTX5Bn6aC5EU/uw51J8obHxbibezdbG5Sixt7WCbWEQY
 YSOPIuV+cSGQDAItQw706vtwHoy6JftfZ4e2o6c5h4xUhkSua5xsoc445KUpE4d7hZru
 wHGQ==
X-Gm-Message-State: ANhLgQ00ZGWxfyJwXdTyIBa5+ROXsxQhYTwCpeOABDAR2NbIkbLK2zVY
 mpq9F1f5CgEycB0AG9heA9p7vkis8Wo=
X-Google-Smtp-Source: ADFU+vvrtKC5cqh8uCinHRKKrVrBtjDzaDtya9VIhh+hJ4eBH2etcPSamOEyiny4NHy0xbbzFWuxVg==
X-Received: by 2002:a17:902:6bc3:: with SMTP id m3mr99276plt.27.1584471615346; 
 Tue, 17 Mar 2020 12:00:15 -0700 (PDT)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id y13sm3738411pfp.88.2020.03.17.12.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 12:00:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] tcg patch queue
Date: Tue, 17 Mar 2020 12:00:08 -0700
Message-Id: <20200317190013.25036-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::62b
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

The following changes since commit 40c67636f67c2a89745f2e698522fe917326a952:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20200317-pull-request' into staging (2020-03-17 14:00:56 +0000)

are available in the Git repository at:

  https://github.com/rth7680/qemu.git tags/pull-tcg-20200317

for you to fetch changes up to 0270bd503e3699b7202200a2d693ad1feb57473f:

  tcg: Remove tcg-runtime-gvec.c DO_CMP0 (2020-03-17 08:41:07 -0700)

----------------------------------------------------------------
Fix tcg/i386 bug vs sari_vec.
Fix tcg-runtime-gvec.c vs i386 without avx.

----------------------------------------------------------------
Richard Henderson (5):
      tcg/i386: Bound shift count expanding sari_vec
      tcg: Remove CONFIG_VECTOR16
      tcg: Tidy tcg-runtime-gvec.c types
      tcg: Tidy tcg-runtime-gvec.c DUP*
      tcg: Remove tcg-runtime-gvec.c DO_CMP0

 configure                    |  56 --------
 accel/tcg/tcg-runtime-gvec.c | 298 +++++++++++++++++--------------------------
 tcg/i386/tcg-target.inc.c    |   9 +-
 3 files changed, 122 insertions(+), 241 deletions(-)

