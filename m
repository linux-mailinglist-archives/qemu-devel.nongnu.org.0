Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE41256039
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 20:04:46 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBik1-0002sq-8Z
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 14:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBii9-0001KU-86
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:02:49 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBii7-0002H4-FK
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:02:48 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y6so17355plk.10
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aF348TVEVtewrTCX73GHudwGFAOAttP72aoJbt1/ORg=;
 b=HDuUos9E5WZPKYOvfQgTXLqjekyKQ95/BsVDz7QplhkIZdRdSnR+VVmHpFDs2OJtO2
 sZefC7rOFA7X9wDIBo21IWWQ+56Kh4eJlXj5QKCPGNPE8XL4C7En5Lh1WX+8tJKGNBJ9
 JbJhe//CPUt/N2z4IatFcEPHJLEeoZnsyOyiejCkQaf4rw0J68Uc63CxmTLXbuL6Tv6/
 epTgAkMw4Jdyw5cMKVgiTY23gKcM5OvAtrMBTxg+2UsfQ3RRZ34AhQxVByOp4DdrcbPa
 8stjgxGp4NrRygNUHDeVc2iQVZt8ulJh6kZUUBrnBNm6nDc75Bhj4d9wak2kd+1BY5r4
 imcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aF348TVEVtewrTCX73GHudwGFAOAttP72aoJbt1/ORg=;
 b=sDtLaU689jvpTbiKUcIts49ZIxJPFD5uvojyvPG4Ad67rRC8O0i15Pt+cbHPk2bijf
 wUgqN+XeavWtCMsyY4VG4wgYW+lTQRVAjBOlcLn6Ngh4ZFd3JBKd6g2+hNGhx4AJnb0g
 /hZ3oK73Si7RbGOGqHOg3YrwaCfPQHx2Ku+cUHEDfHeFN5scK/rPc/AtZ/3sMpRx+ApI
 oV7R1i35rZmU3oNeL5e0n2S32B43iDHKBPmolQHZGQ09nanPkDxK3BAVJ3FWG+7CLu9P
 ppopB6R2mE5fWKTwvQkJyFLP9hdXftP2j5R/RUmgsLM0Coc7XYFhHjW0osL2eOoPLQd5
 nJeA==
X-Gm-Message-State: AOAM530VmpsnonAu4XahG3mZSyM95xMJTgBPp9ltBwffIpL/fAIhI1eM
 Ah8fTJJ1oOv6k6HpTectqLqGa1bIKw7XTg==
X-Google-Smtp-Source: ABdhPJwhYLJMtlBvJDLLTmOEa11LNx37aStAmAC3bHVx7cHTrdWejxArIahrpsGSMyflIHmn3vI66g==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id
 mw15mr200980pjb.174.1598637765234; 
 Fri, 28 Aug 2020 11:02:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w14sm41656pfi.211.2020.08.28.11.02.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:02:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] tcg misc patches
Date: Fri, 28 Aug 2020 11:02:40 -0700
Message-Id: <20200828180243.443016-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A couple of changes I'd like to queue for tcg-next,
which are as yet unreviewed.  The final one has been
on list before, as part of the sve2 patch set.


r~


Richard Henderson (3):
  softmmu/cpus: Only set parallel_cpus for SMP
  tcg: Eliminate one store for in-place 128-bit dup_mem
  tcg: Implement 256-bit dup for tcg_gen_gvec_dup_mem

 softmmu/cpus.c    | 11 +++++++++-
 tcg/tcg-op-gvec.c | 56 ++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 61 insertions(+), 6 deletions(-)

-- 
2.25.1


