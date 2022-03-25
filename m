Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1C4E757D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:56:30 +0100 (CET)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlMb-00023a-56
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:56:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nXlGo-0005qk-Tw
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:50:32 -0400
Received: from sonic313-19.consmr.mail.gq1.yahoo.com ([98.137.65.82]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nXlGk-0003ET-Tx
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1648219819; bh=BTgejReWI6pjyoVYpjPd76mqzkOOM22HnIrQnScJYTs=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=VIyfXBZIBlmBkWESrvgcl8cBfWETEQWeQOnoTSI6+SX7RmsgJpheZtPTs3eQJB6spmk4sUR6yT/OAuUHJR7LpJGX2yherXu/2H/SEqyz5hSK2Oyot3vvN83QAVbB9eOAL9s0l2jw25hQiCIaqJjp04jRpXLAK049myuN6lbDgBbV38rp9h47GcJ8n9tQbWUPcdGmMSGdu5YYl3G/cBjF9WZM99SuGFkNB0OT2CYW2jcNKWxq220yO/NgTAobVIiIKFauS8fRjssig32euVwEOzi+4c+ZXfyxmPyZ03d6mLk/+uaKQmTc15cU/BekywZmJivKt7o3biMAjP7ez98IkQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1648219819; bh=ErtjShuIQGaqS4ohw/Bu0uKYrjEO6rh51yv0dw68zpK=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=rf4PVER/OE8fpRK/z0f+KUX5Z7KckP1r5d7SGJfEZNAlF8Sk2VN0oNWsWJ0VwzUEMOv57wyiHVGsUyn0oJafllAFwSq7q/VkJAdv6uNEnYZ94Wiqe0jLJuFXWlBK3K0mGfdj/7OEwjit0059aiZlRxNcCCGSWlf5pdz+5zwlsfmc3cXOrs8xopYQNN7VXYYrS1IeMNdFRx94qfWvLYK90dfWKjBDwd/ffZW7+N5z6nhqt1kSLFJDgE3An3jXkprzrB1lKYymXnoMtwJ4mc9kPXW03AercArBCfuynKdik0EC3HMChfWC7/jpFEba+A67XLHsJUovOLiB4E/3hrglvw==
X-YMail-OSG: aUh8WkYVM1kUEI7zsu3FU3JtO6YoUblhTiG_EKMcicKn67GptZxlPij2Nibwomq
 u0uFKuoaG2spW8AM2Lw_GMyLImC2Bikglf5BYS9YXbCfepJ5nxLCw0Ad5qdFjd7hTsi.wn5yKTl0
 0d58tBmTExAHU1blZyx_0pf2POmd98gtZ4U1nZg0EK9EDyQ6SrBp66u_t4JxvJwALz2gg_z9yGOt
 aBE2d7Bp8EuHlZihajpmR..wRd8ysT3zBzDJf31SKUUfysswomp_SZyClHy1ieoOXGn0yg4Y2rnT
 GIrAtQBFc2P72KSwZ4sKKFxhYogMWG7Ie6eFrDoI6aGWStvMSQSnHAfCx0ch1AyHoeOYxCuLrSnm
 GP06rEtpQZYSrTNe1xUfBh2mih5LvDyy_qEtyXrkAqwm7ilb0OO7bNWhmFS9gDJjAkQbZfGWUvnF
 HmNp2KPEBGCp0XmpplT25Z1zNGdhFrmTqx96a2ytlMNFmommII9gcpfbj0npg.MCulVJ1RJzZjM8
 0LPxeKG_D1D8XFRJJcMAViDQJXC8EKrBwteV2.tSyUKbdz8wDFBCM6TsVDOF9a4NSHsW8uZ6S7dG
 fRdfOF.eSs_dm1HDUCcVtHDWVhHCDuikS7tXQcDpHa7RlTUWqxuKc0HAIYnfmhcKJboGzpKKo4w1
 A.TEu2m06YE_QNm6qqlQKbQsLPjo4UqJZ3zTWQ6wixKMRhoU1gyqvvPHJ_hPNMLfgCVZ0JTRB97_
 9DPByMURvj4TNWXXmbxEfyFCVwad33eGb24voUqlFhPN7dbTPqi2KxN9lCw.dk0K9GF9efTvZBVm
 W1EXdWvaGQOUGtyXi8WJ4Y5bUwlQQBaEIoY.1YCrG9h3IOtiAGRokmN3xPMG6GtQAc1SB8.ag0qw
 QHPZsmQjXVkJka9ArVOFDxzy21TrpD0MQDNi71wVTqBYyyxw6Prz13ugAteeoA9DQJxJzMhTPxtC
 6vICQsP4DLCrg9hu3yisTDsAZfkji39zoja4R9lhFDTNvLrqZ4RPwx2Ftj.GhmIOeuOeqRGsy653
 KgTSY8ytqptu7IKRBcIZ5ttZUebAlbYLGURrHRrtn9LkC9hjKaX1.SthuK_zuP2da8G7Be_Lvvnp
 o6Hz4m8Uhf8UDf7OBo5H0yPWUZ.SiDeO56EEyzAYYWNej9K1wkVLmV.4Oyj04jTawcJ.6E2vNQQo
 UYNtOAQeinPnzZDVlKaav9xwqVwQ1e3mLhR5Z8xgqPU.s.bzxXsFsSchSSDFFIqhSjVnnHPHQ7Jd
 0XdgCLR0._Zncedr3S7eYn5ZEVgKXiI0MpxAcxHXYxUPCj3sTwhfxKD0Cam2c75eFx6Z9Vq2grrh
 GOrNkaV22y4UNfaH3.NpIZzcO32EXsToq4soySOxfyyuvG.5hCgQcUmKABZHuk_B09vuwbMV.IIR
 gBwPIoYtlnFgpMUoB4pWa3tWpbTgEQBG1tcnGGCL_XuFS_aG3bKm8C.gTuDmrkEWhm_rBs1QNDx1
 HOZVpTzlOO8kk3BV.yVNp0Q6QKYSjjcFnjQiJfQfJLr.DsBjTn3_Vnnqpkjv._Qel_IM_cRdai_X
 VlVxB7renORxo2EHKQl4pwlYDkuNyITwSLY.aIKcXvQeL03TJ0Sp_9_PUbHR3tzr7gQBvmPGZ5C.
 chDY78eDqBT2yjTXAQSmlB9godCxAyGnisXdrQO.RUuiaqVTAVRLkeb3vy8J5OJ3No7IyeXKw05J
 fDlDZoWGj.qtrqgimjPiiZbTPQ3dOsvnfb9cx3_NiUzZOT7QDCrvmNyPTv5occtRuuQ5CMpVrzWw
 two8DFdLmkG9KlpR2CthlCJo2xAbZgRbIV7u0YVYQiR8Vx8ekWdImGAmCIaGEvkcxE1PMZpz2Z9h
 5VPNEIAAlSrTceYCrE30rfERSjaUWoUNffaL1Nf3eXZRaAllUO5PN0Wh0ZtV7XXdrsTLe2skozI.
 ETkKGSYtNgyTQc7ubZ96fnm7naf7Sg14dm7r0dTVRgy0BxJphXru1aqLWks24wG.WogKFeXgRgNQ
 xXi_MKGT3bG8foxsDMagvEES.9P7feowZIpF_xXuUYnFtcWEFVYXsb0fnA1LB3Tf6i6pvDFTESrs
 feEgJsD8hF51sdJw4WL3yKpGOU4KfepnGSplTJD2WpJB7mPFZKo9CcwWNXWQ358GyIDGczOU4Igg
 Bq5XIMi1yHp_yUgmY9XGtHd2gC2kVanLYGrzIo7G25mnucZutmrx2GHvYVHKZwYAtIU2RcusSY_i
 21evtmtuyUHPBInqIghsahdgwrj81d3WY4J8PfcENNUPHgb4BKt_AwC.cgUSsZjdwEaADKfiLL9l
 LRluadAM-
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Fri, 25 Mar 2022 14:50:19 +0000
Received: by kubenode516.mail-prod1.omega.sg3.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID ee9c67d9044eb9cc3a7d6349bbd1d60e; 
 Fri, 25 Mar 2022 14:50:11 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/i386: Some mmx/sse instructions don't require
Date: Fri, 25 Mar 2022 22:50:05 +0800
Message-Id: <20220325145007.448948-1-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20220325145007.448948-1-lw945lw945.ref@yahoo.com>
Received-SPF: pass client-ip=98.137.65.82; envelope-from=lw945lw945@yahoo.com;
 helo=sonic313-19.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/427

All instructions decoded by 'gen_see' is assumed to require CRO.TS=0. But
according to SDM, CRC32 doesn't require it. In fact, EMMS, FMMS and some
mmx/sse instructions(0F38F[0-F], 0F3AF[0-F]) don't require it.

To solve the problem, first to move EMMS and FMMS out of gen_sse. Then
instructions in 'gen_sse' require it only when modrm & 0xF0 is false.

Wei Li (2):
  Move EMMS and FEMMS instructions out of gen_sse
  Some mmx/sse instructions in 'gen_sse' don't require CRO.TS=0

 target/i386/tcg/translate.c | 45 +++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

-- 
2.30.2


