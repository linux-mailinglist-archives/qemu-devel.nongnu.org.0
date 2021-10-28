Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFC243DA99
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:57:27 +0200 (CEST)
Received: from localhost ([::1]:42272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxTi-0007rT-Ix
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHG-0008D6-Fd
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:34 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHC-0004ka-80
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396270; x=1666932270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jp9UVWaLwVNIzQpBAwcwf23Ysj/NKdZvzmtw/yFvBeM=;
 b=T/D3Hhd7NRUWoREROHNfGPOz9CzF/5vT7p/oY4Mv0om24dp2kvezga/C
 LvWHQSzio4903SzdEnrnOlPcSWYfyyTOMRaDHSIo9Xjrp01U11ZXtrZtQ
 DENkzJM87k4mltyZGdNHWMj6gBjfzvIgIs0HMC9XPIFvMcb8R8qvb+aYe
 /dGi3kvSBaTOG6a+t+jamXW2OoCqeVYZjfEzvkKnE9M9OfDKRvRHf5nDm
 DR8jqykFUB0UMXh9bvpJbgCd+qf497ep3pmMSIoMLSy0KGKUM7NNmUFkf
 x3tC5h2MpgpINlNSsGRpdCPwke6erkrn8rpBILVp2f9pJVIe2U1PIjrSU A==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="287922951"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:28 +0800
IronPort-SDR: EZGGwzxp6Cuwp8aExCS3nKiVVTP/VZwMrb9kiFpasJxunr7Fh0MKQYpVZUNsvLJ3ppaFLaHW5K
 1Cyv3Vfbf2yCMDCoDllT/C/6vd+WPo4xduAZzkNMSM9phS5jElQMJa2UU8GSiVp6o0xU79/o5Z
 qSPTK8rRWxMgTZPVPGlMAWeZY5z+4YXKasNtJJDLkF1aR+Rt/5MZXtKXtMPvQKou9aFs38tfQ9
 TRaZOWOJjmIfGHA2qrbZs6ZHomfgBGzO90tCPnXn6niUTnrjNwa3dw6HahT/pXWx18itYE3LTT
 dcQLyuDauhEpF9MOMJjuol+g
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:19:56 -0700
IronPort-SDR: 4NuxtVJfnPnzfNzK8E4YMPamtOuirduFqd1d/bJwfMNsuNhMiawC5Ngmf4DbsTKJTJ9mq6BKW1
 mjsGFz0QAsKipo2PAbwB/HIxFQqhXsyCO4di3dlpRh/GM2Ac8byAwpR1KMwOsH10PxnUexX/Lu
 xgr/4ecaaG2qgAxD2Wfj7aPu4e2SXuUsSJkm89C0A1mLvyFmxTZl8IkGqJnEUptsn6/wMM39Ii
 hIFd9GNToNLD/8Rk9jYEvI95NJPOj/H265cMKJWUvH5DqdQY1OJ0Czz776dbvzEKocp1WXUpYf
 LMI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftJD137xz1RtVx
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:28 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396267; x=1637988268; bh=Jp9UVWaLwVNIzQpBAw
 cwf23Ysj/NKdZvzmtw/yFvBeM=; b=Y5DQKH4pfgvqzg+5rCD8i41pJFt+1CTTB/
 Id9lIjSgCb1VJOxfQc73vb/lv1zf27VRMbhYr+AMJjFktQMC6SMowa0Rlb9upGvQ
 Ixr81PGatr+fhMdQc14XtCA8ZTJKHL52FKlUlxmqgfOCfCGyLlj35n3yV33xSUBU
 xcR3oyQglLC9qP/oUrDDEavT/0zPtAwaaMtHFB/x50DATdq2Vr7UA6bRwuUqYh2P
 AAKjCkSYmJKdnzS+cm0LJH6K48dKe3a4ncsyXBONTKq5f/2k0i6P/y3Uw6n53p0k
 upUhx9Prree5DnRk5Pvj+QZ85pnR9RlpAxAgdjQBgenkyYY66b+g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YLysdODVzFVF for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:27 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftJ64dkcz1RtVl;
 Wed, 27 Oct 2021 21:44:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 07/18] target/riscv: Add J-extension into RISC-V
Date: Thu, 28 Oct 2021 14:43:31 +1000
Message-Id: <20211028044342.3070385-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211025173609.2724490-2-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a33dc30be8..1cfc6a53a0 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -65,6 +65,7 @@
 #define RVS RV('S')
 #define RVU RV('U')
 #define RVH RV('H')
+#define RVJ RV('J')
=20
 /* S extension denotes that Supervisor mode exists, however it is possib=
le
    to have a core that support S mode but does not have an MMU and there
@@ -291,6 +292,7 @@ struct RISCVCPU {
         bool ext_s;
         bool ext_u;
         bool ext_h;
+        bool ext_j;
         bool ext_v;
         bool ext_zba;
         bool ext_zbb;
--=20
2.31.1


