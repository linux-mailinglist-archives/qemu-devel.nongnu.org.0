Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149C274A3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 04:52:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTdqa-0006mf-Ls
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 22:52:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTdoa-0005Qx-3Q
	for qemu-devel@nongnu.org; Wed, 22 May 2019 22:50:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTdgf-0001rE-DL
	for qemu-devel@nongnu.org; Wed, 22 May 2019 22:42:34 -0400
Received: from mail-yw1-xc30.google.com ([2607:f8b0:4864:20::c30]:37947)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTdgf-0001qi-7B
	for qemu-devel@nongnu.org; Wed, 22 May 2019 22:42:33 -0400
Received: by mail-yw1-xc30.google.com with SMTP id b74so1689057ywe.5
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 19:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=68GZMF7g9zHe3y0c6MgmjIQpKZhJSrYvoxbHlwqCDNU=;
	b=JlnJVM+ZST3DL9uTH1igxrO4wGmVHPNG2s+Fs32ZW/XzHvJ951sA0cmT7YvYmFRNCJ
	HdODz2VET6OxmIMWykKU2ayIIm06hZku0decCTHPm2DenoVlhMVbw6tCPo1uvcBiDf3W
	XlvF0t/O17Q7jL0Mtt9CQltv9cGnU1K/Po1vaSeGWaNS84HzyG0TZjHSEiV2RoSQPjd5
	Z2Lberdg3ws5q5EHZt9CI2mPqVbsRAqpEityjdOKTYW0FI4L1lLzJ94j0IWlt1D1HlID
	GpKx7ZEFEpeVJKu2X4tyFgTin0sTkvaWNiay5q/k+k3OD9L7miGf6bctq3uJ3VxRTJIv
	b7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=68GZMF7g9zHe3y0c6MgmjIQpKZhJSrYvoxbHlwqCDNU=;
	b=sCkXBGEVU6qLF2d2V/VaVysQ7k7LHtFL+TTvMdinIkK7a9tFy8pWqak1de38fKQp1d
	xobResYPPWn4pt0+i1Qo6MIqNQT95xu5avJ/TnX3K4EvVPUlv1cPKypo5HcjlPWjeTLf
	Gebgn+FcxBhoVEas6w4koankkniM/6jYTeQZQiYiWuVzYdL0Go8bAi9c6ibw6CF067PD
	sDomirLEwi+cNf+fQfWBwVu2+zMcHwD584yr1YfLEwPThhs6Eob/v7XhpCdiFo9zQy8q
	wLowQ1tBbcfNO+4Ug1/61y8EYTrTEMDmLlQMTV6Vs2brd8TsII6Zt0yo90dClFi8EOmb
	7Nvg==
X-Gm-Message-State: APjAAAUG7cmoBwymZYn41QChJA6hgUou4TkaRsT13b1wZLkDZnXXJcfG
	nq7EAEhpXn6Ks+h1padNme/NL/OLV5Q=
X-Google-Smtp-Source: APXvYqw96AbvXqu99X1A/sOFXy2GASKVuB4EBWOmSaqDgK1P4By0B5705CtFPR662klSpbZs+q0p2Q==
X-Received: by 2002:a81:a111:: with SMTP id y17mr16804063ywg.415.1558579351446;
	Wed, 22 May 2019 19:42:31 -0700 (PDT)
Received: from localhost.localdomain ([71.46.56.17])
	by smtp.gmail.com with ESMTPSA id
	n12sm7559320ywn.81.2019.05.22.19.42.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 19:42:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 22:42:26 -0400
Message-Id: <20190523024229.1158-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c30
Subject: [Qemu-devel] [PATCH 0/3] Update capstone module
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There has recently been some good progress in the upstream
capstone repository, syncing the instruction sets from the
(further) upstream llvm.

In particular, there are Power9 and System z13 instructions.
Both of which were missing from our current snapshot and from
our (ancient) binutils opcodes snapshots.


r~


Richard Henderson (3):
  capstone: Adjust include of capstone.h
  capstone: Update to master
  capstone: Enable disassembly for s390x

 Makefile                 |  1 +
 include/disas/capstone.h |  4 ++++
 disas.c                  | 40 ++++++++++++++++++++++++++++++++++++++++
 target/s390x/cpu.c       |  4 ++++
 capstone                 |  2 +-
 configure                |  7 +++++++
 6 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.17.1


