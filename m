Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272BFA80FD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 13:23:12 +0200 (CEST)
Received: from localhost ([::1]:56242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5TNW-0000CV-R1
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 07:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i5TLd-00075s-Tj
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 07:21:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i5TLc-0007Ca-Ga
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 07:21:13 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52978)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i5TLc-0007BT-7w
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 07:21:12 -0400
Received: by mail-wm1-x342.google.com with SMTP id t17so2874829wmi.2
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 04:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27MdaX+gehdwlrQBcjnPAqiSCpVbJJsljj5uWs5cQMk=;
 b=NgH+EeWsrFB9kDuaAPcCeXDkZxxwzfNjVLQ8H2+OriuyEM/OM7FkIOeE0ThIMJimki
 Mv7T2RQrmsE0usaPhz48z8fKa8ivoFloSjbJmqalWNaS1OR9N9qy/aGJtnAa7vOxmW9q
 D2Aj99GbizEYCRxEQSp2x1+8mmEfoCUKdpkzP9agS+reWwfaKhrqUKiSz4pVoidUZ5ig
 xFcCX4MAXe4imAS6ssfYa2RsInMV61/hB7SDDS64M1jxmf/ZqErdR+ZCvBFGojVYUnt5
 YXu5cJvsrOo3f9UhiJwsDaLOy+o8dtB9XwzymwLtKPiJH3Voh7aevARYOy96RE94dplp
 ZWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=27MdaX+gehdwlrQBcjnPAqiSCpVbJJsljj5uWs5cQMk=;
 b=Geonwj6AqjB5h5dks8SVCo2lloIjFE7SMn3M2xKKrgef4PIVtsojszTDE/GN3v5YmL
 nQhhWuIo7Bfo5w68Nv7dflWjIop/fUH8KFMdUenuoW61hIbGbXwXF5U9BG12iG8aBkw3
 kMD/5zs//r/8AzXVShEoSOffck84yPDluod4mr5TcacjvskH/6bmT3+J2GB1X2sMBrIB
 dXBGd9w92/g16VS58ERpw6kg0YaMyD2ii8iSnO9fmUnBAKaPfDg1yOeG9UAzW7yl2CZv
 JPSYOhGW7s8CWs5AnV70GDwfhS/q6AtFxQesS2m3ZODm5/o6DNiyp0Tf0YEpR9c5dlDs
 yI3g==
X-Gm-Message-State: APjAAAXoYTkErZlBOZ0+OApNGMCzD9bgs/j1o0ak0Yj6+DQzgtKok54b
 M5bqVYhRny1iVy1uAc0WFf+S/Q==
X-Google-Smtp-Source: APXvYqzT9V69jUG5W9KO22PEwt5UMmiz2Ec/k2682srtCYux5tZ4mcOooHxsUeAOpG2GB82dOTDU/A==
X-Received: by 2002:a1c:be19:: with SMTP id o25mr3759877wmf.54.1567596071165; 
 Wed, 04 Sep 2019 04:21:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v7sm21764006wru.87.2019.09.04.04.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:21:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C73B1FF87;
 Wed,  4 Sep 2019 12:21:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:21:03 +0100
Message-Id: <20190904112108.2341-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH  v2 0/5] fixed up semihosting fixups
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

Here is version 2 of the ARM semi-hosting cleanup patches. The re-base
had failed due to a change in the gen_exception_internal_insn API
which now takes the PC instead of offset from pc_next. There is also
the a minor indentation fix.

Alex Bennée (4):
  target/arm: handle M-profile semihosting at translate time
  target/arm: handle A-profile T32 semihosting at translate time
  target/arm: handle A-profile A32 semihosting at translate time
  target/arm: remove run time semihosting checks

Emilio G. Cota (1):
  atomic_template: fix indentation in GEN_ATOMIC_HELPER

 accel/tcg/atomic_template.h |  2 +-
 target/arm/helper.c         | 96 +++++++++----------------------------
 target/arm/m_helper.c       | 18 +++----
 target/arm/translate.c      | 64 +++++++++++++++++++++----
 4 files changed, 85 insertions(+), 95 deletions(-)

-- 
2.20.1


