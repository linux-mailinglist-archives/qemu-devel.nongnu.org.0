Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA769DF26
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUR2m-0003Yl-8A; Tue, 21 Feb 2023 06:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUR2e-0003Uk-RR
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:42:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUR2c-0000Ux-Ug
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:42:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p26so3013843wmc.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zbr9KT/mHHzG0wAw+6IcgcKOpVdCy1zxhh2pEcF1ga0=;
 b=sYL6iOie2SpB5dpjnAOhDsSTZgi4smAiItyTkdGptkFophn4J98nuOsgrqnoM3mtzn
 LI6z0py7jMqBwY6faiTWsQmaayC6YKvfhmlxPXvzUH/H72vFJb+9P7zsBry6S26jzdNc
 ZL9IZkmIhqBlq8u2DRbchJbTaXkQSsf9vm400nFOdz6xoJHBOqIk/3/GDjQXnyfUm2hc
 1I9yCNTq+A/Dlhs/5fu+7ZlvQgPR6pf4iaewDNl60COFxGyGmeTJBw30galFW4oWpPZ0
 tWjyGiOy35u8bvimLNt++HJ3C9zp7Btrekx7LhtpcUOJVru64pR8RSA7BSi6sIebjNeE
 Y0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zbr9KT/mHHzG0wAw+6IcgcKOpVdCy1zxhh2pEcF1ga0=;
 b=vnc1EzalOVjavpIf6QSS7BW6F+sVJl9oSWBJMW3fSM4qez6J0EuouyhlCkXDUviGBz
 yV/UwRa1u1wKtnrNKSpdZpfiTbtV+CXyaCIWn0xzN98W3RXKgIFosbf1eC/jCxxtooj3
 Vs4YtuL2KqSKvXNImQFOg4ur6XsFUq7USfQUmz/T/pkRcqYlFYf2x6P6AfkC/8pUzbO6
 vacFnWMqVcGDHUWtoZj3uQJdNXh2gvtSM0wLjexGSR/DiOUdlxZT8y2NSFPtST6iCS3I
 UQ7zw6UiFO9nxdfNxA7qSyuwcPIRs6+HtyzY8AKVXEYPuVfQQFeF1eoQa9uVuptWgSLf
 n+jA==
X-Gm-Message-State: AO0yUKXdlYM3TfHC8DrzdYjjHcMt5oGSNyBWAYD40QIpJjmHvacRIllD
 McBSIbZcU2vLzfOxc5IIalCBTQ==
X-Google-Smtp-Source: AK7set+eCC1+IuGk1ulmrMk/dQAq8Llfqk8Tc6RwS0vvEM8KoNFOUxoKrDfLw73+K6YU3i/OxRfp4A==
X-Received: by 2002:a05:600c:43d3:b0:3e2:1d1e:78dc with SMTP id
 f19-20020a05600c43d300b003e21d1e78dcmr2744324wmn.36.1676979756191; 
 Tue, 21 Feb 2023 03:42:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f23-20020a7bc8d7000000b003e7f1086660sm1287320wml.15.2023.02.21.03.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 03:42:35 -0800 (PST)
Message-ID: <57030391-e742-2c46-7cdb-6f454cfe88f8@linaro.org>
Date: Tue, 21 Feb 2023 12:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4] configure: Add 'mkdir build' check
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Dinah Baum <dinahbaum123@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230221110631.4142-1-dinahbaum123@gmail.com>
 <391fdaaa-4b77-b17f-0cc2-0d7bdcf065b5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <391fdaaa-4b77-b17f-0cc2-0d7bdcf065b5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/2/23 12:14, Thomas Huth wrote:
> On 21/02/2023 12.06, Dinah Baum wrote:
>> QEMU configure script goes into an infinite error printing loop
>> when in read only directory due to 'build' dir never being created.
>>
>> Checking if 'mkdir dir' succeeds prevents this error.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321
>> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   configure | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index cf6db3d551..1ef3e7f77d 100755
>> --- a/configure
>> +++ b/configure
>> @@ -31,7 +31,12 @@ then
>>           fi
>>       fi
>> -    mkdir build
>> +    if ! mkdir build || ! touch $MARKER
>> +    then
>> +        echo "ERROR: Could not create ./build directory. Check the 
>> permissions on"
>> +        echo "your source directory, or try doing an out-of-tree build."
>> +        exit 1
>> +    fi
>>       touch $MARKER
> 
> Nit: I think the final "touch $MARKER" could now be removed, too, since 
> the code either exits above, or runs the "|| ! touch $MARKER" part there 
> already.
> 
> Anyway, it's just a nit, and maybe could also be fixed while picking up 
> the patch,

Yes please :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> thus:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 


