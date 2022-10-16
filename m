Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446605FFF49
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 14:51:27 +0200 (CEST)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok370-00086B-0H
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 08:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2mh-0004Te-Hy; Sun, 16 Oct 2022 08:30:28 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ok2mf-0000mz-1w; Sun, 16 Oct 2022 08:30:27 -0400
Received: by mail-ej1-x62b.google.com with SMTP id w18so19396457ejq.11;
 Sun, 16 Oct 2022 05:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1E2xXSQga2vK9R+hJBuJ8cdtauJdyjfNnfLSRUgwiMo=;
 b=qHONOfAqcGQHU2tsgNEF11wYciNxQ94iAtmBNxKIUgOQs+eCR/BecQu/cchjn0beoc
 ojRKSe2WZTgnjSNgIjTPIkDcr681nlPXBVhFGJBVuU4dkvnzoJ82xuU258mVFD4AwGQy
 YJmaAFzc0p49odjjCXfZ+PoyV3LzW7LbG+B5YyLBwgXOW7Dws2Z0XiF4ymOQ12J5LO0w
 6sF2+I7fUxxBMxCc7QDZifyViZEvXMy0qFKzFplQYyRjt/JjJgyKFvxYkK3KdFaGMpiF
 djIAs4P5WvTK6bhG1fxpdLoWUUCS0fVf/f3VR8Qc+48SeL3I+xUDlTi18uQG6gRMplO4
 +v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1E2xXSQga2vK9R+hJBuJ8cdtauJdyjfNnfLSRUgwiMo=;
 b=z5WGE21ZfoX2czMuRon7KvwcknUfZUxb+ZF8basjWsD5FFGTv2zaXKG2b5+XbZq7ZH
 hd7tSpMwu7R9r4iILvsDmfVBIBccjvrNlSdyFpgtnifRiERYN235eWVlr9XiG5uUipJJ
 3n5ukZomjVz1z9U/7qc5FfXf5ubB3um37wA4G9uisoYdeTRsmX06nXdsAwRLSY3hFsuH
 aw/Kj/Rso1VEtn2XDN4X+lol7DjtYxwN3IT/N9ggT99qYLcEuXUbYSqPSfxZVfVVJto0
 RKPj/EfRViqtun9VtBUOLP6SeIYSEgMPH3DJ+yGj9+qoOL1eJUmOQRsBRcQpEfv+oyGc
 zoDw==
X-Gm-Message-State: ACrzQf2Q/IPqPNUuUaCKxolLhW1Ul4p+LlxWE13KXAll8hibfYW9eAB9
 L63c/qWmuf7TuGg3JG82ZzvKkK/w/xM=
X-Google-Smtp-Source: AMsMyM52HBCVRobQOjt2iNXE0qiA8aA3nEbAIBzp3U89MimcD8D8GD+nQbo69KVhf73dAEzaqdkhdg==
X-Received: by 2002:a17:907:96a0:b0:78d:dd45:a6d4 with SMTP id
 hd32-20020a17090796a000b0078ddd45a6d4mr5114005ejc.643.1665923422966; 
 Sun, 16 Oct 2022 05:30:22 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-006-139.89.14.pool.telefonica.de.
 [89.14.6.139]) by smtp.gmail.com with ESMTPSA id
 r2-20020a1709061ba200b0078d76ee7543sm4426318ejg.222.2022.10.16.05.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Oct 2022 05:30:22 -0700 (PDT)
Date: Sun, 16 Oct 2022 12:04:10 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 13/13] hw/ppc/e500: Add Freescale eSDHC to e500 boards
In-Reply-To: <69fadeb6-ff4d-c327-5716-5a416bf96c20@amsat.org>
References: <20221003203142.24355-1-shentey@gmail.com>
 <20221003203142.24355-14-shentey@gmail.com>
 <69fadeb6-ff4d-c327-5716-5a416bf96c20@amsat.org>
Message-ID: <C749F10A-8368-4195-A942-8BA8D5609F04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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

Am 3=2E Oktober 2022 21:06:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4=
bug@amsat=2Eorg>:
>On 3/10/22 22:31, Bernhard Beschow wrote:
>> Adds missing functionality to emulated e500 SOCs which increases the
>> chance of given "real" firmware images to access SD cards=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   docs/system/ppc/ppce500=2Erst | 13 +++++++++++++
>>   hw/ppc/Kconfig              |  1 +
>>   hw/ppc/e500=2Ec               | 31 ++++++++++++++++++++++++++++++-
>>   3 files changed, 44 insertions(+), 1 deletion(-)
>
>> +static void dt_sdhc_create(void *fdt, const char *parent, const char *=
mpic)
>> +{
>> +    hwaddr mmio =3D MPC85XX_ESDHC_REGS_OFFSET;
>> +    hwaddr size =3D MPC85XX_ESDHC_REGS_SIZE;
>> +    int irq =3D MPC85XX_ESDHC_IRQ;
>
>Why not pass these 3 variable as argument?

Besides looking for a way to derive these parameters from QOM properties I=
 wanted to keep the code consistent to existing one, e=2Eg=2E dt_i2c_create=
()=2E

Best regards,
Bernhard
>
>> +    g_autofree char *name =3D NULL;
>> +
>> +    name =3D g_strdup_printf("%s/sdhc@%" PRIx64, parent, mmio);
>> +    qemu_fdt_add_subnode(fdt, name);
>> +    qemu_fdt_setprop(fdt, name, "sdhci,auto-cmd12", NULL, 0);
>> +    qemu_fdt_setprop_phandle(fdt, name, "interrupt-parent", mpic);
>> +    qemu_fdt_setprop_cells(fdt, name, "bus-width", 4);
>> +    qemu_fdt_setprop_cells(fdt, name, "interrupts", irq, 0x2);
>> +    qemu_fdt_setprop_cells(fdt, name, "reg", mmio, size);
>> +    qemu_fdt_setprop_string(fdt, name, "compatible", "fsl,esdhc");
>> +}
>>     typedef struct PlatformDevtreeData {
>>       void *fdt;
>> @@ -553,6 +573,8 @@ static int ppce500_load_device_tree(PPCE500MachineS=
tate *pms,
>>         dt_rtc_create(fdt, "i2c", "rtc");
>>   +    /* sdhc */
>> +    dt_sdhc_create(fdt, soc, mpic);
>>  =20

