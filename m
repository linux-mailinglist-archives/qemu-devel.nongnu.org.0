Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593BA539E3B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 09:33:38 +0200 (CEST)
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwIrJ-00025X-9X
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 03:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwIn8-0008V6-5t
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwIn6-0005rj-I4
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654068555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rhAhJS7pdilL+5Tvz3JfPzKAQz4+POge+Hngh83xLCM=;
 b=Zsa/Wf1YZIdzDOJjeXWv7jpjG+8s71QVEXlDb6giGzuFAKJBTgaBJhU9QVJghurkJ0Jfk9
 o4eEjjUbwKczKRjDUx4qwBWSmzyg3BpOTBI32HAiVSgaZEn+cQtpgmae6STyPYmQu2sGOo
 XPdUT4+upgxRK7v3C1hxra/7gtn45L0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-TbhfPNzNMIKy5jH0c1fgjQ-1; Wed, 01 Jun 2022 03:29:14 -0400
X-MC-Unique: TbhfPNzNMIKy5jH0c1fgjQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a05600c4fc300b003946a9764baso2897863wmq.1
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 00:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rhAhJS7pdilL+5Tvz3JfPzKAQz4+POge+Hngh83xLCM=;
 b=rkj1A61z309/Vgqd8qh5QZaG52s1eeK8IL868RW1VCApMv7xtGNF31AhnzJjAzCWX2
 HQaBFBSoQMGF7k+qu4FbzPbtij8PycCrN/yGPP3rqVFrUGgPH6SH4JQlpqM3kxsZQgG8
 a5Zk5fnb3RWrZYdfEsWqcZOGcL0BxwVLusEaqe3fpTdu38dlSzu9NcuCg4ZKncIYZmFf
 7i82gtOS/7obJhS3P8+9prqEtYBliokO3G+feRsSCcJWJTQgJFepktlTZJwKTMu114S1
 l6y9K3Qdp3hd2H8GR/mcy0jjjB43HHOoV92TN+kIHtlQYoaEhhWEDE/Z+5gVoV/HSu7s
 Yf4Q==
X-Gm-Message-State: AOAM531lCP5BasfJHk3uTGb6y8dRe43Qbxrg5nSffwCwgdQAX59oVBa7
 2q2Tp8311GyFEPKk4ecfTs1ZFJ4fG5o9O9kxCxDr8e66NoTk/TEzt90VRg/XDke2YUi6b0+flD3
 qfDnjzBcS+gHn44Y=
X-Received: by 2002:a05:600c:2218:b0:397:3932:7c21 with SMTP id
 z24-20020a05600c221800b0039739327c21mr27226155wml.44.1654068553630; 
 Wed, 01 Jun 2022 00:29:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw40GGvw73pke77WueNvxiIckhaASVu3bffhnVbO0F0oNxT5RCIB04JL1bfyVgppjNV7zFjrA==
X-Received: by 2002:a05:600c:2218:b0:397:3932:7c21 with SMTP id
 z24-20020a05600c221800b0039739327c21mr27226139wml.44.1654068553429; 
 Wed, 01 Jun 2022 00:29:13 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b0039744bd664esm4598938wmq.13.2022.06.01.00.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 00:29:12 -0700 (PDT)
Message-ID: <67280754-2b19-c9e4-1b7c-2a22348915ae@redhat.com>
Date: Wed, 1 Jun 2022 09:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 8/9] tests: add python3-venv to debian10.docker
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
 <20220526000921.1581503-9-jsnow@redhat.com>
 <3a0913d7-c148-2619-bdee-7f70b091a6a9@redhat.com>
 <CAFn=p-bnd54uvF38Xqexi9T+P0CHo1seLYoBpwCi2V0e-unkSg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFn=p-bnd54uvF38Xqexi9T+P0CHo1seLYoBpwCi2V0e-unkSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 31/05/2022 20.28, John Snow wrote:
> On Mon, May 30, 2022 at 3:33 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 26/05/2022 02.09, John Snow wrote:
>>> This is needed to be able to add a venv-building step to 'make check';
>>> the clang-user job in particular needs this to be able to run
>>> check-unit.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>    tests/docker/dockerfiles/debian10.docker | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
>>> index b414af1b9f7..03be9230664 100644
>>> --- a/tests/docker/dockerfiles/debian10.docker
>>> +++ b/tests/docker/dockerfiles/debian10.docker
>>> @@ -34,4 +34,5 @@ RUN apt update && \
>>>            python3 \
>>>            python3-sphinx \
>>>            python3-sphinx-rtd-theme \
>>> +        python3-venv \
>>>            $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
>>
>> Note that we'll (hopefully) drop the debian 10 container soon, since Debian
>> 10 is EOL by the time we publish the next QEMU release.
>>
> 
> Noted -- do you think it'd be OK to sneak this change in first and
> have you move the requisite to the new container? :)

I don't mind - whatever comes first ... I just wanted to make you aware that 
there might be conflicts ;-)

  Thomas



