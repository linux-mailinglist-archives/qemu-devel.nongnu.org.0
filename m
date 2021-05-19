Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB3389532
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:22:02 +0200 (CEST)
Received: from localhost ([::1]:49624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQpW-00036B-0R
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljQlD-0001O8-Rn
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:17:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljQl8-00073N-Ku
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:17:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621448248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIipQQWM42YT1RBQvtUlh4xISGgm/Eyn0rb2vTdMTHU=;
 b=VlVD//NCDypJ/e+dZ6mKZ8CBG7ptG1PVjVnR/4DlqcRdlogj+TKd2QnigFeIPBJSBpBsZ5
 JWLbltdJLxDxwo82TVwHLitf1Qv+XsnMUF+JquDzDkv2sJqjf+QrBh9z21NlhHzrCSwp54
 6ujRuay1ioDZf13oCdnshcngdZk6h54=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-f2ccM2DtOoe2aZZW4ALSEg-1; Wed, 19 May 2021 14:17:27 -0400
X-MC-Unique: f2ccM2DtOoe2aZZW4ALSEg-1
Received: by mail-wr1-f69.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so7424800wrm.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tIipQQWM42YT1RBQvtUlh4xISGgm/Eyn0rb2vTdMTHU=;
 b=Wx/CX7eHXqx1SUsldl5V7SB301G+wDyNbvlN2p099fTuS7fwYk70S3+BfDpvv3Vqb4
 JobGZ2Ug9IJ4sm/zIPmvMv9XDNnpBrglkfaJPt8DvnmkRbZLs5h98AA9TN4ljiQnadFW
 HjElgZ/Y+HzhKvEhYjnhOpApVVNVzMUuUmG95jDCjZ5v8Fr0nkqF9p5MH+aUZOZoWTrg
 3NvftJRTY48uVF0S7cqKaBIY/F+Zlr+5B6IcCSaKvdDoUdZyfjDL4F3Xc6h/ENt0Weou
 FbE9sof70RAPG593//ai8fhdFJBuZlX5gmWS/leqzyu4CZpg03LSO5l7YH6f8/X5eSEK
 1pYg==
X-Gm-Message-State: AOAM53117atp4dW1JfOaSQhwAV0Jkn0V/7xf7N2RApPIm8nqrW4NttEt
 sLos3ZjlGpazaMK1NsgAHzzuyfoFBvox9yqb0DB7WtCZoIaPyaIO7Ss9IQwRC//SZwm9FMFgdKS
 IIb/HRDhrd18+YKE=
X-Received: by 2002:a1c:7702:: with SMTP id t2mr518006wmi.115.1621448245815;
 Wed, 19 May 2021 11:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyajsdM8Yy7pQiq2gQ3e3xSLgylCG3bscJQ9YXYGVj+bEpFHDvKU7NXkmUJJBVCW9ZT56BJHA==
X-Received: by 2002:a1c:7702:: with SMTP id t2mr517989wmi.115.1621448245612;
 Wed, 19 May 2021 11:17:25 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z3sm145780wrq.42.2021.05.19.11.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 11:17:24 -0700 (PDT)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de> <875z21aghn.fsf@linaro.org>
 <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de> <87o8dpo4ww.fsf@linaro.org>
 <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
 <20210505193141.4tb6k5cupbovctbs@habkost.net>
 <a6049846-2edf-c22f-0b7b-5a9f087223ab@suse.de>
 <a6f5e405-039a-a055-ffec-dd9e65bf209e@redhat.com>
 <19a1ed59-af39-3c20-2156-6bf4b3026973@redhat.com>
 <d3fea8e3-57a8-b50e-c072-9718f8d0967d@redhat.com>
 <f6784ff8-71e7-f2b8-61b0-caf007f6ce1b@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc687201-768b-32bc-180c-2639f4e29b47@redhat.com>
Date: Wed, 19 May 2021 20:17:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f6784ff8-71e7-f2b8-61b0-caf007f6ce1b@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 8:17 AM, Claudio Fontana wrote:
> On 5/12/21 9:17 AM, Philippe Mathieu-Daudé wrote:
>> On 5/6/21 11:33 AM, Philippe Mathieu-Daudé wrote:
>>> On 5/6/21 11:10 AM, Philippe Mathieu-Daudé wrote:
>>>> On 5/6/21 9:55 AM, Claudio Fontana wrote:
>>>>> On 5/5/21 9:31 PM, Eduardo Habkost wrote:
>>>>>> On Wed, May 05, 2021 at 02:15:29PM +0200, Philippe Mathieu-Daudé wrote:
>>>>>>> On 5/5/21 12:04 PM, Alex Bennée wrote:
>>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>>> On 3/8/21 3:02 PM, Alex Bennée wrote:
>>>>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>>>>
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> anything else for me to do here?
>>>>>>>>>>
>>>>>>>>>> It looks to me that this series is looking pretty good. Every patch has
>>>>>>>>>> at least one review so I think it's just waiting on the maintainers to
>>>>>>>>>> pick it up.
>>>>>>>>>>
>>>>>>>>>> Paolo/Richard - are you intending to take the series as is or are you
>>>>>>>>>> waiting for something else? I'd like to see the patch delta reduced for
>>>>>>>>>> the ARM cleanup work which is still ongoing.
>>>>>>>>>
>>>>>>>>> I am a bit at a loss here, as this has been reviewed for a while, but nothing is happening.
>>>>>>>>> Rebasing is starting to become more and more draining;
>>>>>>>>
>>>>>>>> This is still the latest re-factor right?
>>>>>>>>
>>>>>>>>   Subject: [PATCH v28 00/23] i386 cleanup PART 2
>>>>>>>>   Date: Mon, 22 Mar 2021 14:27:36 +0100
>>>>>>>>   Message-Id: <20210322132800.7470-1-cfontana@suse.de>
>>>>>>>>
>>>>>>>>> I am seeing some changes from Phil that redo some of the patches here (like target arch user),
>>>>>>>>> maybe you would like to drive this?
>>>>>>>>
>>>>>>>> AIUI his changes where to get qtest passing.
>>>>>>>
>>>>>>> I hadn't read Claudio's mail, I think he's mentioning commit 46369b50ee3
>>>>>>>
>>>>>>>     meson: Introduce meson_user_arch source set for arch-specific user-mode
>>>>>>>
>>>>>>>     Similarly to the 'target_softmmu_arch' source set which allows
>>>>>>>     to restrict target-specific sources to system emulation, add
>>>>>>>     the equivalent 'target_user_arch' set for user emulation.
>>>>>>>
>>>>>>> The patch only contains 6 lines in 2 hunks, if it introduced a conflict
>>>>>>> it should be trivial to resolve (I wasn't expecting it to conflict with
>>>>>>> your work when I merged it TBH).
>>>>
>>>>> I'd suggest to move the discussions about the ARM series to the arm series thread.
>>>>>
>>>>> I am concerned here about the groundwork and x86 part.
>>>>
>>>> OK sorry, I was explaining the IRC chat.
>>>>
>>>> Is there any issue rebasing the groundwork on top of commit 46369b50ee3?
>>>>
>>>> Maybe my qtest/accel series is irrelevant to your x86 part, TBH I don't
>>>> remember.
>>>
>>> So far I could rebase this series on top of commit 229a834518b
>>> (Mon Mar 8 15:45:48 2021).
>>
>> Pfff I realized late you asked on the v26 series, but v28 is
>> available... Let's try again.
> 
> Hi Philippe,
> 
> I think that Paolo picked it up in the end?

Fortunately yes (for you; unfortunately for me... I thought you
pinged the latest series and tried to rebase it, and Paolo comment
on your v28 was "Looks good to me, thanks for all the effort!"
which was not obvious to me the series was already queued).

Anyway we are done with that part for good now, thanks.
Yes,


