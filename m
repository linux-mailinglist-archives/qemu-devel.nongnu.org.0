Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C086865D6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 13:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNC7o-0002Ow-UN; Wed, 01 Feb 2023 07:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNC6O-00026V-Sq
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:20:36 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNC6N-0004IK-01
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 07:20:36 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t18so17157610wro.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 04:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QmEwDIIXbnJQWe/vywVkIYSUouwOkGUSZz05T7U9oB0=;
 b=qcw+Kge3QnCwNoKDVJ/gwR+DY4wMkyWQafRMQP1lYyduZHVPG6UuRWg0+Rn8zodZr6
 cyhAr7X/y0VdYqlESy9kpm4p9fiJ0u8hizsMyaiAvT0GpBkxD7lS8pXLUFfrIOol84j7
 Q3DNvH7qCxJAI4v2o2aACx6W5RceP9QsU9QPqIcSkUWhlnY+vCqO97UCopbFPZy0fEqd
 NPKcyYA5tC101uHmdjZHm3E05Ie5G9TOcAHUnQI22JOTw1S0Q5ut6aoYmspxmFjWAWac
 o7ocTivCa5Y5Inm3jkEHQ5rLo0Y/zBXMHABTlk71Wv9BogXt7SX0bQU4z9iIyFHlRVer
 AaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QmEwDIIXbnJQWe/vywVkIYSUouwOkGUSZz05T7U9oB0=;
 b=8P1iENfn7D0gvVqV83L0ROSzpl6GWLWbqJQdlqLJ/uFx9ESGWoNwSM4oHe5raujib4
 HgR4suF1FPOteVeVK00P5Ph0PU7fle2zpkrWDQgrXXWL+dlyLsg3/NXq7uqUg+34GDp2
 QPUPcTvIvKPwDtyVnw8eRh5KZkalX+xZ9N8THwXl7xbwF9G1rWkBl9DqO1MHj1jyz7sq
 Nzsn6jagTJYy0+JQyiRzBYwnbFOaOf4XXC46AQJwIPiKdZo9W9IBTxIHf2b9dWHgbce1
 RSQ4VBE7Mj5H9zdYW0bDP6Z2qHjgO0XzrGsL+qRNk8MRHLiA4iLmpBrCwdKNnEzcaTdr
 HwRg==
X-Gm-Message-State: AO0yUKV9FwDNg+LtRkYYu9Ph/QUVGKrL573E/ZavPfiW61bVC4LdA/Gi
 P8L45UOBnIg9KfePG5CjUqzchA==
X-Google-Smtp-Source: AK7set+LN7X7In+xbonMOVI05OnDojNqlqkUl0tYFZ2ni+c4YB7Us+jLvedkQKV4KHpy7WBuadgwLQ==
X-Received: by 2002:adf:ee87:0:b0:2bf:e288:6289 with SMTP id
 b7-20020adfee87000000b002bfe2886289mr2335035wro.15.1675254033296; 
 Wed, 01 Feb 2023 04:20:33 -0800 (PST)
Received: from [192.168.242.175] (107.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.107]) by smtp.gmail.com with ESMTPSA id
 f6-20020a5d50c6000000b002bfc24e1c55sm17241228wrt.78.2023.02.01.04.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 04:20:32 -0800 (PST)
Message-ID: <a1955947-8f04-42fb-f2bc-57fd0561ee5d@linaro.org>
Date: Wed, 1 Feb 2023 13:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 08/25] hw/arm/boot: Export write_bootloader for Aspeed
 machines
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-9-clg@kaod.org>
 <CACPK8XfW6peVF27_YthCubp-9J8aGpKp5x15-2-qpusnV=4Dzg@mail.gmail.com>
 <131c30d3-5ada-8f94-8c1a-84419c39b461@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <131c30d3-5ada-8f94-8c1a-84419c39b461@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/2/23 08:58, Cédric Le Goater wrote:
> On 2/1/23 06:45, Joel Stanley wrote:
>> On Thu, 19 Jan 2023 at 12:37, Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> AST2600 Aspeed machines have an home made boot loader for secondaries.
>>> To improve support, export the internal ARM boot loader and use it
>>> instead.
>>
>> I didn't quite follow why we're doing this. Is it just a cleanup?
> 
> It comes from this discussion :
> 
>    
> https://lore.kernel.org/qemu-devel/20221222215549.86872-1-philmd@linaro.org/

Joel, see:
https://lore.kernel.org/qemu-devel/CAFEAcA9KD8WwPTKVQQUfAZxaqA=ASweZtJ=sAV0Vd8TkpqDBOw@mail.gmail.com/

