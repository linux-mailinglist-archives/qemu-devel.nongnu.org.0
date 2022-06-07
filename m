Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F7E541483
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:18:48 +0200 (CEST)
Received: from localhost ([::1]:47706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyff5-0001LL-H7
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb2-000620-WF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:37 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:45849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb1-0004Mb-8X
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:36 -0400
Received: by mail-il1-x12b.google.com with SMTP id a15so15047654ilq.12
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/0TbLP92AxhBtlV/QTMwJbwW+pTfhflz+AfVe2UYl0=;
 b=pYsJ63+WzeSXgUqoiib6vhTtSfcSfq7NUdahSVWtyMF+5U14dvxyf18Kv2lilL2l3F
 qVW41Cd5qkdLJOL1U2dh3tSpThiSS0xT4HMqr3EZl63Rsb6NrSAqmlVe/zqcRH+KQzaV
 tj83mmHyy/FMsoxIIr2wFaZEdEXyavdbL41iiP7y+2UwqAfanMnP2DdCkQEN+zpZoTLX
 MWD4Pl+y7XCCD5V72lRfrEk+OfHoUZORrItui+h4JPC09/BxUj5Ab9xpjNMiayAu6yuJ
 CCe9VUrqCDbqQPcGG0ZsOByS8xsD3vP4/SciaxZljUJAo2bJlB49jFN7/KYIgD7yjMFI
 9gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/0TbLP92AxhBtlV/QTMwJbwW+pTfhflz+AfVe2UYl0=;
 b=jbtTkj4jxAAzakjR2CdZ75DNm514A0gRGUiZ9pRsDBHcf75aox62R8dvTXMXIsu3a8
 s7TjWK7fk/979cm3ePYm5f6lS5JOAmj8swevIyp9hRuCBjI3g7FpED4GjqBST9AYlpqE
 nIUFCSqbNqOT3tMKsJyrhci4XP9JfmEcGEmikNi9QUyUzIqOcm5BGrzHeLIDypvW+p95
 ZIfMoWi4Ow0nQ9Q+l8ED83kDvK98BpFcGHAbROnsc14M7rIfGz6TSbyDt/bUp91cETCM
 tb8kyhDXtykwA5a/29mVk+9zu+uphItj35tWUt1T6EAoYbrUAOaf3Jj8VCAJql2pzxZI
 1LfA==
X-Gm-Message-State: AOAM53222DgFS2kmTfQLwkxuSAxZavJgBwWuwUOfIqDuOBRhsTp9l15q
 gDjCM50YLnStrpVlBJf3omtEa+O4UTrO9Q==
X-Google-Smtp-Source: ABdhPJw13qtM0E1IsCyN9326adVZxYUz3GuDvOHW2ffVlacocau3Y+U+lwA8sjiYsoOoSP9yuSCLtg==
X-Received: by 2002:a92:d1d2:0:b0:2d3:9ab1:da45 with SMTP id
 u18-20020a92d1d2000000b002d39ab1da45mr17241690ilg.223.1654632872705; 
 Tue, 07 Jun 2022 13:14:32 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 cp5-20020a056638480500b0032ea3ba170dsm7053024jab.86.2022.06.07.13.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:14:32 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 0/6] bsd-user upstreaming: read, write and exit
Date: Tue,  7 Jun 2022 14:14:34 -0600
Message-Id: <20220607201440.41464-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series of patches continues the effort to get system calls working
upstream. This series was cleaved off a prior series to give me time to rework
based on the feedback from the first time I posted these.

These still need review based on comments from  Richard Henderson

       o bsd-user/freebsd/os-syscall.c: lock_iovec
I rewored to use g_try_new, as well as fixing bugs in the 'after a FAULT
handling code' Created a common routine to cleanup after errors that can
be used for the unlock_iovec.

       o bsd-user/freebsd/os-syscall.c: unlock_iovec
Fixed the error handling to be consistent with a normal unlock_iovec.

       o bsd-user/freebsd/os-syscall.c: Tracing and error boilerplate
Created the wrapper function as suggested in prior reviews.

The others were reviewed before, and haven't changed in any real way, but more
eyes likely won't hurt.

Warner Losh (6):
  bsd-user/freebsd/os-syscall.c: lock_iovec
  bsd-user/freebsd/os-syscall.c: unlock_iovec
  bsd-user/freebsd/os-syscall.c: Tracing and error boilerplate
  bsd-user/bsd-file.h: Add implementations for read, pread, readv and
    preadv
  bsd-user/bsd-file.h: Meat of the write system calls
  bsd-user/freebsd/os-syscall.c: Implement exit

 bsd-user/bsd-file.h           | 164 ++++++++++++++++++++++++
 bsd-user/bsd-proc.h           |  43 +++++++
 bsd-user/freebsd/os-syscall.c | 231 +++++++++++++++++++++++++++++++++-
 3 files changed, 434 insertions(+), 4 deletions(-)
 create mode 100644 bsd-user/bsd-proc.h

-- 
2.33.1


