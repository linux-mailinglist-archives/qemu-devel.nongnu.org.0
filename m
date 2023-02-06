Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0868B32B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 01:17:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOpAz-0006Sn-8g; Sun, 05 Feb 2023 19:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOpAx-0006SQ-9w; Sun, 05 Feb 2023 19:16:03 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOpAv-0007gP-NC; Sun, 05 Feb 2023 19:16:03 -0500
Received: by mail-ej1-x633.google.com with SMTP id p26so29708896ejx.13;
 Sun, 05 Feb 2023 16:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XNck/4K1CIixbioZCqBfB2y/H5I2HmE3bokEKPcz8b0=;
 b=okWqCQX44MvHEjPQ3AboKF9RAoIh2hGtsLiwTDRW3SqaJ4paNVbqUOhjvCdchlcBtX
 w2lphR4TJmNB4ubygLAy5HqNGDZxVR5+MeyzRlcNuEi4eF6+cGBmhvY506NQlFl5oUIG
 WhW+khLPGkdV/YqiYhsOX/MtF23mg4AzpthkDxdM1Jak5653ISM4Vk8h468sDN1BmHKe
 v+USnyyWYNzbY5/XfBbAJcRANe+yWw15nPpA5t/SINR/2zV2hqO9li16p0VDLwLmUBzT
 pkGhn/RqSCTp5ejMgC+mt7Afa9HS4ADIkzcicjbc+5LdtJ9xgfcdinMLMtoehZBq6F9I
 88HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XNck/4K1CIixbioZCqBfB2y/H5I2HmE3bokEKPcz8b0=;
 b=kuyOz70eS8V53fA0vorcIsMiRuRBgaZGx9h4s+EOoiGiHSnHbGEcO7sKfjlnp1mSD1
 0OpjBkAqoXugQuQ21hT96Cocsx42sVLwQ+RqBZ//9ojwMfltx2hmjAZrY3T/uPDPEsHv
 p30Dw0iytoTYz8pFWBvBC7fLJFoaktqAGQ5wRK3oPVCJGf4lcbByCyLpsayRHwGvTLH1
 vRa3qYvk/Ow/zM9EYESFkr/rcAA2LWIWMX1oZcVff31zqp31nHN4yo40gxMHyKpkW73e
 eSia9RAafUdvahRqYt9ppjADHbeGjD7Tl374BZPGOPqgzANwxU/sgogD+yTUCas91Apa
 EJ5Q==
X-Gm-Message-State: AO0yUKUewdRWEFBBQ91cFTw7YtQkvx6+mXn+0X9z+4zIbXZS4D4g6Rsh
 /AvCXJrLTrQt6KNiPj0/VDU=
X-Google-Smtp-Source: AK7set/VwpMIfSLyBS2wTmezB1GaAAufal0RP1/nIiotTDyulNW9/e6+uGXMeu2aRLm/hoKWx2ehjA==
X-Received: by 2002:a17:906:1806:b0:88b:109e:fbd3 with SMTP id
 v6-20020a170906180600b0088b109efbd3mr17769758eje.24.1675642559480; 
 Sun, 05 Feb 2023 16:15:59 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-009-140.77.13.pool.telefonica.de.
 [77.13.9.140]) by smtp.gmail.com with ESMTPSA id
 z5-20020a1709060ac500b008806a3c22c5sm4687285ejf.25.2023.02.05.16.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 16:15:58 -0800 (PST)
Date: Mon, 06 Feb 2023 00:15:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 2/9] hw/pci-host/q35: Inline sysbus_add_io()
In-Reply-To: <58531e21-311c-a747-3859-a621144feeda@linaro.org>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-3-shentey@gmail.com>
 <58531e21-311c-a747-3859-a621144feeda@linaro.org>
Message-ID: <7C061913-012A-45BD-8969-1C1CA73AE517@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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



Am 5=2E Februar 2023 11:12:26 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 4/2/23 16:10, Bernhard Beschow wrote:
>> sysbus_add_io() just wraps memory_region_add_subregion() while also
>> obscuring where the memory is attached=2E So use
>> memory_region_add_subregion() directly and attach it to the existing
>> memory region s->mch=2Eaddress_space_io which is set as an alias to
>> get_system_io() by the q35 machine=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Reviewed-by: Thomas Huth <thuth@redhat=2Ecom>
>> ---
>>   hw/pci-host/q35=2Ec | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/hw/pci-host/q35=2Ec b/hw/pci-host/q35=2Ec
>> index 26390863d6=2E=2Efa05844319 100644
>> --- a/hw/pci-host/q35=2Ec
>> +++ b/hw/pci-host/q35=2Ec
>> @@ -50,10 +50,12 @@ static void q35_host_realize(DeviceState *dev, Erro=
r **errp)
>>       Q35PCIHost *s =3D Q35_HOST_DEVICE(dev);
>>       SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>>   -    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
>> +    memory_region_add_subregion(s->mch=2Eaddress_space_io,
>> +                                MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->con=
f_mem);
>>       sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);
>
>This makes me wonder why MCH_PCI_DEVICE doesn't use the bus I/O space
>via pci_address_space_io()=2E IOW, why the MR like is in MCH_PCI_DEVICE
>and not Q35_HOST_DEVICE?

I think I have follow-up patches in the pipeline moving the MemoryRegion p=
ointers to the host device=2E Interestingly, these pointers are only used d=
uring the realize phase and just needlessly occupy memory during the rest o=
f the device's lifetime=2E=2E=2E

