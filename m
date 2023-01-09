Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A7266235A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 11:42:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEpZR-0000uN-LR; Mon, 09 Jan 2023 05:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEpZP-0000rW-H6
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:39:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEpZM-0006F2-JC
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 05:39:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso3247097wmb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 02:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xTy+zRGaEwMAcEbHvrvejMsiUb0iYAe4ynWYjVfKoxI=;
 b=Z1268/tM6Aj/IyFSOml1jlpxYo5Tmm9/LFWbpXJoBCxMsdpuCsa2S+rB60JDUJd8zN
 57RArsniLkLotHCCihCrjErybNDEHwnS/CjbP7xKWI7mj2XO2FWlH2EZiKR2VKfTzO2n
 wQ1w09lNMuwU/wuqr6PHCCdvWaEz+eJKSItvQ0tEYYuHzLZb4DZ77Dphp+DtV4QRM/iE
 2xGDTlcx5+Lno0BMonPSAz0rUC2gAzj3Clyuvf+JKrgDk5di/jX39cFZo6e0kvojbLVx
 JDO07FXFk28qWTeFvO0MC4GfuMuJXAz7JqzALlm7Uom2C9lNEWOAVr/kc5T8WuO9GxpZ
 Gpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xTy+zRGaEwMAcEbHvrvejMsiUb0iYAe4ynWYjVfKoxI=;
 b=brBM3P+KzJX7MYleUzKPvb5f6pnergq3O7KruyXsnNInFKEDZBNLXPcJ28MR+KSfJT
 XfgMBS6Gwdf02XxGrjwOvK2AmG3bItKgkOm6aW4UZRdocNFc+HzKWXAqAc5VnUkOlkCm
 kRc21X3mLCbGb4BaPI02/Ih1PRBEFeXA6BqlHrDZleLomn1VIcukRm2mXR1bP2ZqyF5E
 JKYLyzd7ecOPDkCWNzpe6IESAmEH77+HNGWigyUjP1lyRgpbIP2AFjGbIWE59bTIhUV3
 lv+fB1Zb7DAiwaKGudpYIcOg4tUb4R3TPolu0jHiVCsvT89xQXzBGDFu6bkiLZsIj66u
 kCUw==
X-Gm-Message-State: AFqh2koRwaBqhzDQdMJaMdEDoxlPxHwt+86fL6KWcEwTdf3ODr0c9/dh
 78znCSlchBDS+p97JlRp0iUHApe7wh/vSLTo
X-Google-Smtp-Source: AMrXdXthBUXATOPlkec5oXveGh6z9ogH8gGRCTiMoMnVLKfg4FxlxrzuSxfHzu5FnCWXDA3dtjRI4Q==
X-Received: by 2002:a05:600c:4fce:b0:3d9:ee01:60a4 with SMTP id
 o14-20020a05600c4fce00b003d9ee0160a4mr3050376wmq.1.1673260794779; 
 Mon, 09 Jan 2023 02:39:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm24693383wms.3.2023.01.09.02.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 02:39:54 -0800 (PST)
Message-ID: <9ce88e6c-005a-68a3-0962-361981604536@linaro.org>
Date: Mon, 9 Jan 2023 11:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] hw: Remove implicit sysbus_mmio_map() from pflash
 APIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
References: <20230104220449.41337-1-philmd@linaro.org>
 <CAFEAcA_sw=SdiKD4X3E1=AURS40NTv7zeLNfRTTP6zdLnr93rg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_sw=SdiKD4X3E1=AURS40NTv7zeLNfRTTP6zdLnr93rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/1/23 18:51, Peter Maydell wrote:
> On Wed, 4 Jan 2023 at 22:04, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Paving the road toward heterogeneous QEMU, the limitations of
>> having a single machine sysbus become more apparent.
>>
>> The sysbus_mmio_map() API forces the caller to map a sysbus
>> device to an address on the system bus (system bus here is
>> the root MemoryRegion returned by get_system_memory() ).
>>
>> This is not practical when each core has its own address
>> space and group of cores have access to a part of the
>> peripherals.
>>
>> Experimenting with the PFLASH devices. Here the fix is
>> quite easy, we split the pflash_cfi_register() -- which
>> does the implicit sysbus mapping -- into an explicit qdev
>> pflash_cfi_create() followed by the sysbus_mmio_map() call.
> 
> pflash_cfi_register() is a legacy convenience function. If
> you don't like the sysbus_mmio_map() it does then you can
> create, configure, realize and map the device directly.
> This is what hw/arm/virt.c does, for instance (it wants to
> map the flash devices into either secure or non secure RAM).

Good point, thanks!

