Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7168415B93
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:57:54 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLUH-0006dv-Ok
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTLRK-0004S5-NU
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTLRE-0008Lo-DW
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632390883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AriHs4v33JDWrPVm2acb/zRUsHFtPIzhGZIPGe3NZdI=;
 b=eidpYQZKuOnpbb8gcx7Nd75P6yCAl6bWdoul5VhllfgjLg9GR3kNyDc9LgLbCam3kSQZq4
 NeJkNsbbaxNOOWh/Lbw+/RMSXS5wOVcF/cPEeJp5B9D7knZtZsH9a6c9NXU7Mp1gl83lXx
 Nmh80wXYM/TFRheZ/5EYPY9yvTjsWbo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-EF0dTUNFNpuXwONtPJO1pQ-1; Thu, 23 Sep 2021 05:54:42 -0400
X-MC-Unique: EF0dTUNFNpuXwONtPJO1pQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso4680672wrg.1
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AriHs4v33JDWrPVm2acb/zRUsHFtPIzhGZIPGe3NZdI=;
 b=EoyisYQNacZAbDJmhLKTx0R4gwTI5x39Mw1YWEwznK/TCxal6eKX9bIHir9lHlTw5O
 ktlz242c5wEYpaUTAVYAEd4wgJ2RipVdBNfJzLkQYyabyAid55jjF45V3FpLKPHLQy4i
 VrnAlsUYe3Hi2Lrc4E0LtMYbdqI71gjyqF7CquOB4BmSifi4hR+V3a7Zs0FI3q3gv93c
 2r2MrBLycrYb0zZ/XNXEAcCoZC0c0yjFx5qZYXHOwa8w57FMZJ9otqK/UUgmv2EpK6SP
 16aVK0/yHIbZIWUFaUL55QMzKIDRoT/RHpBw0sZzBt+QtBZ6J+fcBjegdlnglDoWESl7
 /urg==
X-Gm-Message-State: AOAM5322HNzGbrJi97YE7fYucjLWux+4a0S5dFAxJ9tLNxqMqYUaimxr
 MIufIRMv161xUOsJMbwBJZxaITOy1tSTbqt9MXOTqkMZcA+FR6KMwQ1lASeAXzRxOQhBLMw5p09
 vOvIai/3yfqSQAL4=
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr3891138wrp.95.1632390880654; 
 Thu, 23 Sep 2021 02:54:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw84TcqmQQQ6ynUgRTPuFP1iEf+rl9jTkTernzKKCSOJqLwjmad4MLTBwNKkk9aqQo23i1Q6g==
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr3891120wrp.95.1632390880438; 
 Thu, 23 Sep 2021 02:54:40 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 5sm4896265wmb.37.2021.09.23.02.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:54:39 -0700 (PDT)
Message-ID: <44010f4f-1382-66be-bb7c-ac05b099b981@redhat.com>
Date: Thu, 23 Sep 2021 11:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] tests/qapi-schema: Use Python OSError instead of
 outmoded IOError
To: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210922125619.670673-1-armbru@redhat.com>
 <20210922125619.670673-2-armbru@redhat.com>
 <CAFn=p-YasVLZbFWqx=rxFNLcwyHhBKxcJgeKpQLjDZC2bj-_nQ@mail.gmail.com>
 <87o88jfxfw.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <87o88jfxfw.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.039,
 DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@gmail.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 11:33, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On Wed, Sep 22, 2021 at 8:56 AM Markus Armbruster <armbru@redhat.com> wrote:
>>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>   tests/qapi-schema/test-qapi.py | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/qapi-schema/test-qapi.py
>>> b/tests/qapi-schema/test-qapi.py
>>> index 73cffae2b6..2e384f5efd 100755
>>> --- a/tests/qapi-schema/test-qapi.py
>>> +++ b/tests/qapi-schema/test-qapi.py
>>> @@ -154,7 +154,7 @@ def test_and_diff(test_name, dir_name, update):
>>>           errfp = open(os.path.join(dir_name, test_name + '.err'), mode)
>>>           expected_out = outfp.readlines()
>>>           expected_err = errfp.readlines()
>>> -    except IOError as err:
>>> +    except OSError as err:
>>>           print("%s: can't open '%s': %s"
>>>                 % (sys.argv[0], err.filename, err.strerror),
>>>                 file=sys.stderr)
>>> @@ -180,7 +180,7 @@ def test_and_diff(test_name, dir_name, update):
>>>           errfp.truncate(0)
>>>           errfp.seek(0)
>>>           errfp.writelines(actual_err)
>>> -    except IOError as err:
>>> +    except OSError as err:
>>>           print("%s: can't write '%s': %s"
>>>                 % (sys.argv[0], err.filename, err.strerror),
>>>                 file=sys.stderr)
>>> --
>>> 2.31.1
>>>
>>>
>> If you're happy with the expanded scope of the exception-catcher, I am too.
> 
> https://docs.python.org/3.6/library/exceptions.html has
> 
>      Changed in version 3.3: EnvironmentError, IOError, WindowsError,
>      socket.error, select.error and mmap.error have been merged into
>      OSError, and the constructor may return a subclass.
> 
> and
> 
>      The following exceptions are kept for compatibility with previous
>      versions; starting from Python 3.3, they are aliases of OSError.
> 
>      exception EnvironmentError
> 
>      exception IOError
> 
>      exception WindowsError
> 
>          Only available on Windows.

With that information amended to the description:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> So unless I'm misunderstanding something (which is quite possible),
> we're catching exactly the same exceptions as before, we just switch to
> their preferred name.
> 
>> Reviewed-by: John Snow <jsnow@redhat.com>
> 
> Thanks!
> 
> 


