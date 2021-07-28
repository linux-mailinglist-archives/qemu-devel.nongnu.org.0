Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60D43D9039
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:18:36 +0200 (CEST)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kOJ-0008Nv-R6
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKu-0004LI-Ts
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:04 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kKs-0007SX-PC
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:15:04 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f18-20020a05600c4e92b0290253c32620e7so4213407wmq.5
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NrcePF1tYZjOCclgrrj9E/nGibqhnlfkFdHWKICs6d8=;
 b=Jp0DfaSqe6gmPFV8NSpojInYfQ+pnlt2OajTDuwBRf3zVMU0k/ZRJRHk3v/LYGsn9L
 kB+zWOWcO65agMvBPMFGxjAKsHB37X3uYOUU3nCU1XD3DQPC59mG5HQG+C4XFTbK5GhF
 QM0bWWeUeoERGlvnMnvAivXtUiyoyuOb3QElOvIph65R6LOs3rxMvqk4fZB9oBgN3aOu
 uANwvXboF/NY2ZmgSawV85AdemvFvcxyEZbyvvMnk5vJLjlY+cf6CCOgVLX+tx+y07+C
 9mRrHf1tNu+DcXHAcZu0ltPFXS0Z3ihanD2kq0APIj6d0OEPOGHgXJ8md6xlbG8PGIBJ
 L+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NrcePF1tYZjOCclgrrj9E/nGibqhnlfkFdHWKICs6d8=;
 b=kQizsMCBWVyBxzK0rPQ4QxbryKylGKNdi3cH9qzsPDNfqXd8XaNFH6+v8Nh6X87sWC
 DngDqLHNOA/ug/ecGPAFTLu0Ccp8rduqUZiKb1TOhktK9QKM2PM6laGbSPJiPy7jL49U
 PRnSyrcVbBEybELHGzIjNaKgCRmx+F0UlOdKjhCiQIZbP2SkqZSWuH50GTVrE367EyaV
 RU+OpDeCaIKRNWS6g1YD5POVJWIIaRqx7cA3L4UrXa7cEMy1tlBlzdYTTGkKNbXsloEB
 ibvPPTvx+t/Mg2bhhpRHG4HVYWB1y2bOCn7AecRpketUOe9Y7x+4es6AC9e9TqYj34pl
 wY1A==
X-Gm-Message-State: AOAM5315A/6HcS1vjDG8hdTI9q/T3961jDTzu48z9/IMuB5Vak6PX03W
 iJ+qA9HuFm1Y/1gTB/g1hgpwJywHYvGqAA==
X-Google-Smtp-Source: ABdhPJxaNjA2eWPM2RAZSblAQmGdK8qoriivQ9z3BcCNY1ZzHH3QKOmzbcrk0IsathS8jvJxSgsnLQ==
X-Received: by 2002:a05:600c:4308:: with SMTP id
 p8mr9912019wme.45.1627481700985; 
 Wed, 28 Jul 2021 07:15:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm7598247wrv.20.2021.07.28.07.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:15:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] docs: Move usb2.txt, usb-storage.txt into rST manual
Date: Wed, 28 Jul 2021 15:14:53 +0100
Message-Id: <20210728141457.14825-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a section of the rST manual describing USB
emulation support; this patchset moves the information
from the text files docs/usb2.txt and docs/usb-storage.txt
into the rST manual.

The changes here include reformatting into rST and a little bit of
wordsmithing in places.  I also added 'format=raw' to some example
command lines since QEMU now complains if you don't use it.  I have
not attempted to determine whether the information in the text files
(last updated in 2018) is stale...

thanks
-- PMM

Peter Maydell (4):
  docs: Incorporate information in usb-storage.txt into rST manual
  docs: Fold usb2.txt USB controller information into usb.rst
  docs: Fold usb2.txt physical port addressing info into usb.rst
  docs: Fold usb2.txt passthrough information into usb.rst

 docs/system/devices/usb.rst | 225 ++++++++++++++++++++++++++++++++++--
 docs/usb-storage.txt        |  59 ----------
 docs/usb2.txt               | 172 ---------------------------
 MAINTAINERS                 |   3 +-
 4 files changed, 219 insertions(+), 240 deletions(-)
 delete mode 100644 docs/usb-storage.txt
 delete mode 100644 docs/usb2.txt

-- 
2.20.1


