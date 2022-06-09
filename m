Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA795454E2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:25:07 +0200 (CEST)
Received: from localhost ([::1]:40258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNmE-0004Ev-9j
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzM5d-0007Fc-JR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nzM5a-00065B-LU
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654796217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fxKrKsQEB8G4iQGYeKuwDNZ4gycDD93QMtfokS0qGEw=;
 b=fDBVNs4ldR5Ib0PxxcH/+f503F2OfX8nv7n/ocRZas3R/T+6xfPL+0nBV0i40KTkchawgD
 NttKewlb2l0iXcJqBzw8gIs5rOzlMEwlYNLKGpkuGwk30i2ccaKxSDkzZogv9eQVe2u5Vg
 kY3r/4r8yk/pSS9sRYLUjhvsyOPzvjg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-nxTQerL6MlmZ993jFZn3OA-1; Thu, 09 Jun 2022 13:36:55 -0400
X-MC-Unique: nxTQerL6MlmZ993jFZn3OA-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so8491826wmb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 10:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=fxKrKsQEB8G4iQGYeKuwDNZ4gycDD93QMtfokS0qGEw=;
 b=h9cUorQw2WVPEAbTs9r+jzAy2uOGm+soNPvHuLM/mWOi6ckO+Y6uHcOFMGJ+/cbFAR
 9qfTuIHSSv0P3ve2ExMa/UZXImyis3y7UxIqNNg8P9h3TSDjq7WU56v03C2W1fSLO8k/
 HxsgrQEZb5Xo7VxBDWMcD2rihe1u/ccKDCMw37X/NTmJz2U5hSVTNJaBkNSvDoGHOepj
 +Qxe3lCfifbZOsFbykmKng1+jEWk973DhYOF1Flg4baufqhotCMPHvANHnYzV66vwMAq
 2wT5MO+joKw0pYyBwG99JqUtIyS6J190nWGRcyq1Mi7behB9kKXIZ8bXl0MdFV81bUs8
 zpHg==
X-Gm-Message-State: AOAM530GA+d5KT/FNVczMYR0gS8csaqZ6njrF7zhX5wIEBA/8o8y9Gdo
 LUSJdEOxgalLAHByDAKkLYwWmoCRvEs2zK8l5zyaYytOh6XZ4o6lTsYOjXrcZjOg4Gk7G7lG/ey
 rlJutGMLIDmJakK8=
X-Received: by 2002:a05:600c:4fd2:b0:39c:1586:a2e0 with SMTP id
 o18-20020a05600c4fd200b0039c1586a2e0mr4466407wmq.62.1654796214372; 
 Thu, 09 Jun 2022 10:36:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDlSnekmjm5bOiD+LIvK6kOGrX1rg/o7KTpRJloDvfhIHW5qjqyTVJ4zWtQl4X75hFMMFlEg==
X-Received: by 2002:a05:600c:4fd2:b0:39c:1586:a2e0 with SMTP id
 o18-20020a05600c4fd200b0039c1586a2e0mr4466368wmq.62.1654796214049; 
 Thu, 09 Jun 2022 10:36:54 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-115-130.web.vodafone.de.
 [109.42.115.130]) by smtp.gmail.com with ESMTPSA id
 f18-20020a5d4dd2000000b0020fd392df33sm25269084wru.29.2022.06.09.10.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 10:36:53 -0700 (PDT)
Message-ID: <62d1fed0-4c18-0d36-3912-d762baa34462@redhat.com>
Date: Thu, 9 Jun 2022 19:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Claudio Fontana <cfontana@suse.de>, Stefan Pejic <stefan.pejic@syrmia.com>,
 Dragan Mladjenovic <OT_Dragan.Mladjenovic@mediatek.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Matthew Fortune <matthew.fortune@mips.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Pejic <OT_Stefan.Pejic@mediatek.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220603164249.112459-1-thuth@redhat.com>
 <07f021e7-1346-c6b3-3bd1-ef0d0f0e2ff5@suse.de>
 <52c51ac4-5598-faf2-d5e5-638cab0dc1fd@redhat.com>
 <7ae17984-89c4-2247-57a7-fde6206e41e0@redhat.com>
 <03a1e04e-45c7-5002-6920-d04e29fd48fd@redhat.com>
 <YqG2Anwtba+MfxfH@redhat.com> <209c7aaf-bc7b-cbc2-c6d0-002bbe31258a@suse.de>
 <e29d83e6-e7bb-b370-33d0-88d22aa2eddb@suse.de>
 <4d58f632-df78-b709-37b8-f7d86ae536f6@redhat.com>
 <TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: What to do with the nanomips disassembler (was: [PATCH] disas:
 Remove libvixl disassembler)
In-Reply-To: <TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2022 18.31, Vince Del Vecchio wrote:
> On Thu, Jun 9, 2022 at 10:34AM, Thomas Huth wrote:
>> On 09/06/2022 16.15, Claudio Fontana wrote:
>>> On 6/9/22 13:27, Claudio Fontana wrote:
>>>> On 6/9/22 10:57, Daniel P. Berrangé wrote:
>>>>> On Thu, Jun 09, 2022 at 10:47:24AM +0200, Thomas Huth wrote:
>>>>>> On 08/06/2022 17.51, Paolo Bonzini wrote:
>>>>>>> On 6/3/22 19:35, Thomas Huth wrote:
>>>>>>>> On 03/06/2022 19.26, Claudio Fontana wrote:
>> [...]
>>>>>>>>> maybe something we can now drop if there are no more C++ users?
>>>>>>>>
>>>>>>>> I thought about that, too, but we still have disas/nanomips.cpp
>>>>>>>> left and the Windows-related files in qga/vss-win32/* .
>>>>>>>
>>>>>>> That is pure C++ so it does not need the extra complication of
>>>>>>> "detect whether the C and C++ compiler are ABI-compatible"
>>>>>>> (typically due to different libasan/libtsan implementation between
>>>>>>> gcc and clang).  So it's really just nanoMIPS that's left.
>>>>>>
>>>>>> Ok, so the next theoretical question is: If we get rid of the
>>>>>> nanomips.cpp file or convert it to plain C, would we then simplify
>>>>>> the code in configure again (and forbid C++ for the main QEMU
>>>>>> code), or would we rather keep the current settings in case we want
>>>>>> to re-introduce more C++ code again in the future?
>>>>>>
>>>>> It doesn't feel very compelling to have just 1 source file that's
>>>>> C++ in QEMU. I'm curious how we ended up with this nanomips.cpp
>>>>> file - perhaps it originated from another project that was C++ based
>>>>> ?
>>>>>
>>>>> The code itself doesn't look like it especially needs to be using
>>>>> C++. There's just 1 class there and every method is associated
>>>>> with that class, and external entry point from the rest of QEMU is
>>>>> just one boring method. Feels like it could easily have been done in
>>>>> C.
>>>>>
>>>>> Personally I'd prefer it to be converted to C, and if we want to add
>>>>> any C++ in future it should be justified & debated on its merits,
>>>>> rather than as an artifact of any historical artifacts such as the
>>>>> code in configure happening to still exist.
>>>>
>>>> I'll take a look at it, maybe I can turn it to C fairly quickly.
>>>
>>> It seems to be generated code, getting the original authors involved in the thread.
>>
>> Not sure whether the original mips folks are still around ... but the folks from MediaTek recently expressed their interest in nanoMIPS:
>>
>>   
>> https://lore.kernel.org/qemu-devel/20220504110403.613168-8-stefan.pejic@syrmia.com/
>>
>> Maybe they could help with the nanoMIPS disassembler?
>>
>> I know it's likely a lot of work, but the best solution would maybe be to add nanoMIPS support to capstone instead, then other projects could benefit from the support in this library, too...
>>
>> If I googled that right, there is a LLVM implementation of nanoMIPS available here:
>>
>>   
>> https://github.com/milos1397/nanomips-outliner/tree/master/llvm/lib/Target/Mips
>>
>> ... so maybe that could be used as input for capstone (which is based on llvm)?
>>
>>   Thomas
> 
> Yes, we are working on an LLVM port for nanoMIPS.  It's functionally complete and pretty usable, although we're still tuning performance.  The more official location is https://github.com/MediaTek-Labs/llvm-project.
> 
> However, for now we're still using the binutils assembler; there's no encoding information in the current LLVM description.  We have tentative plans to work on encoding and integrated-as later this year.  Correct me if I'm wrong, but I would assume that, before that's available, it's not feasible to use capstone?

I'm also not very familiar with the way capstone translated the information 
from LLVM into its disassembler source files, but I guess you're right - 
this likely cannot work yet.

> Regardless, I think we can look at converting the existing disassembler from C++ to C.  That would address the current concern, right?

Right - if it's not too much of a hassle that would be great!

  Thomas


