Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E96A8309
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:00:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiKN-0002U7-Bb; Thu, 02 Mar 2023 07:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXiK5-0002Kl-0T
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:46:13 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXiK2-0007OL-7G
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:46:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id e13so4878173wro.10
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677761168;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kNcHnfod7Tlxl+jVg+JafzTrxKndYEOrYpb+DmUIpQw=;
 b=mXN++hh7xs5QdkqV2YGqESs7bTdAsXtfJEh0EEes+dEniAiyF5GYwvVPuOZKTLESxi
 QHEm41kXB/R+TlW8D0+m/F5zFppKHpSAydSnwhjv61mH/iORHyMiLyFskZQX2G548DGD
 2R0EV7bz7vpJ5WCVU5wmp+8ROPNRAeScV25td0yd/483VZStUkX/4TLIjTIeRVoh/S7+
 bs9AAGyvwEcC5FqwVjqP3zz3Rko16Wpu52P7Dd1eBG47JAVUN+ebWyoWwkfnSf7UU9wE
 gJ4G4E/jHE0X2DxmnjuXIMHApppfhf9HncfgRixD6USoKVhoXecm/6BdpYVCuxp/EgqH
 5NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677761168;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kNcHnfod7Tlxl+jVg+JafzTrxKndYEOrYpb+DmUIpQw=;
 b=ZRF8D1/EUB/0p52W8lvMEpkoXZ0KxtiTNKQz4K1847BQfSS2tz/LNMsfEMdAhB7jyt
 y2qoXunbUqPbUvhNurKRMmmOYOdWqqiq3Ub+UXSSM40983GfzfaS7ltIqstXVkzjgqvd
 j09e55uCKW0M+r4bpGt/JWLwAzRERDQLGsdVIQ2N8GdYYMxuMpOJJmmt4mo7AlIPTIm5
 Tjr0rTdb9uHyM5bCrrqGvsgtnAo61prsSxcSze3cQhjATdhpeL6PR31e06CV5TUQuvup
 UlbY1QGatUY+JGnLOFTjn4dkwXgMcWsMwuPWP2QS88NTwfzlwi1lZmmTYVGENf4vTjFX
 IjBQ==
X-Gm-Message-State: AO0yUKWqYUiUm6MDxK0GR2ivXyN0hevEtwtHdkL4Sp0JLOYiYTBWv/e0
 Y/3n1APLINUKRUgr9/U0Yquf6w==
X-Google-Smtp-Source: AK7set8laV203hwBZO79bkGpJ8ff3h99WYGPyi4FLoWdFQ9N64z65It7L5ewzsQVgdQEPmRY35zdkA==
X-Received: by 2002:a5d:6a88:0:b0:2c7:57e:633e with SMTP id
 s8-20020a5d6a88000000b002c7057e633emr8608600wru.49.1677761168312; 
 Thu, 02 Mar 2023 04:46:08 -0800 (PST)
Received: from [192.168.230.175] (148.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.148]) by smtp.gmail.com with ESMTPSA id
 p1-20020a056000018100b002c54fb024b2sm15442167wrx.61.2023.03.02.04.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 04:46:07 -0800 (PST)
Message-ID: <7820ffb0-8123-67f2-b4d9-c9e7c579187c@linaro.org>
Date: Thu, 2 Mar 2023 13:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 2/7] Revert "hw/isa/vt82c686: Remove intermediate IRQ
 forwarder"
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, ReneEngel80@emailn.de,
 Anton Kochkov <anton.kochkov@proton.me>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
 <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
 <7ae0ae69-817e-7100-beed-ed610b3135cb@linaro.org>
 <f85e3122-3a30-1a32-a6b0-8414663e39f9@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f85e3122-3a30-1a32-a6b0-8414663e39f9@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 2/3/23 13:37, BALATON Zoltan wrote:
> On Thu, 2 Mar 2023, Philippe Mathieu-Daudé wrote:
>> On 1/3/23 01:33, BALATON Zoltan wrote:
>>> On Wed, 1 Mar 2023, BALATON Zoltan wrote:
>>>> This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
>>>> keeping the rename of a state field but reverting other cahanges which
>>>> break interrupts on pegasos2.
>>>
>>> I've found this with just booting the MorphOS iso which now hangs 
>>> without this revert when trying to read from the ide device.
>>
>> Can you add an Avocado test booting the MorphOS iso?
> 
> I think you had a patch for that before, so you remember where to find 
> it? I can't test that though as I don't have avocado and it does not 
> come with my distro. So maybe if you can revive your patch and test it 
> that might work better.

It doesn't work on Darwin/macOS neither sigh :( A few users also
reported / complained about this there.

Waiting for this since 15months or more now...
https://github.com/avocado-framework/avocado/issues/5138
https://github.com/avocado-framework/avocado/issues/4888

Personally I ended running it on a remote Linux, this is unfortunate
but ¯\_(ツ)_/¯

