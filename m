Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58F65FD6D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 10:18:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDiq9-0006Ce-T1; Fri, 06 Jan 2023 04:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDiq6-0006Au-2R
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 04:16:38 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDiq3-0003E8-QM
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 04:16:37 -0500
Received: by mail-wr1-x429.google.com with SMTP id d4so714601wrw.6
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 01:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ybm/nkggJ4JinykD93o7cl7HP7cIPLlxpb+M9Pw5r8Q=;
 b=UB9gws9lIC1XnRouJbI0vvK+evrTTI3jq/AW1ZIjo7TIQp7n0DLdhxOH//QMgsognP
 rldvOrTdq7ebIyPXzGA9KB3/GIoYnQccICPOkfXAyLReoo6iw9VK5VDCt6w3qT5zalPw
 KW85byU+TFbqVchzMN4zHJ4kz/4j3JlXkFe3x17+2sFdqT1HKJduPzxuFtrQ4wd8nmoA
 mECN9Qk2Se3rhG5G1veobVeLhUebt3vCJd+M12zzFKl2jQ97UpHVAB6l3kMI8BuaW6Zl
 fBIAxkhCBg6fKb9znHUd0UbRuS9J74/Ex3NivG1eRhlTCzMkbqLgVshQHd2+K6Tg83gF
 iwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ybm/nkggJ4JinykD93o7cl7HP7cIPLlxpb+M9Pw5r8Q=;
 b=A6UYtlwdqT3n59vHb/NPxIKTiogYnOrlytZHByPMZBW2NMxSbyAOYgcbTpr6OkIe6z
 juo8IwKQXRfFhiUvKecUJL/VZAryL1Dy+4HiJokP6YShGZy8DA9Nwwe3LXBOSpO9q0wj
 FJFX8yaBR55ptcRQoegSuPpWOpH99gsltN32jYhotpvhw6WH8pnplxpUgB9OXB4KFrmP
 1crAdPWMtF+j3xTlolOyeCGlKPY08C1//aRKZT9bCUbm9aRMyB6nlR3y2Yl6gWrbjFGv
 D0EbNsgXwDpo9v97IqCUo6ZTEeZra5nzyIbk0ZQUTzibjbrF8vcpdcJXfqGX6hdiERNL
 yHNg==
X-Gm-Message-State: AFqh2krC9VA8Imst2RNwH4C0ZeFQmawEcKUKznUpTCUEQOLfqlT2/xH1
 UFzR72Ly56PNPwVdaxsQvL0o5g==
X-Google-Smtp-Source: AMrXdXsXUc+2RjGKaXLUv/jNZqnXPeKmLxsT1rQB25YNg0ubIWuIjok8PuNC36pcDzxNAYndBQ2/nQ==
X-Received: by 2002:adf:cc81:0:b0:275:ae5c:d448 with SMTP id
 p1-20020adfcc81000000b00275ae5cd448mr33127566wrj.13.1672996593710; 
 Fri, 06 Jan 2023 01:16:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4bc6000000b0027323b19ecesm621749wrt.16.2023.01.06.01.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 01:16:33 -0800 (PST)
Message-ID: <13e75f83-9487-30c0-b825-bd051217c2ab@linaro.org>
Date: Fri, 6 Jan 2023 10:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] .gitlab-ci.d/windows: Do not run the qtests in the
 msys2-32bit job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20230105204819.26992-1-thuth@redhat.com>
 <4ff2d01a-e6bb-5a99-356b-6b2ade61b667@linaro.org>
 <5a2d8ef1-a478-0b6d-3c65-d792f162feaf@redhat.com>
 <373666f9-7999-9628-b3ae-a749fcc2e1c3@weilnetz.de>
 <95c8fd9a-9dd8-249a-1509-084910fbb7de@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <95c8fd9a-9dd8-249a-1509-084910fbb7de@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 6/1/23 09:19, Thomas Huth wrote:
> On 06/01/2023 09.15, Stefan Weil wrote:
>> Am 06.01.23 um 08:49 schrieb Thomas Huth:
>>
>>> On 05/01/2023 22.42, Philippe Mathieu-Daudé wrote:
>>>
>>> > That said, maybe it is time to deprecate the 32-bit
>>> > hosts?
>>>
>>> Certainly fine for me, but that's up to the Windows folks to decide. 
>>> Maybe you could just suggest a patch to start the discussion?
>>>
>>>  Thomas
>>
>>
>> Download numbers from yesterday for my latest Windows installers:
>>
>> qemu-w32-setup-20221230.exe - 243
>>
>> qemu-w64-setup-20221230.exe - 6540
>>
>> On Wednesday the ratio was 288 : 3516.
>>
>> As expected the 64-bit variant is used much more often, but it looks 
>> like there is still a certain desire for the 32-bit variant.
> 
> OK, thanks. Could you maybe also check the browser types in the logs? 
> ... I'm wondering whether a big part of those w32 downloads were just 
> automatic web crawlers?

Or people downloading both variants "just in case" but only install the
64-bit one ;)


