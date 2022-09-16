Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1515BB194
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 19:22:32 +0200 (CEST)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZF2r-0005aL-F0
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 13:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZF0T-0003mu-GE; Fri, 16 Sep 2022 13:20:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oZF0R-0005eM-Tn; Fri, 16 Sep 2022 13:20:01 -0400
Received: by mail-ej1-x632.google.com with SMTP id a26so22258941ejc.4;
 Fri, 16 Sep 2022 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=5UPNTK4bWFBw4c7cxGwfDW9wQSJy6ZKXnn64ebi0bcQ=;
 b=GQjUK1lqNMS2QSTrXdoXkVikCVmKPBiQ6gRGjng8x5VFjTpwfhTC4dRNcXXbz/bIBV
 Hnrv4ANngwg15hz0MbK7mlAtHu50D30l7jcG18x3bCtuRzMFMFqAh4Bkihi2fNyaCfwq
 YhdHMN9etNcs+0DDtZvCj7C0Pp7LFiuxy1Sr/hHQEtYKWHfZSMius6VRfCb8yFF/Po+P
 OkSGngM7kPuiDuTNzcar+2490xU8H9rDz52LroLuqsfXEdzWSezP1cd0PVTT4yaiR+CR
 5tlAq91q85nvS9xbTMFE/NO0MER154TTztBGVok4SiSjiBcjAx4R9CaazLr4O46P1PA4
 +J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5UPNTK4bWFBw4c7cxGwfDW9wQSJy6ZKXnn64ebi0bcQ=;
 b=mVZTeGerF+B86UXXGMoIS0byfTFGrXeeNBZvGHYbrGA0FgvBzDEpBz+eKY1OgBKui0
 MGKLlhRQwd3hE9v7Ka5CjZJzqMz1fARMhZ/CaZ5HmkiIUrBpv+7p8em9hc0tEGMHUHLV
 ExQNSnl1hoQg4A/vXvWkL2hxk3i40KKp94YkYwpa6dBmWvh79CDMc+2hFI9n3YKHvsKJ
 lx1i36NiVsnSetKTdj9akU9KSUFRBNRLcPJ+lk4J+1cSWOmrjfzjsRrtLP02rIwKInh9
 mqL1PcEe+p+2j34KtHmeMG5EsfDyFXiBBjRznoP36v0Y6oOD+7RsTU488Gw+rvpVi9xQ
 xTHA==
X-Gm-Message-State: ACrzQf05kGaIghuijj9GxZIx5hqkc+69rAvoFdyFAYBSXYd60IX141v8
 RD5WxKQwm4EicqiuXlBYCjo=
X-Google-Smtp-Source: AMsMyM4Wlb0JyBX2RdZegpLYrvd2zDu/InmPLvfVEmBfQTQk72PyWYPxF2zt/8K9FB7BybQ2yL3uBA==
X-Received: by 2002:a17:907:7632:b0:76f:f6e7:36cf with SMTP id
 jy18-20020a170907763200b0076ff6e736cfmr4448924ejc.442.1663348797203; 
 Fri, 16 Sep 2022 10:19:57 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-154-155.77.191.pool.telefonica.de.
 [77.191.154.155]) by smtp.gmail.com with ESMTPSA id
 v1-20020a170906292100b0077d6f628e14sm7638602ejd.83.2022.09.16.10.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 10:19:56 -0700 (PDT)
Date: Fri, 16 Sep 2022 17:19:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 04/11] hw/ppc/mpc8544ds: Add platform bus
In-Reply-To: <CAEUhbmW6Zu3Uv5Qo=7cwFeydW7zkeOGkE5jVP04HiExJy9wOHQ@mail.gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
 <20220915152520.21948-5-shentey@gmail.com>
 <CAEUhbmW6Zu3Uv5Qo=7cwFeydW7zkeOGkE5jVP04HiExJy9wOHQ@mail.gmail.com>
Message-ID: <1890577F-7230-4E0C-A375-F0A215F6F543@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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

Am 16=2E September 2022 06:15:53 UTC schrieb Bin Meng <bmeng=2Ecn@gmail=2Ec=
om>:
>On Thu, Sep 15, 2022 at 11:29 PM Bernhard Beschow <shentey@gmail=2Ecom> w=
rote:
>>
>> Models the real device more closely=2E
>
>Please describe the source (e=2Eg=2E: I assume it's MPC8544DS board manua=
l
>or something like that?) that describe such memory map for the
>platform bus=2E
>
>Is this the eLBC bus range that includes the NOR flash device?

Good point=2E My numbers come from a different board=2E I'll fix them acco=
rding to the  mpc8544ds=2Edts in the Linux tree=2E

This will leave an eLBC memory window of just 8MB while my proprietary loa=
d needs 64MB=2E My proprietary load doesn't seem to have 64 bit physical me=
mory support so I can't use e500plat either=2E Any suggestions?

Best regards,
Bernhard
>
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/ppc/mpc8544ds=2Ec | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/ppc/mpc8544ds=2Ec b/hw/ppc/mpc8544ds=2Ec
>> index 81177505f0=2E=2Ecd6cd04bef 100644
>> --- a/hw/ppc/mpc8544ds=2Ec
>> +++ b/hw/ppc/mpc8544ds=2Ec
>> @@ -14,6 +14,7 @@
>>  #include "sysemu/device_tree=2Eh"
>>  #include "hw/ppc/openpic=2Eh"
>>  #include "qemu/error-report=2Eh"
>> +#include "qemu/units=2Eh"
>>  #include "cpu=2Eh"
>>
>>  static void mpc8544ds_fixup_devtree(void *fdt)
>> @@ -45,6 +46,11 @@ static void e500plat_machine_class_init(ObjectClass =
*oc, void *data)
>>      pmc->pci_nr_slots =3D 2;
>>      pmc->fixup_devtree =3D mpc8544ds_fixup_devtree;
>>      pmc->mpic_version =3D OPENPIC_MODEL_FSL_MPIC_20;
>> +    pmc->has_platform_bus =3D true;
>> +    pmc->platform_bus_base =3D 0xEC000000ULL;
>> +    pmc->platform_bus_size =3D 128 * MiB;
>> +    pmc->platform_bus_first_irq =3D 5;
>> +    pmc->platform_bus_num_irqs =3D 10;
>>      pmc->ccsrbar_base =3D 0xE0000000ULL;
>>      pmc->pci_mmio_base =3D 0xC0000000ULL;
>>      pmc->pci_mmio_bus_base =3D 0xC0000000ULL;
>> --
>
>Regards,
>Bin


