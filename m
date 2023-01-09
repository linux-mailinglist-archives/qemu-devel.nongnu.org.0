Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A58662B77
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvEq-00079H-IC; Mon, 09 Jan 2023 11:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvEa-00078s-Nj; Mon, 09 Jan 2023 11:42:52 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvEY-0000hM-NW; Mon, 09 Jan 2023 11:42:52 -0500
Received: by mail-ej1-x62c.google.com with SMTP id hw16so9731453ejc.10;
 Mon, 09 Jan 2023 08:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2VzvZfZ+7nPeeEFKw1QifcreGVs0cRmZw8Ynukh+WBI=;
 b=q03w3Ms1NVg0yAwDFf1uROEA8DQlbWbBCduDuvjZP1bzaGx8VzkRFJS7wN5OGTLzfp
 /J4UpL9b2ipj8leeS/Bhk6a6ubxHxVRAh1IZiXQJdRH1HEygTAB81lK/DsVCa7evmAU6
 5IIIOqzMUOLNOinP0qeXS9bvPWhBOI0dr+It7DQ/HCknci7j3r9mGqCyMLjO/w56XmP7
 uhn/j6w8PFeu48qJCYeYFPjhCHwfPN1HHSKD2ilr51vhoN7v8ANuYUv38ChfTzYW4pGc
 yazQFtktMaSPW3makYwjGAjMw6KuNGW35jJhY6EAjbLoxVg8N89zekRcTvtICGtBsS6n
 SRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2VzvZfZ+7nPeeEFKw1QifcreGVs0cRmZw8Ynukh+WBI=;
 b=QA3XX5q8HYWMsKfAGBd90/m/VMrBwe03WNDGmqVg/qRBXv7CjrPdGtYyNysj+LpI0R
 axNbU2QpzWbxWtx6iEFavZ8gKgQyJvA8pfhabixFT+/eP1EpWBN1sFxfBhutAKt3JswU
 lI1TP54u/1cv4q52Q/XewkrlC3e7NH+XFG5AgcyWQPtWSjDYkjSnMiqtFejA+0UZSp3f
 HKYJVqAK1ZYcZd0GGmRJBdaLN8JZHl7KrmiJDmqzZMF44ldwWRI20rHrFMbT1CARfpGz
 TRWD7BttlMMbd4bNIi0UIwZ8yGR6hPsZhLNCSgzTkMNDnWTBMxBdmEUCMY/kHVl6azBQ
 6cWg==
X-Gm-Message-State: AFqh2kromzOEGexSJZQXDdVlXWgHtkiWcB7y3XWbghjWD+2RBjVF86J7
 UbKoC+fUx1FIuDeZ9wDJnTqrQJLXPe7QXw==
X-Google-Smtp-Source: AMrXdXvhLfpsBzCD2mcyyPm//LNT4PbXT+4SRDykygqf7M1AZKftx41TPW3A1oX4GnUygnJg3MoEsg==
X-Received: by 2002:a17:907:a809:b0:7c1:5467:39af with SMTP id
 vo9-20020a170907a80900b007c1546739afmr61354110ejc.37.1673282568395; 
 Mon, 09 Jan 2023 08:42:48 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20074734860dc6c494f.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:7473:4860:dc6c:494f])
 by smtp.gmail.com with ESMTPSA id
 gn19-20020a1709070d1300b00815835b4b5fsm3906682ejc.134.2023.01.09.08.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:42:47 -0800 (PST)
Date: Mon, 09 Jan 2023 16:42:42 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Magnus Damm <magnus.damm@gmail.com>, qemu-ppc@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/5=5D_hw/ppc/sam460ex=3A_Remove_unre?=
 =?US-ASCII?Q?achable_code_calling_pflash=5Fcfi01=5Fregister=28=29?=
In-Reply-To: <20230109120154.2868-2-philmd@linaro.org>
References: <20230109120154.2868-1-philmd@linaro.org>
 <20230109120154.2868-2-philmd@linaro.org>
Message-ID: <DD08389D-315E-4C44-BD39-020BC54B7337@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 9=2E Januar 2023 12:01:50 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>Since its QOM'ification in commit 368a354f02 ("pflash_cfi0x:
>QOMified") the pflash_cfi01_register() function does not fail=2E
>
>This call was later converted with a script to use &error_fatal,
>still unable to fail=2E Remove the unreachable code=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/ppc/sam460ex=2Ec | 12 ++++--------
> 1 file changed, 4 insertions(+), 8 deletions(-)

It looks like there is more: https://lists=2Enongnu=2Eorg/archive/html/qem=
u-devel/2022-10/msg02491=2Ehtml

Best regards,
Bernhard

>
>diff --git a/hw/ppc/sam460ex=2Ec b/hw/ppc/sam460ex=2Ec
>index 4a22ce3761=2E=2Ecf7213f7c9 100644
>--- a/hw/ppc/sam460ex=2Ec
>+++ b/hw/ppc/sam460ex=2Ec
>@@ -103,14 +103,10 @@ static int sam460ex_load_uboot(void)
>     DriveInfo *dinfo;
>=20
>     dinfo =3D drive_get(IF_PFLASH, 0, 0);
>-    if (!pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32)=
,
>-                               "sam460ex=2Eflash", FLASH_SIZE,
>-                               dinfo ? blk_by_legacy_dinfo(dinfo) : NULL=
,
>-                               64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1))=
 {
>-        error_report("Error registering flash memory");
>-        /* XXX: return an error instead? */
>-        exit(1);
>-    }
>+    pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
>+                          "sam460ex=2Eflash", FLASH_SIZE,
>+                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
>+                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1));
>=20
>     if (!dinfo) {
>         /*error_report("No flash image given with the 'pflash' parameter=
,"

