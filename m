Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138653DBD83
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 19:11:56 +0200 (CEST)
Received: from localhost ([::1]:40260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9W38-0006Kd-Cm
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 13:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m9W1L-0004Hn-05
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:10:03 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m9W1J-0000Hm-GY
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 13:10:02 -0400
Received: by mail-qt1-x82c.google.com with SMTP id d9so6878061qty.12
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C58OJrotj8J+CqNFg+kM81VXtKtTI5zhtYA9cPYrF7I=;
 b=Ll6F2Coz4NXABlglOoMkpkETf3TnTeq/DbmMTnlyKK41hBGwXT+gcedCY0hQuQPpP4
 TrgTOOGrGZG4q53a/xgJNYdWd+jSpdl+o6xprYY1jiJwV6Y6enG9cLyowEmH/6cSH1h0
 PsSRHlu/LepuwfUU3vRZEBZfiNIj7oXO6eLQ7QEuz4aReLOutQQ6mwXjgtUfStnU18MJ
 NalmPcQ2PaasHkcmRpXEtp1M81n0bJGcDGqkJSN1qBRiyvGzncAc4wUo6BceDKNlV79/
 lErKOxoAAF6ftm/64/JYntnF4wW9bInQyUJ+9xj+Sx49ObSu+YDqoRJCQGxhJAM3w4f6
 VbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C58OJrotj8J+CqNFg+kM81VXtKtTI5zhtYA9cPYrF7I=;
 b=pII4dp4RMoK1Wl1GplWZ0M/MnYmVbScRjlxvP+/P4+vVlvGUPxC9h4FNOxcMtF/H/8
 wOrGShZnLLGbjcnQlIjR1ukzDw+PpEsTulsZ0i+mRkNXszB0ulESpl9gZCi1HROrXDuB
 F0Fspugboow7mQ9VUMn+bTeOa4W5uNHwS2P64e9IvLPW2TStBAlt8gdpTzFfdw0iq2pX
 EIjYp9+4FmZSW3zNPh78JmmaQxmFVHrmMQbLwX1gKKWt37em+OPwbGa44XU4zoLrFQH8
 TL6WR1grr4IuiTPOYI/zf7NvIJXisak5xZz7WWocQ3+OV6x2sfWYyzeEU6UqEpNzJPVZ
 miUA==
X-Gm-Message-State: AOAM533Ps4Cy4gKzA1zvABHUtogyilU7HE4jBu+CwBraoDtAj8kgC2Jj
 wxyuDZu2z3sg3o4gb1Z+JuM=
X-Google-Smtp-Source: ABdhPJyiQ8Q+i1/mae+m69mmxdolVf6ZlX/gQ8RYfBfqkpkz+u6s+XqHRA0Cc1pSYSD6sv1HUmszaw==
X-Received: by 2002:ac8:7956:: with SMTP id r22mr3170082qtt.300.1627664996644; 
 Fri, 30 Jul 2021 10:09:56 -0700 (PDT)
Received: from localhost.localdomain (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id k15sm1227856qko.84.2021.07.30.10.09.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Jul 2021 10:09:56 -0700 (PDT)
From: John Arbuckle <programmingkidx@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>,
 QEMU devel list <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] cocoa.m: keyboard quality of life reborn
Date: Fri, 30 Jul 2021 13:09:43 -0400
Message-Id: <20210730170945.4468-1-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches can really help improve keyboard usage with a guest.
Based on patches by Gustavo Noronha Silva <gustavo@noronha.dev.br>. 

John Arbuckle (2):
  Add full keyboard grab support
  Add ability to swap command/meta and options keys

 ui/cocoa.m | 178 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 170 insertions(+), 8 deletions(-)

-- 
2.24.3 (Apple Git-128)


