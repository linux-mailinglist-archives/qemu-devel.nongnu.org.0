Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D414A3B09
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 00:32:14 +0100 (CET)
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJg5-0001Bk-P7
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 18:32:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJdx-0000Nf-Cm
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:30:01 -0500
Received: from [2a00:1450:4864:20::436] (port=47048
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJdt-00035g-Tq
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:30:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id l25so21920994wrb.13
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 15:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LAE0fWxF8E74RVDDe5DAIfZW9Wrc4gy4zGlSnAZ8ra4=;
 b=F8N9qJoksFzdyJGRFQIG+dDPUCW13WBzgnRBceIxeORp/BGQ04tnt+RE8n8on6awqt
 EkiiI3dxMYZSfiXEvWc0a2ESBrCMtpHsxg+OZ6aJD+ui6NDyOr6Ul7YHxgvZXx0umRd/
 78c84DLcoHIpkrKRZ+w7JM7HxQZKhAS9BMhItEPLTuMuxcZriKqTVi4J+LUCqbeEcS3N
 SZXg1GOOli4rqOCUeJZa6DWFX+0KJeQXje/l8RfG7Sm3hnIuEHO6deKXyqpGxfVRlg7g
 3gAzMlyjf5LrmFf1aQGYuuWXAW13H7J/u1WR+SBTGgbyW3UtiJf67Xsp3qj0Am3DTFiH
 OyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LAE0fWxF8E74RVDDe5DAIfZW9Wrc4gy4zGlSnAZ8ra4=;
 b=thx9nW/xXErqBuwBpSphi47XHylQlj0uhQPfNQy1vpy0gxRjJ2x3ie6f4HsWBhBGdh
 DljQspdkxdKy7PPrlPE1uIVQShvoQcJH7fUaOIvh7X4EhceQ5mAVrWFGmgf1GCQbvZjo
 g/7GSCeSaGBKuUMSWX5wYoDdClCGn2r1/X9aApwtQjYbW2Igg9OrI8FlfaKvR4viIFBS
 YMbg9A0P3J1LLVCHrxrJ/JvvX2mmCZXzbLXdzlgjF8QKNGp6n5BAjYHalz7qtHA201Bo
 DxhXcA2UhzrVpU6I8eJTnTIi45KZLzsc2pa5jDhkSvcBO2L1p2+xN2ib4wCoId4Aqt4Q
 2HHQ==
X-Gm-Message-State: AOAM530CNTKpn0gj/bROmDfuDhwIFEAh2GZatEv/wibtqXR1qrdQwElv
 iRKu198tJw98W556WXc0EOc=
X-Google-Smtp-Source: ABdhPJxMK9IlOKjJ/xDIroguKv8n9viu+NASM2antlLOSL06aanu8/183TROo5mp9e1c9fVe75kTSA==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr14893776wry.652.1643585382226; 
 Sun, 30 Jan 2022 15:29:42 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id e10sm12090774wrq.53.2022.01.30.15.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 15:29:41 -0800 (PST)
Message-ID: <0039f019-2bf4-577c-2ab4-f0a2f6f5ef1b@amsat.org>
Date: Mon, 31 Jan 2022 00:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] memory: Make memory_region_is_mapped() succeed
 when mapped via an alias
Content-Language: en-US
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211102164317.45658-1-david@redhat.com>
 <20211102164317.45658-3-david@redhat.com>
 <CAPan3Wpgm94iHRCz3uGvUZYV37W=e4_d7UMqc81hY1cxB-zs1w@mail.gmail.com>
In-Reply-To: <CAPan3Wpgm94iHRCz3uGvUZYV37W=e4_d7UMqc81hY1cxB-zs1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Niek!

(+Mark FYI)

On 30/1/22 23:50, Niek Linnenbank wrote:
> Hi David,
> 
> While I realize my response is quite late, I wanted to report this error 
> I found when running the acceptance
> tests for the orangepi-pc machine using avocado:

Unfortunately I only run the full SD/MMC tests when I send a SD/MMC pull
request, so missed that here.

> Basically the two tests freeze during the part where the U-Boot 
> bootloader needs to detect the amount of memory. We model this in the 
> hw/misc/allwinner-h3-dramc.c file.
> And when running the machine manually it shows an assert on 
> 'alias->mapped_via_alias >= 0'. When running manually via gdb, I was 
> able to collect this backtrace:
> 
> $ gdb ./build/qemu-system-arm
> ...
> gdb) run -M orangepi-pc -nographic 
> ./Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img
> ...
> U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
> DRAM:
> qemu-system-arm: ../softmmu/memory.c:2588: memory_region_del_subregion: 
> Assertion `alias->mapped_via_alias >= 0' failed.
...

> So it seems that the hw/misc/allwinner-h3-dramc.c file is using the call 
> memory_region_set_address, where internally we are calling 
> memory_region_del_subregion.
> The allwinner-h3-dramc.c file does use 
> memory_region_add_subregion_overlap once in the realize function, but 
> might use the memory_region_set_address multiple times.
> It looks to me this is the path where the assert comes in. If I revert 
> this patch on current master, the machine boots without the assertion.
> 
> Would you be able to help out how we can best resolve this? Ofcourse, if 
> there is anything needed to be changed on the allwinner-h3-dramc.c file, 
> I would be happy to prepare a patch for that.

David's patch LGTM and I think your model might be somehow abusing the
memory API, but I'd like to read on the DRAMCOM Control Register to
understand the allwinner_h3_dramc_map_rows() logic. I couldn't find a
reference looking at Allwinner_H3_Datasheet_V1.2.pdf.
I wonder if we could ignore implementing it.

Your use case is typically what I tried to solve with this model:
https://lore.kernel.org/qemu-devel/20210419094329.1402767-2-f4bug@amsat.org/

In your case, @span_size is your amount of DRAM, and @region_size is the
area u-boot is scanning (and @offset is zero).
Could that work, or is DRAMCOM doing much more?

Thanks,

Phil.

P.D. reference to documentation welcome :)

