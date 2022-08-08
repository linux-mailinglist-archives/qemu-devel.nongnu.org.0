Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F258D02B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 00:35:49 +0200 (CEST)
Received: from localhost ([::1]:35426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLBLg-0002rr-0F
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 18:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLBJL-0007s1-ME
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:33:23 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLBJJ-0001B1-Vv
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:33:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id h28so9254269pfq.11
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 15:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=mTq5W8mhCIY4iu1UyNhmG8HYFoX8fQtCoeVL1I2i9dc=;
 b=gzYYgYfGMQ5Qs79RZRWzRPnKKl6puHcvnJMy1QQ/crdNO9ZL+BEku87S8y28sRQo3l
 bE6mRQtHebi4yi3F1yJDElvXth8eLtgBNgvI1dznn+ORtwmrJBJB99MVjfrU4fPFQrkg
 7QhNzYU48ZC9lokF1khuEDuSqaO20LZ/+/q8+88273q6i/Fve1lqsm4Z/pOcuebq6g40
 1RZl/Xcm+wWSiCi0qkSEE/s526ZOdn3e51o84IE9LTAMjykTVM5YqZk5oKDKEiEwMM5E
 SXIq8uk7kNDkEzK8c2DL8S/SudIKBB+e1g77CL7XeOEqs+jtnNQyBlilAfMNp77RRfEO
 HRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=mTq5W8mhCIY4iu1UyNhmG8HYFoX8fQtCoeVL1I2i9dc=;
 b=77ttVSZSIah29E/TmOSNmAJlSFKpjdNyWaKyZWew0l5cL/5k8M/z+W4Oyo0bV8Azdq
 WfJVaR1XSlGoh4GyFCBxhMFNIh00OGBCND/XlohYSdgbgL1NdZi0SDcq606ND+hzO/Ph
 18RzHss/hlk5npaAgL1wgVIjl0fbNgSJZMO9PowyH0izcheWsDHHTcDbcVhHiyFsDbfk
 ghB+Ze9S1zF7a4nRrRbAytYmIMHasr0vSCDUgbt58IHvxfrH621ltQEn33ZPnghY3R9j
 /NJg7HBTNsdYwB4CG2DtA90UWWZ3GvbxKJCsnXkfgrfwARC40N5Rm2vjCoPX6jseiQgQ
 oxag==
X-Gm-Message-State: ACgBeo3VR1cswT7x32bgtIPtH2M0OU7Ge7sqIK94c6GRsf+/BeiEfq2o
 OMJY+vSxcuaJiauRR6PzpHjjl1W10bSP8g==
X-Google-Smtp-Source: AA6agR5bY752hBGJQLv5mc53MU4m7exeVarZLkqsk9+RKxugLd/cQFXAP7e+1D1M5cz/oDnhpOVgpA==
X-Received: by 2002:a05:6a00:1687:b0:518:6c6b:6a9a with SMTP id
 k7-20020a056a00168700b005186c6b6a9amr20937493pfc.81.1659998000306; 
 Mon, 08 Aug 2022 15:33:20 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170902da8100b0016f8e80336esm8289231plx.298.2022.08.08.15.33.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Aug 2022 15:33:19 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL 0/3] MIPS/SPARC patches for 2022-08-09
Date: Tue,  9 Aug 2022 00:33:09 +0200
Message-Id: <20220808223312.53720-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The following changes since commit 8a1337e60400ef54432e063164faf5043a55555d:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-08-08 09:57:37 -0700)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20220809

for you to fetch changes up to 09d12c81ec5d8dc9208e5739d17a56c34be96247:

  hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit accesses (2022-08-08 23:43:11 +0200)

----------------------------------------------------------------
MIPS/SPARC patches queue

- target/mips: Handle lock_user failure in UHI_plog semihosting (Peter Maydell)
- hw/mips/malta: Turn off x86 specific features of PIIX4 PM (Igor Mammedov)
- hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit accesses (Peter Maydell)

----------------------------------------------------------------

Igor Mammedov (1):
  hw/mips/malta: turn off x86 specific features of PIIX4_PM

Peter Maydell (2):
  target/mips: Handle lock_user() failure in UHI_plog semihosting call
  hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit accesses

 hw/mips/malta.c                    |  9 +++++++++
 hw/misc/grlib_ahb_apb_pnp.c        | 10 ++++++----
 hw/misc/trace-events               |  4 ++--
 target/mips/tcg/sysemu/mips-semi.c |  3 +++
 4 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.36.1


