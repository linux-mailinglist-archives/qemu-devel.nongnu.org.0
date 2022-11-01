Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4136150FC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:45:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opvIt-0008WS-PT; Tue, 01 Nov 2022 13:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opvIp-0008VW-S6
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 13:43:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opvIk-0002eJ-Cn
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 13:43:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id j15so21169440wrq.3
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 10:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5KGKRkVKYVqeYihSn5GKn7nUY62jhMca8611dDw/Rbo=;
 b=PTsAqREQ92I96vPn+NZ113UMhozD8jPEApJ/VzUzS1bnvjtjprwTo2fX+aWi1UjNU+
 17Q+2ZOiJHvUcLz7Mg+M+cQjk4U9J+05kKXv2oywP9dyQgMwi+/3lsuFPsZV3iUhrNLk
 N5Kw8n9zdg1cPjLIVp5z84QOmKXLJbwR8iZhUdRTKaXMsU9sw61DxNMjxITZJ2wdyqLu
 nKRae07o8PZ1NQLvBPNieEezAeCZUcGnZfKhIs8oDmZ5YP5i6Wi336z9oExU+T57SLRi
 hq8gm5io7Z5QkY5LLsgHnbSnIrXF6AcVEIqqPsa7JZEi8PGNnG95qnjHxlLnNl8WvlTN
 ZvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5KGKRkVKYVqeYihSn5GKn7nUY62jhMca8611dDw/Rbo=;
 b=SMKFYhKELU24sg2oSx87yCWO7F4tjkEW957gfRp/Aq6vwMVHjqOFX6lcNp3OKYBIkx
 oJdwU2EQ+9vVikPosY0jrnQrmfZmICKmNA5TsLtCk1TaqgCFcq/AUXLFTnxo3UKyPrT9
 Le+w49SY55edvx7aXuQnSIihHeNeu9DQzjR5uouTKj/RYqtPIVDtMDzfzKEFFmt7YIf9
 pBlcUwAhOoyl148sljGiBKFpcUULk0MaRI+aOruBSYO8QiiTjEonvi8eaQ2VNmdgbLqa
 ubsThziKxooTbDircqS4bwVsNpiVfW4Wpce7wD43+0hVwOX3RA6q6zYTxPZYGWWOV1XN
 O4Tw==
X-Gm-Message-State: ACrzQf3cMTUpxYJx44+L4ZWtboRg51r3C2U2L/Ka+Uhk3aEwEX0xm49M
 3zDxTQRsxE9MSOpEe8dFxW19Yw==
X-Google-Smtp-Source: AMsMyM6R/nJzHvg8wVX7kenV2K5Lraotecf57f4PJEwilo1BK89Hw0FVNBQRHjj9HviRqCuMkcjGnQ==
X-Received: by 2002:a5d:6743:0:b0:236:6301:918 with SMTP id
 l3-20020a5d6743000000b0023663010918mr12545784wrw.247.1667324628390; 
 Tue, 01 Nov 2022 10:43:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h11-20020adff18b000000b0023677e1157fsm10734029wro.56.2022.11.01.10.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 10:43:47 -0700 (PDT)
Message-ID: <b476934e-20b8-91f5-b0e1-0d84f3ba2707@linaro.org>
Date: Tue, 1 Nov 2022 18:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v5 0/6] ppc/e500: Add support for two types of flash,
 cleanup
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20221031115402.91912-1-philmd@linaro.org>
 <CAG4p6K5Kmcq6o5NwuvL-oFQtw80VXw_WX-2zUCjUnP=e2g0Q4g@mail.gmail.com>
 <AAFF66C6-6254-44FB-96B8-97B08F413C95@gmail.com>
 <7ee7386e-f754-083a-42e3-44b84bf4908a@linaro.org>
Content-Language: en-US
In-Reply-To: <7ee7386e-f754-083a-42e3-44b84bf4908a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 17:58, Philippe Mathieu-Daudé wrote:
> On 1/11/22 17:01, Bernhard Beschow wrote:
>> Am 1. November 2022 10:41:51 UTC schrieb Bernhard Beschow 
>> <shentey@gmail.com>:
>>> On Mon, Oct 31, 2022 at 12:54 PM Philippe Mathieu-Daudé 
>>> <philmd@linaro.org>
>>> wrote:
>>>
>>>> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
>>>> as an 'UNIMP' region. See v4 cover here:
>>>>
>>>> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/

>> Hi Phil,
>>
>> Is there a chance to get this in for 7.2?
> 
> Well 1/ can you review patch #1 and 2/ we need to figure out what to do 
> with patch #2 :) Can you point me to the CCSR datasheet?

Maybe I found it, I'm looking at the "MPC8544E PowerQUICC III Integrated 
Host Processor Family Reference Manual, Rev. 1".

