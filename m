Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D080D44D58D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:09:03 +0100 (CET)
Received: from localhost ([::1]:59174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7x1-0007nE-0Q
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:09:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v5-0004xi-4P
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:03 -0500
Received: from [2a00:1450:4864:20::42e] (port=44838
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml7v3-0001iz-3b
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:07:02 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n29so9110304wra.11
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gMRuO5XLSwjHrhtFj2+MvlbXZKFSLLxVaLyxzEOBhp8=;
 b=PFY+b6p7ausys1GoYT+Is8w6Eq7wBmSiV7oXdkbKD3SLUdQZiqn4H7hGV+dwEo4Nm9
 Z76ZXzzIv3XuM8gz9l8BZGsfMtx5B7oGyuRedBHTH073NCaDRr0mzkJcYVcis/0OIMCc
 uBk4oLk06UebhNLZUdAHJOX9+AdyUbOJzT4glaeR67iT+6/8hI475p9Tj7dNNZ1Dautm
 0zpAp2hF26EzReuU53ZUk7kT5OlWt6d1hhH1MtZgHNdL7+uFgRPm7+z2f507At94fqQ9
 wswsEnNd7z2OMsa/CMKquxuAfwA4mQ8a69S1460WIt7Uegm1lAR8C0vfMSsRdycRI1vb
 KZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gMRuO5XLSwjHrhtFj2+MvlbXZKFSLLxVaLyxzEOBhp8=;
 b=18KnyDqKLAi81ejIMoVW4JiTX1tHD0k1wYdPsDFYKJ7plfTaZHcxxj301soV66Hwh4
 p38Z3+T/tc3b1JFqthRjcwH3x1ZPA4OjG0Kfe67YcgMBjtz/AxNfXLKnwidvyTnXPl9o
 S501Dxl+85jrG4hcO60f9fRv6G+Y4c/LHeyV+09FN+NJXSZ63U+AP54QS57dI2Uu2bX6
 jJ2Wnu60l44XI44wWeg/n//JGuUdPCOMusIRzShtWV+QpDC8l8cscBCBS7VZ4LwLMJAR
 uRztiLQZi2qQAKriIA2BvEVZab8O4p3zXSwznGFmE/vhPd7QFiPtOsowH0ONPRKAHqdF
 dffg==
X-Gm-Message-State: AOAM531BwGTCE7ZBOTPc40DhNGDZy2UC9PmtDKMDdpiWCkF/quDFbct7
 w6bBvMAekUMONac2VW8nryBIaRSi6gPvg5BPplU=
X-Google-Smtp-Source: ABdhPJzYq9YMGV3M1a7/joe+pyMiIDuYV26ETWbJ6QbZYlG3E5m4KUzifWWUNd6d1U37SdEQLdt3Bg==
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr7615956wrs.272.1636628818700; 
 Thu, 11 Nov 2021 03:06:58 -0800 (PST)
Received: from localhost.localdomain
 (10.red-95-125-227.dynamicip.rima-tde.net. [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id j8sm2536684wrh.16.2021.11.11.03.06.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 03:06:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] tcg patch queue
Date: Thu, 11 Nov 2021 12:06:52 +0100
Message-Id: <20211111110656.237727-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

The following changes since commit 1b9fc6d8ba6667ceb56a3392e84656dcaed0d676:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2021-11-11 09:56:22 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20211111

for you to fetch changes up to d58f01733b94845b0c2232018a2bedb6a2347ec5:

  tcg/s390x: Fix tcg_out_vec_op argument type (2021-11-11 11:47:58 +0100)

----------------------------------------------------------------
appease coverity vs extract2
update docs for ctpop opcodes
tcg/s390x build fix for gcc11

----------------------------------------------------------------
Miroslav Rezanina (1):
      tcg/s390x: Fix tcg_out_vec_op argument type

Philippe Mathieu-Daudé (1):
      tcg: Remove TCI experimental status

Richard Henderson (2):
      tcg/optimize: Add an extra cast to fold_extract2
      tcg: Document ctpop opcodes

 docs/about/build-platforms.rst | 10 ++++++----
 meson.build                    |  4 ++--
 tcg/optimize.c                 |  2 +-
 tcg/s390x/tcg-target.c.inc     |  3 ++-
 meson_options.txt              |  2 +-
 scripts/meson-buildoptions.sh  |  3 +--
 tcg/README                     |  6 ++++++
 7 files changed, 19 insertions(+), 11 deletions(-)

