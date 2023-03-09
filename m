Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7626B2578
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paGNn-000275-A0; Thu, 09 Mar 2023 08:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGNk-000260-V4
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:32:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paGNj-0003yn-CV
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:32:32 -0500
Received: by mail-wm1-x336.google.com with SMTP id j3so1158669wms.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678368749;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rx55T7Hd4eYc1XKnM2YVsA1aSR75i/vnV30XpXhTGjw=;
 b=YX/cb1U4LxNkRUHK3UW4UHUrVIWkiUDBekR59RkVirZrR8qOps7eLMB1uV0Sdgho1f
 LE3OnLmz9EtPsuTVR1BWyJRDmKxn3arKJHdhOlpu5Uj+zhToVeMDbD0V8C2tz/mSraEN
 80Gk6ph7df67/6rb/bYDWq73GzgWRY+1BxvLjtVWX0Rtu5bewZEPOXfd44u3Y5+oO8Tn
 YU3n4Cpuo02mIfJtgIhf3R4/Zr/u1nfcq2b7BvVq0bhmT7N1WiXn80FgnVxAmDn9QCUT
 4xwRCFj1IUHB8T74KNE3MC5iLAPoPwIDHhZtkzm3tRwCuKwXhCx84zi7qeYlItXuiI7E
 su/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678368749;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rx55T7Hd4eYc1XKnM2YVsA1aSR75i/vnV30XpXhTGjw=;
 b=pmpq9eRPChDkL3hHgCYdPpNldaWWzJ2Hr1V933yDrVr8R8vniaV7q7qIthwKEGpUge
 O2iwmy5SePhyGNxq6YnuEf6yIXhrhtPZGUqefU4hiFGF37SOOquw2YAWX6CY0QlPrvAX
 V1Otg0YdcUVfb1a7J5FXXatqWctcGjENXD3+uGAZILX8uN7QYc+oKzXMZQ3FZWP+j0el
 OKdERCWwYoIX0Oo3WRWApLni5JD4009PNF1qNqY4k/8KiRJO2zklLXqp6Pu2o2ZUmULV
 PSSLdn/bjPqYrs72gJRwsGdpw3dD/H6PzmiLckC40sKwloXj6bHOGPAFLR5qwcxVlbGJ
 atag==
X-Gm-Message-State: AO0yUKU/w6oLcLlVLQMWI16wDJzWvVWIrB86PtNu3XZZoD8DqEU1xw1o
 6hRssX4hPzRFf74kjI55ecdMog==
X-Google-Smtp-Source: AK7set86SPCH6Frz5GlUtF3LAZ+OwN2XDFlUMvTFCQ81JkPQjaC3mVtRU4YAgJqoDOUSTeybdd99/w==
X-Received: by 2002:a05:600c:4f14:b0:3eb:1d0c:ad71 with SMTP id
 l20-20020a05600c4f1400b003eb1d0cad71mr19253395wmq.23.1678368749264; 
 Thu, 09 Mar 2023 05:32:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z6-20020adfd0c6000000b002c55efa9cbesm17722261wrh.39.2023.03.09.05.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 05:32:28 -0800 (PST)
Message-ID: <f3d27416-4e3f-af3f-ad9c-ab9582aa9cbb@linaro.org>
Date: Thu, 9 Mar 2023 14:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] log: remove unneeded new line
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20230119214033.600FB74645F@zero.eik.bme.hu>
 <433ab722-025b-f57c-a905-997eb34bb848@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <433ab722-025b-f57c-a905-997eb34bb848@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 28/2/23 23:16, BALATON Zoltan wrote:
> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>> The help text of the -d plugin option has a new line at the end which
>> is not needed as one is added automatically. Fixing it removes the
>> unexpected empty line in -d help output.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Ping?

Merged as commit cb9291e550.

