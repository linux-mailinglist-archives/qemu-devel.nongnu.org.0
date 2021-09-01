Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040FA3FE019
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:39:13 +0200 (CEST)
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTGZ-0007C9-Rf
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSHI-00006S-Rj
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLSHH-0001q1-2k
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630510550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ra6r60ogw0INw+sg3LCqm9R+alg1wxxmTra4u8tkkVo=;
 b=JZ5Kw8v/MteExmmdb1cyfLd/naWeLhEtFlS5Jqkv7CP4bqeJ4rZxXvMoPEw/93Vg+5N98i
 7UyvItkQV5IcclvD8vTpKIpIvASHq1ivEb6KB8Rf1BP3rK9ruJeEy5XMH8IlZi2r4duvtg
 WZTbA/7sM10jR2xQ5KKJt+C1zfGie2U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-yHgdUINLOgSwxfzKIgE3RA-1; Wed, 01 Sep 2021 11:35:48 -0400
X-MC-Unique: yHgdUINLOgSwxfzKIgE3RA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c4-20020a1c9a04000000b002e864b7edd1so33796wme.6
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ra6r60ogw0INw+sg3LCqm9R+alg1wxxmTra4u8tkkVo=;
 b=k2CEfPmaEDmL2wKrm8D2TbNe0cTBW8kD9It0NbA/z8nEm+eyzTIRPvEv3PmWHjxAD/
 2TxCVfOvqXXJeoTvubTs1RXHSfVCz2ujhnRmdxc5g1fzS3WGqmQq4qmablY3Ibpdm+dh
 q6sfheTvTQcGAFiSmjXI3O++W7wGTNW9dIbcT8QDO35BbBg5bwFsZh7wwzJOqjbVw7fu
 oxqCb+pwKvcSI1npug/XYKEoMMLICDYRNahrSp/uwt3u+rIYYO9+oU916Y2zLH+ChUO7
 hn+tZX1E8OmIPq7S3QThTgUF/iWrR/fzGlb2CXiA05qLxXc5eX1lxImDvcmaSFa8U4XV
 HzDw==
X-Gm-Message-State: AOAM532r64lA6bgWU6b44JyXSaWpyQF90vvM0B+rrX+vZsZLYwaxVpaJ
 B+NfdkE4XV5SUhLLmFi+kUxqLvD7kPfyKr0TwyX5cNErEpFoUjTNxFlF0MnO5szMHlT9GAlw+w5
 eGzfJ0xkJMCVvQtg=
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr74365wmq.83.1630510544619; 
 Wed, 01 Sep 2021 08:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymcnIk+AE3ZrBs7xjKQ1Pe5NtG/425r/24DQu/E/m6Vy7K7v7kVtLVf01AvakaXuIuPdxgNw==
X-Received: by 2002:a05:600c:a44:: with SMTP id c4mr74335wmq.83.1630510544376; 
 Wed, 01 Sep 2021 08:35:44 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e26sm22740982wrc.6.2021.09.01.08.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 08:35:43 -0700 (PDT)
Subject: Re: [PATCH] gitlab: Escape git-describe match pattern on Windows hosts
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210901145229.4132606-1-philmd@redhat.com>
 <YS+UylEr3CJyksxt@redhat.com>
 <CAFEAcA_gyZTfUTAAoKvrA-qyv-8dOvGjLSLmq2uaur8XYS6CuQ@mail.gmail.com>
 <YS+aiZep166VuVcH@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0901f6da-de5c-f9e6-5f40-e15f4a7c807d@redhat.com>
Date: Wed, 1 Sep 2021 17:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS+aiZep166VuVcH@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/1/21 5:21 PM, Daniel P. Berrangé wrote:
> On Wed, Sep 01, 2021 at 04:17:48PM +0100, Peter Maydell wrote:
>> On Wed, 1 Sept 2021 at 15:59, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Wed, Sep 01, 2021 at 04:52:29PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Properly escape git-describe 'match' pattern to avoid (MinGW):
>>>>
>>>>   $ if grep -q "EXESUF=.exe" config-host.mak; then make installer;
>>>>     version="$(git describe --match v[0-9]*)";
>>>>     mv -v qemu-setup*.exe qemu-setup-${version}.exe; fi
>>>>   fatal: No names found, cannot describe anything.
>>>>   ERROR: Job failed: exit code 1
>>>>
>>>> Reported-by: Cédric Le Goater <clg@kaod.org>
>>>> Fixes: 8619b5ddb56 ("ci: build & store windows installer")
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/591
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
>>>> index 10d22dcf6c1..62d33e6661d 100644
>>>> --- a/.gitlab-ci.d/crossbuild-template.yml
>>>> +++ b/.gitlab-ci.d/crossbuild-template.yml
>>>> @@ -14,7 +14,7 @@
>>>>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>>>>      - if grep -q "EXESUF=.exe" config-host.mak;
>>>>        then make installer;
>>>> -      version="$(git describe --match v[0-9]*)";
>>>> +      version="$(git describe --match 'v[0-9]*')";
>>>
>>> Do you have a pointer to a pipeline showing this fix works ?

It worked on my fork but I have some versioned tag:
https://gitlab.com/philmd_rh/qemu/-/jobs/1553450025

Cédric, do you mind testing on your fork?

>>>
>>> It is a bit strange to me. AFAICT, the only difference would
>>> be if the unquoted  v[0-9]*  matched a filename in the
>>> current directory, but that doesn't seem like it is the
>>> case here.
>>
>> We should quote the glob pattern anyway, to avoid possible
>> really confusing behaviour in the future if such a file ever
>> does turn up...
> 
> Sure, I'm happy to see the thing quoted regardless, just want to
> make sure the commit behaviour matches the commit message.
> 
> 
> Regards,
> Daniel
> 


