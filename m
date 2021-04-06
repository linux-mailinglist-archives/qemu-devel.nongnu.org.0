Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640F355599
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 15:46:15 +0200 (CEST)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTm22-00089L-20
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 09:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lTm0U-0007eu-IG
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:44:38 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:45006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lTm0T-0002LI-4l
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:44:38 -0400
Received: by mail-qt1-x82a.google.com with SMTP id y12so11122254qtx.11
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=AWqSGgX2Xki4kPup0gpkNQ9lmtywOk+g8SX0J455Zk0=;
 b=evGggzDV7VHpMzjGEtpBFutiGDa9NcI9RTkKn+n842I7SsQIX/EkzHJ3iQQSCFnaiU
 S1ZVFtCWo0JYLoh5Hihy2flaOX6910oNZuNoZKM3LKCjFRbDJ42XHijAkM3UtAYFNKTc
 KK2EFgKYleEk72kkG/gxlMy89NyOF+6r10j6Az4CDFPY3d1n/Lq8yYDGYhFSEqNkt9Zk
 Zys7vFGweyrJjB2MtOFh4i6Tf0RLVbKnk0xJ2RZHCsU+MmwauvekS0wJrsi7ETc9qMyn
 6C3oY2oFc3j2j2tfvnotZJFZHN7e1Jt6LyfolFmyklDPmWKDrl/qbPIue/JoYB3IFibb
 VE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=AWqSGgX2Xki4kPup0gpkNQ9lmtywOk+g8SX0J455Zk0=;
 b=CPGcfvCyvkCWeUYvP/xl77JmuZBTe0Ymt8Qw1HS7WTmdVwMcP3PPixgSYu9tMDxPLb
 caBAdZ6jr76nlrBFX8cVOAsgAhsuWSr/3KK7PKizR7d1sRqwSGq4MtcIwIlKAiTCVDQA
 Ym8cVoKJZn+/f6KXp89UiG9HuZQAehZruD9ZQA52+Mx/uHb8dWsVhNDT8AEzQqKsSAYJ
 Kcx7nQPDTPYlJ/l2w+snJC3w/D/tGXo1LB2NkXffhgE3a+H7ApISN76Pt194gF56DoPe
 dnaUa/gC5UIrL8Pw0USRMefXysPddWsTAuJjX18fn4DwE4qMJRruq3roQWzYhJSS8/7P
 ucpA==
X-Gm-Message-State: AOAM5302h5pHWNAZpMrjvV8b3soIwfUkyPIXnN9zpT4qU2oBJoq2Hb8T
 bq9x4c8MsxBH1/ft0QamCOV6y5FkgwU=
X-Google-Smtp-Source: ABdhPJzKlCHUngU/zUc4HlnsPPfljcjDdO3N//mhnyk5R9zXppFOSlLQ1PL9bc6A1d648SuK4ooJLA==
X-Received: by 2002:ac8:5fc6:: with SMTP id k6mr27586339qta.206.1617716675389; 
 Tue, 06 Apr 2021 06:44:35 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id o7sm15881244qki.63.2021.04.06.06.44.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Apr 2021 06:44:34 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Mac OS real USB device support issue
Message-Id: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
Date: Tue, 6 Apr 2021 09:44:33 -0400
To: gerd@kraxel.org
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82a.google.com
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
Cc: QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

I was wondering if you had access to a Mac OS 10 or Mac OS 11 machine to =
test USB support. I am on Mac OS 11.1 and cannot make USB devices work =
with any of my guests. So far these are the guests I have tested with:

- Windows 7
- Mac OS 9.2
- Windows 2000

I have tried using USB flash drives, USB sound cards, and an USB =
headset. They all show up under 'info usb', but cannot be used in the =
guest. My setup does use a USB-C hub so I'm not sure if this is a bug =
with QEMU or an issue with the hub. Would you have any information on =
this issue?=

