Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A803D2CAE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 21:23:21 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6eHw-0002eE-8U
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 15:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6eFO-0007PH-7x
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:20:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6eF6-0001h2-3d
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 15:20:42 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so2171381wmh.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODS/fQwmheZTw3vhYjyCX6NgQaRFrMEWTc/Yv1y4aiA=;
 b=WIa5dbecu3wmX9QZUJVxPiY2IHnoubKanTainXCZsA9XAWIj2FJ4+q4Cvh80/3jDfF
 fDqAzROmOFU94SQ9jsNIeSs6JCXl+Qyx1ibt6PLxoTRfc9czd3INlawdpNhVCLOc+ApZ
 vUwZ4LZct0CYzoezmg36Vkkm+fefZmidMr6jl9Qs38eAzgJs/Jm6aEyS8KwMcagndGgJ
 CkQkIeXFsAasAy/mv8nWOCm+2i1xEhUlG5nXZNZ7Ez6vXEdrkeOtYsU5l90YEVPQmVvG
 9kAEZN/+SN+0vTGaXaNOKkRlghuy0ya8Q0eqzWd8AWqFy1b6POyW7c04xJ2wLnYo7CJe
 gUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODS/fQwmheZTw3vhYjyCX6NgQaRFrMEWTc/Yv1y4aiA=;
 b=J0HGNeshE4zhjzEKjBXK9WsS91xBYXLSfbJGcdcR/8gSy6ILFsZgB+YU6JUSCSxJsw
 kno3PnCca5Ngu/ZEuCTK0S6nXQ2iOByyZygGhD82gAAl6dfeLZmCBhccFFcWF3F3d6+W
 1Jm69kUmt7kRcHx5Cn9d0e3WHDZiIJC3jZdvgVs8ktOb2WNDDRRQU0DhrICvwoQXHViy
 smqfAQ24Wh+FmfTpoGrMmmIjI9j0UR6s49AXHgY9IuMZKyWzAeIqF3obZuax8+k0PPi6
 FbQRf59yiN+LxCMf6+VQu2pAEcSqBt3r/nICpfC5Cerz0ifA70/B99EB1rI/0fYUXjyE
 u94A==
X-Gm-Message-State: AOAM533xXQmG9C1QGuOfsj/vWsGm9CdWzpAp1fOrFxVsim1NQmZSsW/1
 +y/pNe/DalofdijtodEVeaEOMEwLr4+oRw==
X-Google-Smtp-Source: ABdhPJyNZBcigg1n6Tti4tzlB61IQOQX0kBdQ5MPPNLa24s9752WiIcjZb+TDgLEPPUY8BSslwOuSw==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr10808592wml.30.1626981618603; 
 Thu, 22 Jul 2021 12:20:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z25sm26201612wmf.9.2021.07.22.12.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:20:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 0/2] docs license footer followon cleanups
Date: Thu, 22 Jul 2021 20:20:14 +0100
Message-Id: <20210722192016.24915-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset makes a couple of followon cleanups now that
commits 13f934e79fa and 3a50c8f3067aaf are in master and our HTML
documentation has a footer to all pages stating the QEMU license
and version:
 * it removes the TODO comments, because we've now done them
 * three .rst files were rendering their own copyright or
   license information into the user-visible HTML, which is
   a bit confusing now that we also do this in the page footer;
   patch 2 brings those files into line with the others by having
   the comment/license only in a rST comment

thanks
-- PMM

Peter Maydell (2):
  docs: Remove stale TODO comments about license and version
  docs: Move licence/copyright from HTML output to rST comments

 docs/interop/qemu-ga-ref.rst                 |  9 ---------
 docs/interop/qemu-qmp-ref.rst                |  9 ---------
 docs/interop/qemu-storage-daemon-qmp-ref.rst |  9 ---------
 docs/interop/vhost-user-gpu.rst              |  7 ++++---
 docs/interop/vhost-user.rst                  | 12 +++++++-----
 docs/system/generic-loader.rst               |  4 ++--
 6 files changed, 13 insertions(+), 37 deletions(-)

-- 
2.20.1


