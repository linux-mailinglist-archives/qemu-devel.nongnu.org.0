Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BE24CF313
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:58:59 +0100 (CET)
Received: from localhost ([::1]:34524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Gg-0005qk-Cu
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:58:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR888-0001bd-V0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:50:09 -0500
Received: from [2607:f8b0:4864:20::633] (port=43998
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR887-0007XZ-4K
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:50:08 -0500
Received: by mail-pl1-x633.google.com with SMTP id e2so13028379pls.10
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y6AVoKg94+mWL5MWBhHsPQ4sRRq7OrimnTtK7TbWXwo=;
 b=hab/Wxn3CNT3D1vym1Kc9nD0tb6OIGo1DOGekjRVH61iQM1OqzDrov2MiEtNps8Rn2
 5yLkVrrCcz8UmYCFjIyembZbQVO55PJJGzVRyhdl6mK+w+TySnvnPTyVF0oVz00uVGM5
 3fKskA2pc//l+N+CTPKP9ikQpjutVvIAC3roxcVSYrscVMojS7qvxcXA+oRgjAYM/DHo
 ABg95VJcd1mbRGHb7d7S15nv8QLwIs17t49CxyB9qtJv8YwbhehkCr1Y4ikgYozs5NeA
 UpzFp28GU8mcAkulBZ1oqzZszNJU2pJbOE8PzrmT8bWiJV4MH48CUG5706yOGc7DAxIu
 FLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y6AVoKg94+mWL5MWBhHsPQ4sRRq7OrimnTtK7TbWXwo=;
 b=8OR2H3NGS/bxZRx5Q21L1IZ9scP0H8OZOUXwvqV1PF4wKGOx5oDDx7wruLvJ8xEWf8
 PQwx5RFJtkydWiWYUDAdWcTbcXkr6epuWFKZCmAcOZTKCG+XkkVraoBiLgNPtDzB9A0m
 sVj8mDNjGh5pr3kF9GiBQVljEmm+DfiBrtTXZEQeV4MHVJ4pb0cWL7Ph6uN6ElxS5hUe
 mrM/QTE2hl2Y/f/Lc4CIJRp8Ao8XV/UTJTz65J/P549f3qyZoayG5Sm2uZ7cDU+1JcUx
 pG8iUQQDnCFWf993Nvmo1i6WMnEyDIQR7Y5lomZ+xeZy4+SRmhJzF2yHyIhh46/Xzu7K
 ui3w==
X-Gm-Message-State: AOAM532ZQ0GpFv7PFo34gZodaUvR8TtQ2t0lnGRuqa4OMLSsfoVqEDxb
 ZUm2ojcEoHH2VYwdL8oG8us=
X-Google-Smtp-Source: ABdhPJwP6TwgKwrWM1WSxMtrkBRfBcgU6KxdixtCA7P0VyclulMChJ5HIekdJ+xfqCxkACBijl36hw==
X-Received: by 2002:a17:902:f54a:b0:151:9c5a:3c7a with SMTP id
 h10-20020a170902f54a00b001519c5a3c7amr11260616plf.118.1646639405631; 
 Sun, 06 Mar 2022 23:50:05 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a656089000000b00372c36604a7sm10951971pgu.13.2022.03.06.23.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 23:50:05 -0800 (PST)
Message-ID: <4c171d81-576f-e2ff-787f-9b9744f79013@gmail.com>
Date: Mon, 7 Mar 2022 16:50:01 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] ui/cocoa: add option to swap Option and Command
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220306111114.18285-1-akihiko.odaki@gmail.com>
 <20220306111114.18285-3-akihiko.odaki@gmail.com>
 <a2a389c-b253-133b-9415-ecc5a352c2e@eik.bme.hu> <87lexmw7t8.fsf@pond.sub.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <87lexmw7t8.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/07 16:17, Markus Armbruster wrote:
> BALATON Zoltan <balaton@eik.bme.hu> writes:
> 
>> On Sun, 6 Mar 2022, Akihiko Odaki wrote:
>>> From: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>>>
>>> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
>>> swaps them around so that Alt is the key closer to the space bar and Meta/Super
>>> is between Control and Alt, like on non-Mac keyboards.
>>>
>>> It is a cocoa display option, disabled by default.
>>>
>>> Acked-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>>> Message-Id: <20210713213200.2547-3-gustavo@noronha.dev.br>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>> ---
>>> qapi/ui.json    |  8 ++++++-
>>> qemu-options.hx |  3 ++-
>>> ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
>>> 3 files changed, 65 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>> index 1e9893419fe..b082e1a7dee 100644
>>> --- a/qapi/ui.json
>>> +++ b/qapi/ui.json
>>> @@ -1270,10 +1270,16 @@
>>> #             a global grab on key events. (default: off)
>>> #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>>> #
>>> +# @swap-option-command: Swap the Option and Command keys so that their key
>>> +#                       codes match their position on non-Mac keyboards and
>>> +#                       you can use Meta/Super and Alt where you expect them.
>>> +#                       (default: off)
>>> +#
>>> # Since: 6.1
>>> ##
>>> { 'struct'  : 'DisplayCocoa',
>>> -  'data'    : { '*full-grab'     : 'bool' } }
>>> +  'data'    : { '*full-grab'           : 'bool',
>>> +                '*swap-option-command' : 'bool' } }
>>
>> This option name is too long to type. Could we abbreviate it somehow?
> 
> We've largely avoided abbreviations in the QAPI schema, for better or
> worse.
> 
>> Like swap-opt-cmd or swap-alt-meta?
> 
> We should stick to how the keys are generally called on this platform.
> I can't say (I'm not using it).
> 

The patch series is now in:
https://patchew.org/QEMU/20220306231753.50277-1-philippe.mathieu.daude@gmail.com/

It uses swap-opt-cmd for the name. Please reply to the series if it is 
problematic.

Regards,
Akihiko Odaki

