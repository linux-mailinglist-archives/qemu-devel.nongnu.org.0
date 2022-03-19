Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278814DE843
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 15:05:38 +0100 (CET)
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVZi4-000375-W4
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 10:05:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nVZg2-0002FQ-70; Sat, 19 Mar 2022 10:03:30 -0400
Received: from [2607:f8b0:4864:20::1033] (port=40834
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nVZg0-0007RO-CI; Sat, 19 Mar 2022 10:03:29 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so6753016pjb.5; 
 Sat, 19 Mar 2022 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xT7eN31njfHOr0HYBp3W08w1EelqZN54eOiaJPg3ACQ=;
 b=EGfyIPVGnoq1qBjNAhX3aRRzw3lUhAiyhd8rDNHOdkCa8+J5ELKi8DdSbZLEWSsDH5
 5Geew85a1n9OB0ax22duz0rdJB7odaDmjqG7HSU2NyYPZ6gPvDzZBwTep78T8NTSOpNJ
 8bW+1ppWLfnU1PHCKuikMxmBanBgF5ivK2K6ggzskzj5bpOaHA71KYqAT7nYsBQFgTcG
 uoUD+wP2cPBDN90HVuOEBHHM4Z4f3XX1os0JqHKYB1E4CCoGWD/FpF1+ECZ9YF1NWoKx
 btqKYH0eS/eTWksE5EXeZoIDfPsY4xo4L8Gn0gR+Y4wCO9dWX0SqFDeTsAv9wSBvOPhb
 af8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xT7eN31njfHOr0HYBp3W08w1EelqZN54eOiaJPg3ACQ=;
 b=yWMemcjnf7BP3BgiPhjxmBJ+hji4tKIEbpMR1DySSDpMhhhxzz1rkkUYP7qFY1kQET
 kmDXpYXG4EU4Y0Xpbfzo5HJaN8DaOMD1VAenejX6P0nQ0+eeUiusEMbUoPcM4le0aWAX
 p4hj8cfMv67T7dyjDI1ShPXG4LKOiEUBS3q2lz/BmHhUpYevDz0U4PwQwrKRcqJ1ci9z
 0LMG3DlE4Ni8VHz92zkXqwGiGs64PR2ofFdUC/AWZqfz4Pg6YM4gThCjqEUaFN4FRImD
 zmdalmsC4mUlu/ewkn4HFzqdMjiUaczOEHAS5v7L3EtA3zn7EOXpK1sU4RpNkpHXEbJO
 5kTw==
X-Gm-Message-State: AOAM530bUeBSwGIdzsc5COepGy5xBtwOVvUaMLG8IDimEYXWc73r7BoE
 5SWUaAAUiVnmlXrC+UXqShM=
X-Google-Smtp-Source: ABdhPJy4RAQkaAIVmHoqpnGjLNaj/yzzETb7DAMwHY7N+a7dR+TEWUh60PGa6BfBTxIRkjDDB1lBCg==
X-Received: by 2002:a17:902:a586:b0:153:8d7a:70c7 with SMTP id
 az6-20020a170902a58600b001538d7a70c7mr4385313plb.27.1647698606290; 
 Sat, 19 Mar 2022 07:03:26 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 m125-20020a628c83000000b004f7baad5c20sm12911781pfd.144.2022.03.19.07.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Mar 2022 07:03:25 -0700 (PDT)
Message-ID: <0b696b02-0ee2-25da-c6d0-f132b789fd33@gmail.com>
Date: Sat, 19 Mar 2022 23:03:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] gitattributes: Cover Objective-C source files
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
 <62dbdfcf-771e-7c84-ab8b-b02a61112f86@gmail.com>
 <69c6db77-273e-dbeb-e695-e20772d003e2@gmail.com>
 <2ab1e5f9-6a34-6b82-8f43-b7dcf58bc8b1@gmail.com>
 <a37d98d4-5fdf-8a57-af64-eab4daacf49d@gmail.com>
 <42c1f3fa-0cc9-51ff-299e-5ebe1a5f5d32@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <42c1f3fa-0cc9-51ff-299e-5ebe1a5f5d32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/19 22:49, Philippe Mathieu-Daudé wrote:
> On 19/3/22 04:25, Akihiko Odaki wrote:
>> On 2022/03/19 1:14, Philippe Mathieu-Daudé wrote:
>>>> Commit 29cf16db23 says:
>>>>> Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
>>>>> and 139c1837db7 ("meson: rename included C source files to .c.inc")
>>>>> 'git-diff --function-context' stopped displaying C function context
>>>>> correctly.
>>>>
>>>> So I suspect Git has some knowledge of common file extensions like 
>>>> .c, .h and .m although I couldn't find in the source code of Git.
>>>
>>> 'git-diff --function-context' doesn't work for me without this change.
>>
>> With some debugging, I found Apple's Git distribution actually carries 
>> a default gitattributes file which annotates *.m.
>> https://github.com/apple-opensource/Git/blob/master/gitattributes
> 
> I see, I'm using the Homebrew git. Anyway this change helps non-native
> Darwin users to review these .m files.
> 
>> However, it does not annotate *.c or *.h. Apparently there is no "c" 
>> diff pattern and they are handled with the "default" diff pattern 
>> which is actually designed for C. In fact, "c" diff pattern is not 
>> present in the documentation:
>> https://git-scm.com/docs/gitattributes#_defining_an_external_diff_driver
> 
> 'cpp' is listed. Maybe 'c' is aliased to it?

I don't think so. The string 'cpp' is rare in Git code base and I still 
couldn't find such code.

> 
>> In conclusion, *.m should be listed in gitattributes but *.c.inc and 
>> *.h.inc should not be if my understanding is correct.
> 
> But then how git-tools can detect .inc are C files? I remember it was
> not working (on Linux hosts) without this change.

It doesn't have to. If files are not listed in gitattributes, it simply 
applies the "default" diff pattern, which works with C.

I can confirm removing *.c.inc and *.h.inc from gitattributes does not 
affect the output of git diff -W on git version 2.35.1 which comes with 
Fedora.

Regards,
Akihiko Odaki

> 
>> Paolo Bonzini, I found you are the author of commit 29cf16db23. Can 
>> you test the above conclusion?
>>
>> Regards,
>> Akihiko Odaki
> 


