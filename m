Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36EF46DEEB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 00:14:09 +0100 (CET)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv68W-0007FM-Hr
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 18:14:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66R-00056k-IK
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:00 -0500
Received: from [2607:f8b0:4864:20::1034] (port=46725
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66P-0004mR-Eb
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:11:59 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so3344583pjb.5
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 15:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hX/+5BRd2SnWuJl3tr+kAwTDbd9YV56sDgFzlRQkRU=;
 b=TLaRDobnZTMuNxm3v5It9FP0xwXjwuYLizvFi1SVnXEa914sVh3DDgDIoCproGV4eh
 GsDmI9MStV2p1T/5pN+QOORjqYDfkvXkBE9r5+ODY3oeW3HT+pcizzWT2gtfUiope57U
 vmJfyPMAhkm+lqKAZjduRUfLSl1AdDXGGgIGsX4hPv5NxKie2W9kHteeDcdjxj6JiIAt
 X4rJG5o9WY2gaSzmg0bMvb1XvPCjheY8Ddy31cIalCYwVvoyyA84QPzkh7yI4IhbGbBn
 3qlg7egXreILE0+z4MoE9Ao+9hBiSPj2il7XThgzTlBehK+/5OjTtaV81n/1CZkRZmWE
 jGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hX/+5BRd2SnWuJl3tr+kAwTDbd9YV56sDgFzlRQkRU=;
 b=mxl6BMn7f2gK+q+pSbDYYu3jyynctPNPLQzS9U9Ih7EEjku6d2W+pa9cDv+OLAJAOW
 d39gOewb3p3nAgjU3ZGGaUYCRigy1PTGp0V5x703HmfPKJh0ulokTJUvS3kkZ2uzh32h
 a+M8JEw+0VGclFHWcghn9uxijnLbaPX96E8G/ONGLNUoGDDgYIZkO8KhooTOhCxRk6Yd
 ORiF1XyTGMAkKfHzoCdtrSvBVsbyS6W+FNnBaUv7M2uryFrGB9k4hjDvHMSEvqzs2z2z
 N0zWRLAlGHwqepcM5lO90l7KymSwuEaZi3yX3Q5j3GCR3pqOLYlbERAb10blXEDqYVvS
 v4sw==
X-Gm-Message-State: AOAM532QsHUNFk2fX1qaDMJ3dlnTdJCf3h6OkdpuX6W4dwUd0OjZ2QbQ
 m9DLigCRKnJ6q4gzng9za3liCT5qULutCw==
X-Google-Smtp-Source: ABdhPJxBr/rZqxNndy3nEkMjHcrZJOaTHomB7X95FGktF7s+DTOZnrg7NgNM7TMl3f+P7ZVKXs5Uvw==
X-Received: by 2002:a17:903:32c7:b0:141:eb39:30b7 with SMTP id
 i7-20020a17090332c700b00141eb3930b7mr62323487plr.41.1639005115629; 
 Wed, 08 Dec 2021 15:11:55 -0800 (PST)
Received: from localhost.localdomain
 (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id k15sm3301062pgn.91.2021.12.08.15.11.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 15:11:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 0/6] target/arm: Implement LVA, LPA, LPA2 features
Date: Wed,  8 Dec 2021 15:11:48 -0800
Message-Id: <20211208231154.392029-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These features are all related and relatively small.

Testing so far has been limited to booting a kernel
with 64k pages and VA and PA set to 52 bits, which
excercises LVA and LPA.

There is not yet upstream support for LPA2, probably
because it's an ARMv8.7 addition.


r~


Richard Henderson (6):
  target/arm: Fault on invalid TCR_ELx.TxSZ
  target/arm: Move arm_pamax out of line
  target/arm: Honor TCR_ELx.{I}PS
  target/arm: Implement FEAT_LVA
  target/arm: Implement FEAT_LPA
  target/arm: Implement FEAT_LPA2

 target/arm/cpu-param.h |   4 +-
 target/arm/cpu.h       |  17 ++++
 target/arm/internals.h |  22 +----
 target/arm/cpu64.c     |   5 +-
 target/arm/helper.c    | 211 ++++++++++++++++++++++++++++++++++-------
 5 files changed, 204 insertions(+), 55 deletions(-)

-- 
2.25.1


