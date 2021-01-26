Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7671130392B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 10:41:17 +0100 (CET)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Kqa-0004CB-If
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 04:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Kon-0003jC-DZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 04:39:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4Koj-0007uq-AP
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 04:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611653960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBeQpGdMWaEYgpTGx+6EWMYD7MJAtgu57QuYzHMhkYU=;
 b=jQl30j3+pp5XSYWIU4Ejkae6I9CXXTbfhzMG7F+clikjt/ddAN2FkH5qb+uqPaIQoZCDse
 bA/X/tEPGsdkQ8/kDpap5GDV8dmlkTt5awblhyGtl1iiAcZWj4w4VKrl8G2iJWBQ3sjxUQ
 avLFFm2Qh9yhiKIdWcVNlu5bh7VX+OI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-i_tlvkTRNreiRI3nSu6fBg-1; Tue, 26 Jan 2021 04:38:55 -0500
X-MC-Unique: i_tlvkTRNreiRI3nSu6fBg-1
Received: by mail-ej1-f71.google.com with SMTP id z2so4752506ejf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 01:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vBeQpGdMWaEYgpTGx+6EWMYD7MJAtgu57QuYzHMhkYU=;
 b=a24qxmy6UV/3ApLKcLfQR4XaylH5eqMAZd9uieUXBywXiMK632UrVH6a132bjJTm/b
 X1GAaPjD/W54LCldhcf80YlJNylCkzIFbOUEQNlsIwuOeAyx17k7y29IXEfpzKeknVO6
 JfN1Jrs5LJdmzKeiXrKjqqBX6NWQSXPLHC7A/KxKIGwe8WYi1OsXglBCGR+KFm8ggFWr
 SqBe4o8OHidlmITFwilYw8tfLOo9kgiIQ1vx0OfyQBNpkHYpJGCHarGNeytNN66+Xxg0
 Ydh7MxWFHrH2JwDtw9bl3VhM0hODCJ7QJCMVdVFxbSKER/u9SZa96glp0J4JUiMRy8++
 PLbA==
X-Gm-Message-State: AOAM531Jw3udX1XBF0w9GwSHm/1aZCbWiPGin4JbahPBKSz61Kh/z7Y1
 S4V8hp7vmrlHyB6ym44/sWBh72Dt3TFO5q0EMkQyt6GxmRCs/IEQFwNeecY9fFdf3vV4otcJvV8
 WJn7uiGJYLacoJL0=
X-Received: by 2002:a17:906:3146:: with SMTP id
 e6mr2791447eje.363.1611653933996; 
 Tue, 26 Jan 2021 01:38:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRF8F1KloVXwLBJvJroM/vQMyIDw+mwM9MpBurX2FM7uwmZlSTMwLS4hI5umgTeXqU0QjVFg==
X-Received: by 2002:a17:906:3146:: with SMTP id
 e6mr2791434eje.363.1611653933790; 
 Tue, 26 Jan 2021 01:38:53 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id di28sm12112433edb.71.2021.01.26.01.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 01:38:53 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci.yml: Avoid recompiling the sources in the test
 jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210126065757.403853-1-thuth@redhat.com>
 <ed621c17-43e4-3ae4-2a5f-56fb8d054e3f@redhat.com>
 <19cbfd81-3d33-dbc1-b8f4-fecdce8ce09c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dec6a8f1-2486-0ded-0994-6ac25416ef2c@redhat.com>
Date: Tue, 26 Jan 2021 10:38:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <19cbfd81-3d33-dbc1-b8f4-fecdce8ce09c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 10:08 AM, Thomas Huth wrote:
> On 26/01/2021 08.36, Philippe Mathieu-Daudé wrote:
>> On 1/26/21 7:57 AM, Thomas Huth wrote:
>>> Currently, our check-system-* jobs are recompiling the whole sources
>>> again. This happens due to the fact that the jobs are checking out
>>> the whole source tree and required submodules again, and only try
>>> to use the "build" directory with the binaries and object files as an
>>> artifact from the previous stage - which simply does not work right
>>> anymore (with the current version of meson). Due to some changed
>>> time stamps, meson/ninja are always trying to rebuild the whole tree.
>>>
>>> In the long run, we could likely use "meson test --no-rebuild", but
>>> there is still some work going on in that area to improve the user
>>> experience. So until this has been done, simply avoid recompiling the
>>> sources with a trick: pass NINJA=":" to the make process in the test
>>> jobs. Also check out the submodules manually before updating the
>>> timestamps in the build folder, so that the binaries are definitely
>>> newer that all the source files.
>>> This saves ca. 10 - 15 minutes of precious CI cycles in each run.
>>>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   .gitlab-ci.yml | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index de3a3d25b5..16fea25ba9 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -38,9 +38,11 @@ include:
>>>     stage: test
>>>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>>>     script:
>>> +    - scripts/git-submodule.sh update
>>> +        $(grep GIT_SUBMODULES build/config-host.mak | sed
>>> 's/GIT_SUBMODULES=//')
>>>       - cd build
>>>       - find . -type f -exec touch {} +
>>> -    - make $MAKE_CHECK_ARGS
>>> +    - make NINJA=":" $MAKE_CHECK_ARGS
>>
>> This ninja trick deserves a comment in the YAML file.
> 
> I'll add:
> 
>     # Avoid recompiling by hiding ninja with NINJA=":"
> 
> Ok?

Perfect, thanks!

Phil.


