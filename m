Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0936DE4E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:29:21 +0200 (CEST)
Received: from localhost ([::1]:45466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbo00-0003dV-Io
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnud-0005Qh-SF
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:23:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnuc-0005aG-4W
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619630625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUurgbd6R3L+yhNlTrdRjkGEmf2Yn9uyV6bCeK0RASs=;
 b=UsAM7WweeLhb5r4cDvIM6fWS3T10ikL4MkVoiif4GuDUBBzLVdDBwhRHZ42O0pXY52RjmO
 isBk/6oBnlAMFeFEztc8aeXpbhxMeIjxQT7rmk6ewBvo/RWTXYxH97gbz50cQ4B16EOEoX
 e8pEp4Sl9aWXI3i6NiXSJofslxzZ77I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-C16KYPoVOcunEx7LmVcwHw-1; Wed, 28 Apr 2021 13:23:38 -0400
X-MC-Unique: C16KYPoVOcunEx7LmVcwHw-1
Received: by mail-wr1-f72.google.com with SMTP id
 88-20020adf95610000b029010758d8d7e2so11010384wrs.19
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kUurgbd6R3L+yhNlTrdRjkGEmf2Yn9uyV6bCeK0RASs=;
 b=sfMj8USzLIncI8VvvqjjzRCpLtBuNtMwrBxgIelkPy8P8wohiYG6EF4HXcJ4fgECBr
 83U00S0YiHUmLTEt/yVd6pK+zK3Xni8F7/riXZqf2h9wDoxtxeR5IlgN/9MzQGkhXivd
 h4gxzaJIHu3BwVl5lhGN5v+eKvASXr7BMRGp19fAPhvoVpjzXlQpaXOYsvvN80x542No
 sdfXPDU8j3her98XJsUsmyJk0sWlcLJ5i7hBKVikdxRPFxBSHZp8LousNeFal0NIWyHU
 jY1+VCkWlj444Suk1+phLOaPwsJe7QL/fB/LcScEoh4uVDzy5LOuGoADvBpPnUBoImk8
 s5aw==
X-Gm-Message-State: AOAM530CZV0PmH97E8S5Qn8vdu2Q1h8dfU3xsiKpj7BBQrynzC3HKFNk
 j1dSMAl1iZyt11ZF1R2ofPiHYA+7wSlIVg1Ja5UQMl00o9vJKkbWdPQ0PfJIreMRv1VcPnhGMRG
 cE+uNeGDFVHoawyI=
X-Received: by 2002:a05:600c:210f:: with SMTP id
 u15mr5892601wml.115.1619630617665; 
 Wed, 28 Apr 2021 10:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzDvQpsYTGs6+wCW+d39GdTDs9cQrKBVfmJpnCF4toNI8CyYtacMFnf4BFv1X2zaVVhHxCXQ==
X-Received: by 2002:a05:600c:210f:: with SMTP id
 u15mr5892574wml.115.1619630617483; 
 Wed, 28 Apr 2021 10:23:37 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q5sm7481628wmj.20.2021.04.28.10.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 10:23:37 -0700 (PDT)
Subject: Re: [PATCH 6/7] hw/{arm,hppa,riscv}: Add fw_cfg arch-specific stub
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-7-philmd@redhat.com>
 <8b8be0b8-1f1a-d0fe-7fd3-682f34043df6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f4e52c49-03f0-0f2e-a293-46df367c1e2b@redhat.com>
Date: Wed, 28 Apr 2021 19:23:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8b8be0b8-1f1a-d0fe-7fd3-682f34043df6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 6:44 PM, Laszlo Ersek wrote:
> On 04/26/21 21:35, Philippe Mathieu-Daudé wrote:
>> The ARM, HPPA and RISC-V architectures don't declare any fw_cfg
>> specific key. To simplify the buildsys machinery and allow building
>> QEMU without the fw_cfg device (in the next commit), first add a
>> per-architecture empty stub defining the fw_cfg_arch_key_name().
>>
>> Update the MAINTAINERS section to cover the various target-specific
>> fw_cfg.c files.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/arm/fw_cfg.c      | 19 +++++++++++++++++++
>>  hw/hppa/fw_cfg.c     | 19 +++++++++++++++++++
>>  hw/riscv/fw_cfg.c    | 19 +++++++++++++++++++
>>  MAINTAINERS          |  2 +-
>>  hw/arm/meson.build   |  1 +
>>  hw/hppa/meson.build  |  1 +
>>  hw/riscv/meson.build |  1 +
>>  7 files changed, 61 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/fw_cfg.c
>>  create mode 100644 hw/hppa/fw_cfg.c
>>  create mode 100644 hw/riscv/fw_cfg.c
> 
> So, I haven't commented on the Kconfig symbol wrangling yet (my comment
> would be a blanket "Acked-by" anyway... sorry, not really my cup of
> tea), but at this point:
> 
> I don't understand why we need to add *more code* (stubs / boilerplate)
> if our goal is (apparently) to build QEMU with *fewer* devices.
> 
> Sorry for being dense. My total knowledge about stubs in QEMU is this:
> for some QMP methods (and for some QGA methods, dependent on OS), we
> need stubs. When they are invoked, they report "sorry, not implemented".
> That's it: all I know about stubs.
> 
> So... the commit message here says "simplify the buildsys", and the next
> commit message says, paraphrased, "don't build fw_cfg unless we need it"
> -- but why does that require more C-language code? It seems like we have
> some function *calls* that shouldn't exist in an fw-cfg-less machine, in
> the first place.
> 
> Again, sorry, I'm totally dense on this.

Eh no problem, I don't like this neither.

If you don't mind I'll reply in the patch 7/7.


