Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20426EF06D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:48:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1praoG-0006MJ-V0; Wed, 26 Apr 2023 04:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1praoB-0006Fu-0T
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:47:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prao9-0006ty-DU
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 04:47:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iNQ+7oWaheE0uGExJmhyspdi65sCMhErlNCLoOl0wSw=; b=EPGJCBXMHm4K7TIAW8rfkU/zst
 zAb1CLQew1MedVmnMEokK0OQTxzH2b54Gcg2m5iJSX/VlC2FM2gV8gLQylafnkRbzNSLR/VCMjqn6
 G3KK2NxQrbyaKXhIrVqmjRqq9RBAIIJpK2/igJx26ExCsRFlfOmL1wIlOeg2TSNafSp5yR65YVxS6
 NQ1Bqh1You1UCtMAL5PUrn60N20HoRE7WfEPfMXu8nZRqa3dW+3FoO1JUy8PbMzvtMB4RtzGAZgPy
 It6iuQCL1oLlB9opRtHIbNKnrAlb40+1vRT7fGqRSUMQvqsgjWrFgb5fMSDJdqXZQMgUmFArXz8gq
 d79ZAQ3RjFUo4akmv66HbxkRkMx4/UXAt4nCszmuQpI60lpl8gImQIhDvGuZc8pNopATGkbfVsOKS
 X1RHEHeaila527rtWFFFNJQSovMp9tmFSmD2+np6GUHdMA8e3xZd8H5/hxSn9BUDspsq/CO3XsN+l
 4UFrOJCTZGePkdaVxLxYSTxzQXP7ey6K2NgvWqiLte2A9ea8TN2Lo66NH95pF5NWMZnKx0DVWIKll
 hBYjIeuY8i0TDG7cygEmxWZYG+4fUjvjxVi1j6fWN2w4xAeoaXY2xYIYvx41nleA4HYGEfSzFMbGc
 A7ykM3OgUazNVbFVCti9sOlG04OWu3lKoM0bVIS2w=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pranA-0000nu-AV; Wed, 26 Apr 2023 09:46:28 +0100
Message-ID: <ab1e1e79-2a98-edbc-f80a-4763a0517151@ilande.co.uk>
Date: Wed, 26 Apr 2023 09:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-9-alex.bennee@linaro.org>
 <6dcae2f9-9b0e-06a8-40fb-e4fec583e54e@ilande.co.uk>
 <a6d0f507-c4df-d34e-29dd-9a058de6f23d@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <a6d0f507-c4df-d34e-29dd-9a058de6f23d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 8/9] docs/devel: mention the spacing requirement for QOM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 21/04/2023 07:15, Philippe Mathieu-Daudé wrote:

> On 20/4/23 21:32, Mark Cave-Ayland wrote:
>> On 20/04/2023 16:57, Alex Bennée wrote:
>>
>>> We have a more complete document on QOM but we should at least mention
>>> the style requirements in the style guide.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> ---
>>>   docs/devel/qom.rst   |  2 ++
>>>   docs/devel/style.rst | 29 +++++++++++++++++++++++++++++
>>>   2 files changed, 31 insertions(+)
> 
> 
>> A couple of points:
>>
>> 1) It is probably worth removing the typedefs given that they are handled by the 
>> various QOM macros
>>
>> 2) There should be mention of the fixed names "parent_obj" and "parent_class" for
>> the first declaration.
>>
>> How about something like this:
>>
>>
>> QEMU Object Model Declarations
>> ==============================
>>
>> The QEMU Object Model (QOM) provides a framework for handling objects
>> in the base C language. The first declaration of a storage or class
>> structure should always be the parent and leave a visual space between
> 
> s/should/must/
> 
>> that declaration and the new code.
>>
>> For a storage structure the first declaration should always be called
>> "parent_obj" and for a class structure the first member should always
>> be called "parent_class" as below:
>>
>> .. code-block:: c
>>
>>      struct MyDeviceState {
>>          DeviceState parent_obj;
>>
>>          /* Properties */
>>          int prop_a;
>>          char *prob_b;
> 
> Should we mention "We recommend placing instance/class properties fields
> just after the parent field"?

I don't think I've ever seen any recommendations on placing instance/class property 
fields other than for the parent DeviceState/DeviceClass?

IMO it doesn't seem worth committing to anything else for now, especially as which 
fields get exposed as properties can be quite fluid these days ;)

>>          /* Other stuff */
>>          int internal_state;
>>      };
>>
>>      struct MyDeviceClass {
>>          DeviceClass parent_class;
>>
>>          void (*new_fn1)(void);
>>          bool (*new_fn2)(CPUState *);
>>      };
>>
>> Note that there is no need to provide typedefs for QOM structures since these are 
>> generated automatically by the QOM declaration macros. See :ref:`qom` for more 
>> details.


ATB,

Mark.

