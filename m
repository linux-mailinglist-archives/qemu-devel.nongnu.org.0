Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD86424DF5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:15:03 +0200 (CEST)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNcM-0002xu-Hc
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEh-0005O3-FS
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:38 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:53997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNEf-0007RY-L8
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589433; x=1665125433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9fs71T5Mdf9ggLeWUlC2nMjB7d+jmZf4ianZpLyaCFs=;
 b=QhCWXV3TjLS9Cvu/MuAELP69v5mSR5ka4m1D9gUWZqQym5L5cTG/aChu
 kmmOivigSm1uFO8jmwW3Vaa1ZcYwXrTbntkJ+c1TyAfx/MCrNUTLSTFnB
 snyEyUOiVy4ZYkZdLRMzxxpz6SbMDoS0Rl+lEkR4dhBrox+/wHTpBBwmq
 i1Gr0xzifZnLCU7z8KM0dU1yeFSOIlNumdy22js5jF5jYGBIs7Zmq6A7N
 ssnPT5bl79fCk+eHyHSTa3pbllpPKE3879Pgyt5dU28mRdZpCMEZzn+1w
 ZG9y1Yk5QViIVIyrVh/iLhxd+omBtpkBspKaGiAQI+LCT1S0sbbqqn3zl Q==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="293815552"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:50:31 +0800
IronPort-SDR: NPPt0Zra2N9ruIvD9w95jILjzxc7h8SGu3nLANXnzTkxSUP0XAxlz0Zs7ycCzyaOJoGdBIg/tc
 5kRMSnfFdf5JCNG+63O9D65pkvuX8ZdKv7uM2yykF63qwhGMAMAp4IXT+6lmrf+es1fVUTnhoE
 JmtgW5I2tTuHsP8ty9Y/iczOGQEqi7hVLpBnWR7cRUUHNsgPXolw5zJlbGXh1Z+eiXGCVS2xnN
 ytmzR5OGKLlXAZsh3bYluYwh70TulN645X0lvFzvOYL9pKMWV7to0utDMn9RNKMNqDD/xCWqdM
 qiAFXZUlx1qiEoeYAFZOmD+l
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:24:53 -0700
IronPort-SDR: kFXyTToyW+kNwSCptFJoa3c9KLk+vRmsSBbTeGHS+v3+ct4bDKzmgaquso5N/xbb+v2TESlpFU
 VNiNThZLDYkMs3lENCJTx2YpeVbEsPAwwrOWtRpmM02wAmy3S/+wFGpbHUa8kfoUBDGrHz07S8
 qvp8f/k/5XqExIZYbzF3tuDC/LGXuzJueflcgazDBfCdwkUKv5jC8NHbOPpLCqtXDQMaEhOqQC
 dB6nci4z2+OBn6wOGtOojkch9DYeNx+AiJiiAPhuX4DlSz0qQhVe1A4p3/ndIkB1z/VXoq5Yfb
 h1s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:50:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ25M6TBcz1RvmK
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:50:31 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1633589431; x=1636181432; bh=9fs71T5
 Mdf9ggLeWUlC2nMjB7d+jmZf4ianZpLyaCFs=; b=RucoN/diXxMO2U2YzKtXr1g
 c0VtLr6XGznmec3deUlcZ62FTNTZukaLVLmPS4q9wH1/Cte7497mK18jYiJFVTnc
 1Sa7PfmRpLkQumrmhXGoBgiaTEeiHZG2kzVKzMEQcWgmfuSlxY6NJClNICPn4WMN
 S7wU+fbNZmTDw4vGie3WDAONtn75qW13zG29n00qq8eWNwaEL0goNwvpg9T5LouA
 7RDhQn7yk3IgztufgXeui9efhpKgKaRqTDd6P3lUreL0Gh8YmSgsnEsHDH8RaEIy
 gsKwA7XHC7pFleyAvKLbFTPZEp2pOSys9FtSSDJk2osgxnVxTmrtLikAP8VJCOA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Wm5eCT4wfW4j for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:50:31 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ25H3H0tz1RvTg;
 Wed,  6 Oct 2021 23:50:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 26/26] hw/riscv: shakti_c: Mark as not user creatable
Date: Thu,  7 Oct 2021 16:47:51 +1000
Message-Id: <20211007064751.608580-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Mark the shakti_c machine as not user creatable.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <c617a04d4e3dd041a3427b47a1b1d5ab475a2edd.1632871759.git.alis=
tair.francis@wdc.com>
---
 hw/riscv/shakti_c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 2f084d3c8d..d7d1f91fa5 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -150,6 +150,13 @@ static void shakti_c_soc_class_init(ObjectClass *kla=
ss, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     dc->realize =3D shakti_c_soc_state_realize;
+    /*
+     * Reasons:
+     *     - Creates CPUS in riscv_hart_realize(), and can create uninte=
nded
+     *       CPUs
+     *     - Uses serial_hds in realize function, thus can't be used twi=
ce
+     */
+    dc->user_creatable =3D false;
 }
=20
 static void shakti_c_soc_instance_init(Object *obj)
--=20
2.31.1


