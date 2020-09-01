Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184DB259816
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 18:23:05 +0200 (CEST)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD93o-0002Rx-4k
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 12:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD91g-0007EC-Dz
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 12:20:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kD91e-0006rd-9P
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 12:20:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id e16so2228033wrm.2
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 09:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r+ff54JFzVZA1xf/CtI0lcOTvEDmVsQUJVgQUJBztPY=;
 b=J0StlPXjbXnd5JPnGj/VHBPTeN8zCva7KqMyfPLkBENc+feP/ay0ssXWhCkVcyd8u3
 yuP2rHT9SN3sCi2B5/gB5b2LprCXMx0ZuVhtmwyk0W845C2F3cBXa0vJnr/A/GSdx+ph
 QUDm5FnVKaU2MUU77W7Ql+9sTmfRyHCW6WOz3/AKy9uVYudMck3J+esxvhf9ojZ3UYe6
 YOX89FIjLVHfWlD/nc9QxgI6GOF433Ci8QlHNJOE41E1i5yZhdAHh3FD+1bijJZ5pbxn
 lkDW4SH9vsfvIaFYfo+QnrOACs6UkmQSvv9jqGUpgJALnec7BPnTDu5NhO7lxZksZqWt
 d0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r+ff54JFzVZA1xf/CtI0lcOTvEDmVsQUJVgQUJBztPY=;
 b=pYa1TIwRT7jCTJDI4mFfv2VvXXLv8NUx89c7+K+0XqLxnP6Mz0hjwpA/tCxQwHw94J
 6oWAm9cyHyLE84Hr3LMMvnovuIQ00wKB9V6Laba9IWfMjbD2hqZBHEycfVhELZXiWsJP
 kZjNCXk38MHIu8umApaLUyrYkW3cG7xDlrEa2N17znNFzSWMsEe5lvSbV7/WstXQ7+Ki
 dgCETPDu0bxkwLkQHhTMbq2BLDpigRxI3CUaH338tiQ4X2WhLGvxY2vN5EesJh9aZ1Wc
 FIckB4JTI1NbiAdAVOk9BtWlxSlkVWk/BnHgLyhoVD4TpoJad78F43+cHV53VEQ6CFLa
 xUDQ==
X-Gm-Message-State: AOAM530KcpBzVQ7ucAkwS2EEtfnRCMzI9MGiNHZ2WaVIwhtoUjRRR/Ye
 kh1Im8X6BYaMHsuXp5z1xD84mw==
X-Google-Smtp-Source: ABdhPJyOEjzyA79UXpcz4qPajS0mHCWTEWfhNCx+iITLIMeHg9upGiScBes3nw2csKnCYkK9h8Oj4g==
X-Received: by 2002:a5d:4e03:: with SMTP id p3mr2700310wrt.354.1598977248427; 
 Tue, 01 Sep 2020 09:20:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c10sm3145097wrn.24.2020.09.01.09.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 09:20:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RISU PATCH 0/2] arm.risu: two minor fixes
Date: Tue,  1 Sep 2020 17:20:44 +0100
Message-Id: <20200901162046.32670-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are a couple of minor fixes to arm.risu patterns.
(They're a prereq at least textually to the fp16 arm.risu
change, and I should have sent them out with that but I forgot
I had them in my patchstack.)

thanks
-- PMM

Peter Maydell (2):
  arm.risu: Correct VLDR/VSTR U=0 patterns
  arm.risu: Fix typo in VCVT_B_TT pattern name

 arm.risu | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.20.1


