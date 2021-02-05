Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5062B310FBB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:17:41 +0100 (CET)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85fo-0007Lb-5o
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:17:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8514-0000Ug-Pr
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:35:36 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l850u-0001q4-JO
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:35:34 -0500
Received: by mail-ed1-x52c.google.com with SMTP id y18so9654337edw.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b7XmjC+j8puZVGqc8/yxuW/1C5OSlZD4jQAl/AxXOyE=;
 b=bvhf/8wIpOVnSqa3AZcLOpPAvecaD7RXJOHnSBcoqIRHGxHyTsnkC/GgFgOa+yVOfz
 9/QqbRLT/JzrOJim93raC9avO3+SoGfnatA2nv7TRpDo0ah1J/NszyJfSFJRaiHCsRso
 fTIUCwHH1fsnL2ETp7bs2y2Bwi4Afs8jipfDb4vIuGZuXw7nqZdaJnpGOMoebUbJT45S
 DCWUh2t8sEv4dby9zmW+oOiUoiEiMdGpy3CTofMBNSCr1tcMSqCQaIC74XtWM3KaCc2H
 n9QfJPuPW3zWBVWSFEU6Y1exPLEZGDWn4uXbagXTc4tF9LWLnhhbl0goCPYVVVoTtNDf
 UeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b7XmjC+j8puZVGqc8/yxuW/1C5OSlZD4jQAl/AxXOyE=;
 b=bTHF9N0+4Jmd7TqlyLjT1/Jmj+0Vx7NJcezaeb4l6BMfpG2ySInb7BDN/6knuJByIg
 bZMcEfWIZfLRBfyu64pVEEEEyLNrkxx21jtIXuJT8Wh76z+SNMZEpGwN1zKxjtXJUG28
 JMKbPX44Fgyg8EmbD2t7fexwqgq6kVCSVkScO4vi4y5vjD3I1nD5XZwibqG3gPk4t2PQ
 L4Sm2OFcd3kh3pMpc4e8dBpKvmL4pXwBOqq+q0G6aJHEiLcqLwn/GjhV0nAYyOcU3Zz2
 wT+cNLn+O2WMWVHDH5TVaMIlDY2OLzOcgHqZ7fCvmOrpvEOchaZ5V1efZATnpPJ775TO
 x1qA==
X-Gm-Message-State: AOAM5334+XONxEfB6BgvmW+MGQG9XgLe1y4LlMdLaB5jUn99GUMfBD6U
 kFeRDNNfM4ko7OIsg58u+vU=
X-Google-Smtp-Source: ABdhPJwmkisjcIXJqitjDAGargiLiZ5sG+SFq/U4uag5Y9BRAk7SW5CsGcll85eWz6V/5k7q5xiZ8Q==
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr4683892edc.174.1612546521974; 
 Fri, 05 Feb 2021 09:35:21 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f6sm4346934edk.13.2021.02.05.09.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 09:35:21 -0800 (PST)
Subject: Re: [PATCH v7 12/35] Hexagon (target/hexagon) instruction attributes
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-13-git-send-email-tsimpson@quicinc.com>
 <11960eff-406b-158c-7fae-61b2e0550268@amsat.org>
 <BYAPR02MB48867F2DC90D2A81897C387FDEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
 <55f89e45-c479-e02b-27c6-f2e6a7fb85ed@amsat.org>
 <BYAPR02MB4886F04D58FB80D87179FC71DEB99@BYAPR02MB4886.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ddf4afa5-4c9c-7831-9706-580993d104ad@amsat.org>
Date: Fri, 5 Feb 2021 18:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886F04D58FB80D87179FC71DEB99@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

+Eric in case I'm wrong.

On 1/30/21 12:15 AM, Taylor Simpson wrote:
>>>> On 1/20/21 4:28 AM, Taylor Simpson wrote:
>>>>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>>>>> ---
>>>>>  target/hexagon/attribs.h     | 30 ++++++++++++++
>>>>>  target/hexagon/attribs_def.h | 95
>>>> ++++++++++++++++++++++++++++++++++++++++++++
>>>>>  2 files changed, 125 insertions(+)
>>>>>  create mode 100644 target/hexagon/attribs.h
>>>>>  create mode 100644 target/hexagon/attribs_def.h
>>>>>
>>>>> diff --git a/target/hexagon/attribs.h b/target/hexagon/attribs.h
>>>>> new file mode 100644
>>>>> index 0000000..e88e5eb
>>>>> --- /dev/null
>>>>> +++ b/target/hexagon/attribs.h
>>>>> @@ -0,0 +1,30 @@
>>>>> +
>>>>> +enum {
>>>>> +#define DEF_ATTRIB(NAME, ...) A_##NAME,
>>>>> +#include "attribs_def.h"
>>>>
>>>> Per QEMU conventions, this file has to be named "attribs_def.h.inc".
>>>
>>> Didn't know that.  Which files should end in .inc?
>>
>> Oh you are right, it is not documented in CODING_STYLE.rst.
>>
>> You can see the rationale in commits:139c1837db7 and 0979ed017f0:
>>
>>   meson: rename included C source files to .c.inc
>>
>>   With Makefiles that have automatically generated dependencies, you
>>   generated includes are set as dependencies of the Makefile, so that they
>>   are built before everything else and they are available when first
>>   building the .c files.
>>
>>   Alternatively you can use a fine-grained dependency, e.g.
>>
>>           target/arm/translate.o: target/arm/decode-neon-shared.inc.c
>>
>>   With Meson you have only one choice and it is a third option, namely
>>   "build at the beginning of the corresponding target"; the way you
>>   express it is to list the includes in the sources of that target.
>>
>>   The problem is that Meson decides if something is a source vs. a
>>   generated include by looking at the extension: '.c', '.cc', '.m', '.C'
>>   are sources, while everything else is considered an include---including
>>   '.inc.c'.
>>
>>   Use '.c.inc' to avoid this, as it is consistent with our other convention
>>   of using '.rst.inc' for included reStructuredText files.  The editorconfig
>>   file is adjusted.
> 
> OK, I understand why it's better to have files end .[ch].inc than .inc.[ch].
> 
> However, I need some confirmation on which files need .inc instead of simply ending in .h.  From what I can tell these are the guidelines
> - If a file is intended to be included in the middle of another file (as opposed to the top), it should end in .inc.

This has to be justified. Usually such file use macro definitions which
are defined by the file including them.

If you can not justify, there is probably a way to have your file as its
own .c/.h unit.

> - If a .inc file is intended to be included in a .h file, it should end in .h.inc.

Yes, no exception.

> - If a .inc file is intended to be included in a .c file, it should end in .c.inc.

Not necessarily, you can have .h.inc included in .c.inc:

Function prototype declarations -> .h
If generated -> .h.inc

Function body definitions -> .c
These can NOT go in .h, so if generated -> .c.inc

Inlined function body definitions -> .h/.c/.h.inc

> - The above applies to both human-written and generated files.

Yes, although it is harder to justify human-written .inc.

Also:

Header exposing subsystem X API to other subsystems go in include/..X..h
(example include/hw/sd/sd.h)

Header sharing prototypes local to a particular subsystem go in X/..h
(example hw/sd/sdmmc-internal.h)

*.inc must not go in include/

Regards (and sorry for answering late),

Phil.

