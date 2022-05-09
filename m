Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73D51FDA8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:12:58 +0200 (CEST)
Received: from localhost ([::1]:44220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3C5-0003gR-Fr
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2kt-0003nT-Sl; Mon, 09 May 2022 08:44:51 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2ks-0000df-8a; Mon, 09 May 2022 08:44:51 -0400
Received: by mail-pf1-x435.google.com with SMTP id x52so12138417pfu.11;
 Mon, 09 May 2022 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dLdaDOUZIK3RBqbcEUH28W/27HMAjnXQ55ScHR5Pmno=;
 b=bPykLE3MJ/ujeIcjoDDL5cFoxjB3FL2AcQwi/3cB3+3+lgtUlMAgVkCfQ1TgCcuhg8
 9Rytz5vl1qQPZ1EPEmYzR0Re56kLqadvZ1xGsROJIujFFHbCBpYNTKpWqJS4N5DCy+j/
 MncvW50gYjVIp2au4V7+MhLVQaqxyks+5fBIWiTyTh80Bcv95yi9JsD2bVVKoAhOYUta
 hiZqSP1Plr2VC7nFyOC7b5ZkSqs6AnWWbJ0rcLliykaITJ3vp8LEe5s6hi4x97YjJPan
 lefX4GiGs3+u6m3C4wdixS8W1bEPW65GoEYPmVfr62qvcSAhsTGnG740BwR7KaabMF/r
 /H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dLdaDOUZIK3RBqbcEUH28W/27HMAjnXQ55ScHR5Pmno=;
 b=fm3Cgv/aO8ka4CCP/dpQWdLl86TI+vOO6W0o3hlesLiGaBFvRyidqFqA9R04pq+m2G
 St60zPLTohoSXl0bG65sQh9OJW+krLlrwiWRC04pj1cjymlRLLVgzJJX3eH6mZfNTCkr
 iDez+kcgj+iKIv55+AOyedvMufEacYnGXKqi8rxHNXUR4uaKsESlfztXungRJTpH9JV6
 HQ9pU4H6QZ63RtUcGu26qb+kZ/1Nl1N87FYe6lEBG8+GsVSQaOBFcUN1NEyQqyYeLLL/
 vDm2tfPUOCX0s1f9MYyehPZYMpCGDCtbBzG/n8mBP+AMx5EIPyS+6WxvgZqhbYQkMsSZ
 QXxg==
X-Gm-Message-State: AOAM5338WUPogFLjxYKN0+sU6FGcR7rs/g3ozhW6cSy7hI2pib5HwKe9
 aHV0dvqfqeDyk7qrG2wR4Mo=
X-Google-Smtp-Source: ABdhPJyEw7aiS2j09fyBEW+f118GeXVvcJA/300LcY6sIxQpHjXvrWz6qIcvFPUZ+6AaZrCqyXZhlg==
X-Received: by 2002:a63:501a:0:b0:3c6:e381:e95 with SMTP id
 e26-20020a63501a000000b003c6e3810e95mr447703pgb.35.1652100288556; 
 Mon, 09 May 2022 05:44:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cd10-20020a056a00420a00b0050dc76281d0sm8773828pfb.170.2022.05.09.05.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:44:48 -0700 (PDT)
Message-ID: <47f863af-82f7-ec6e-a066-fec8509f34cd@amsat.org>
Date: Mon, 9 May 2022 14:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] qom/object: Remove circular include dependency
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA-tC5hUcYa7Q_GOe=7_k=De_yw0mm2F21ALh6-2D5ChzA@mail.gmail.com>
In-Reply-To: <CAFEAcA-tC5hUcYa7Q_GOe=7_k=De_yw0mm2F21ALh6-2D5ChzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/5/22 11:41, Peter Maydell wrote:
> On Mon, 9 May 2022 at 09:53, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>>
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> "qom/object.h" doesn't need to include itself.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/qom/object.h | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index 5f3d5b5bf5..ef7258a5e1 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -16,7 +16,6 @@
>>
>>   #include "qapi/qapi-builtin-types.h"
>>   #include "qemu/module.h"
>> -#include "qom/object.h"
>>
>>   struct TypeImpl;
>>   typedef struct TypeImpl *Type;
> 
> Accidentally (but harmlessly) 

This makes crash clang tools such clang-format, I'll amend that
to the description.

> added in commit db1015e92e0483 by a
> change generated by a script.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Eduardo: is it worth making ./scripts/codeconverter/converter.py
> handle this as a special case, so it doesn't add the include line
> to qom/object.h itself ? Or do we not really expect that script
> to be run on the codebase again in future ?

Oh, I see required_identifiers() adding this include in
scripts/codeconverter/codeconverter/qom_macros.py.

If we do not expect to use these scripts, we should remove it from
the repository. They are in good shape however, and might be still
valuable, so I'll amend a fix to the script.

Thanks for pointing at these scripts,

Phil.

