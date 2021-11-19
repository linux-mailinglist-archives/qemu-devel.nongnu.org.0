Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84E4576A3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:44:42 +0100 (CET)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8sK-0003vW-Sl
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:44:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo8dA-0005LU-Up
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:29:00 -0500
Received: from [2a00:1450:4864:20::336] (port=36447
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mo8d9-0002je-Bf
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:29:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso11175517wml.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 10:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jLy0NlzhHMC3/Ud5CgK/1HTdtW2HsRGBSyVoe4TtKE8=;
 b=hvG1VHLqVYRW74WQCTC0zouQsaUcGIo+5ajVqCGtN9Zitc1+2dmskLtcEBwSk3cZN9
 wvR63WjLgaW6FlbW5sPiIF45jElh53TePXK2DYfa2Azm7YdpJFsacnsVQW3P4MTzRL1r
 9l8HVBeiJXkdeFtxxAADZjbaYtdxWepGDcQosdYuXN9oKZHVilNWHO6gdnpdPN5nYIuu
 xz3RTy8KR6eaKsKcHg6lX/DM1OAxqW9polkDAvIYleuLP9dOHbEXR82BynY4WNbT3PYP
 Devh7WvUbcSUB23z+JsU/shSvpfRT96OY/oSkxQp71ZYiDMLxJOwDJzrDe27AzJrGXLQ
 F1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jLy0NlzhHMC3/Ud5CgK/1HTdtW2HsRGBSyVoe4TtKE8=;
 b=OPIQajj4PdtFn/ERQs8AUGqOL0D4j5Vn4ghSHTQy2n/LbhhATyK72xHO3hxcHOmyZG
 1bBLrByvAHK7JXBwaxOo70IzKBmo1O3+LHtLFC+3GF8AhpkN83XThQh4aojtntat3hy8
 TuEGJauNaSBAxk/dVFBw1ag6BvXZz72FwAgg4EATB8AEBCO2mKI0iCxx0dbOvuYjOVke
 GV1HcshUU40cEZYqyZBVVLyLQDmBIaT+ysYFxTnDyXMVAuptmYjUelZBOjIZIBfTwBXM
 Js2e9rmwV8szo+MoGZd6UHOhrPh0NqXzj6dgOmtheUM+Eph9kFesv2iRgplXLvnbhmpZ
 QnBw==
X-Gm-Message-State: AOAM530Iqu6TR21T5SoU+YuKevw6Cap/B8Md+dW5fuNaLs8T+gmzr3C0
 pBaBUJG2MkCLJ/4RPwqUxKY=
X-Google-Smtp-Source: ABdhPJwNunPJfMBUwU8mOH8Wb/0Ub2MsEPTYBK0oiZWpyNYR57aVzS26Fxm5/Q2wziTZnc9zf5mdwA==
X-Received: by 2002:a05:600c:4e94:: with SMTP id
 f20mr2029287wmq.77.1637346537823; 
 Fri, 19 Nov 2021 10:28:57 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c6sm16717207wmq.46.2021.11.19.10.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 10:28:57 -0800 (PST)
Message-ID: <bf740ceb-91be-25bf-0c7f-a0a331a22a08@amsat.org>
Date: Fri, 19 Nov 2021 19:28:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-7.0 2/5] hw/display/vga-mmio: Inline vga_mm_init()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211119171202.458919-1-f4bug@amsat.org>
 <20211119171202.458919-3-f4bug@amsat.org>
 <e414c4b-11b-86d7-0b3-5f937db07f49@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <e414c4b-11b-86d7-0b3-5f937db07f49@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.727,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 19:20, BALATON Zoltan wrote:
> On Fri, 19 Nov 2021, Philippe Mathieu-Daudé wrote:
>> Inline vga_mm_init() in vga_mmio_init() to simplify the
>> next patch review. Kind of.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/display/vga-mmio.c | 27 ++++++++++-----------------
>> 1 file changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
>> index 8aaf44e7b1d..0aefbcf53a0 100644
>> --- a/hw/display/vga-mmio.c
>> +++ b/hw/display/vga-mmio.c
>> @@ -65,12 +65,19 @@ static const MemoryRegionOps vga_mm_ctrl_ops = {
>>     .endianness = DEVICE_NATIVE_ENDIAN,
>> };
>>
>> -static void vga_mm_init(VGAMmioState *s, hwaddr vram_base,
>> -                        hwaddr ctrl_base, int it_shift,
>> -                        MemoryRegion *address_space)
>> +int vga_mmio_init(hwaddr vram_base,
>> +                    hwaddr ctrl_base, int it_shift,
>> +                    MemoryRegion *address_space)
> 
> Indentation? (But it's removed later so does not really matter.)

Oops I didn't notice.

>> {
>> +    VGAMmioState *s;
>>     MemoryRegion *s_ioport_ctrl, *vga_io_memory;
>>
>> +    s = g_malloc0(sizeof(*s));
>> +
>> +    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
>> +    s->vga.global_vmstate = true;
>> +    vga_common_init(&s->vga, NULL);

        ^---- here is vga_mm_init() inlined [*]

>>     s->it_shift = it_shift;
>>     s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
>>     memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
>> @@ -89,20 +96,6 @@ static void vga_mm_init(VGAMmioState *s, hwaddr
>> vram_base,
>>     memory_region_add_subregion(address_space,
>>                                 vram_base + 0x000a0000, vga_io_memory);
>>     memory_region_set_coalescing(vga_io_memory);
>> -}
>> -
>> -int vga_mmio_init(hwaddr vram_base,
>> -                    hwaddr ctrl_base, int it_shift,
>> -                    MemoryRegion *address_space)
>> -{
>> -    VGAMmioState *s;
>> -
>> -    s = g_malloc0(sizeof(*s));
>> -
>> -    s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
>> -    s->vga.global_vmstate = true;
>> -    vga_common_init(&s->vga, NULL);
>> -    vga_mm_init(s, vram_base, ctrl_base, it_shift, address_space);
> 
> Where did this vga_mm_init() go?

Earlier in [*].

> Regards,
> BALATON Zoltan
> 
>>     s->vga.con = graphic_console_init(NULL, 0, s->vga.hw_ops, s);
>>
>>

