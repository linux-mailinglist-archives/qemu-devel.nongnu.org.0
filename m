Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AC5D6467
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 15:51:21 +0200 (CEST)
Received: from localhost ([::1]:49856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK0kq-0005m0-CQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 09:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iK0j4-0004Qc-KG
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:49:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iK0j3-0008MG-5I
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:49:30 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iK0j2-0008La-VB
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:49:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z9so19821034wrl.11
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UEXCjAhdu0FKHjjtnW1230km7QIS6Nvx34ZHiSKDVCA=;
 b=wfaYPmEBSOzaBlCum34tLZEmnxAF0N92fey+6nWelk9nyWkF5s944DK1gBx4fxqZgu
 CC6D+2dRm4yJPmcc6kvjLI6PZ0tmNcR/HjIF9st7a+oBnf0yEcNN2G5D9nY4Ca6zPZq1
 x9HUEDpeWtTH0VlbuO5ftrMjBgpH/9U/ajDyXdg4UEyi6C/OL1DhFoVdZg88fhTmFbTi
 5/HG7QV8sg+CMdAp7ItsFoCj40KjxETPtAVHzMgR9KaLD1goZipF77SraMl31rUihH0y
 4RWOvkjSJhx68vWB/TOr9/wOsW6icuzEzKIoAdUi9TkpqtAyWqyPVYftcn/Ax99ZChPB
 sRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UEXCjAhdu0FKHjjtnW1230km7QIS6Nvx34ZHiSKDVCA=;
 b=jveUNKWi/MFSebfGAniffrItp7cWkJgh/19U4GhtIVBbk+ckLSZySgHxnaecJWvlAk
 hHUQNz0hSWpjafINWPF3SAx488KpwD2+AhgtMJNkmJPM6Rl9Cn/TcRLJP9d5nmB2+Vga
 foDytc4uwW/5XxvGOundo9uztMh2sxR0dz7nsglSX/8XKx4Q0CjpYDdLSM6LN53PJkD1
 qHOupZJb2MIID8o6+kY2YyUowFcK4tq552Kx1sUB6sfW5Py0VibmJK9oropunzPXd1Ou
 pLUIUw5ZeWxsTlIADuuip43RPEXHb6JOQaURjLQZ/nxkzWTzRlwRG3SfAsTDYMQ0xCEd
 SZmQ==
X-Gm-Message-State: APjAAAWk8YFMMbV5pSTAKI2RHcQmt8ZGOjrYswQRod2w1V+5m5pcZslS
 vJCFg2ltl5bI94E1PIxEmeaGkg==
X-Google-Smtp-Source: APXvYqyvr4bSlu06amZE6EJ8vVVLcpJrhxnR4f9/OMCdz2acypCGpEKmTr6AQBMnYyxSotxzpt2ksw==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr9655459wru.25.1571060967498; 
 Mon, 14 Oct 2019 06:49:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s10sm8151719wrr.5.2019.10.14.06.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 06:49:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C9D21FF87;
 Mon, 14 Oct 2019 14:49:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 4.2 v1 0/5] gitdm updates
Date: Mon, 14 Oct 2019 14:49:21 +0100
Message-Id: <20191014134926.22308-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
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
 dirty.ice.hu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

With these changes I get a reasonably clean set of stats going back
two years and to the top 20. However most of the individuals are pure
guess work so I won't submit them in a PR without positive feedback to
it being correct. If you want the numbers to be correct by the time of
the KVM Forum QEMU keynote now is the time to let me know ;-)


Alex Bennée (5):
  contrib/gitdm: add more entries individuals and academics
  contrib/gitdm: add MontaVista to the domain map
  contrib/gitdm: add Andrey to the individual group
  contrib/gitdm: add Bin Meng to the individual group
  contrib/gitdm: add China Mobile to the domain map

 contrib/gitdm/domain-map            | 2 ++
 contrib/gitdm/group-map-academics   | 3 +++
 contrib/gitdm/group-map-individuals | 6 ++++++
 3 files changed, 11 insertions(+)

-- 
2.20.1


