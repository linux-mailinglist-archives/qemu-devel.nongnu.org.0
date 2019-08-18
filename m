Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B979151B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Aug 2019 08:41:37 +0200 (CEST)
Received: from localhost ([::1]:39466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzEsi-0006M6-Cc
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 02:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzErF-00056I-2W
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 02:40:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzErD-0000jq-TQ
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 02:40:04 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40181)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzErD-0000jY-M5
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 02:40:03 -0400
Received: by mail-wr1-x442.google.com with SMTP id c3so5420708wrd.7
 for <qemu-devel@nongnu.org>; Sat, 17 Aug 2019 23:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cno2ECwsR7ktzkhE8ZG+zagDyVBGqxsGXUAhcQLNUik=;
 b=DTPMFj2A+44bjtg2HVYU0cK2uixKl8WOdGJFpOc92WL7gIgQ647LlqbG17Rk/yJQlH
 neYUOHhvvGQIMi5TKhRI0JNCSYGoENGY5x0jAgwQ6Hf9CxAhL9xermGe8g3H2PQIT9fy
 fiY8+Y2udJZs9gvICiOWIfP1sJBwnCE71pEzKLjNIR0gnyybmvW6Nkj0Fb27C2oZwmDI
 4Fl+R92ipQMA//vgG8TZhhpB09d/EVbvoD8krLXfMcpeehna/otl0Ma2FG0FcQobyFYF
 FxwyaRpugNBvPY7svzr8wQlAIID6Lur/alRz1tlUXzcnxddDJOx/97husV8MwkcSaHPs
 6CiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cno2ECwsR7ktzkhE8ZG+zagDyVBGqxsGXUAhcQLNUik=;
 b=YlA7vGWU5LIfAp7IUF0xSzU6ShwqaNofq9X/nOBTiI+Hce7kl8sXUO3zADOln2QUot
 8m9MCRcMMlJ58+JixG88Jz8CiDa81b3/xVHXtj0kH/2g79qR1Ak3NGaoBazu+r9q04R2
 2dw/1M4pRhR5I3AnG3PqW4+x+3ny/kYgjlagmMeB9mbKPqfBRbgJf86IPxBIBpGDN+MP
 yHPe1ysK7PkFEtj1BuLaNm1Oqn3ztYCgExC8hWzCInvUrS/pVn2HmbKq4fdXoHsZlwuR
 WXWAEcvqzLero1i6tz775oLixlmDq5iN1KmWkrb1NTocYLDlOipHIFiWZf44/qAV+jOT
 ZXSg==
X-Gm-Message-State: APjAAAUaUMPM/yEE7P9XxpewLksEbRWo/5k+U/jeR4B204Mrd0v6Xz7Q
 ElsFjVV6cmdbuzjFhCOfql/3FDZD5MY=
X-Google-Smtp-Source: APXvYqwGRMkAuOjYoyDrFwzxZyfjpTxiuCafEzdImlnPtDUvjX5wsCVWuOk5HUGaP2V8LEW20P0e8w==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr7337741wrq.332.1566110402100; 
 Sat, 17 Aug 2019 23:40:02 -0700 (PDT)
Received: from cloudburst.Home ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id r5sm9015435wmh.35.2019.08.17.23.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 23:40:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 18 Aug 2019 07:39:56 +0100
Message-Id: <20190818063959.14533-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v2 0/3] decodetree improvements
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

Changes from v1:
  * Drop unintended hunk from MultiField constructor.
  * Typo fixed in ParameterField documentation.

Blurb from v1:
  These are split out from my decodetree coversion of the AArch32
  base instruction sets.

  The first patch has been tidied per review from Peter.  I now
  diagnose nonsense fields containing no bits.  I eliminated the
  unused integer argument passed to the named function.  I improved
  the documentation.

  The second patch is new, a suggestion from Phillipe.  This then
  enables the third patch, tidying up the existing usage in riscv.


r~


Richard Henderson (3):
  decodetree: Allow !function with no input bits
  decodetree: Suppress redundant declaration warnings
  target/riscv: Remove redundant declaration pragmas

 target/riscv/translate.c          | 19 +--------
 docs/devel/decodetree.rst         |  8 +++-
 scripts/decodetree.py             | 71 ++++++++++++++++++++++++++-----
 tests/decode/err_field6.decode    |  5 +++
 tests/decode/succ_function.decode |  6 +++
 5 files changed, 79 insertions(+), 30 deletions(-)
 create mode 100644 tests/decode/err_field6.decode
 create mode 100644 tests/decode/succ_function.decode

-- 
2.17.1


