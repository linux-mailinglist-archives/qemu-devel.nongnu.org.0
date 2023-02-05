Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162768AF05
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 10:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObVL-00020S-O2; Sun, 05 Feb 2023 04:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObVI-00020E-Vm; Sun, 05 Feb 2023 04:40:09 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObVH-0000Qx-BB; Sun, 05 Feb 2023 04:40:08 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 v24-20020a05683011d800b0068bdd29b160so2515600otq.13; 
 Sun, 05 Feb 2023 01:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kgy2jXb34tDtTj4gd8xsbpCEufP9zEMW2LMtCU9qSfc=;
 b=HeWD8x/JrfEl8yEBWF1dXpRgKsniNBUen55+G9+I33OL6pbAfx9WC4QbJu5m1IAcNy
 JM3MeCc6fZPNfOgNTsbQeGdUTAYr82cwooaoJcmPdbGyWEogZhfi1L4EtKS/NWGY/lFa
 WwSp8eFDx/Xiny6JEE3jZ4FrtxsvJ3hEor2kRYPRvjzjKyMzeNfHHjP6GejJKWf7T7xz
 Zfhjk5KbRyz+lo4bPaZ47JcYpTw2KcGmn/LHKYgkD1u9PwFeO7pEPdrSgwTyqxYAN4js
 1nSFHcCZt9g+qB25q8HzdvJdnfQt3yd6gHV2Ni6lahpwikduYab1CBBgDau6SLANXsfU
 GS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kgy2jXb34tDtTj4gd8xsbpCEufP9zEMW2LMtCU9qSfc=;
 b=CfCkz0p5CYHOQrgKGtMzkXIBMbVmy6aey3uH9RaB+n62zUcfUGPtwddLwjVQ6sJq3z
 iYyn85pVHOGjucaK/sq6/850WVgMsTjU6mvYdj7my1aKdPimKW5zCsDmRXbwkijquDe/
 KcOYDpWzQEy1mKl2h759F6xnc5k5GYGpkPMNrdkYYuoqzKjKlC0kJP9bwAthy5UWC4ur
 x2J73DKx52Al/31O9bZfxdoJLF1ynL8+46cjNz/Gf83DVutni/tgJ9C+qAJfYLxaKYUp
 jGB77C92rQpPIB1Y6RC6LSonFZk+Mn+VNlxZLp9XmzYP2d0MmWN0/J2xaS9boY6OjVPe
 EYDg==
X-Gm-Message-State: AO0yUKXA3ur1CtrGAXmzD0X2/c+2E1v1aqyUV3OsTo4SJIYfuxMWGdEF
 s3fI7SegtJdhV5qydpkBofg=
X-Google-Smtp-Source: AK7set+jFx+jAiz2u41WxAScKlcjipY1M2IIaMuuWsTvs0TvYZTqRbrxpqi4CGhtOH8x9VZFQMoILQ==
X-Received: by 2002:a05:6830:40a9:b0:684:c3ad:962f with SMTP id
 x41-20020a05683040a900b00684c3ad962fmr10409310ott.7.1675590004739; 
 Sun, 05 Feb 2023 01:40:04 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05683010c300b0068d542f630fsm3332217oto.76.2023.02.05.01.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 01:40:04 -0800 (PST)
Message-ID: <498f0ba1-2f15-3b6e-cd6a-bb1ab86caad4@gmail.com>
Date: Sun, 5 Feb 2023 06:40:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] Misc sm501 clean ups
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1674333199.git.balaton@eik.bme.hu>
 <78368e67-0ed7-1828-100c-d4d9d15fd27d@linaro.org>
 <46b0b8d7-dce4-18e2-970d-2fd81100bd98@eik.bme.hu>
 <e4463a9e-f8de-aec1-f2ed-fae977049019@gmail.com>
In-Reply-To: <e4463a9e-f8de-aec1-f2ed-fae977049019@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.09,
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



On 1/30/23 06:43, Daniel Henrique Barboza wrote:
> 
> 
> On 1/28/23 23:43, BALATON Zoltan wrote:
>> On Mon, 23 Jan 2023, Philippe Mathieu-Daudé wrote:
>>> On 21/1/23 21:35, BALATON Zoltan wrote:
>>>> Some small trivial clean ups I've found while looking at this file.
>>>>
>>>> BALATON Zoltan (3):
>>>>    hw/display/sm501: Remove parenthesis around consant macro definitions
>>>>    hw/display/sm501: Remove unneeded casts from void pointer
>>>>    hw/display/sm501: Code style fix
>>>>
>>>>   hw/display/sm501.c | 419 +++++++++++++++++++++++----------------------
>>>>   1 file changed, 210 insertions(+), 209 deletions(-)
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> Ping? Who will merge this series? Should Daniel take it via PPC or Gerd for display? I only care that it gets in one way or another and not lost between maintainers.
> 
> I'm planning a PR at the end of this week. I can take these in.


Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel


> 
> Thanks,
> 
> Daniel
> 
>>
>> Regards,
>> BALATON Zoltan

