Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5655F8600
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Oct 2022 18:14:04 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohCSf-0000JJ-Db
	for lists+qemu-devel@lfdr.de; Sat, 08 Oct 2022 12:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ohCQ7-0006YB-In; Sat, 08 Oct 2022 12:11:23 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ohCQ5-0007FI-MK; Sat, 08 Oct 2022 12:11:23 -0400
Received: by mail-ed1-x533.google.com with SMTP id w10so10703749edd.4;
 Sat, 08 Oct 2022 09:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJi9FEKycwRJVGwbktHckOWHEnMu4SclfXNUDofcTc4=;
 b=DxmYYGsuOlO2uiQT7fxpeLMa0ETHu0yF3+z14ivQwf6nAWS17929U+kHxylaaq8jX0
 IAbn/pPVqKeGnTwnheMHmX5I8/HV2NXOaexQu0rME2OKnazUso2JqV2jIrd19z2dZpRd
 KsOgmyOTI6UxPKzc+jlLhFJnAwK/ZAZtv5DcWuMWsH/bjkPaVgpPQaGfiZaaHo5OQ8UR
 5afXuiVmcaBpeOQ8zU9nC+fVmp4uFak5Nps2GFGa8k8d7MaXJHqYEiko3xgUvS3Xc2qv
 RUOtIbjsXrYKrsm9BC66wkcQka+wDzbFMPup5IKyEU8Dh1lcMwPbWVqB/F4H+hlMppZx
 hEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJi9FEKycwRJVGwbktHckOWHEnMu4SclfXNUDofcTc4=;
 b=ACH1WlBd9TWgeLTjZeKmJGFuFhhb8rUInXgZ+XByRiZsI3jWS8hI8eXDQ35T6b/35m
 kapK025KIjJQZomDzqjknKREmkhiuS58IRPQbglYzpxVS+wwASv8nORA+T6fEn+2nfmb
 H3oLiOWsT+VpkdahHlC2kuVARxrsQWPO+INRHLd0nW8abNbkFMALOjhbqk3jmti75DpF
 r2kuYDssOUn1N8YECj/jkfsd40al8I82KDPEpxKoF1nbnmxaKkf9bZMoOxYH5oC0tQoN
 72m84bCy5YSz0h+Wb1e5WFDnvNrPRXEuNFbLejuu8BUZDP0g4FrppPi/kRiNUGjlTWXx
 IgXw==
X-Gm-Message-State: ACrzQf1crlOxJE4ngNi6cKKUoSJyT+q0IamyP1EoFxnUhzxJnnbaIzgi
 w4dkeVT08FV2VmEG5RV9+bA=
X-Google-Smtp-Source: AMsMyM66ZiIphLuWbqNAdhrUIx75oHF1OKJ3Bz4jmiQhMXGRQdQVtIOij1gnHsv0GYq22bPJCP6jLg==
X-Received: by 2002:a05:6402:ea0:b0:454:38bf:aa3d with SMTP id
 h32-20020a0564020ea000b0045438bfaa3dmr9457193eda.291.1665245478161; 
 Sat, 08 Oct 2022 09:11:18 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-038-045.77.183.pool.telefonica.de.
 [77.183.38.45]) by smtp.gmail.com with ESMTPSA id
 o8-20020aa7d3c8000000b0045769dee1fdsm3680453edr.29.2022.10.08.09.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 09:11:17 -0700 (PDT)
Date: Sat, 08 Oct 2022 16:11:14 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
CC: qemu-ppc@nongnu.org, qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_00/13=5D_ppc/e500=3A_Add_su?=
 =?US-ASCII?Q?pport_for_two_types_of_flash=2C_cleanup?=
In-Reply-To: <ba62aabc-0023-c5e6-d156-67d027bb6ff3@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <da8a2a03-0e54-fe81-7a13-cd5e79d69d18@amsat.org>
 <ba62aabc-0023-c5e6-d156-67d027bb6ff3@gmail.com>
Message-ID: <45BEF5EF-3259-4B50-8F17-115C31A0D3EB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 4=2E Oktober 2022 12:43:35 UTC schrieb Daniel Henrique Barboza <danielhb=
413@gmail=2Ecom>:
>Hey,
>
>On 10/3/22 18:27, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Daniel,
>>=20
>> On 3/10/22 22:31, Bernhard Beschow wrote:
>>> Cover letter:
>>> ~~~~~~~~~~~~~
>>>=20
>>> This series adds support for -pflash and direct SD card access to the
>>> PPC e500 boards=2E The idea is to increase compatibility with "real" f=
irmware
>>> images where only the bare minimum of drivers is compiled in=2E
>>=20
>>> Bernhard Beschow (13):
>>> =C2=A0=C2=A0 hw/ppc/meson: Allow e500 boards to be enabled separately
>>> =C2=A0=C2=A0 hw/gpio/meson: Introduce dedicated config switch for hw/g=
pio/mpc8xxx
>>> =C2=A0=C2=A0 docs/system/ppc/ppce500: Add heading for networking chapt=
er
>>> =C2=A0=C2=A0 hw/ppc/e500: Reduce usage of sysbus API
>>> =C2=A0=C2=A0 hw/ppc/mpc8544ds: Rename wrongly named method
>>> =C2=A0=C2=A0 hw/ppc/mpc8544ds: Add platform bus
>>> =C2=A0=C2=A0 hw/ppc/e500: Remove if statement which is now always true
>>=20
>> This first part is mostly reviewed and can already go via your
>> ppc-next queue=2E
>
>We're missing an ACK in patch 6/13:
>
>hw/ppc/mpc8544ds: Add platform bus

Bin: Ping?

Best regards,
Bernhard
>
>I'll need some time to understand what's been doing there to provide my o=
wn
>R-b=2E Or you can toss a R-b there :D
>
>
>Thanks,
>
>
>Daniel
>
>
>
>>=20
>>> =C2=A0=C2=A0 hw/block/pflash_cfi01: Error out if device length isn't a=
 power of two
>>> =C2=A0=C2=A0 hw/ppc/e500: Implement pflash handling
>>> =C2=A0=C2=A0 hw/sd/sdhci-internal: Unexport ESDHC defines
>>> =C2=A0=C2=A0 hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
>>> =C2=A0=C2=A0 hw/sd/sdhci: Implement Freescale eSDHC device model
>>> =C2=A0=C2=A0 hw/ppc/e500: Add Freescale eSDHC to e500 boards
>>=20
>> This second part still need work=2E I can take it via the sdmmc-next
>> queue=2E
>>=20
>> Regards,
>>=20
>> Phil=2E


