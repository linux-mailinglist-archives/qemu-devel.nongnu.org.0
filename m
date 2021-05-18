Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AB93880BF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:49:03 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5iA-0001ZG-GC
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZxikYAcKCjQlUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com>)
 id 1lj5av-0005iQ-PW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:33 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:52996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZxikYAcKCjQlUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com>)
 id 1lj5as-0003US-3w
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:41:33 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 b3-20020a05620a0cc3b02902e9d5ca06f2so7927872qkj.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+e+BnVIcdXQpIo13+f1rOjuEwcuZUOaf2ae2EEV4Ap4=;
 b=VcSqRCsE45Orz2HI/pzHoTYBruS4NsHdXSK7x0hQom0gqy0L/L6NHIgnuTSKXopTgc
 mVm1mo/RdIibRmjzSaahsLuwyAtev1kagJrtl3ff9ea+eeyjPifweJsSOTjHKAxMSb9b
 Vp5hP3j7SX3Fv54qRxuK4zpeQ/aO5Q5IjTRliFS/lc6ikmZE/TEfxUQ1F5yYgaMwha+q
 h49Pc/1Ht8xSWsZ0P2shmmqjAr0EAkxqZDGzmT6YQITTGB/MblhBjDMBekykKgzfHqRF
 5kSfLUy6bt7HcjK4PQhFrFPqenz7mvFfLpQUp5joWMgnCdYuNtxlc8tMVVMFEtPuhX5X
 7N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+e+BnVIcdXQpIo13+f1rOjuEwcuZUOaf2ae2EEV4Ap4=;
 b=ELp1mQtSDKR5X/faHfaCzWMpsKLD7f5OajUN0zTH2BHlSGkPgtnLx8u62fkCzLTZjv
 SummsULoRlZKJlFQawQnohI31ufCNPRP4PFmSd1Uqe9pW6BWKTv2iGg0+vhvF19yXfx6
 18Cv82wMkC9Ta6thEu3l8xjFc/ReTrPkWWXzBidoniPTUJJkd6yuw8cC2CPPMgr89XuI
 4yUlyyObqniaV9mNK2fR8o46Vf3oFssrKt94cBl2IuE5JqQ53d6sygvDuoA5NKZB3uup
 gvoO6bwXxcS9FP0xFQlfkIwCBhQ9LrYX2yJAfNkApguIgBJGieEAVHtdGRcWP34onRIg
 N3ng==
X-Gm-Message-State: AOAM532D+TRNbsuVNt103kUd/1NM5kiqrscf7kJdwwzLGVRfY3DDvDwA
 e82pAgxiA/QGh9TupuiatGKFO2eZLdAI
X-Google-Smtp-Source: ABdhPJyUt91xXjgkdPZhC3xPdJD63V7ZeGudIO56qYxSR2A+uVhnp5sGWD5R6stN6XRELHkFH6y6Q6TOV0AM
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a0c:fd62:: with SMTP id
 k2mr8030346qvs.51.1621366887804; Tue, 18 May 2021 12:41:27 -0700 (PDT)
Date: Tue, 18 May 2021 12:41:14 -0700
Message-Id: <20210518194118.755410-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 0/4] With the pca954x i2c mux available, enable it on aspeed
 and nuvoton BMC boards.
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=3ZxikYAcKCjQlUdjkhUWeeWbU.SecgUck-TUlUbdedWdk.ehW@flex--venture.bounces.google.com;
 helo=mail-qk1-x74a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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


Patrick Venture (4):
  hw/arm: gsj add i2c comments
  hw/arm: gsj add pca9548
  hw/arm: quanta-q71l add pca954x muxes
  aspeed: sonorapass: enable pca954x muxes

 hw/arm/Kconfig          |  2 ++
 hw/arm/aspeed.c         | 33 +++++++++++++++++++--------------
 hw/arm/npcm7xx_boards.c | 14 +++++++++++++-
 3 files changed, 34 insertions(+), 15 deletions(-)

-- 
2.31.1.751.gd2f1c929bd-goog


