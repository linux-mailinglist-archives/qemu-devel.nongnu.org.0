Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531011A77EA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 11:54:48 +0200 (CEST)
Received: from localhost ([::1]:55148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOIHH-00007e-Cj
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 05:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOIGR-0008AN-G8
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 05:53:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOIGQ-0005CB-3y
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 05:53:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26712
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOIGQ-0005Aa-0e
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 05:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586858033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voblG5G1PzyqY8sprhCJn2vSX6V/rHSPZTBJgSk7Rp8=;
 b=QqGCb0vLAnAnLkMrB/swGDK955886l0bUQmQAAaCD+IefMAaqVYD+D6AqkOGQbokXrKn7e
 ZSWels7WwVdxoZ7ZRbwL79IKJx48Dz37ifPHJw7Zz7TaJVs954pN7hUp7rsoDL03AO8avl
 E+IggXXQvyHx3MFt47B3eJTWeyuqEfE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-wCdDAvw3NJGVclz2HD0Nbg-1; Tue, 14 Apr 2020 05:53:51 -0400
X-MC-Unique: wCdDAvw3NJGVclz2HD0Nbg-1
Received: by mail-wr1-f71.google.com with SMTP id h95so8367615wrh.11
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 02:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=teX/v/73gsE/ZTJHvy0RvaRbBnL4fvE8+63ivkMli/8=;
 b=f6Xr6DCzXgfNO0H5PaMYYPmenhHHuXwqW0oExRhYlFYldcC43FHDL4v0xYLIKxTJ8Z
 PhpVCHt1ZAPlEWgx+AK7suX2DnRM/YP6MqfoiP7QAZTdbHY/rqf4rexKfd/4b/j2o5dv
 xGqf9tZFLJHfWQFzxRVumtX1Bt96Vvb/yPwUmbLQ0ragtCzqVzP/hkSS7jKVhqtn/XxP
 a2090LFGGARN+tTAurrN26h2INtrnaiRNLHINM83sPXFJyVqltZqYnj3fOsilUQGp6H4
 2uWbsIyzK7HkmxJLDL3fKjDVT/YxVfhztLoUXV8nX45fg0o5bPUtZZ1DS3N8BI5WFJGK
 KGUg==
X-Gm-Message-State: AGi0PuYVt3AqDiDZS/qJ6IZhBGrLghDRPXsOH5of2N0O5tmL2fyJn9hD
 duhG5lezJHXlnRPa8YzF6WtQSk7Mw1rjVpumLMgNGb5uTbjHPDz2Ce0J72UyEnRbt+owRdgn+cG
 KGqelgYaNNH9/Y5w=
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr21546438wmj.80.1586858029968; 
 Tue, 14 Apr 2020 02:53:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7mFqcf2/nMIaZmjw3IQBAiWLDbB3qenbfmGkfRfBWefI/SY1O+r0TqYXsc5/JIIGGRV6rGg==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr21546409wmj.80.1586858029616; 
 Tue, 14 Apr 2020 02:53:49 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f3sm18505301wmj.24.2020.04.14.02.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 02:53:49 -0700 (PDT)
Subject: Re: [PATCH] .gitignore: include common build sub-directories
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20200413162902.7985-1-alex.bennee@linaro.org>
 <2c489489-f459-f029-029e-74bfbfc70e49@redhat.com> <87imi38433.fsf@linaro.org>
 <d97c8034-2a9f-fe26-c70b-49b4d19f800d@redhat.com>
 <875ze2zed7.fsf@dusky.pond.sub.org> <873696qwrc.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b96c529e-1d17-ff48-da10-eae13a939cbe@redhat.com>
Date: Tue, 14 Apr 2020 11:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <873696qwrc.fsf@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/20 10:47 AM, Alex Benn=C3=A9e wrote:
>=20
> Markus Armbruster <armbru@redhat.com> writes:
>=20
>> Eric Blake <eblake@redhat.com> writes:
>>
>>> On 4/13/20 4:32 PM, Alex Benn=C3=A9e wrote:
>>>>
>>>> Eric Blake <eblake@redhat.com> writes:
>>>>
>>>>> On 4/13/20 11:29 AM, Alex Benn=C3=A9e wrote:
>>>>>> As out-of-tree builds become more common (or rather building in a
>>>>>> subdir) we can add a lot of load to "git ls-files" as it hunts down
>>>>>> sub-directories that are irrelevant to the source tree. This is
>>>>>> especially annoying if you have a prompt that attempts to summarise
>>>>>> the current git status on command completion.
>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>> ---
>>>>>>     .gitignore | 2 ++
>>>>>>     1 file changed, 2 insertions(+)
>>>>>> diff --git a/.gitignore b/.gitignore
>>>>>> index 0c5af83aa74..7757dc08a08 100644
>>>>>> --- a/.gitignore
>>>>>> +++ b/.gitignore
>>>>>> @@ -141,6 +141,8 @@ cscope.*
>>>>>>     tags
>>>>>>     TAGS
>>>>>>     docker-src.*
>>>>>> +build
>>>>>> +builds
>>>>>
>>>>> Would 'build-*' be worth adding as well?
>>>>
>>>> Sure - I'll add it to v2.
>>>
>>> Or even consolidate it into a single pattern: build* (which would
>>> allow 'build', 'builds', 'build1', 'build23', 'build-fedora',
>>> 'build-bug1234', ...)
>>
>> The looser the pattern, the higher the risk of unwanted matches.
>>
>> Would be less of an issue if we had a cleaner source root directory.
>=20
> True but as of now we don't have anything matching bu* so I think build*
> is fairly safe. I have ran into problems with over lax .gitignore
> stanzas before but I don't think it's taken too long to figure out what
> was going on. It's not like having a build subdir isn't a common
> "out-of-tree" build idiom.

We can restrict to directories using "build*/":

GITIGNORE(5)

=C2=B7   If the pattern ends with a slash, it is removed for the
     purpose of the following description, but it would only
     find a match with a directory. In other words, foo/ will
     match a directory foo and paths underneath it, but will
     not match a regular file or a symbolic link foo (this is
     consistent with the way how pathspec works in general in
     Git).


