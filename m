Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61F06140DC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:49:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opdZM-0002l2-VV; Mon, 31 Oct 2022 18:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opdZK-0002kY-Am
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:47:46 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opdZI-0000b0-G9
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:47:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id w14so17941991wru.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G3maYs9cdXMpY3srjra3odiafanja2fK/BuKAe+b/MM=;
 b=GEPKrDZ5ZuApEKN7MbRwj27NA0pvT1Fxf7zExbK9bGB6xwNbsnaSeokuYsIzv21Bwt
 sAQE61yPSs0IMC59FW8+K1b2osY6vkQ8q4YeDfhvmVC//amvl7Ea4BPiWvFaq2uz/POq
 KayR2scfCNgvfiWk+aDgq6ic32f+GABOAJBuCmKCfz1JnpjBHfLRI5zUhv9hBxMPhj3S
 42V9arlSO6rPK5pAQrVnHMbhlGFafNKK9oTvzoRR00PzxEcxFxEa3ma5pCWYh1+B0RGh
 nGW4QY9+KOqp1fn63rFnuRD3C7+E3ZHhp9XzVgx9RKAvuPlYmmcigyNlDdvWr3siFmzC
 15EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G3maYs9cdXMpY3srjra3odiafanja2fK/BuKAe+b/MM=;
 b=qTBkuKXxZ2wYgfqVIMExzt1l9FU2JIlKs375K9/wxrGP3dKZJkBMLStzbsZnPEIIgD
 a6h2mzgE17ITR6ODLyFtmkIh3+0YGMoefs2LqaiktG7bz9+2GNCjxeY3i09sX/Qck10D
 mNpYrxsJAeGl8nIzKbKOUReE31COEz+chHA/hLW9lL49mzsi9YZDHeF4fd4PuFpKXk9P
 rqtUqiEpsDt45B2eGHG96JfNRRyiRL+9+KFL8am+TgdLSWH2v2xtvY6UEcXEvQolz8Qs
 5ocO/+rrxgCmgtbsO+pCb0Zr3ie/2QBAAAya0ls+8CGzIIiI73t0NgYkhWQyV+IrcDUT
 4MrQ==
X-Gm-Message-State: ACrzQf3FqG78nD78iLdEOGgTTVq2CxVzf1BFDLNpdwl3RvLIB5I4Ps+R
 IBcbglcLcv1iEDd+cJWOLpEEkg==
X-Google-Smtp-Source: AMsMyM6VG2+FGsyaI7+R1PxxI+t2d8wO1m5hQHE9iI/aRGNMxRBOSkDCUtwfjK3tuuwGcXnYeu8g7w==
X-Received: by 2002:a5d:4303:0:b0:236:c6c9:2c4c with SMTP id
 h3-20020a5d4303000000b00236c6c92c4cmr5654566wrq.630.1667256462634; 
 Mon, 31 Oct 2022 15:47:42 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t12-20020adff60c000000b002366ded5864sm8134052wrp.116.2022.10.31.15.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 15:47:42 -0700 (PDT)
Message-ID: <44728aa2-9c2c-95b3-62b3-7cb75e4222f1@linaro.org>
Date: Mon, 31 Oct 2022 23:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v6 00/19] Misc ppc/mac machines clean up
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1666957578.git.balaton@eik.bme.hu>
 <cd48ea7a-1269-6b3b-73e4-d7f2a1abffd5@ilande.co.uk>
 <59497b0-a5d4-3c8c-524b-9cde50aae5e7@eik.bme.hu>
 <a3185b5f-9ee4-e76a-8e96-0908234c8df4@ilande.co.uk>
 <da7320f7-4f9b-23bd-1aa5-279125c86e2@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <da7320f7-4f9b-23bd-1aa5-279125c86e2@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 23:09, BALATON Zoltan wrote:
> On Mon, 31 Oct 2022, Mark Cave-Ayland wrote:
>> On 30/10/2022 22:23, BALATON Zoltan wrote:
>>> On Sun, 30 Oct 2022, Mark Cave-Ayland wrote:
>>>> On 28/10/2022 12:56, BALATON Zoltan wrote:
>>>>> Since only one week is left until freeze starts I've included some
>>>>> more patches in this version that I've intended to submit after the
>>>>> clean ups but we're running out of time now. The last 3 patches could
>>>>> be squashed together, I've just split these up because I expect
>>>>> resistence from Mark to any changes so maybe it's easier to digest
>>>>> piece by piece and can cherry pick parts easier this way but ideally
>>>>> these should be in one patch.
>>>>>
>>>>> I'd appreciate very much if this series would get in before the
>>>>> freeze, it is very discouraging to spend time with something that gets
>>>>> ignored and then postponed for the rest of the year just to start
>>>>> again the same in January. This might be a reason why not many people
>>>>> contribute to this part of QEMU besides that maybe only a few people
>>>>> are still interested so those who are interested should be served
>>>>> better to not scare them off even more.

>>>> I've queued patches 1-14 in my qemu-macppc branch (whilst fixing the 
>>>> typos in the description for patch 5) and will send a PR in time for 
>>>> soft freeze.
>>>
>>> Thanks. Sorry about the typos, looks like I missed two in that patch: 
>>> otder -> order and reorganise. Did you fix both?
>>
>> Yes, I've done that.
>>
>>> What about the remaining patches?
>>
>> AIUI there are two separate discussion points outstanding from the 
>> series: adding new machines (deprecating mac99), and changing the 
>> mechanism for handling the VGA option ROM. I'm not saying that we 
>> can't improve QEMU in these areas, but we should discuss these points 
>> separately on-list, particularly with regard to the machines 
>> indicating why they were chosen and what references we have against 
>> real hardware before making any final decision.
> 
> The PowerMac3,1 and PowerMac7,3 are trivial as these have the hardware 
> we emulate and this is also what OpenBIOS says in the device tree (at 
> least for PowerMac3,1). The PowerBook3,2 is debatable but I'm OK with 
> dropping that for now and only add powermac3_1 and powermac7_3 now. The 
> sooner we start the deprecation of the G5 mac99 is the better as that 
> would allow us to get rid of separate qemu-system-ppc and 
> qemu-system-ppc64 in the future if that will be decided later but even 
> if we won't do that this avoids the confusion that exists currently by 
> having these machines work consistently between the ppc and ppc64 
> executables. I.e. -M powermac3_1 will always result in a G4 Mac and 
> powermac7_3 is clearly a G5 Mac that can be seen from the model id. The 
> old commands still work just print a warning with the new machine type 
> so don't know what's your concern about this.
> 
> You could modify the patches by removing the powerboo3_2 parts and 
> squash the patch 15-18 together. I can make such patch if it helps but 
> you could do it easily too.
> 
>> In the meantime it is still possible to use the ati-rage device with 
>> the -prom-env 'vga-ndrv=false' option until this point in time, so I 
>> don't feel this is something that has to be fixed in the limited 
>> discussion time available before freeze.
> 
> What discusiion do you expect about this? As there are not many people 
> who care about Mac emulation and OpenBIOS apart from us 3 I don't think 
> there will be much to discuss. Howard did not raise any concern and 
> seemed to agree this is a good idea so only you have some concerns yet 
> and the discussion time is also short because you were slow to respond 
> on the first series. I understand you may not have time to work on this 
> but then at least don't block patches for no good reason. If you merge 
> this now we can still revert it before the release if a discussion 
> results in a decision for that, but if you postpone it now we can't do 
> anything before next year and we lose months again.

Maybe we can merge the doc deprecation (PATCH 18) next week.
This would Zoltan to remove the machines during the next cycle.

