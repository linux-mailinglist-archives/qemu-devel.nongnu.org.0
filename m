Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B925FEA6A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:22:53 +0200 (CEST)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFy0-0001tG-DL
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbw-0003OE-OY
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:00:05 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:39339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFbq-0001wL-1x
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734397; x=1697270397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7RnAAvOzfBjNtieBZkXzrvGE5zKak+3TvMl9K+3Edz8=;
 b=Xuc4pK7kqCeVZJ4MpMlc10qRkxPAVHYGjN7JckfuqkTk6opLzJ9Umj93
 UskwV0WLipdkDdbv0EzaIHI5SIe63zMjLlWObs+wxaYJ9L33kige7zDc1
 ct8lFeriFDxytJU8GqC1jaqIk406ZcddXJG0PRHv6UiShwDXypY7Q8Hm5
 KcG60/6vbqzEE3uICvNA5wOeIbI/zZj0s/HzKqHMPBYAiEdasPqYDTLDD
 sam4IAbqi6SDnJZnMGsSjj2H2QW7y2GkK7IZu4Qn+uDd04s7CP6wKWjCY
 ne37+2ypNHbkqCpzjphsO4Qz8WGLDD5lp7pUlwP1gHkV+Hnv3Q47vViHQ g==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="212116335"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:59:52 +0800
IronPort-SDR: oQrmpWl8Dwn9fZoM5iv6Md3wfkx4O/7b1Dp+l5kH83EoKyGyX7DIg+aTCio/9WMcsy0g30jxVk
 iRruvM4+5ceMITNlUKTTHFVAYzzvfqgMrDrc103PzopUMp+hN26ZSDxtn4Degbm0moIZiWweps
 1ryne1nuKt9OdsVW4KbdeUn8bAxdbzAfulHad0Mo7Up7a9qI1Bgu601uy+sEy2PsRkVBJzdgFw
 kVSkHT8cGVdkTdin4MspDH3/9VkB/d/2HNNcw2ZdFagd2EdhWzdZ6TCUFtKK7aVO5khuIfut5b
 KoaAxfMQDWwYwiwN4LEfKEfD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:19:29 -0700
IronPort-SDR: N2fLJFxYu6nUDAjpE3AWemFo7czth1q/yqJuwqte5dK6mvQY/TbnorO2t2EYZq+DSSm0qrHuzO
 FqywBWH/6xRMjQ4sBtk5X6hEie4yUEiRTazfgZz2iNkLnDD2ZocZ9S5wvFlI6jrks0QJh9uTaf
 vIDGXrw8T09WSyvfPTnbMMnNL3kB4P5LJQgs1DVSwClJkFEwvVmCkONhelMR8gvwi1DbCJmeF6
 6+XFj1xmFGzuXfLeCVmrTpt1U0o9EtizDQOC1erfAntaKJ85HRKumqWyB2y6q+XK7gEuf/q4Th
 FKM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:59:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf1h0XHLz1RvTr
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:59:52 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734385; x=1668326386; bh=7RnAAvOzfBjNtieBZk
 XzrvGE5zKak+3TvMl9K+3Edz8=; b=bJPItzEmGmZvyunRgqbFu2zPgprTcPPBI1
 RNm2T1w4tmzp0BEKF67MyT6AaQ14CPvjXzdlXW6nWBZ8ZDm0wD+egUL7/ql6wSXi
 7sXM5BSLSXoehEck7tCdroiPioJyXsxhdYveyd74l4UufOPoFPyV+q4RGl7u2Kog
 KNFo7bpzXln+TdTfoW6pi/iXM1+JbNYlCIcNGrwssDKbEPtv1txCgZn1UaeOodGo
 FJbC1T2Gy9nXXajF9y6kBFHSXYMoWGdnfizoO8F/Ns77J3AjK+WU8wXDT9c5l7D8
 ZQX6ddnKiMOTCKQu5JAkLKq8/MKFmq4qEvgsaChQ+tD47cJ8CHJA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FbIHD4OLelWc for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:59:45 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf1N0x0dz1RvLy;
 Fri, 14 Oct 2022 00:59:34 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yang Liu <liuyang22@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/10] disas/riscv.c: rvv: Add disas support for vector
 instructions
Date: Fri, 14 Oct 2022 17:58:27 +1000
Message-Id: <20221014075830.914722-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Yang Liu <liuyang22@iscas.ac.cn>

Tested with https://github.com/ksco/rvv-decoder-tests

Expected checkpatch errors for consistency and brevity reasons:

ERROR: line over 90 characters
ERROR: trailing statements should be on next line
ERROR: braces {} are necessary for all arms of this statement

Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220928051842.16207-1-liuyang22@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 1432 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 1430 insertions(+), 2 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index f107d94c4c..d216b9c39b 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -158,6 +158,11 @@ typedef enum {
     rv_codec_css_sqsp,
     rv_codec_k_bs,
     rv_codec_k_rnum,
+    rv_codec_v_r,
+    rv_codec_v_ldst,
+    rv_codec_v_i,
+    rv_codec_vsetvli,
+    rv_codec_vsetivli,
 } rv_codec;
=20
 typedef enum {
@@ -560,6 +565,376 @@ typedef enum {
     rv_op_zip =3D 396,
     rv_op_xperm4 =3D 397,
     rv_op_xperm8 =3D 398,
+    rv_op_vle8_v =3D 399,
+    rv_op_vle16_v =3D 400,
+    rv_op_vle32_v =3D 401,
+    rv_op_vle64_v =3D 402,
+    rv_op_vse8_v =3D 403,
+    rv_op_vse16_v =3D 404,
+    rv_op_vse32_v =3D 405,
+    rv_op_vse64_v =3D 406,
+    rv_op_vlm_v =3D 407,
+    rv_op_vsm_v =3D 408,
+    rv_op_vlse8_v =3D 409,
+    rv_op_vlse16_v =3D 410,
+    rv_op_vlse32_v =3D 411,
+    rv_op_vlse64_v =3D 412,
+    rv_op_vsse8_v =3D 413,
+    rv_op_vsse16_v =3D 414,
+    rv_op_vsse32_v =3D 415,
+    rv_op_vsse64_v =3D 416,
+    rv_op_vluxei8_v =3D 417,
+    rv_op_vluxei16_v =3D 418,
+    rv_op_vluxei32_v =3D 419,
+    rv_op_vluxei64_v =3D 420,
+    rv_op_vloxei8_v =3D 421,
+    rv_op_vloxei16_v =3D 422,
+    rv_op_vloxei32_v =3D 423,
+    rv_op_vloxei64_v =3D 424,
+    rv_op_vsuxei8_v =3D 425,
+    rv_op_vsuxei16_v =3D 426,
+    rv_op_vsuxei32_v =3D 427,
+    rv_op_vsuxei64_v =3D 428,
+    rv_op_vsoxei8_v =3D 429,
+    rv_op_vsoxei16_v =3D 430,
+    rv_op_vsoxei32_v =3D 431,
+    rv_op_vsoxei64_v =3D 432,
+    rv_op_vle8ff_v =3D 433,
+    rv_op_vle16ff_v =3D 434,
+    rv_op_vle32ff_v =3D 435,
+    rv_op_vle64ff_v =3D 436,
+    rv_op_vl1re8_v =3D 437,
+    rv_op_vl1re16_v =3D 438,
+    rv_op_vl1re32_v =3D 439,
+    rv_op_vl1re64_v =3D 440,
+    rv_op_vl2re8_v =3D 441,
+    rv_op_vl2re16_v =3D 442,
+    rv_op_vl2re32_v =3D 443,
+    rv_op_vl2re64_v =3D 444,
+    rv_op_vl4re8_v =3D 445,
+    rv_op_vl4re16_v =3D 446,
+    rv_op_vl4re32_v =3D 447,
+    rv_op_vl4re64_v =3D 448,
+    rv_op_vl8re8_v =3D 449,
+    rv_op_vl8re16_v =3D 450,
+    rv_op_vl8re32_v =3D 451,
+    rv_op_vl8re64_v =3D 452,
+    rv_op_vs1r_v =3D 453,
+    rv_op_vs2r_v =3D 454,
+    rv_op_vs4r_v =3D 455,
+    rv_op_vs8r_v =3D 456,
+    rv_op_vadd_vv =3D 457,
+    rv_op_vadd_vx =3D 458,
+    rv_op_vadd_vi =3D 459,
+    rv_op_vsub_vv =3D 460,
+    rv_op_vsub_vx =3D 461,
+    rv_op_vrsub_vx =3D 462,
+    rv_op_vrsub_vi =3D 463,
+    rv_op_vwaddu_vv =3D 464,
+    rv_op_vwaddu_vx =3D 465,
+    rv_op_vwadd_vv =3D 466,
+    rv_op_vwadd_vx =3D 467,
+    rv_op_vwsubu_vv =3D 468,
+    rv_op_vwsubu_vx =3D 469,
+    rv_op_vwsub_vv =3D 470,
+    rv_op_vwsub_vx =3D 471,
+    rv_op_vwaddu_wv =3D 472,
+    rv_op_vwaddu_wx =3D 473,
+    rv_op_vwadd_wv =3D 474,
+    rv_op_vwadd_wx =3D 475,
+    rv_op_vwsubu_wv =3D 476,
+    rv_op_vwsubu_wx =3D 477,
+    rv_op_vwsub_wv =3D 478,
+    rv_op_vwsub_wx =3D 479,
+    rv_op_vadc_vvm =3D 480,
+    rv_op_vadc_vxm =3D 481,
+    rv_op_vadc_vim =3D 482,
+    rv_op_vmadc_vvm =3D 483,
+    rv_op_vmadc_vxm =3D 484,
+    rv_op_vmadc_vim =3D 485,
+    rv_op_vsbc_vvm =3D 486,
+    rv_op_vsbc_vxm =3D 487,
+    rv_op_vmsbc_vvm =3D 488,
+    rv_op_vmsbc_vxm =3D 489,
+    rv_op_vand_vv =3D 490,
+    rv_op_vand_vx =3D 491,
+    rv_op_vand_vi =3D 492,
+    rv_op_vor_vv =3D 493,
+    rv_op_vor_vx =3D 494,
+    rv_op_vor_vi =3D 495,
+    rv_op_vxor_vv =3D 496,
+    rv_op_vxor_vx =3D 497,
+    rv_op_vxor_vi =3D 498,
+    rv_op_vsll_vv =3D 499,
+    rv_op_vsll_vx =3D 500,
+    rv_op_vsll_vi =3D 501,
+    rv_op_vsrl_vv =3D 502,
+    rv_op_vsrl_vx =3D 503,
+    rv_op_vsrl_vi =3D 504,
+    rv_op_vsra_vv =3D 505,
+    rv_op_vsra_vx =3D 506,
+    rv_op_vsra_vi =3D 507,
+    rv_op_vnsrl_wv =3D 508,
+    rv_op_vnsrl_wx =3D 509,
+    rv_op_vnsrl_wi =3D 510,
+    rv_op_vnsra_wv =3D 511,
+    rv_op_vnsra_wx =3D 512,
+    rv_op_vnsra_wi =3D 513,
+    rv_op_vmseq_vv =3D 514,
+    rv_op_vmseq_vx =3D 515,
+    rv_op_vmseq_vi =3D 516,
+    rv_op_vmsne_vv =3D 517,
+    rv_op_vmsne_vx =3D 518,
+    rv_op_vmsne_vi =3D 519,
+    rv_op_vmsltu_vv =3D 520,
+    rv_op_vmsltu_vx =3D 521,
+    rv_op_vmslt_vv =3D 522,
+    rv_op_vmslt_vx =3D 523,
+    rv_op_vmsleu_vv =3D 524,
+    rv_op_vmsleu_vx =3D 525,
+    rv_op_vmsleu_vi =3D 526,
+    rv_op_vmsle_vv =3D 527,
+    rv_op_vmsle_vx =3D 528,
+    rv_op_vmsle_vi =3D 529,
+    rv_op_vmsgtu_vx =3D 530,
+    rv_op_vmsgtu_vi =3D 531,
+    rv_op_vmsgt_vx =3D 532,
+    rv_op_vmsgt_vi =3D 533,
+    rv_op_vminu_vv =3D 534,
+    rv_op_vminu_vx =3D 535,
+    rv_op_vmin_vv =3D 536,
+    rv_op_vmin_vx =3D 537,
+    rv_op_vmaxu_vv =3D 538,
+    rv_op_vmaxu_vx =3D 539,
+    rv_op_vmax_vv =3D 540,
+    rv_op_vmax_vx =3D 541,
+    rv_op_vmul_vv =3D 542,
+    rv_op_vmul_vx =3D 543,
+    rv_op_vmulh_vv =3D 544,
+    rv_op_vmulh_vx =3D 545,
+    rv_op_vmulhu_vv =3D 546,
+    rv_op_vmulhu_vx =3D 547,
+    rv_op_vmulhsu_vv =3D 548,
+    rv_op_vmulhsu_vx =3D 549,
+    rv_op_vdivu_vv =3D 550,
+    rv_op_vdivu_vx =3D 551,
+    rv_op_vdiv_vv =3D 552,
+    rv_op_vdiv_vx =3D 553,
+    rv_op_vremu_vv =3D 554,
+    rv_op_vremu_vx =3D 555,
+    rv_op_vrem_vv =3D 556,
+    rv_op_vrem_vx =3D 557,
+    rv_op_vwmulu_vv =3D 558,
+    rv_op_vwmulu_vx =3D 559,
+    rv_op_vwmulsu_vv =3D 560,
+    rv_op_vwmulsu_vx =3D 561,
+    rv_op_vwmul_vv =3D 562,
+    rv_op_vwmul_vx =3D 563,
+    rv_op_vmacc_vv =3D 564,
+    rv_op_vmacc_vx =3D 565,
+    rv_op_vnmsac_vv =3D 566,
+    rv_op_vnmsac_vx =3D 567,
+    rv_op_vmadd_vv =3D 568,
+    rv_op_vmadd_vx =3D 569,
+    rv_op_vnmsub_vv =3D 570,
+    rv_op_vnmsub_vx =3D 571,
+    rv_op_vwmaccu_vv =3D 572,
+    rv_op_vwmaccu_vx =3D 573,
+    rv_op_vwmacc_vv =3D 574,
+    rv_op_vwmacc_vx =3D 575,
+    rv_op_vwmaccsu_vv =3D 576,
+    rv_op_vwmaccsu_vx =3D 577,
+    rv_op_vwmaccus_vx =3D 578,
+    rv_op_vmv_v_v =3D 579,
+    rv_op_vmv_v_x =3D 580,
+    rv_op_vmv_v_i =3D 581,
+    rv_op_vmerge_vvm =3D 582,
+    rv_op_vmerge_vxm =3D 583,
+    rv_op_vmerge_vim =3D 584,
+    rv_op_vsaddu_vv =3D 585,
+    rv_op_vsaddu_vx =3D 586,
+    rv_op_vsaddu_vi =3D 587,
+    rv_op_vsadd_vv =3D 588,
+    rv_op_vsadd_vx =3D 589,
+    rv_op_vsadd_vi =3D 590,
+    rv_op_vssubu_vv =3D 591,
+    rv_op_vssubu_vx =3D 592,
+    rv_op_vssub_vv =3D 593,
+    rv_op_vssub_vx =3D 594,
+    rv_op_vaadd_vv =3D 595,
+    rv_op_vaadd_vx =3D 596,
+    rv_op_vaaddu_vv =3D 597,
+    rv_op_vaaddu_vx =3D 598,
+    rv_op_vasub_vv =3D 599,
+    rv_op_vasub_vx =3D 600,
+    rv_op_vasubu_vv =3D 601,
+    rv_op_vasubu_vx =3D 602,
+    rv_op_vsmul_vv =3D 603,
+    rv_op_vsmul_vx =3D 604,
+    rv_op_vssrl_vv =3D 605,
+    rv_op_vssrl_vx =3D 606,
+    rv_op_vssrl_vi =3D 607,
+    rv_op_vssra_vv =3D 608,
+    rv_op_vssra_vx =3D 609,
+    rv_op_vssra_vi =3D 610,
+    rv_op_vnclipu_wv =3D 611,
+    rv_op_vnclipu_wx =3D 612,
+    rv_op_vnclipu_wi =3D 613,
+    rv_op_vnclip_wv =3D 614,
+    rv_op_vnclip_wx =3D 615,
+    rv_op_vnclip_wi =3D 616,
+    rv_op_vfadd_vv =3D 617,
+    rv_op_vfadd_vf =3D 618,
+    rv_op_vfsub_vv =3D 619,
+    rv_op_vfsub_vf =3D 620,
+    rv_op_vfrsub_vf =3D 621,
+    rv_op_vfwadd_vv =3D 622,
+    rv_op_vfwadd_vf =3D 623,
+    rv_op_vfwadd_wv =3D 624,
+    rv_op_vfwadd_wf =3D 625,
+    rv_op_vfwsub_vv =3D 626,
+    rv_op_vfwsub_vf =3D 627,
+    rv_op_vfwsub_wv =3D 628,
+    rv_op_vfwsub_wf =3D 629,
+    rv_op_vfmul_vv =3D 630,
+    rv_op_vfmul_vf =3D 631,
+    rv_op_vfdiv_vv =3D 632,
+    rv_op_vfdiv_vf =3D 633,
+    rv_op_vfrdiv_vf =3D 634,
+    rv_op_vfwmul_vv =3D 635,
+    rv_op_vfwmul_vf =3D 636,
+    rv_op_vfmacc_vv =3D 637,
+    rv_op_vfmacc_vf =3D 638,
+    rv_op_vfnmacc_vv =3D 639,
+    rv_op_vfnmacc_vf =3D 640,
+    rv_op_vfmsac_vv =3D 641,
+    rv_op_vfmsac_vf =3D 642,
+    rv_op_vfnmsac_vv =3D 643,
+    rv_op_vfnmsac_vf =3D 644,
+    rv_op_vfmadd_vv =3D 645,
+    rv_op_vfmadd_vf =3D 646,
+    rv_op_vfnmadd_vv =3D 647,
+    rv_op_vfnmadd_vf =3D 648,
+    rv_op_vfmsub_vv =3D 649,
+    rv_op_vfmsub_vf =3D 650,
+    rv_op_vfnmsub_vv =3D 651,
+    rv_op_vfnmsub_vf =3D 652,
+    rv_op_vfwmacc_vv =3D 653,
+    rv_op_vfwmacc_vf =3D 654,
+    rv_op_vfwnmacc_vv =3D 655,
+    rv_op_vfwnmacc_vf =3D 656,
+    rv_op_vfwmsac_vv =3D 657,
+    rv_op_vfwmsac_vf =3D 658,
+    rv_op_vfwnmsac_vv =3D 659,
+    rv_op_vfwnmsac_vf =3D 660,
+    rv_op_vfsqrt_v =3D 661,
+    rv_op_vfrsqrt7_v =3D 662,
+    rv_op_vfrec7_v =3D 663,
+    rv_op_vfmin_vv =3D 664,
+    rv_op_vfmin_vf =3D 665,
+    rv_op_vfmax_vv =3D 666,
+    rv_op_vfmax_vf =3D 667,
+    rv_op_vfsgnj_vv =3D 668,
+    rv_op_vfsgnj_vf =3D 669,
+    rv_op_vfsgnjn_vv =3D 670,
+    rv_op_vfsgnjn_vf =3D 671,
+    rv_op_vfsgnjx_vv =3D 672,
+    rv_op_vfsgnjx_vf =3D 673,
+    rv_op_vfslide1up_vf =3D 674,
+    rv_op_vfslide1down_vf =3D 675,
+    rv_op_vmfeq_vv =3D 676,
+    rv_op_vmfeq_vf =3D 677,
+    rv_op_vmfne_vv =3D 678,
+    rv_op_vmfne_vf =3D 679,
+    rv_op_vmflt_vv =3D 680,
+    rv_op_vmflt_vf =3D 681,
+    rv_op_vmfle_vv =3D 682,
+    rv_op_vmfle_vf =3D 683,
+    rv_op_vmfgt_vf =3D 684,
+    rv_op_vmfge_vf =3D 685,
+    rv_op_vfclass_v =3D 686,
+    rv_op_vfmerge_vfm =3D 687,
+    rv_op_vfmv_v_f =3D 688,
+    rv_op_vfcvt_xu_f_v =3D 689,
+    rv_op_vfcvt_x_f_v =3D 690,
+    rv_op_vfcvt_f_xu_v =3D 691,
+    rv_op_vfcvt_f_x_v =3D 692,
+    rv_op_vfcvt_rtz_xu_f_v =3D 693,
+    rv_op_vfcvt_rtz_x_f_v =3D 694,
+    rv_op_vfwcvt_xu_f_v =3D 695,
+    rv_op_vfwcvt_x_f_v =3D 696,
+    rv_op_vfwcvt_f_xu_v =3D 697,
+    rv_op_vfwcvt_f_x_v =3D 698,
+    rv_op_vfwcvt_f_f_v =3D 699,
+    rv_op_vfwcvt_rtz_xu_f_v =3D 700,
+    rv_op_vfwcvt_rtz_x_f_v =3D 701,
+    rv_op_vfncvt_xu_f_w =3D 702,
+    rv_op_vfncvt_x_f_w =3D 703,
+    rv_op_vfncvt_f_xu_w =3D 704,
+    rv_op_vfncvt_f_x_w =3D 705,
+    rv_op_vfncvt_f_f_w =3D 706,
+    rv_op_vfncvt_rod_f_f_w =3D 707,
+    rv_op_vfncvt_rtz_xu_f_w =3D 708,
+    rv_op_vfncvt_rtz_x_f_w =3D 709,
+    rv_op_vredsum_vs =3D 710,
+    rv_op_vredand_vs =3D 711,
+    rv_op_vredor_vs =3D 712,
+    rv_op_vredxor_vs =3D 713,
+    rv_op_vredminu_vs =3D 714,
+    rv_op_vredmin_vs =3D 715,
+    rv_op_vredmaxu_vs =3D 716,
+    rv_op_vredmax_vs =3D 717,
+    rv_op_vwredsumu_vs =3D 718,
+    rv_op_vwredsum_vs =3D 719,
+    rv_op_vfredusum_vs =3D 720,
+    rv_op_vfredosum_vs =3D 721,
+    rv_op_vfredmin_vs =3D 722,
+    rv_op_vfredmax_vs =3D 723,
+    rv_op_vfwredusum_vs =3D 724,
+    rv_op_vfwredosum_vs =3D 725,
+    rv_op_vmand_mm =3D 726,
+    rv_op_vmnand_mm =3D 727,
+    rv_op_vmandn_mm =3D 728,
+    rv_op_vmxor_mm =3D 729,
+    rv_op_vmor_mm =3D 730,
+    rv_op_vmnor_mm =3D 731,
+    rv_op_vmorn_mm =3D 732,
+    rv_op_vmxnor_mm =3D 733,
+    rv_op_vcpop_m =3D 734,
+    rv_op_vfirst_m =3D 735,
+    rv_op_vmsbf_m =3D 736,
+    rv_op_vmsif_m =3D 737,
+    rv_op_vmsof_m =3D 738,
+    rv_op_viota_m =3D 739,
+    rv_op_vid_v =3D 740,
+    rv_op_vmv_x_s =3D 741,
+    rv_op_vmv_s_x =3D 742,
+    rv_op_vfmv_f_s =3D 743,
+    rv_op_vfmv_s_f =3D 744,
+    rv_op_vslideup_vx =3D 745,
+    rv_op_vslideup_vi =3D 746,
+    rv_op_vslide1up_vx =3D 747,
+    rv_op_vslidedown_vx =3D 748,
+    rv_op_vslidedown_vi =3D 749,
+    rv_op_vslide1down_vx =3D 750,
+    rv_op_vrgather_vv =3D 751,
+    rv_op_vrgatherei16_vv =3D 752,
+    rv_op_vrgather_vx =3D 753,
+    rv_op_vrgather_vi =3D 754,
+    rv_op_vcompress_vm =3D 755,
+    rv_op_vmv1r_v =3D 756,
+    rv_op_vmv2r_v =3D 757,
+    rv_op_vmv4r_v =3D 758,
+    rv_op_vmv8r_v =3D 759,
+    rv_op_vzext_vf2 =3D 760,
+    rv_op_vzext_vf4 =3D 761,
+    rv_op_vzext_vf8 =3D 762,
+    rv_op_vsext_vf2 =3D 763,
+    rv_op_vsext_vf4 =3D 764,
+    rv_op_vsext_vf8 =3D 765,
+    rv_op_vsetvli =3D 766,
+    rv_op_vsetivli =3D 767,
+    rv_op_vsetvl =3D 768,
 } rv_op;
=20
 /* structures */
@@ -581,6 +956,8 @@ typedef struct {
     uint8_t   rl;
     uint8_t   bs;
     uint8_t   rnum;
+    uint8_t   vm;
+    uint32_t  vzimm;
 } rv_decode;
=20
 typedef struct {
@@ -619,6 +996,13 @@ static const char rv_freg_name_sym[32][5] =3D {
     "fs8",  "fs9",  "fs10", "fs11", "ft8",  "ft9",  "ft10", "ft11",
 };
=20
+static const char rv_vreg_name_sym[32][4] =3D {
+    "v0",  "v1",  "v2",  "v3",  "v4",  "v5",  "v6",  "v7",
+    "v8",  "v9",  "v10", "v11", "v12", "v13", "v14", "v15",
+    "v16", "v17", "v18", "v19", "v20", "v21", "v22", "v23",
+    "v24", "v25", "v26", "v27", "v28", "v29", "v30", "v31"
+};
+
 /* instruction formats */
=20
 #define rv_fmt_none                   "O\t"
@@ -658,6 +1042,34 @@ static const char rv_freg_name_sym[32][5] =3D {
 #define rv_fmt_rs2_offset             "O\t2,o"
 #define rv_fmt_rs1_rs2_bs             "O\t1,2,b"
 #define rv_fmt_rd_rs1_rnum            "O\t0,1,n"
+#define rv_fmt_ldst_vd_rs1_vm         "O\tD,(1)m"
+#define rv_fmt_ldst_vd_rs1_rs2_vm     "O\tD,(1),2m"
+#define rv_fmt_ldst_vd_rs1_vs2_vm     "O\tD,(1),Fm"
+#define rv_fmt_vd_vs2_vs1             "O\tD,F,E"
+#define rv_fmt_vd_vs2_vs1_vl          "O\tD,F,El"
+#define rv_fmt_vd_vs2_vs1_vm          "O\tD,F,Em"
+#define rv_fmt_vd_vs2_rs1_vl          "O\tD,F,1l"
+#define rv_fmt_vd_vs2_fs1_vl          "O\tD,F,4l"
+#define rv_fmt_vd_vs2_rs1_vm          "O\tD,F,1m"
+#define rv_fmt_vd_vs2_fs1_vm          "O\tD,F,4m"
+#define rv_fmt_vd_vs2_imm_vl          "O\tD,F,il"
+#define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
+#define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
+#define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
+#define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
+#define rv_fmt_vd_fs1_vs2_vm          "O\tD,4,Fm"
+#define rv_fmt_vd_vs1                 "O\tD,E"
+#define rv_fmt_vd_rs1                 "O\tD,1"
+#define rv_fmt_vd_fs1                 "O\tD,4"
+#define rv_fmt_vd_imm                 "O\tD,i"
+#define rv_fmt_vd_vs2                 "O\tD,F"
+#define rv_fmt_vd_vs2_vm              "O\tD,Fm"
+#define rv_fmt_rd_vs2_vm              "O\t0,Fm"
+#define rv_fmt_rd_vs2                 "O\t0,F"
+#define rv_fmt_fd_vs2                 "O\t3,F"
+#define rv_fmt_vd_vm                  "O\tDm"
+#define rv_fmt_vsetvli                "O\t0,1,v"
+#define rv_fmt_vsetivli               "O\t0,u,v"
=20
 /* pseudo-instruction constraints */
=20
@@ -1283,7 +1695,377 @@ const rv_opcode_data opcode_data[] =3D {
     { "unzip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "zip", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "xperm4", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
-    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 }
+    { "xperm8", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "vle8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle8=
_v, rv_op_vle8_v, 0 },
+    { "vle16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle=
16_v, rv_op_vle16_v, 0 },
+    { "vle32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle=
32_v, rv_op_vle32_v, 0 },
+    { "vle64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vle=
64_v, rv_op_vle64_v, 0 },
+    { "vse8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse8=
_v, rv_op_vse8_v, 0 },
+    { "vse16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse=
16_v, rv_op_vse16_v, 0 },
+    { "vse32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse=
32_v, rv_op_vse32_v, 0 },
+    { "vse64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vse=
64_v, rv_op_vse64_v, 0 },
+    { "vlm.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vlm_v=
, rv_op_vlm_v, 0 },
+    { "vsm.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vsm_v=
, rv_op_vsm_v, 0 },
+    { "vlse8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vl=
se8_v, rv_op_vlse8_v, 0 },
+    { "vlse16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
lse16_v, rv_op_vlse16_v, 0 },
+    { "vlse32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
lse32_v, rv_op_vlse32_v, 0 },
+    { "vlse64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
lse64_v, rv_op_vlse64_v, 0 },
+    { "vsse8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_vs=
se8_v, rv_op_vsse8_v, 0 },
+    { "vsse16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
sse16_v, rv_op_vsse16_v, 0 },
+    { "vsse32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
sse32_v, rv_op_vsse32_v, 0 },
+    { "vsse64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_rs2_vm, NULL, rv_op_v=
sse64_v, rv_op_vsse64_v, 0 },
+    { "vluxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_=
vluxei8_v, rv_op_vluxei8_v, 0 },
+    { "vluxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vluxei16_v, rv_op_vluxei16_v, 0 },
+    { "vluxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vluxei32_v, rv_op_vluxei32_v, 0 },
+    { "vluxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vluxei64_v, rv_op_vluxei64_v, 0 },
+    { "vloxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_=
vloxei8_v, rv_op_vloxei8_v, 0 },
+    { "vloxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vloxei16_v, rv_op_vloxei16_v, 0 },
+    { "vloxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vloxei32_v, rv_op_vloxei32_v, 0 },
+    { "vloxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vloxei64_v, rv_op_vloxei64_v, 0 },
+    { "vsuxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_=
vsuxei8_v, rv_op_vsuxei8_v, 0 },
+    { "vsuxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsuxei16_v, rv_op_vsuxei16_v, 0 },
+    { "vsuxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsuxei32_v, rv_op_vsuxei32_v, 0 },
+    { "vsuxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsuxei64_v, rv_op_vsuxei64_v, 0 },
+    { "vsoxei8.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op_=
vsoxei8_v, rv_op_vsoxei8_v, 0 },
+    { "vsoxei16.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsoxei16_v, rv_op_vsoxei16_v, 0 },
+    { "vsoxei32.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsoxei32_v, rv_op_vsoxei32_v, 0 },
+    { "vsoxei64.v", rv_codec_v_r, rv_fmt_ldst_vd_rs1_vs2_vm, NULL, rv_op=
_vsoxei64_v, rv_op_vsoxei64_v, 0 },
+    { "vle8ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
e8ff_v, rv_op_vle8ff_v, 0 },
+    { "vle16ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
le16ff_v, rv_op_vle16ff_v, 0 },
+    { "vle32ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
le32ff_v, rv_op_vle32ff_v, 0 },
+    { "vle64ff.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
le64ff_v, rv_op_vle64ff_v, 0 },
+    { "vl1re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
1re8_v, rv_op_vl1re8_v, 0 },
+    { "vl1re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l1re16_v, rv_op_vl1re16_v, 0 },
+    { "vl1re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l1re32_v, rv_op_vl1re32_v, 0 },
+    { "vl1re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l1re64_v, rv_op_vl1re64_v, 0 },
+    { "vl2re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
2re8_v, rv_op_vl2re8_v, 0 },
+    { "vl2re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l2re16_v, rv_op_vl2re16_v, 0 },
+    { "vl2re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l2re32_v, rv_op_vl2re32_v, 0 },
+    { "vl2re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l2re64_v, rv_op_vl2re64_v, 0 },
+    { "vl4re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
4re8_v, rv_op_vl4re8_v, 0 },
+    { "vl4re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l4re16_v, rv_op_vl4re16_v, 0 },
+    { "vl4re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l4re32_v, rv_op_vl4re32_v, 0 },
+    { "vl4re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l4re64_v, rv_op_vl4re64_v, 0 },
+    { "vl8re8.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vl=
8re8_v, rv_op_vl8re8_v, 0 },
+    { "vl8re16.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l8re16_v, rv_op_vl8re16_v, 0 },
+    { "vl8re32.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l8re32_v, rv_op_vl8re32_v, 0 },
+    { "vl8re64.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_v=
l8re64_v, rv_op_vl8re64_v, 0 },
+    { "vs1r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs1r=
_v, rv_op_vs1r_v, 0 },
+    { "vs2r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs2r=
_v, rv_op_vs2r_v, 0 },
+    { "vs4r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs4r=
_v, rv_op_vs4r_v, 0 },
+    { "vs8r.v", rv_codec_v_ldst, rv_fmt_ldst_vd_rs1_vm, NULL, rv_op_vs8r=
_v, rv_op_vs8r_v, 0 },
+    { "vadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vadd_vv=
, rv_op_vadd_vv, 0 },
+    { "vadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vadd_vx=
, rv_op_vadd_vx, 0 },
+    { "vadd.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vadd_vi=
, rv_op_vadd_vi, 0 },
+    { "vsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsub_vv=
, rv_op_vsub_vv, 0 },
+    { "vsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsub_vx=
, rv_op_vsub_vx, 0 },
+    { "vrsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrsub_=
vx, rv_op_vrsub_vx, 0 },
+    { "vrsub.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vrsub_=
vi, rv_op_vrsub_vi, 0 },
+    { "vwaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd=
u_vv, rv_op_vwaddu_vv, 0 },
+    { "vwaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd=
u_vx, rv_op_vwaddu_vx, 0 },
+    { "vwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd_=
vv, rv_op_vwadd_vv, 0 },
+    { "vwadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd_=
vx, rv_op_vwadd_vx, 0 },
+    { "vwsubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub=
u_vv, rv_op_vwsubu_vv, 0 },
+    { "vwsubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub=
u_vx, rv_op_vwsubu_vx, 0 },
+    { "vwsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub_=
vv, rv_op_vwsub_vv, 0 },
+    { "vwsub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub_=
vx, rv_op_vwsub_vx, 0 },
+    { "vwaddu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd=
u_wv, rv_op_vwaddu_wv, 0 },
+    { "vwaddu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd=
u_wx, rv_op_vwaddu_wx, 0 },
+    { "vwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwadd_=
wv, rv_op_vwadd_wv, 0 },
+    { "vwadd.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwadd_=
wx, rv_op_vwadd_wx, 0 },
+    { "vwsubu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub=
u_wv, rv_op_vwsubu_wv, 0 },
+    { "vwsubu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub=
u_wx, rv_op_vwsubu_wx, 0 },
+    { "vwsub.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwsub_=
wv, rv_op_vwsub_wv, 0 },
+    { "vwsub.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwsub_=
wx, rv_op_vwsub_wx, 0 },
+    { "vadc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vadc_v=
vm, rv_op_vadc_vvm, 0 },
+    { "vadc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vadc_v=
xm, rv_op_vadc_vxm, 0 },
+    { "vadc.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vadc_v=
im, rv_op_vadc_vim, 0 },
+    { "vmadc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmadc=
_vvm, rv_op_vmadc_vvm, 0 },
+    { "vmadc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmadc=
_vxm, rv_op_vmadc_vxm, 0 },
+    { "vmadc.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vmadc=
_vim, rv_op_vmadc_vim, 0 },
+    { "vsbc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vsbc_v=
vm, rv_op_vsbc_vvm, 0 },
+    { "vsbc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vsbc_v=
xm, rv_op_vsbc_vxm, 0 },
+    { "vmsbc.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmsbc=
_vvm, rv_op_vmsbc_vvm, 0 },
+    { "vmsbc.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmsbc=
_vxm, rv_op_vmsbc_vxm, 0 },
+    { "vand.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vand_vv=
, rv_op_vand_vv, 0 },
+    { "vand.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vand_vx=
, rv_op_vand_vx, 0 },
+    { "vand.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vand_vi=
, rv_op_vand_vi, 0 },
+    { "vor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vor_vv, =
rv_op_vor_vv, 0 },
+    { "vor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vor_vx, =
rv_op_vor_vx, 0 },
+    { "vor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vor_vi, =
rv_op_vor_vi, 0 },
+    { "vxor.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vxor_vv=
, rv_op_vxor_vv, 0 },
+    { "vxor.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vxor_vx=
, rv_op_vxor_vx, 0 },
+    { "vxor.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vxor_vi=
, rv_op_vxor_vi, 0 },
+    { "vsll.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsll_vv=
, rv_op_vsll_vv, 0 },
+    { "vsll.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsll_vx=
, rv_op_vsll_vx, 0 },
+    { "vsll.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsll_v=
i, rv_op_vsll_vi, 0 },
+    { "vsrl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsrl_vv=
, rv_op_vsrl_vv, 0 },
+    { "vsrl.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsrl_vx=
, rv_op_vsrl_vx, 0 },
+    { "vsrl.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsrl_v=
i, rv_op_vsrl_vi, 0 },
+    { "vsra.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsra_vv=
, rv_op_vsra_vv, 0 },
+    { "vsra.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsra_vx=
, rv_op_vsra_vx, 0 },
+    { "vsra.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vsra_v=
i, rv_op_vsra_vi, 0 },
+    { "vnsrl.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vnsrl_=
wv, rv_op_vnsrl_wv, 0 },
+    { "vnsrl.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vnsrl_=
wx, rv_op_vnsrl_wx, 0 },
+    { "vnsrl.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnsrl=
_wi, rv_op_vnsrl_wi, 0 },
+    { "vnsra.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vnsra_=
wv, rv_op_vnsra_wv, 0 },
+    { "vnsra.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vnsra_=
wx, rv_op_vnsra_wx, 0 },
+    { "vnsra.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnsra=
_wi, rv_op_vnsra_wi, 0 },
+    { "vmseq.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmseq_=
vv, rv_op_vmseq_vv, 0 },
+    { "vmseq.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmseq_=
vx, rv_op_vmseq_vx, 0 },
+    { "vmseq.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmseq_=
vi, rv_op_vmseq_vi, 0 },
+    { "vmsne.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsne_=
vv, rv_op_vmsne_vv, 0 },
+    { "vmsne.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsne_=
vx, rv_op_vmsne_vx, 0 },
+    { "vmsne.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsne_=
vi, rv_op_vmsne_vi, 0 },
+    { "vmsltu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmslt=
u_vv, rv_op_vmsltu_vv, 0 },
+    { "vmsltu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmslt=
u_vx, rv_op_vmsltu_vx, 0 },
+    { "vmslt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmslt_=
vv, rv_op_vmslt_vv, 0 },
+    { "vmslt.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmslt_=
vx, rv_op_vmslt_vx, 0 },
+    { "vmsleu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsle=
u_vv, rv_op_vmsleu_vv, 0 },
+    { "vmsleu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsle=
u_vx, rv_op_vmsleu_vx, 0 },
+    { "vmsleu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsle=
u_vi, rv_op_vmsleu_vi, 0 },
+    { "vmsle.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmsle_=
vv, rv_op_vmsle_vv, 0 },
+    { "vmsle.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsle_=
vx, rv_op_vmsle_vx, 0 },
+    { "vmsle.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsle_=
vi, rv_op_vmsle_vi, 0 },
+    { "vmsgtu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsgt=
u_vx, rv_op_vmsgtu_vx, 0 },
+    { "vmsgtu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsgt=
u_vi, rv_op_vmsgtu_vi, 0 },
+    { "vmsgt.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmsgt_=
vx, rv_op_vmsgt_vx, 0 },
+    { "vmsgt.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vmsgt_=
vi, rv_op_vmsgt_vi, 0 },
+    { "vminu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vminu_=
vv, rv_op_vminu_vv, 0 },
+    { "vminu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vminu_=
vx, rv_op_vminu_vx, 0 },
+    { "vmin.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmin_vv=
, rv_op_vmin_vv, 0 },
+    { "vmin.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmin_vx=
, rv_op_vmin_vx, 0 },
+    { "vmaxu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmaxu_=
vv, rv_op_vmaxu_vv, 0 },
+    { "vmaxu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmaxu_=
vx, rv_op_vmaxu_vx, 0 },
+    { "vmax.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmax_vv=
, rv_op_vmax_vv, 0 },
+    { "vmax.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmax_vx=
, rv_op_vmax_vx, 0 },
+    { "vmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmul_vv=
, rv_op_vmul_vv, 0 },
+    { "vmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmul_vx=
, rv_op_vmul_vx, 0 },
+    { "vmulh.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmulh_=
vv, rv_op_vmulh_vv, 0 },
+    { "vmulh.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmulh_=
vx, rv_op_vmulh_vx, 0 },
+    { "vmulhu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmulh=
u_vv, rv_op_vmulhu_vv, 0 },
+    { "vmulhu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmulh=
u_vx, rv_op_vmulhu_vx, 0 },
+    { "vmulhsu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmul=
hsu_vv, rv_op_vmulhsu_vv, 0 },
+    { "vmulhsu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vmul=
hsu_vx, rv_op_vmulhsu_vx, 0 },
+    { "vdivu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vdivu_=
vv, rv_op_vdivu_vv, 0 },
+    { "vdivu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vdivu_=
vx, rv_op_vdivu_vx, 0 },
+    { "vdiv.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vdiv_vv=
, rv_op_vdiv_vv, 0 },
+    { "vdiv.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vdiv_vx=
, rv_op_vdiv_vx, 0 },
+    { "vremu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vremu_=
vv, rv_op_vremu_vv, 0 },
+    { "vremu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vremu_=
vx, rv_op_vremu_vx, 0 },
+    { "vrem.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vrem_vv=
, rv_op_vrem_vv, 0 },
+    { "vrem.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrem_vx=
, rv_op_vrem_vx, 0 },
+    { "vwmulu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmul=
u_vv, rv_op_vwmulu_vv, 0 },
+    { "vwmulu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmul=
u_vx, rv_op_vwmulu_vx, 0 },
+    { "vwmulsu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmu=
lsu_vv, rv_op_vwmulsu_vv, 0 },
+    { "vwmulsu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmu=
lsu_vx, rv_op_vwmulsu_vx, 0 },
+    { "vwmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwmul_=
vv, rv_op_vwmul_vv, 0 },
+    { "vwmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vwmul_=
vx, rv_op_vwmul_vx, 0 },
+    { "vmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vmacc_=
vv, rv_op_vmacc_vv, 0 },
+    { "vmacc.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vmacc_=
vx, rv_op_vmacc_vx, 0 },
+    { "vnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vnmsa=
c_vv, rv_op_vnmsac_vv, 0 },
+    { "vnmsac.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vnmsa=
c_vx, rv_op_vnmsac_vx, 0 },
+    { "vmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vmadd_=
vv, rv_op_vmadd_vv, 0 },
+    { "vmadd.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vmadd_=
vx, rv_op_vmadd_vx, 0 },
+    { "vnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vnmsu=
b_vv, rv_op_vnmsub_vv, 0 },
+    { "vnmsub.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vnmsu=
b_vx, rv_op_vnmsub_vx, 0 },
+    { "vwmaccu.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwma=
ccu_vv, rv_op_vwmaccu_vv, 0 },
+    { "vwmaccu.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwma=
ccu_vx, rv_op_vwmaccu_vx, 0 },
+    { "vwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwmac=
c_vv, rv_op_vwmacc_vv, 0 },
+    { "vwmacc.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwmac=
c_vx, rv_op_vwmacc_vx, 0 },
+    { "vwmaccsu.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vwm=
accsu_vv, rv_op_vwmaccsu_vv, 0 },
+    { "vwmaccsu.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwm=
accsu_vx, rv_op_vwmaccsu_vx, 0 },
+    { "vwmaccus.vx", rv_codec_v_r, rv_fmt_vd_rs1_vs2_vm, NULL, rv_op_vwm=
accus_vx, rv_op_vwmaccus_vx, 0 },
+    { "vmv.v.v", rv_codec_v_r, rv_fmt_vd_vs1, NULL, rv_op_vmv_v_v, rv_op=
_vmv_v_v, 0 },
+    { "vmv.v.x", rv_codec_v_r, rv_fmt_vd_rs1, NULL, rv_op_vmv_v_x, rv_op=
_vmv_v_x, 0 },
+    { "vmv.v.i", rv_codec_v_i, rv_fmt_vd_imm, NULL, rv_op_vmv_v_i, rv_op=
_vmv_v_i, 0 },
+    { "vmerge.vvm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vl, NULL, rv_op_vmer=
ge_vvm, rv_op_vmerge_vvm, 0 },
+    { "vmerge.vxm", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vl, NULL, rv_op_vmer=
ge_vxm, rv_op_vmerge_vxm, 0 },
+    { "vmerge.vim", rv_codec_v_i, rv_fmt_vd_vs2_imm_vl, NULL, rv_op_vmer=
ge_vim, rv_op_vmerge_vim, 0 },
+    { "vsaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsadd=
u_vv, rv_op_vsaddu_vv, 0 },
+    { "vsaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsadd=
u_vx, rv_op_vsaddu_vx, 0 },
+    { "vsaddu.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vsadd=
u_vi, rv_op_vsaddu_vi, 0 },
+    { "vsadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsadd_=
vv, rv_op_vsadd_vv, 0 },
+    { "vsadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsadd_=
vx, rv_op_vsadd_vx, 0 },
+    { "vsadd.vi", rv_codec_v_i, rv_fmt_vd_vs2_imm_vm, NULL, rv_op_vsadd_=
vi, rv_op_vsadd_vi, 0 },
+    { "vssubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssub=
u_vv, rv_op_vssubu_vv, 0 },
+    { "vssubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssub=
u_vx, rv_op_vssubu_vx, 0 },
+    { "vssub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssub_=
vv, rv_op_vssub_vv, 0 },
+    { "vssub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssub_=
vx, rv_op_vssub_vx, 0 },
+    { "vaadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vaadd_=
vv, rv_op_vaadd_vv, 0 },
+    { "vaadd.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vaadd_=
vx, rv_op_vaadd_vx, 0 },
+    { "vaaddu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vaadd=
u_vv, rv_op_vaaddu_vv, 0 },
+    { "vaaddu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vaadd=
u_vx, rv_op_vaaddu_vx, 0 },
+    { "vasub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vasub_=
vv, rv_op_vasub_vv, 0 },
+    { "vasub.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vasub_=
vx, rv_op_vasub_vx, 0 },
+    { "vasubu.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vasub=
u_vv, rv_op_vasubu_vv, 0 },
+    { "vasubu.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vasub=
u_vx, rv_op_vasubu_vx, 0 },
+    { "vsmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vsmul_=
vv, rv_op_vsmul_vv, 0 },
+    { "vsmul.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsmul_=
vx, rv_op_vsmul_vx, 0 },
+    { "vssrl.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssrl_=
vv, rv_op_vssrl_vv, 0 },
+    { "vssrl.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssrl_=
vx, rv_op_vssrl_vx, 0 },
+    { "vssrl.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vssrl=
_vi, rv_op_vssrl_vi, 0 },
+    { "vssra.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vssra_=
vv, rv_op_vssra_vv, 0 },
+    { "vssra.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vssra_=
vx, rv_op_vssra_vx, 0 },
+    { "vssra.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vssra=
_vi, rv_op_vssra_vi, 0 },
+    { "vnclipu.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vncl=
ipu_wv, rv_op_vnclipu_wv, 0 },
+    { "vnclipu.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vncl=
ipu_wx, rv_op_vnclipu_wx, 0 },
+    { "vnclipu.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vnc=
lipu_wi, rv_op_vnclipu_wi, 0 },
+    { "vnclip.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vncli=
p_wv, rv_op_vnclip_wv, 0 },
+    { "vnclip.wx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vncli=
p_wx, rv_op_vnclip_wx, 0 },
+    { "vnclip.wi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vncl=
ip_wi, rv_op_vnclip_wi, 0 },
+    { "vfadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfadd_=
vv, rv_op_vfadd_vv, 0 },
+    { "vfadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfadd_=
vf, rv_op_vfadd_vf, 0 },
+    { "vfsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsub_=
vv, rv_op_vfsub_vv, 0 },
+    { "vfsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsub_=
vf, rv_op_vfsub_vf, 0 },
+    { "vfrsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfrsu=
b_vf, rv_op_vfrsub_vf, 0 },
+    { "vfwadd.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwad=
d_vv, rv_op_vfwadd_vv, 0 },
+    { "vfwadd.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwad=
d_vf, rv_op_vfwadd_vf, 0 },
+    { "vfwadd.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwad=
d_wv, rv_op_vfwadd_wv, 0 },
+    { "vfwadd.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwad=
d_wf, rv_op_vfwadd_wf, 0 },
+    { "vfwsub.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwsu=
b_vv, rv_op_vfwsub_vv, 0 },
+    { "vfwsub.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwsu=
b_vf, rv_op_vfwsub_vf, 0 },
+    { "vfwsub.wv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwsu=
b_wv, rv_op_vfwsub_wv, 0 },
+    { "vfwsub.wf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwsu=
b_wf, rv_op_vfwsub_wf, 0 },
+    { "vfmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmul_=
vv, rv_op_vfmul_vv, 0 },
+    { "vfmul.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmul_=
vf, rv_op_vfmul_vf, 0 },
+    { "vfdiv.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfdiv_=
vv, rv_op_vfdiv_vv, 0 },
+    { "vfdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfdiv_=
vf, rv_op_vfdiv_vf, 0 },
+    { "vfrdiv.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfrdi=
v_vf, rv_op_vfrdiv_vf, 0 },
+    { "vfwmul.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfwmu=
l_vv, rv_op_vfwmul_vv, 0 },
+    { "vfwmul.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfwmu=
l_vf, rv_op_vfwmul_vf, 0 },
+    { "vfmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmac=
c_vv, rv_op_vfmacc_vv, 0 },
+    { "vfmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmac=
c_vf, rv_op_vfmacc_vf, 0 },
+    { "vfnmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnm=
acc_vv, rv_op_vfnmacc_vv, 0 },
+    { "vfnmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnm=
acc_vf, rv_op_vfnmacc_vf, 0 },
+    { "vfmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmsa=
c_vv, rv_op_vfmsac_vv, 0 },
+    { "vfmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmsa=
c_vf, rv_op_vfmsac_vf, 0 },
+    { "vfnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnm=
sac_vv, rv_op_vfnmsac_vv, 0 },
+    { "vfnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnm=
sac_vf, rv_op_vfnmsac_vf, 0 },
+    { "vfmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmad=
d_vv, rv_op_vfmadd_vv, 0 },
+    { "vfmadd.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmad=
d_vf, rv_op_vfmadd_vf, 0 },
+    { "vfnmadd.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnm=
add_vv, rv_op_vfnmadd_vv, 0 },
+    { "vfnmadd.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnm=
add_vf, rv_op_vfnmadd_vf, 0 },
+    { "vfmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfmsu=
b_vv, rv_op_vfmsub_vv, 0 },
+    { "vfmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfmsu=
b_vf, rv_op_vfmsub_vf, 0 },
+    { "vfnmsub.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfnm=
sub_vv, rv_op_vfnmsub_vv, 0 },
+    { "vfnmsub.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfnm=
sub_vf, rv_op_vfnmsub_vf, 0 },
+    { "vfwmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfwm=
acc_vv, rv_op_vfwmacc_vv, 0 },
+    { "vfwmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfwm=
acc_vf, rv_op_vfwmacc_vf, 0 },
+    { "vfwnmacc.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfw=
nmacc_vv, rv_op_vfwnmacc_vv, 0 },
+    { "vfwnmacc.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfw=
nmacc_vf, rv_op_vfwnmacc_vf, 0 },
+    { "vfwmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfwm=
sac_vv, rv_op_vfwmsac_vv, 0 },
+    { "vfwmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfwm=
sac_vf, rv_op_vfwmsac_vf, 0 },
+    { "vfwnmsac.vv", rv_codec_v_r, rv_fmt_vd_vs1_vs2_vm, NULL, rv_op_vfw=
nmsac_vv, rv_op_vfwnmsac_vv, 0 },
+    { "vfwnmsac.vf", rv_codec_v_r, rv_fmt_vd_fs1_vs2_vm, NULL, rv_op_vfw=
nmsac_vf, rv_op_vfwnmsac_vf, 0 },
+    { "vfsqrt.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfsqrt_v, rv_=
op_vfsqrt_v, 0 },
+    { "vfrsqrt7.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfrsqrt7_v,=
 rv_op_vfrsqrt7_v, 0 },
+    { "vfrec7.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vfrec7_v, rv_=
op_vfrec7_v, 0 },
+    { "vfmin.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmin_=
vv, rv_op_vfmin_vv, 0 },
+    { "vfmin.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmin_=
vf, rv_op_vfmin_vf, 0 },
+    { "vfmax.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfmax_=
vv, rv_op_vfmax_vv, 0 },
+    { "vfmax.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfmax_=
vf, rv_op_vfmax_vf, 0 },
+    { "vfsgnj.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsgn=
j_vv, rv_op_vfsgnj_vv, 0 },
+    { "vfsgnj.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsgn=
j_vf, rv_op_vfsgnj_vf, 0 },
+    { "vfsgnjn.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsg=
njn_vv, rv_op_vfsgnjn_vv, 0 },
+    { "vfsgnjn.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsg=
njn_vf, rv_op_vfsgnjn_vf, 0 },
+    { "vfsgnjx.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfsg=
njx_vv, rv_op_vfsgnjx_vv, 0 },
+    { "vfsgnjx.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vfsg=
njx_vf, rv_op_vfsgnjx_vf, 0 },
+    { "vfslide1up.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_v=
fslide1up_vf, rv_op_vfslide1up_vf, 0 },
+    { "vfslide1down.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op=
_vfslide1down_vf, rv_op_vfslide1down_vf, 0 },
+    { "vmfeq.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfeq_=
vv, rv_op_vmfeq_vv, 0 },
+    { "vmfeq.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfeq_=
vf, rv_op_vmfeq_vf, 0 },
+    { "vmfne.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfne_=
vv, rv_op_vmfne_vv, 0 },
+    { "vmfne.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfne_=
vf, rv_op_vmfne_vf, 0 },
+    { "vmflt.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmflt_=
vv, rv_op_vmflt_vv, 0 },
+    { "vmflt.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmflt_=
vf, rv_op_vmflt_vf, 0 },
+    { "vmfle.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmfle_=
vv, rv_op_vmfle_vv, 0 },
+    { "vmfle.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfle_=
vf, rv_op_vmfle_vf, 0 },
+    { "vmfgt.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfgt_=
vf, rv_op_vmfgt_vf, 0 },
+    { "vmfge.vf", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vm, NULL, rv_op_vmfge_=
vf, rv_op_vmfge_vf, 0 },
+    { "vfclass.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfclass_v=
, rv_op_vfclass_v, 0 },
+    { "vfmerge.vfm", rv_codec_v_r, rv_fmt_vd_vs2_fs1_vl, NULL, rv_op_vfm=
erge_vfm, rv_op_vfmerge_vfm, 0 },
+    { "vfmv.v.f", rv_codec_v_r, rv_fmt_vd_fs1, NULL, rv_op_vfmv_v_f, rv_=
op_vfmv_v_f, 0 },
+    { "vfcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_=
xu_f_v, rv_op_vfcvt_xu_f_v, 0 },
+    { "vfcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_x=
_f_v, rv_op_vfcvt_x_f_v, 0 },
+    { "vfcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_=
f_xu_v, rv_op_vfcvt_f_xu_v, 0 },
+    { "vfcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfcvt_f=
_x_v, rv_op_vfcvt_f_x_v, 0 },
+    { "vfcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vf=
cvt_rtz_xu_f_v, rv_op_vfcvt_rtz_xu_f_v, 0 },
+    { "vfcvt.rtz.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfc=
vt_rtz_x_f_v, rv_op_vfcvt_rtz_x_f_v, 0 },
+    { "vfwcvt.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcv=
t_xu_f_v, rv_op_vfwcvt_xu_f_v, 0 },
+    { "vfwcvt.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt=
_x_f_v, rv_op_vfwcvt_x_f_v, 0 },
+    { "vfwcvt.f.xu.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcv=
t_f_xu_v, rv_op_vfwcvt_f_xu_v, 0 },
+    { "vfwcvt.f.x.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt=
_f_x_v, rv_op_vfwcvt_f_x_v, 0 },
+    { "vfwcvt.f.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfwcvt=
_f_f_v, rv_op_vfwcvt_f_f_v, 0 },
+    { "vfwcvt.rtz.xu.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_v=
fwcvt_rtz_xu_f_v, rv_op_vfwcvt_rtz_xu_f_v, 0 },
+    { "vfwcvt.rtz.x.f.v", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vf=
wcvt_rtz_x_f_v, rv_op_vfwcvt_rtz_x_f_v, 0 },
+    { "vfncvt.xu.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncv=
t_xu_f_w, rv_op_vfncvt_xu_f_w, 0 },
+    { "vfncvt.x.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt=
_x_f_w, rv_op_vfncvt_x_f_w, 0 },
+    { "vfncvt.f.xu.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncv=
t_f_xu_w, rv_op_vfncvt_f_xu_w, 0 },
+    { "vfncvt.f.x.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt=
_f_x_w, rv_op_vfncvt_f_x_w, 0 },
+    { "vfncvt.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vfncvt=
_f_f_w, rv_op_vfncvt_f_f_w, 0 },
+    { "vfncvt.rod.f.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vf=
ncvt_rod_f_f_w, rv_op_vfncvt_rod_f_f_w, 0 },
+    { "vfncvt.rtz.xu.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_v=
fncvt_rtz_xu_f_w, rv_op_vfncvt_rtz_xu_f_w, 0 },
+    { "vfncvt.rtz.x.f.w", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vf=
ncvt_rtz_x_f_w, rv_op_vfncvt_rtz_x_f_w, 0 },
+    { "vredsum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
sum_vs, rv_op_vredsum_vs, 0 },
+    { "vredand.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
and_vs, rv_op_vredand_vs, 0 },
+    { "vredor.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vredo=
r_vs, rv_op_vredor_vs, 0 },
+    { "vredxor.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
xor_vs, rv_op_vredxor_vs, 0 },
+    { "vredminu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vre=
dminu_vs, rv_op_vredminu_vs, 0 },
+    { "vredmin.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
min_vs, rv_op_vredmin_vs, 0 },
+    { "vredmaxu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vre=
dmaxu_vs, rv_op_vredmaxu_vs, 0 },
+    { "vredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vred=
max_vs, rv_op_vredmax_vs, 0 },
+    { "vwredsumu.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vw=
redsumu_vs, rv_op_vwredsumu_vs, 0 },
+    { "vwredsum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vwr=
edsum_vs, rv_op_vwredsum_vs, 0 },
+    { "vfredusum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vf=
redusum_vs, rv_op_vfredusum_vs, 0 },
+    { "vfredosum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vf=
redosum_vs, rv_op_vfredosum_vs, 0 },
+    { "vfredmin.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfr=
edmin_vs, rv_op_vfredmin_vs, 0 },
+    { "vfredmax.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vfr=
edmax_vs, rv_op_vfredmax_vs, 0 },
+    { "vfwredusum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_v=
fwredusum_vs, rv_op_vfwredusum_vs, 0 },
+    { "vfwredosum.vs", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_v=
fwredosum_vs, rv_op_vfwredosum_vs, 0 },
+    { "vmand.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmand_=
mm, rv_op_vmand_mm, 0 },
+    { "vmnand.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmnan=
d_mm, rv_op_vmnand_mm, 0 },
+    { "vmandn.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmand=
n_mm, rv_op_vmandn_mm, 0 },
+    { "vmxor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmxor_=
mm, rv_op_vmxor_mm, 0 },
+    { "vmor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmor_mm=
, rv_op_vmor_mm, 0 },
+    { "vmnor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmnor_=
mm, rv_op_vmnor_mm, 0 },
+    { "vmorn.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmorn_=
mm, rv_op_vmorn_mm, 0 },
+    { "vmxnor.mm", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vmxno=
r_mm, rv_op_vmxnor_mm, 0 },
+    { "vcpop.m", rv_codec_v_r, rv_fmt_rd_vs2_vm, NULL, rv_op_vcpop_m, rv=
_op_vcpop_m, 0 },
+    { "vfirst.m", rv_codec_v_r, rv_fmt_rd_vs2_vm, NULL, rv_op_vfirst_m, =
rv_op_vfirst_m, 0 },
+    { "vmsbf.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsbf_m, rv=
_op_vmsbf_m, 0 },
+    { "vmsif.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsif_m, rv=
_op_vmsif_m, 0 },
+    { "vmsof.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vmsof_m, rv=
_op_vmsof_m, 0 },
+    { "viota.m", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_viota_m, rv=
_op_viota_m, 0 },
+    { "vid.v", rv_codec_v_r, rv_fmt_vd_vm, NULL, rv_op_vid_v, rv_op_vid_=
v, 0 },
+    { "vmv.x.s", rv_codec_v_r, rv_fmt_rd_vs2, NULL, rv_op_vmv_x_s, rv_op=
_vmv_x_s, 0 },
+    { "vmv.s.x", rv_codec_v_r, rv_fmt_vd_rs1, NULL, rv_op_vmv_s_x, rv_op=
_vmv_s_x, 0 },
+    { "vfmv.f.s", rv_codec_v_r, rv_fmt_fd_vs2, NULL, rv_op_vfmv_f_s, rv_=
op_vfmv_f_s, 0 },
+    { "vfmv.s.f", rv_codec_v_r, rv_fmt_vd_fs1, NULL, rv_op_vfmv_s_f, rv_=
op_vfmv_s_f, 0 },
+    { "vslideup.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vsl=
ideup_vx, rv_op_vslideup_vx, 0 },
+    { "vslideup.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vs=
lideup_vi, rv_op_vslideup_vi, 0 },
+    { "vslide1up.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vs=
lide1up_vx, rv_op_vslide1up_vx, 0 },
+    { "vslidedown.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_v=
slidedown_vx, rv_op_vslidedown_vx, 0 },
+    { "vslidedown.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_=
vslidedown_vi, rv_op_vslidedown_vi, 0 },
+    { "vslide1down.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_=
vslide1down_vx, rv_op_vslide1down_vx, 0 },
+    { "vrgather.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op_vrg=
ather_vv, rv_op_vrgather_vv, 0 },
+    { "vrgatherei16.vv", rv_codec_v_r, rv_fmt_vd_vs2_vs1_vm, NULL, rv_op=
_vrgatherei16_vv, rv_op_vrgatherei16_vv, 0 },
+    { "vrgather.vx", rv_codec_v_r, rv_fmt_vd_vs2_rs1_vm, NULL, rv_op_vrg=
ather_vx, rv_op_vrgather_vx, 0 },
+    { "vrgather.vi", rv_codec_v_i, rv_fmt_vd_vs2_uimm_vm, NULL, rv_op_vr=
gather_vi, rv_op_vrgather_vi, 0 },
+    { "vcompress.vm", rv_codec_v_r, rv_fmt_vd_vs2_vs1, NULL, rv_op_vcomp=
ress_vm, rv_op_vcompress_vm, 0 },
+    { "vmv1r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv1r_v, rv_op=
_vmv1r_v, 0 },
+    { "vmv2r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv2r_v, rv_op=
_vmv2r_v, 0 },
+    { "vmv4r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv4r_v, rv_op=
_vmv4r_v, 0 },
+    { "vmv8r.v", rv_codec_v_r, rv_fmt_vd_vs2, NULL, rv_op_vmv8r_v, rv_op=
_vmv8r_v, 0 },
+    { "vzext.vf2", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf2=
, rv_op_vzext_vf2, 0 },
+    { "vzext.vf4", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf4=
, rv_op_vzext_vf4, 0 },
+    { "vzext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vzext_vf8=
, rv_op_vzext_vf8, 0 },
+    { "vsext.vf2", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf2=
, rv_op_vsext_vf2, 0 },
+    { "vsext.vf4", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf4=
, rv_op_vsext_vf4, 0 },
+    { "vsext.vf8", rv_codec_v_r, rv_fmt_vd_vs2_vm, NULL, rv_op_vsext_vf8=
, rv_op_vsext_vf8, 0 },
+    { "vsetvli", rv_codec_vsetvli, rv_fmt_vsetvli, NULL, rv_op_vsetvli, =
rv_op_vsetvli, 0 },
+    { "vsetivli", rv_codec_vsetivli, rv_fmt_vsetivli, NULL, rv_op_vsetiv=
li, rv_op_vsetivli, 0 },
+    { "vsetvl", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, rv_op_vsetvl, rv_op=
_vsetvl, 0 }
 };
=20
 /* CSR names */
@@ -1297,6 +2079,10 @@ static const char *csr_name(int csrno)
     case 0x0003: return "fcsr";
     case 0x0004: return "uie";
     case 0x0005: return "utvec";
+    case 0x0008: return "vstart";
+    case 0x0009: return "vxsat";
+    case 0x000a: return "vxrm";
+    case 0x000f: return "vcsr";
     case 0x0015: return "seed";
     case 0x0040: return "uscratch";
     case 0x0041: return "uepc";
@@ -1469,6 +2255,9 @@ static const char *csr_name(int csrno)
     case 0x0c00: return "cycle";
     case 0x0c01: return "time";
     case 0x0c02: return "instret";
+    case 0x0c20: return "vl";
+    case 0x0c21: return "vtype";
+    case 0x0c22: return "vlenb";
     case 0x0c80: return "cycleh";
     case 0x0c81: return "timeh";
     case 0x0c82: return "instreth";
@@ -1656,9 +2445,86 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             break;
         case 1:
             switch (((inst >> 12) & 0b111)) {
+            case 0:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op =3D rv_op_vl1re8_v; break;
+                case 552: op =3D rv_op_vl2re8_v; break;
+                case 1576: op =3D rv_op_vl4re8_v; break;
+                case 3624: op =3D rv_op_vl8re8_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op =3D rv_op_vle8_v; break;
+                    case 11: op =3D rv_op_vlm_v; break;
+                    case 16: op =3D rv_op_vle8ff_v; break;
+                    }
+                    break;
+                case 1: op =3D rv_op_vluxei8_v; break;
+                case 2: op =3D rv_op_vlse8_v; break;
+                case 3: op =3D rv_op_vloxei8_v; break;
+                }
+                break;
             case 2: op =3D rv_op_flw; break;
             case 3: op =3D rv_op_fld; break;
             case 4: op =3D rv_op_flq; break;
+            case 5:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op =3D rv_op_vl1re16_v; break;
+                case 552: op =3D rv_op_vl2re16_v; break;
+                case 1576: op =3D rv_op_vl4re16_v; break;
+                case 3624: op =3D rv_op_vl8re16_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op =3D rv_op_vle16_v; break;
+                    case 16: op =3D rv_op_vle16ff_v; break;
+                    }
+                    break;
+                case 1: op =3D rv_op_vluxei16_v; break;
+                case 2: op =3D rv_op_vlse16_v; break;
+                case 3: op =3D rv_op_vloxei16_v; break;
+                }
+                break;
+            case 6:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op =3D rv_op_vl1re32_v; break;
+                case 552: op =3D rv_op_vl2re32_v; break;
+                case 1576: op =3D rv_op_vl4re32_v; break;
+                case 3624: op =3D rv_op_vl8re32_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op =3D rv_op_vle32_v; break;
+                    case 16: op =3D rv_op_vle32ff_v; break;
+                    }
+                    break;
+                case 1: op =3D rv_op_vluxei32_v; break;
+                case 2: op =3D rv_op_vlse32_v; break;
+                case 3: op =3D rv_op_vloxei32_v; break;
+                }
+                break;
+            case 7:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op =3D rv_op_vl1re64_v; break;
+                case 552: op =3D rv_op_vl2re64_v; break;
+                case 1576: op =3D rv_op_vl4re64_v; break;
+                case 3624: op =3D rv_op_vl8re64_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op =3D rv_op_vle64_v; break;
+                    case 16: op =3D rv_op_vle64ff_v; break;
+                    }
+                    break;
+                case 1: op =3D rv_op_vluxei64_v; break;
+                case 2: op =3D rv_op_vlse64_v; break;
+                case 3: op =3D rv_op_vloxei64_v; break;
+                }
+                break;
             }
             break;
         case 3:
@@ -1783,9 +2649,64 @@ static void decode_inst_opcode(rv_decode *dec, rv_=
isa isa)
             break;
         case 9:
             switch (((inst >> 12) & 0b111)) {
+            case 0:
+                switch (((inst >> 20) & 0b111111111111)) {
+                case 40: op =3D rv_op_vs1r_v; break;
+                case 552: op =3D rv_op_vs2r_v; break;
+                case 1576: op =3D rv_op_vs4r_v; break;
+                case 3624: op =3D rv_op_vs8r_v; break;
+                }
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op =3D rv_op_vse8_v; break;
+                    case 11: op =3D rv_op_vsm_v; break;
+                    }
+                    break;
+                case 1: op =3D rv_op_vsuxei8_v; break;
+                case 2: op =3D rv_op_vsse8_v; break;
+                case 3: op =3D rv_op_vsoxei8_v; break;
+                }
+                break;
             case 2: op =3D rv_op_fsw; break;
             case 3: op =3D rv_op_fsd; break;
             case 4: op =3D rv_op_fsq; break;
+            case 5:
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op =3D rv_op_vse16_v; break;
+                    }
+                    break;
+                case 1: op =3D rv_op_vsuxei16_v; break;
+                case 2: op =3D rv_op_vsse16_v; break;
+                case 3: op =3D rv_op_vsoxei16_v; break;
+                }
+                break;
+            case 6:
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op =3D rv_op_vse32_v; break;
+                    }
+                    break;
+                case 1: op =3D rv_op_vsuxei32_v; break;
+                case 2: op =3D rv_op_vsse32_v; break;
+                case 3: op =3D rv_op_vsoxei32_v; break;
+                }
+                break;
+            case 7:
+                switch (((inst >> 26) & 0b111)) {
+                case 0:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: op =3D rv_op_vse64_v; break;
+                    }
+                    break;
+                case 1: op =3D rv_op_vsuxei64_v; break;
+                case 2: op =3D rv_op_vsse64_v; break;
+                case 3: op =3D rv_op_vsoxei64_v; break;
+                }
+                break;
             }
             break;
         case 11:
@@ -2152,6 +3073,408 @@ static void decode_inst_opcode(rv_decode *dec, rv=
_isa isa)
                 break;
             }
             break;
+        case 21:
+            switch (((inst >> 12) & 0b111)) {
+            case 0:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op =3D rv_op_vadd_vv; break;
+                case 2: op =3D rv_op_vsub_vv; break;
+                case 4: op =3D rv_op_vminu_vv; break;
+                case 5: op =3D rv_op_vmin_vv; break;
+                case 6: op =3D rv_op_vmaxu_vv; break;
+                case 7: op =3D rv_op_vmax_vv; break;
+                case 9: op =3D rv_op_vand_vv; break;
+                case 10: op =3D rv_op_vor_vv; break;
+                case 11: op =3D rv_op_vxor_vv; break;
+                case 12: op =3D rv_op_vrgather_vv; break;
+                case 14: op =3D rv_op_vrgatherei16_vv; break;
+                case 16: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
adc_vvm; break;
+                case 17: op =3D rv_op_vmadc_vvm; break;
+                case 18: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
sbc_vvm; break;
+                case 19: op =3D rv_op_vmsbc_vvm; break;
+                case 23:
+                    if (((inst >> 20) & 0b111111) =3D=3D 32)
+                        op =3D rv_op_vmv_v_v;
+                    else if (((inst >> 25) & 1) =3D=3D 0)
+                        op =3D rv_op_vmerge_vvm;
+                    break;
+                case 24: op =3D rv_op_vmseq_vv; break;
+                case 25: op =3D rv_op_vmsne_vv; break;
+                case 26: op =3D rv_op_vmsltu_vv; break;
+                case 27: op =3D rv_op_vmslt_vv; break;
+                case 28: op =3D rv_op_vmsleu_vv; break;
+                case 29: op =3D rv_op_vmsle_vv; break;
+                case 32: op =3D rv_op_vsaddu_vv; break;
+                case 33: op =3D rv_op_vsadd_vv; break;
+                case 34: op =3D rv_op_vssubu_vv; break;
+                case 35: op =3D rv_op_vssub_vv; break;
+                case 37: op =3D rv_op_vsll_vv; break;
+                case 39: op =3D rv_op_vsmul_vv; break;
+                case 40: op =3D rv_op_vsrl_vv; break;
+                case 41: op =3D rv_op_vsra_vv; break;
+                case 42: op =3D rv_op_vssrl_vv; break;
+                case 43: op =3D rv_op_vssra_vv; break;
+                case 44: op =3D rv_op_vnsrl_wv; break;
+                case 45: op =3D rv_op_vnsra_wv; break;
+                case 46: op =3D rv_op_vnclipu_wv; break;
+                case 47: op =3D rv_op_vnclip_wv; break;
+                case 48: op =3D rv_op_vwredsumu_vs; break;
+                case 49: op =3D rv_op_vwredsum_vs; break;
+                }
+                break;
+            case 1:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op =3D rv_op_vfadd_vv; break;
+                case 1: op =3D rv_op_vfredusum_vs; break;
+                case 2: op =3D rv_op_vfsub_vv; break;
+                case 3: op =3D rv_op_vfredosum_vs; break;
+                case 4: op =3D rv_op_vfmin_vv; break;
+                case 5: op =3D rv_op_vfredmin_vs; break;
+                case 6: op =3D rv_op_vfmax_vv; break;
+                case 7: op =3D rv_op_vfredmax_vs; break;
+                case 8: op =3D rv_op_vfsgnj_vv; break;
+                case 9: op =3D rv_op_vfsgnjn_vv; break;
+                case 10: op =3D rv_op_vfsgnjx_vv; break;
+                case 16:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: if ((inst >> 25) & 1) op =3D rv_op_vfmv_f_s;=
 break;
+                    }
+                    break;
+                case 18:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: op =3D rv_op_vfcvt_xu_f_v; break;
+                    case 1: op =3D rv_op_vfcvt_x_f_v; break;
+                    case 2: op =3D rv_op_vfcvt_f_xu_v; break;
+                    case 3: op =3D rv_op_vfcvt_f_x_v; break;
+                    case 6: op =3D rv_op_vfcvt_rtz_xu_f_v; break;
+                    case 7: op =3D rv_op_vfcvt_rtz_x_f_v; break;
+                    case 8: op =3D rv_op_vfwcvt_xu_f_v; break;
+                    case 9: op =3D rv_op_vfwcvt_x_f_v; break;
+                    case 10: op =3D rv_op_vfwcvt_f_xu_v; break;
+                    case 11: op =3D rv_op_vfwcvt_f_x_v; break;
+                    case 12: op =3D rv_op_vfwcvt_f_f_v; break;
+                    case 14: op =3D rv_op_vfwcvt_rtz_xu_f_v; break;
+                    case 15: op =3D rv_op_vfwcvt_rtz_x_f_v; break;
+                    case 16: op =3D rv_op_vfncvt_xu_f_w; break;
+                    case 17: op =3D rv_op_vfncvt_x_f_w; break;
+                    case 18: op =3D rv_op_vfncvt_f_xu_w; break;
+                    case 19: op =3D rv_op_vfncvt_f_x_w; break;
+                    case 20: op =3D rv_op_vfncvt_f_f_w; break;
+                    case 21: op =3D rv_op_vfncvt_rod_f_f_w; break;
+                    case 22: op =3D rv_op_vfncvt_rtz_xu_f_w; break;
+                    case 23: op =3D rv_op_vfncvt_rtz_x_f_w; break;
+                    }
+                    break;
+                case 19:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: op =3D rv_op_vfsqrt_v; break;
+                    case 4: op =3D rv_op_vfrsqrt7_v; break;
+                    case 5: op =3D rv_op_vfrec7_v; break;
+                    case 16: op =3D rv_op_vfclass_v; break;
+                    }
+                    break;
+                case 24: op =3D rv_op_vmfeq_vv; break;
+                case 25: op =3D rv_op_vmfle_vv; break;
+                case 27: op =3D rv_op_vmflt_vv; break;
+                case 28: op =3D rv_op_vmfne_vv; break;
+                case 32: op =3D rv_op_vfdiv_vv; break;
+                case 36: op =3D rv_op_vfmul_vv; break;
+                case 40: op =3D rv_op_vfmadd_vv; break;
+                case 41: op =3D rv_op_vfnmadd_vv; break;
+                case 42: op =3D rv_op_vfmsub_vv; break;
+                case 43: op =3D rv_op_vfnmsub_vv; break;
+                case 44: op =3D rv_op_vfmacc_vv; break;
+                case 45: op =3D rv_op_vfnmacc_vv; break;
+                case 46: op =3D rv_op_vfmsac_vv; break;
+                case 47: op =3D rv_op_vfnmsac_vv; break;
+                case 48: op =3D rv_op_vfwadd_vv; break;
+                case 49: op =3D rv_op_vfwredusum_vs; break;
+                case 50: op =3D rv_op_vfwsub_vv; break;
+                case 51: op =3D rv_op_vfwredosum_vs; break;
+                case 52: op =3D rv_op_vfwadd_wv; break;
+                case 54: op =3D rv_op_vfwsub_wv; break;
+                case 56: op =3D rv_op_vfwmul_vv; break;
+                case 60: op =3D rv_op_vfwmacc_vv; break;
+                case 61: op =3D rv_op_vfwnmacc_vv; break;
+                case 62: op =3D rv_op_vfwmsac_vv; break;
+                case 63: op =3D rv_op_vfwnmsac_vv; break;
+                }
+                break;
+            case 2:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op =3D rv_op_vredsum_vs; break;
+                case 1: op =3D rv_op_vredand_vs; break;
+                case 2: op =3D rv_op_vredor_vs; break;
+                case 3: op =3D rv_op_vredxor_vs; break;
+                case 4: op =3D rv_op_vredminu_vs; break;
+                case 5: op =3D rv_op_vredmin_vs; break;
+                case 6: op =3D rv_op_vredmaxu_vs; break;
+                case 7: op =3D rv_op_vredmax_vs; break;
+                case 8: op =3D rv_op_vaaddu_vv; break;
+                case 9: op =3D rv_op_vaadd_vv; break;
+                case 10: op =3D rv_op_vasubu_vv; break;
+                case 11: op =3D rv_op_vasub_vv; break;
+                case 16:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: if ((inst >> 25) & 1) op =3D rv_op_vmv_x_s; =
break;
+                    case 16: op =3D rv_op_vcpop_m; break;
+                    case 17: op =3D rv_op_vfirst_m; break;
+                    }
+                    break;
+                case 18:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 2: op =3D rv_op_vzext_vf8; break;
+                    case 3: op =3D rv_op_vsext_vf8; break;
+                    case 4: op =3D rv_op_vzext_vf4; break;
+                    case 5: op =3D rv_op_vsext_vf4; break;
+                    case 6: op =3D rv_op_vzext_vf2; break;
+                    case 7: op =3D rv_op_vsext_vf2; break;
+                    }
+                    break;
+                case 20:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 1: op =3D rv_op_vmsbf_m;  break;
+                    case 2: op =3D rv_op_vmsof_m; break;
+                    case 3: op =3D rv_op_vmsif_m; break;
+                    case 16: op =3D rv_op_viota_m; break;
+                    case 17: if (((inst >> 20) & 0b11111) =3D=3D 0) op =3D=
 rv_op_vid_v; break;
+                    }
+                    break;
+                case 23: if ((inst >> 25) & 1) op =3D rv_op_vcompress_vm=
; break;
+                case 24: if ((inst >> 25) & 1) op =3D rv_op_vmandn_mm; b=
reak;
+                case 25: if ((inst >> 25) & 1) op =3D rv_op_vmand_mm; br=
eak;
+                case 26: if ((inst >> 25) & 1) op =3D rv_op_vmor_mm; bre=
ak;
+                case 27: if ((inst >> 25) & 1) op =3D rv_op_vmxor_mm; br=
eak;
+                case 28: if ((inst >> 25) & 1) op =3D rv_op_vmorn_mm; br=
eak;
+                case 29: if ((inst >> 25) & 1) op =3D rv_op_vmnand_mm; b=
reak;
+                case 30: if ((inst >> 25) & 1) op =3D rv_op_vmnor_mm; br=
eak;
+                case 31: if ((inst >> 25) & 1) op =3D rv_op_vmxnor_mm; b=
reak;
+                case 32: op =3D rv_op_vdivu_vv; break;
+                case 33: op =3D rv_op_vdiv_vv; break;
+                case 34: op =3D rv_op_vremu_vv; break;
+                case 35: op =3D rv_op_vrem_vv; break;
+                case 36: op =3D rv_op_vmulhu_vv; break;
+                case 37: op =3D rv_op_vmul_vv; break;
+                case 38: op =3D rv_op_vmulhsu_vv; break;
+                case 39: op =3D rv_op_vmulh_vv; break;
+                case 41: op =3D rv_op_vmadd_vv; break;
+                case 43: op =3D rv_op_vnmsub_vv; break;
+                case 45: op =3D rv_op_vmacc_vv; break;
+                case 47: op =3D rv_op_vnmsac_vv; break;
+                case 48: op =3D rv_op_vwaddu_vv; break;
+                case 49: op =3D rv_op_vwadd_vv; break;
+                case 50: op =3D rv_op_vwsubu_vv; break;
+                case 51: op =3D rv_op_vwsub_vv; break;
+                case 52: op =3D rv_op_vwaddu_wv; break;
+                case 53: op =3D rv_op_vwadd_wv; break;
+                case 54: op =3D rv_op_vwsubu_wv; break;
+                case 55: op =3D rv_op_vwsub_wv; break;
+                case 56: op =3D rv_op_vwmulu_vv; break;
+                case 58: op =3D rv_op_vwmulsu_vv; break;
+                case 59: op =3D rv_op_vwmul_vv; break;
+                case 60: op =3D rv_op_vwmaccu_vv; break;
+                case 61: op =3D rv_op_vwmacc_vv; break;
+                case 63: op =3D rv_op_vwmaccsu_vv; break;
+                }
+                break;
+            case 3:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op =3D rv_op_vadd_vi; break;
+                case 3: op =3D rv_op_vrsub_vi; break;
+                case 9: op =3D rv_op_vand_vi; break;
+                case 10: op =3D rv_op_vor_vi; break;
+                case 11: op =3D rv_op_vxor_vi; break;
+                case 12: op =3D rv_op_vrgather_vi; break;
+                case 14: op =3D rv_op_vslideup_vi; break;
+                case 15: op =3D rv_op_vslidedown_vi; break;
+                case 16: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
adc_vim; break;
+                case 17: op =3D rv_op_vmadc_vim; break;
+                case 23:
+                    if (((inst >> 20) & 0b111111) =3D=3D 32)
+                        op =3D rv_op_vmv_v_i;
+                    else if (((inst >> 25) & 1) =3D=3D 0)
+                        op =3D rv_op_vmerge_vim;
+                    break;
+                case 24: op =3D rv_op_vmseq_vi; break;
+                case 25: op =3D rv_op_vmsne_vi; break;
+                case 28: op =3D rv_op_vmsleu_vi; break;
+                case 29: op =3D rv_op_vmsle_vi; break;
+                case 30: op =3D rv_op_vmsgtu_vi; break;
+                case 31: op =3D rv_op_vmsgt_vi; break;
+                case 32: op =3D rv_op_vsaddu_vi; break;
+                case 33: op =3D rv_op_vsadd_vi; break;
+                case 37: op =3D rv_op_vsll_vi; break;
+                case 39:
+                    switch (((inst >> 15) & 0b11111)) {
+                    case 0: op =3D rv_op_vmv1r_v; break;
+                    case 1: op =3D rv_op_vmv2r_v; break;
+                    case 3: op =3D rv_op_vmv4r_v; break;
+                    case 7: op =3D rv_op_vmv8r_v; break;
+                    }
+                    break;
+                case 40: op =3D rv_op_vsrl_vi; break;
+                case 41: op =3D rv_op_vsra_vi; break;
+                case 42: op =3D rv_op_vssrl_vi; break;
+                case 43: op =3D rv_op_vssra_vi; break;
+                case 44: op =3D rv_op_vnsrl_wi; break;
+                case 45: op =3D rv_op_vnsra_wi; break;
+                case 46: op =3D rv_op_vnclipu_wi; break;
+                case 47: op =3D rv_op_vnclip_wi; break;
+                }
+                break;
+            case 4:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op =3D rv_op_vadd_vx; break;
+                case 2: op =3D rv_op_vsub_vx; break;
+                case 3: op =3D rv_op_vrsub_vx; break;
+                case 4: op =3D rv_op_vminu_vx; break;
+                case 5: op =3D rv_op_vmin_vx; break;
+                case 6: op =3D rv_op_vmaxu_vx; break;
+                case 7: op =3D rv_op_vmax_vx; break;
+                case 9: op =3D rv_op_vand_vx; break;
+                case 10: op =3D rv_op_vor_vx; break;
+                case 11: op =3D rv_op_vxor_vx; break;
+                case 12: op =3D rv_op_vrgather_vx; break;
+                case 14: op =3D rv_op_vslideup_vx; break;
+                case 15: op =3D rv_op_vslidedown_vx; break;
+                case 16: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
adc_vxm; break;
+                case 17: op =3D rv_op_vmadc_vxm; break;
+                case 18: if (((inst >> 25) & 1) =3D=3D 0) op =3D rv_op_v=
sbc_vxm; break;
+                case 19: op =3D rv_op_vmsbc_vxm; break;
+                case 23:
+                    if (((inst >> 20) & 0b111111) =3D=3D 32)
+                        op =3D rv_op_vmv_v_x;
+                    else if (((inst >> 25) & 1) =3D=3D 0)
+                        op =3D rv_op_vmerge_vxm;
+                    break;
+                case 24: op =3D rv_op_vmseq_vx; break;
+                case 25: op =3D rv_op_vmsne_vx; break;
+                case 26: op =3D rv_op_vmsltu_vx; break;
+                case 27: op =3D rv_op_vmslt_vx; break;
+                case 28: op =3D rv_op_vmsleu_vx; break;
+                case 29: op =3D rv_op_vmsle_vx; break;
+                case 30: op =3D rv_op_vmsgtu_vx; break;
+                case 31: op =3D rv_op_vmsgt_vx; break;
+                case 32: op =3D rv_op_vsaddu_vx; break;
+                case 33: op =3D rv_op_vsadd_vx; break;
+                case 34: op =3D rv_op_vssubu_vx; break;
+                case 35: op =3D rv_op_vssub_vx; break;
+                case 37: op =3D rv_op_vsll_vx; break;
+                case 39: op =3D rv_op_vsmul_vx; break;
+                case 40: op =3D rv_op_vsrl_vx; break;
+                case 41: op =3D rv_op_vsra_vx; break;
+                case 42: op =3D rv_op_vssrl_vx; break;
+                case 43: op =3D rv_op_vssra_vx; break;
+                case 44: op =3D rv_op_vnsrl_wx; break;
+                case 45: op =3D rv_op_vnsra_wx; break;
+                case 46: op =3D rv_op_vnclipu_wx; break;
+                case 47: op =3D rv_op_vnclip_wx; break;
+                }
+                break;
+            case 5:
+                switch (((inst >> 26) & 0b111111)) {
+                case 0: op =3D rv_op_vfadd_vf; break;
+                case 2: op =3D rv_op_vfsub_vf; break;
+                case 4: op =3D rv_op_vfmin_vf; break;
+                case 6: op =3D rv_op_vfmax_vf; break;
+                case 8: op =3D rv_op_vfsgnj_vf; break;
+                case 9: op =3D rv_op_vfsgnjn_vf; break;
+                case 10: op =3D rv_op_vfsgnjx_vf; break;
+                case 14: op =3D rv_op_vfslide1up_vf; break;
+                case 15: op =3D rv_op_vfslide1down_vf; break;
+                case 16:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: if ((inst >> 25) & 1) op =3D rv_op_vfmv_s_f;=
 break;
+                    }
+                    break;
+                case 23:
+                    if (((inst >> 25) & 1) =3D=3D 0)
+                        op =3D rv_op_vfmerge_vfm;
+                    else if (((inst >> 20) & 0b111111) =3D=3D 32)
+                        op =3D rv_op_vfmv_v_f;
+                    break;
+                case 24: op =3D rv_op_vmfeq_vf; break;
+                case 25: op =3D rv_op_vmfle_vf; break;
+                case 27: op =3D rv_op_vmflt_vf; break;
+                case 28: op =3D rv_op_vmfne_vf; break;
+                case 29: op =3D rv_op_vmfgt_vf; break;
+                case 31: op =3D rv_op_vmfge_vf; break;
+                case 32: op =3D rv_op_vfdiv_vf; break;
+                case 33: op =3D rv_op_vfrdiv_vf; break;
+                case 36: op =3D rv_op_vfmul_vf; break;
+                case 39: op =3D rv_op_vfrsub_vf; break;
+                case 40: op =3D rv_op_vfmadd_vf; break;
+                case 41: op =3D rv_op_vfnmadd_vf; break;
+                case 42: op =3D rv_op_vfmsub_vf; break;
+                case 43: op =3D rv_op_vfnmsub_vf; break;
+                case 44: op =3D rv_op_vfmacc_vf; break;
+                case 45: op =3D rv_op_vfnmacc_vf; break;
+                case 46: op =3D rv_op_vfmsac_vf; break;
+                case 47: op =3D rv_op_vfnmsac_vf; break;
+                case 48: op =3D rv_op_vfwadd_vf; break;
+                case 50: op =3D rv_op_vfwsub_vf; break;
+                case 52: op =3D rv_op_vfwadd_wf; break;
+                case 54: op =3D rv_op_vfwsub_wf; break;
+                case 56: op =3D rv_op_vfwmul_vf; break;
+                case 60: op =3D rv_op_vfwmacc_vf; break;
+                case 61: op =3D rv_op_vfwnmacc_vf; break;
+                case 62: op =3D rv_op_vfwmsac_vf; break;
+                case 63: op =3D rv_op_vfwnmsac_vf; break;
+                }
+                break;
+            case 6:
+                switch (((inst >> 26) & 0b111111)) {
+                case 8: op =3D rv_op_vaaddu_vx; break;
+                case 9: op =3D rv_op_vaadd_vx; break;
+                case 10: op =3D rv_op_vasubu_vx; break;
+                case 11: op =3D rv_op_vasub_vx; break;
+                case 14: op =3D rv_op_vslide1up_vx; break;
+                case 15: op =3D rv_op_vslide1down_vx; break;
+                case 16:
+                    switch (((inst >> 20) & 0b11111)) {
+                    case 0: if ((inst >> 25) & 1) op =3D rv_op_vmv_s_x; =
break;
+                    }
+                    break;
+                case 32: op =3D rv_op_vdivu_vx; break;
+                case 33: op =3D rv_op_vdiv_vx; break;
+                case 34: op =3D rv_op_vremu_vx; break;
+                case 35: op =3D rv_op_vrem_vx; break;
+                case 36: op =3D rv_op_vmulhu_vx; break;
+                case 37: op =3D rv_op_vmul_vx; break;
+                case 38: op =3D rv_op_vmulhsu_vx; break;
+                case 39: op =3D rv_op_vmulh_vx; break;
+                case 41: op =3D rv_op_vmadd_vx; break;
+                case 43: op =3D rv_op_vnmsub_vx; break;
+                case 45: op =3D rv_op_vmacc_vx; break;
+                case 47: op =3D rv_op_vnmsac_vx; break;
+                case 48: op =3D rv_op_vwaddu_vx; break;
+                case 49: op =3D rv_op_vwadd_vx; break;
+                case 50: op =3D rv_op_vwsubu_vx; break;
+                case 51: op =3D rv_op_vwsub_vx; break;
+                case 52: op =3D rv_op_vwaddu_wx; break;
+                case 53: op =3D rv_op_vwadd_wx; break;
+                case 54: op =3D rv_op_vwsubu_wx; break;
+                case 55: op =3D rv_op_vwsub_wx; break;
+                case 56: op =3D rv_op_vwmulu_vx; break;
+                case 58: op =3D rv_op_vwmulsu_vx; break;
+                case 59: op =3D rv_op_vwmul_vx; break;
+                case 60: op =3D rv_op_vwmaccu_vx; break;
+                case 61: op =3D rv_op_vwmacc_vx; break;
+                case 62: op =3D rv_op_vwmaccus_vx; break;
+                case 63: op =3D rv_op_vwmaccsu_vx; break;
+                }
+                break;
+            case 7:
+                if (((inst >> 31) & 1) =3D=3D 0) {
+                    op =3D rv_op_vsetvli;
+                } else if ((inst >> 30) & 1) {
+                    op =3D rv_op_vsetivli;
+                } else if (((inst >> 25) & 0b11111) =3D=3D 0) {
+                    op =3D rv_op_vsetvl;
+                }
+                break;
+            }
+            break;
         case 22:
             switch (((inst >> 12) & 0b111)) {
             case 0: op =3D rv_op_addid; break;
@@ -2530,6 +3853,21 @@ static uint32_t operand_cimmq(rv_inst inst)
         ((inst << 57) >> 62) << 6;
 }
=20
+static uint32_t operand_vimm(rv_inst inst)
+{
+    return (int64_t)(inst << 44) >> 59;
+}
+
+static uint32_t operand_vzimm11(rv_inst inst)
+{
+    return (inst << 33) >> 53;
+}
+
+static uint32_t operand_vzimm10(rv_inst inst)
+{
+    return (inst << 34) >> 54;
+}
+
 static uint32_t operand_bs(rv_inst inst)
 {
     return (inst << 32) >> 62;
@@ -2540,6 +3878,11 @@ static uint32_t operand_rnum(rv_inst inst)
     return (inst << 40) >> 60;
 }
=20
+static uint32_t operand_vm(rv_inst inst)
+{
+    return (inst << 38) >> 63;
+}
+
 /* decode operands */
=20
 static void decode_inst_operands(rv_decode *dec, rv_isa isa)
@@ -2829,6 +4172,33 @@ static void decode_inst_operands(rv_decode *dec, r=
v_isa isa)
         dec->rs1 =3D operand_rs1(inst);
         dec->rnum =3D operand_rnum(inst);
         break;
+    case rv_codec_v_r:
+        dec->rd =3D operand_rd(inst);
+        dec->rs1 =3D operand_rs1(inst);
+        dec->rs2 =3D operand_rs2(inst);
+        dec->vm =3D operand_vm(inst);
+        break;
+    case rv_codec_v_ldst:
+        dec->rd =3D operand_rd(inst);
+        dec->rs1 =3D operand_rs1(inst);
+        dec->vm =3D operand_vm(inst);
+        break;
+    case rv_codec_v_i:
+        dec->rd =3D operand_rd(inst);
+        dec->rs2 =3D operand_rs2(inst);
+        dec->imm =3D operand_vimm(inst);
+        dec->vm =3D operand_vm(inst);
+        break;
+    case rv_codec_vsetvli:
+        dec->rd =3D operand_rd(inst);
+        dec->rs1 =3D operand_rs1(inst);
+        dec->vzimm =3D operand_vzimm11(inst);
+        break;
+    case rv_codec_vsetivli:
+        dec->rd =3D operand_rd(inst);
+        dec->imm =3D operand_vimm(inst);
+        dec->vzimm =3D operand_vzimm10(inst);
+        break;
     };
 }
=20
@@ -3025,6 +4395,10 @@ static void format_inst(char *buf, size_t buflen, =
size_t tab, rv_decode *dec)
             snprintf(tmp, sizeof(tmp), "%d", dec->imm);
             append(buf, tmp, buflen);
             break;
+        case 'u':
+            snprintf(tmp, sizeof(tmp), "%u", ((uint32_t)dec->imm & 0b111=
11));
+            append(buf, tmp, buflen);
+            break;
         case 'o':
             snprintf(tmp, sizeof(tmp), "%d", dec->imm);
             append(buf, tmp, buflen);
@@ -3113,6 +4487,60 @@ static void format_inst(char *buf, size_t buflen, =
size_t tab, rv_decode *dec)
                 append(buf, ".rl", buflen);
             }
             break;
+        case 'l':
+            append(buf, ",v0", buflen);
+            break;
+        case 'm':
+            if (dec->vm =3D=3D 0) {
+                append(buf, ",v0.t", buflen);
+            }
+            break;
+        case 'D':
+            append(buf, rv_vreg_name_sym[dec->rd], buflen);
+            break;
+        case 'E':
+            append(buf, rv_vreg_name_sym[dec->rs1], buflen);
+            break;
+        case 'F':
+            append(buf, rv_vreg_name_sym[dec->rs2], buflen);
+            break;
+        case 'G':
+            append(buf, rv_vreg_name_sym[dec->rs3], buflen);
+            break;
+        case 'v': {
+            char nbuf[32] =3D {0};
+            const int sew =3D 1 << (((dec->vzimm >> 3) & 0b111) + 3);
+            sprintf(nbuf, "%d", sew);
+            const int lmul =3D dec->vzimm & 0b11;
+            const int flmul =3D (dec->vzimm >> 2) & 1;
+            const char *vta =3D (dec->vzimm >> 6) & 1 ? "ta" : "tu";
+            const char *vma =3D (dec->vzimm >> 7) & 1 ? "ma" : "mu";
+            append(buf, "e", buflen);
+            append(buf, nbuf, buflen);
+            append(buf, ",m", buflen);
+            if (flmul) {
+                switch (lmul) {
+                case 3:
+                    sprintf(nbuf, "f2");
+                    break;
+                case 2:
+                    sprintf(nbuf, "f4");
+                    break;
+                case 1:
+                    sprintf(nbuf, "f8");
+                break;
+                }
+                append(buf, nbuf, buflen);
+            } else {
+                sprintf(nbuf, "%d", 1 << lmul);
+                append(buf, nbuf, buflen);
+            }
+            append(buf, ",", buflen);
+            append(buf, vta, buflen);
+            append(buf, ",", buflen);
+            append(buf, vma, buflen);
+            break;
+        }
         default:
             break;
         }
@@ -3209,7 +4637,7 @@ disasm_inst(char *buf, size_t buflen, rv_isa isa, u=
int64_t pc, rv_inst inst)
     decode_inst_operands(&dec, isa);
     decode_inst_decompress(&dec, isa);
     decode_inst_lift_pseudo(&dec);
-    format_inst(buf, buflen, 16, &dec);
+    format_inst(buf, buflen, 24, &dec);
 }
=20
 #define INST_FMT_2 "%04" PRIx64 "              "
--=20
2.37.3


