Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292842356E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 03:26:54 +0200 (CEST)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXvhs-0007uy-PS
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 21:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXvgG-00079x-Tg
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 21:25:13 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXvgF-0001p2-0u
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 21:25:12 -0400
Received: by mail-pg1-x529.google.com with SMTP id r201so996377pgr.4
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 18:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=62+YswJJE86NsayvXvEIF8WIoIP8ABbidkBAW0gQkao=;
 b=EGdmFLlOKTLeONNqHI5vWZnDxmRC3wyE3Y18us4+ZLYuWmLSaN3qECoq3n9ezGnZqE
 MStl7LqWGUHmKl/Vi69u2/WPLbP8TzBZtW9sXkfCVplxXdKnmCKIMkvdQokqr9KHfg4E
 APjW84R+fXRsf1QEkRPeIkFiqA7TeR3PSp0JRX43mlKh50jGLN5ivfT6C2POfMouhXFh
 m05ohDyu7WgVesvfqlVjhV73TgjdwMHj7ytaKdGxL71HLkoypwa4cwNykfOJ34rgGNl3
 TNE7w0kU4Wz2Y1zwW+w7AizkVq+VIg161g2xqE9R1fN/uHybL9H3gqIlAdVtgWvAENtL
 QdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=62+YswJJE86NsayvXvEIF8WIoIP8ABbidkBAW0gQkao=;
 b=sahmdgAPi53foHndtzj9yQJd8LeesNQLLTqGiTRitbn52X35tKpWqP3fCOb8E1XmwU
 J21kC1HPWdcfxhEiVQdqNWSvaRWVnG0TjZHrwL9JVfSXvgftAMPtxg7vyjIX1yMzA2ub
 gSYwPW3e0FCFpT1vjcInsLIvLACaz8v5WCtjdnueoN4dqcF1GcbJH8VM3tkyBNEBnWJi
 D6WZo0XDN0d+TUzWJOo8uZj/axPF3p07lWhgklOfmcnvLzX7HJQJ3Pp5oLu59+iYa/cH
 mUrdyuB00pMVHL4hG07ct+/6lBhEQGgPZLMux4SCGSOV0V4Xfp6RlgsOcWSdRjJ7bDdd
 /8sw==
X-Gm-Message-State: AOAM532H56x6tED4PitSnt8LCihQPtvX4B0uRX86BGZyeV+NvVj2Wya9
 bsdWc96C6Zjnk1pXzjedE+dCoQ==
X-Google-Smtp-Source: ABdhPJxS1lIuftVDKAHfl72Z74iNUwY1jyLl97SuyIbhjucNR0Ljxc4tVdszXF5ZNcZ1mR4zMkeexA==
X-Received: by 2002:a63:4344:: with SMTP id q65mr18679354pga.450.1633483509136; 
 Tue, 05 Oct 2021 18:25:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s10sm3140694pjn.38.2021.10.05.18.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 18:25:07 -0700 (PDT)
Subject: Re: [PATCH] tests/docker/dockerfiles: Bump fedora-i386-cross to
 fedora 34
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211005205846.153724-1-richard.henderson@linaro.org>
 <2499dfbd-e037-cc31-3004-3517bbbd9b31@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6081eb6a-f78f-c224-9f44-2d716d30cfd5@linaro.org>
Date: Tue, 5 Oct 2021 18:25:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2499dfbd-e037-cc31-3004-3517bbbd9b31@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 3:16 PM, Paolo Bonzini wrote:
> On 05/10/21 22:58, Richard Henderson wrote:
>> For unknown and unrepeatable reasons, the cross-i386-tci test has
>> started failing.  "Fix" this by updating the container to use fedora 34.
>>
>> Add sysprof-capture-devel as a new dependency of glib2-devel that
>> was not correctly spelled out in the rpm rules.
>>
>> Use dnf update Just In Case -- there are presently out-of-date
>> packages in the upstream docker registry.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tests/docker/dockerfiles/fedora-i386-cross.docker | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker 
>> b/tests/docker/dockerfiles/fedora-i386-cross.docker
>> index 820740d5be..f62a71ce22 100644
>> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
>> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
>> @@ -1,4 +1,5 @@
>> -FROM registry.fedoraproject.org/fedora:33
>> +FROM registry.fedoraproject.org/fedora:34
>> +
>>   ENV PACKAGES \
>>       bzip2 \
>>       ccache \
>> @@ -20,10 +21,11 @@ ENV PACKAGES \
>>       pcre-devel.i686 \
>>       perl-Test-Harness \
>>       pixman-devel.i686 \
>> +    sysprof-capture-devel.i686 \
>>       zlib-devel.i686
>>   ENV QEMU_CONFIGURE_OPTS --cpu=i386 --disable-vhost-user
>>   ENV PKG_CONFIG_LIBDIR /usr/lib/pkgconfig
>> -RUN dnf install -y $PACKAGES
>> +RUN dnf update -y && dnf install -y $PACKAGES
>>   RUN rpm -q $PACKAGES | sort > /packages.txt
>>
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> I would say, go ahead and apply it to the tree directly to unbreak CI.

Done.  CI is now green again.


r~


