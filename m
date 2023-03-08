Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82456B0014
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 08:42:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZoPu-0007DP-8g; Wed, 08 Mar 2023 02:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZoPr-000738-0H
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:40:51 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZoPn-0002d0-3I
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 02:40:50 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bx12so14404955wrb.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 23:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678261244;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=so4BijStIwanSu+GF2rmzCW4j5iACzEFyV0r0Af/kU4=;
 b=vCSPWfFuvDWVM3mf5fGZw1kYL7CSO6p7GILs6TVSEZiH+shBMasaK7b/UvonAV4Mch
 wmtdRk6BKFlzcHCWORZgnBN+hdeFz2HEJmBKTA0vCEClWxM+pkChDhSWqIP6bdxnCq1e
 lYLHOBphjauBsQU/tXL3zZqyUlnE4eCgP8EBSZxDvfck3CxBXCJjDECiwIfUdJeFs1WY
 +ihKiPFFK39OhrXccN1IaFgF+63F1qORSNv7DzF9LY/YqBpm8DIxazyxE3W4LGLw2Ijy
 aQaZmL9HKywb4dg1/hCjkuniv0nRXm2F8TH8O6MwkNvm/a3mVqKVH2Klz+H1U5JLWron
 ewjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678261244;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=so4BijStIwanSu+GF2rmzCW4j5iACzEFyV0r0Af/kU4=;
 b=BNh1LPEfBbBjT6forcT9OPj0J6hq8ojGM4W/JC0x81I+SuH5X0mkGpXMIOcqMu3FhU
 lxp5LbSeZaeMW0Yg50NtNi6dI7XKGvMaKT70iauVsprNXHta+dFOoy4jjJxb3JSkxZYu
 rJ5SDFVQw+MQSvJN2h/g4x7odb2JTWXe6dlmm57ogHoWBXBSwmMiPjdJtIPypbk8rze9
 npSKcamaaM3BNcM733GnbvWwp9pImVZy7YBuuynCLPG+3+HpoKlAMikRv+abjq0WTjAM
 QPHz6iSFwyR/aOx1XaNfS13e/ix38ZxpCQ6XcG6wgSO5vaLrRznKFqj2iozpeoUS9Mw3
 6tow==
X-Gm-Message-State: AO0yUKWvrHx678M7JF50szSrsVMaiudPJLyMReXtJ5RjrwAzEdLIfMxG
 DOjx5YrpiZqS5SZQwbqBJqvf7Q==
X-Google-Smtp-Source: AK7set/2dh0r6LhIGxetIxiG4+ItPQ+jiPRCZtem9iJmyRWcoci8udS6+W+Wi8vcfwiKM4A45og/pw==
X-Received: by 2002:a05:6000:1a54:b0:2ca:6cb1:c9c5 with SMTP id
 t20-20020a0560001a5400b002ca6cb1c9c5mr11746861wry.30.1678261244473; 
 Tue, 07 Mar 2023 23:40:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r4-20020a5d4944000000b002c56013c07fsm14246076wrs.109.2023.03.07.23.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 23:40:43 -0800 (PST)
Message-ID: <719692c2-6401-fd6a-8718-1dd5e6ff1f85@linaro.org>
Date: Wed, 8 Mar 2023 08:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/51] Net patches
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
 <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
 <4b67f103-0df3-891c-2a0f-466a82e89732@linaro.org>
 <CACGkMEsuy_eCGcLy2C8-BybbwGC4ak9+Gfv9EeiG6DAZrLjZdQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CACGkMEsuy_eCGcLy2C8-BybbwGC4ak9+Gfv9EeiG6DAZrLjZdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/3/23 07:56, Jason Wang wrote:
> On Wed, Mar 8, 2023 at 4:43 AM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 7/3/23 18:01, Peter Maydell wrote:
>>> On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com> wrote:
>>>>
>>>> The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:
>>>>
>>>>     Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     https://github.com/jasowang/qemu.git tags/net-pull-request
>>>>
>>>> for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b240414:
>>>>
>>>>     hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (2023-03-07 14:55:39 +0800)
>>>>
>>>> ----------------------------------------------------------------
>>
>>> build-oss-fuzz failed on something involving fuzzing eepro100:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3889073821
>> Jason, please drop my patches. I'll look at that failure.

Before "hw/net/eepro100: Convert reset handler to DeviceReset",
e100_pci_reset() is only called once from DeviceRealize _before_
the device is realized.

After, 1/ it can be called multiple times and 2/ it seems to do
stuffs that really belong to DeviceRealize (should be called once),
in particular pci_add_capability().

I *think* it should be illegal to call pci_add_capability() _after_
a device is realized. Auditing pci_add_capability(), there is only
one other use before realize: amdvi_sysbus_realize() in
hw/i386/amd_iommu.c.

