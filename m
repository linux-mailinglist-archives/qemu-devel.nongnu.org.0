Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2296E4D9791
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 10:23:59 +0100 (CET)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU3PK-0003CU-7z
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 05:23:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2ls-0008Pj-Is
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:13 -0400
Received: from [2607:f8b0:4864:20::102d] (port=43635
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nU2lr-00052S-6f
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:43:12 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so1781523pju.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GQcXlmS9K62wJuAQUabURuXRQcJ5mQNx97YBkJ7y2uE=;
 b=zBu1VBADxbp71pL8DbGmz21n0w4+PeKgbsnAqUctk/fKKiwrr1tXPThvQJTjrccOGV
 gggBs+PGIsqTGkMxqEhYJbYJFM7N4V1WJqwqhJJCduNBS4xkzBg4Iv97h+252grnAxUe
 8HJDySmAq7BlcCRA4PJPyGjtNfFVy71EnEi+mcQ79zW8zgJ3mZCq+Ba7TczG91DlT5BW
 EUnZtkvQKAx45ABeboPmHwX6O81Yfc7ZOU0lmwL2w71B1G2Tt9y0AEDgcN6DYe3PWohS
 lBt78E2faQZHCLZYHqoiFPVz4+dBpPTVU4fkuItadiGDYCSHBz2NtmyZuw1rPSsRYT9k
 He4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GQcXlmS9K62wJuAQUabURuXRQcJ5mQNx97YBkJ7y2uE=;
 b=xEkm3CwHsY0j56whQQLYN4DWocf2MNKsrZet0BtPQZ89ikZO8LZd7E4FvPn9pyAzc0
 KQ4hsNhz/HZDJprfd+8M2CaB3tDUbi4GeGcrdSzNgn4gkWxMLjoNS8u21nyFfv+JiLf8
 e/gaQmYpOqXkDbHc34euiLtznGDMP30AdB/MgBf1kWWUm/hEOrMUNqYIzNN3aL2gxcAr
 BrQBNFwZBeArlJD/FdPiCV6kylqItongqOV3IWsdJkwyGUCMBPgGTSwPiSbMdTINCuJ6
 3i3SbmYpGiRYpGMMl5i3EvlBUWayBkjGnXAtqpSxidJVz7g1e8w2+f5tOQoPTznQtXuX
 adgA==
X-Gm-Message-State: AOAM530YtvTuhOB2z2nUm83rM4zaKY4eLxPF2Pe+PDEDhcoY4zDhWHov
 1z0Rs0bQ39geEZequWZPxLZLSbo4eb7Z2w==
X-Google-Smtp-Source: ABdhPJzJCT4R8vw8/IjtghT56rUt2Vy1cYunYAPDPrmbh7D4PATq/1pwbVVP4TIF8iXaMrQFKkWBmg==
X-Received: by 2002:a17:902:6ac7:b0:150:24d6:b2ee with SMTP id
 i7-20020a1709026ac700b0015024d6b2eemr27473706plt.168.1647333789566; 
 Tue, 15 Mar 2022 01:43:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm2233762pjb.27.2022.03.15.01.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 01:43:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] linux-user: signal mask fixes for pselect et al
Date: Tue, 15 Mar 2022 01:43:03 -0700
Message-Id: <20220315084308.433109-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out some helpers from sigsuspend.
Reuse them for pselect, epoll_pwait, ppoll.
Fix an alpha buglet found on the way.

r~

Richard Henderson (5):
  linux-user/alpha: Fix sigsuspend for big-endian hosts
  linux-user: Split out helpers for sigsuspend
  linux-user: Properly handle sigset arg to pselect
  linux-user: Properly handle sigset arg to epoll_pwait
  linux-user: Properly handle sigset arg to ppoll

 linux-user/signal-common.h |  26 ++++++++
 linux-user/signal.c        |  23 +++++++
 linux-user/syscall.c       | 119 ++++++++++++++-----------------------
 3 files changed, 92 insertions(+), 76 deletions(-)

-- 
2.25.1


