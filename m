Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6104C00B0
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:57:45 +0100 (CET)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZQ0-0001fH-TN
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZNN-0007Ad-2R; Tue, 22 Feb 2022 12:55:01 -0500
Received: from [2a00:1450:4864:20::533] (port=45886
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nMZNL-0007As-Cz; Tue, 22 Feb 2022 12:55:00 -0500
Received: by mail-ed1-x533.google.com with SMTP id c6so35955166edk.12;
 Tue, 22 Feb 2022 09:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=f3T8mbZi0bA2FOiqoK7L+eNmSPSfAchEN/jFShB/S1Y=;
 b=J7FU+jhof3y7uMSlHdhHUjnAad8MIQyopadSgapVuCMp0Il2PeO+i52m/ChN//IEg6
 n68GDz598iMXjEJM1hBqUKYeZaheZr4+184kBQLGkVvq61v76GFHvTmGRpmLBBG1gvef
 58IcPSBkUxgIksvxHjlfH9fHixCOqF6nmJ5UtTJZkEVoRWr1zVsGIYc0ZuChgvglj4eM
 MYUjzVtR5gOvJnc8BGsZ5mOUPiPydDb2w4nCtboXTYrEXRG9xws83J/hbKfmv5eh1/3f
 dxs1vN6js8HzxxhpJhf9jblzsUAdfDUaVoPCc2Juy8stX0g0M5ACIpbvT8KBpy7/redU
 aD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=f3T8mbZi0bA2FOiqoK7L+eNmSPSfAchEN/jFShB/S1Y=;
 b=T17QuMfn3kGMZvfJvmflyr6Pe4jJs2JZTKr1m2jHrtq59AeqLBlwUyxMTNxNVlxzp5
 scyvPBD0wTf4q74w5/8JQVMvkyKG6lV31R9lT8FtgFU4GkCyCqBYWYmMFbf5O+YL1WXx
 kj9CIoTuXKkViAA67OGSuqKhfUsbIl3be7cc0QbG7/KVXovc79564AE6dznWeb+D5HEp
 VIb34yzfKG7vhiz8mCTo5y1JRgF/UBEJ9K85R/v53DC0DeESVQsqpoge9uw0gtetLulB
 YUAPggJcZ+ZJfKlLR9zbyhg9Zc0eWBBOOS+Apm3EiYLe2Mex0UfVuC19iE3JPGEVETgT
 ca3Q==
X-Gm-Message-State: AOAM532hypNS2PLKBtF/NdFmkdIVP7EaYmy3WdAW6EN3lzRg2xVzCbYd
 EGKjtxABsx7hbhid1sDeqcUoVimH3V0=
X-Google-Smtp-Source: ABdhPJydNrFfdAmUhROjNYBYk8Ltrehf4a3JLrMXteWY3/BVZ4JY3s5Atxi+OoErCRhuZQ0m2vazmQ==
X-Received: by 2002:a50:f69c:0:b0:410:8241:580c with SMTP id
 d28-20020a50f69c000000b004108241580cmr27108718edn.100.1645552497607; 
 Tue, 22 Feb 2022 09:54:57 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-227-088.89.12.pool.telefonica.de.
 [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id d21sm6509836eja.15.2022.02.22.09.54.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Feb 2022 09:54:57 -0800 (PST)
Date: Tue, 22 Feb 2022 17:54:53 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 02/22] hw/rtc/m48t59-isa: QOM'ify IRQ number
In-Reply-To: <CAFEAcA-MDH48sv6O5taVn=A8BMZHQWPJhkaTQ_YtTnLq3mgGdA@mail.gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
 <20220222173819.76568-3-shentey@gmail.com>
 <CAFEAcA-MDH48sv6O5taVn=A8BMZHQWPJhkaTQ_YtTnLq3mgGdA@mail.gmail.com>
Message-ID: <AFB7748C-3E94-4106-B27C-51B46B0BA826@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "open list:PReP" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22=2E Februar 2022 17:47:56 UTC schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Tue, 22 Feb 2022 at 17:41, Bernhard Beschow <shentey@gmail=2Ecom> wrot=
e:
>>
>> Exposing the IRQ number as a QOM property not only allows it to be
>> configurable but also to be printed by standard QOM mechanisms=2E This =
allows
>> isabus_dev_print() to be retired eventually=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/rtc/m48t59-isa=2Ec | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/rtc/m48t59-isa=2Ec b/hw/rtc/m48t59-isa=2Ec
>> index dc21fb10a5=2E=2Ed1c1d789a5 100644
>> --- a/hw/rtc/m48t59-isa=2Ec
>> +++ b/hw/rtc/m48t59-isa=2Ec
>> @@ -42,6 +42,7 @@ struct M48txxISAState {
>>      ISADevice parent_obj;
>>      M48t59State state;
>>      uint32_t io_base;
>> +    uint32_t isairq;
>>      MemoryRegion io;
>>  };
>>
>> @@ -79,6 +80,7 @@ static void m48txx_isa_toggle_lock(Nvram *obj, int lo=
ck)
>>  static Property m48t59_isa_properties[] =3D {
>>      DEFINE_PROP_INT32("base-year", M48txxISAState, state=2Ebase_year, =
0),
>>      DEFINE_PROP_UINT32("iobase", M48txxISAState, io_base, 0x74),
>> +    DEFINE_PROP_UINT32("irq", M48txxISAState, isairq, 8),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> @@ -99,7 +101,7 @@ static void m48t59_isa_realize(DeviceState *dev, Err=
or **errp)
>>
>>      s->model =3D u->info=2Emodel;
>>      s->size =3D u->info=2Esize;
>> -    isa_init_irq(isadev, &s->IRQ, 8);
>> +    isa_init_irq(isadev, &s->IRQ, d->isairq);
>>      m48t59_realize_common(s, errp);
>>      memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48=
t59", 4);
>>      if (d->io_base !=3D 0) {
>> --
>> 2=2E35=2E1
>
>If the user creates the device specifying irq=3D16 then isa_init_irq()
>will assert=2E Since these devices are creatable by users on the
>commandline, I think the realize method should check that the
>property value is in range (d->isairq < ISA_NUM_IRQS), and report
>a suitable error back if not=2E

Ah, I missed that! Thanks for pointing out, I will fix it=2E

Regards,
Bernhard
>
>thanks
>-- PMM


