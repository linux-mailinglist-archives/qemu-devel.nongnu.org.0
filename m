Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1692E5BAF83
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:42:05 +0200 (CEST)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCXc-0006Ln-5c
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCS2-0000NH-0w; Fri, 16 Sep 2022 10:36:18 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCRw-0004FG-86; Fri, 16 Sep 2022 10:36:16 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 n23-20020a17090a091700b00202a51cc78bso19615357pjn.2; 
 Fri, 16 Sep 2022 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=YQUHyWlfI9iUD/lWKmqbUDJfV1xBKCzIpjqTEDNoC3s=;
 b=HPHxI3LHd93rBetpysXY0q0qc/HbJwv+LvZTKPjkidMr8/1/bIiGV4YElFcQVV/4QV
 fV6MkE3+FoFX/NzI+GnR1tWFRKuX6ARO2sCcyc1RPAOtSF0dFbjN/LC0UsTbjtJK7AA0
 KvW2ACRYfrKIGobcHKFOQheQ3vaKQcPPoEtZe4bA9fZKj80BcQjE+wcqk0SnzhdGS4y4
 N5MvctLP5ssKeUbdT7wjFZdeN93uNrfvc6WLjnW84YElScQspjy0EZRUdQ8fGsSaxcbA
 E7i1K7LaG/+5iroH934BVwyRLNdcYncN6FR7ZkX18mtuq8JQUsCU8LatsGXSpxFr32Vi
 yL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=YQUHyWlfI9iUD/lWKmqbUDJfV1xBKCzIpjqTEDNoC3s=;
 b=KonRcksVYavWHdOtvoX6N3K/p556rG2/mjmErW54O3pdeH1uooBJLPyPtQjED01c6p
 qsRREPD8nQHOSFbde7SpuEe95RK2nCmojQnwj751dlrVjKpt+KvgXIYPnWOw+96RgnDF
 3ZNFuEYRjfMRdtEIquzlYfneHECjgID+lwzNd8akRSHfuZnFc32xIsHUz0LjhRX3tWub
 x+BbLW4DYyPThkTe+lTheGo/o2HhAONbAjSuWBV4L5CBpPwahHLp0D52tZEs/ogWH016
 w2FPSB0GF7LmZ0TRvqmyEKiwDJfKWxH6NvRHRTKmfgUF5YvYEp/DvhYiX8+1vQpZgAAr
 RIiw==
X-Gm-Message-State: ACrzQf1fTNDroJStLHmTuSIIx8E3pQiB1W+P9tXrqn4W6pH3dgACL8GR
 A7R1BM6XkEzT6be+TO+7dEQ=
X-Google-Smtp-Source: AMsMyM5NpPlgw1MzdC+C/n3THOXIXNo5rjOoCkHu7VjZuVxfW3DzjiTAxiqmL5KHwvdZbF/I8aIn4g==
X-Received: by 2002:a17:903:1247:b0:178:6200:96d2 with SMTP id
 u7-20020a170903124700b00178620096d2mr179654plh.52.1663338970189; 
 Fri, 16 Sep 2022 07:36:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170903024600b00177e590df96sm14991938plh.118.2022.09.16.07.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 07:36:09 -0700 (PDT)
Message-ID: <25b0a116-7098-c285-cb20-af05dd03768b@amsat.org>
Date: Fri, 16 Sep 2022 16:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v5 00/13] Instantiate VT82xx functions in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220901114127.53914-1-shentey@gmail.com>
 <E2820A94-3E30-46DB-9F83-8157C9A6FE1B@gmail.com>
In-Reply-To: <E2820A94-3E30-46DB-9F83-8157C9A6FE1B@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.816,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/9/22 21:50, Bernhard Beschow wrote:
> Am 1. September 2022 11:41:14 UTC schrieb Bernhard Beschow <shentey@gmail.com>:

>> Testing done:
>>
>> * `qemu-system-ppc -machine pegasos2 -rtc base=localtime -device ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel morphos-3.17/boot.img`
>>
>>   Boots successfully and it is possible to open games and tools.
>>
>>
>>
>> * I was unable to test the fuloong2e board even before this series since it seems to be unfinished [1].
>>
>>   A buildroot-baked kernel [2] booted but doesn't find its root partition, though the issues could be in the buildroot receipt I created.
>>
>>
>>
>> [1] https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>
>> [2] https://github.com/shentok/buildroot/commits/fuloong2e
>>
> 
> Copying from v2 (just found it in my spam folder :/):
> Series:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Review seems complete, thanks to all who participated! Now we just need someone to queue this series.
> 
> Best regards,
> Bernhard

Excellent cleanup! Series queued to mips-next.




















