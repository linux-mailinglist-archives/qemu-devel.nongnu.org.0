Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B54382020
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 19:08:05 +0200 (CEST)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liKFH-0004Ww-In
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 13:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liKD6-00030b-VY; Sun, 16 May 2021 13:05:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liKD4-0005pI-Ve; Sun, 16 May 2021 13:05:48 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v12so4014150wrq.6;
 Sun, 16 May 2021 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F6GWTDNVPwLi8KzHyu5P6sLj6Ryz9PtZMWjQtp08sls=;
 b=aD/GpyZaF1TH+k5USvdl5dRb24LZT1GIECZoI3J9t6j2eLQAPKVnaP7lbc83GO9zTH
 1jBb9QveTljQzRPkniBKhjcqZGZ6g7hVEkYOg373tozfgtLsZf7FSMxfAdNS53O0FfwZ
 0uoWCofpgXnhMjrvcTayEcZUK6r5znYIhB3qp0fv98LrmEvFwGNYuHS2ib4aLWmbdMsa
 n6DaQDgFg8/224pZnO+G6U3NIxEscwAS46wDHVlr+9vb/OpVkPWdKdTVY+AYHtojL6Ty
 erd7W5PBkx0RFXl9Nv/g0QI2wiFObbq7Qw75VNBEDUNrftfc2zp5sGhjM0T8TMbwUZKj
 VGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F6GWTDNVPwLi8KzHyu5P6sLj6Ryz9PtZMWjQtp08sls=;
 b=Nuo+3ox8x1UbXIlvZJiqHOckCzjjRfJ2BVtZ7U0gzGrAr6XMZbCdtScwLA18vwaywD
 8fdSpN0Mk3L4XovJPls/MEaLUzdxPAsufp7FNC4YpPYDe9I0/PeyFFNpgyhTIxxpeDQ5
 1bMRchSgYuPNxzo7LIlr5lf8k7dnDFe6aAiCl1g41qQ4e6DQUE7NZxG3ZexMmSIMcb67
 ae2mKPkXacA8HHM9Sk0sz3Zd3Z4WkJeYOOy5TnaY5rIxM0hobmLPz5matK9ebd18F/bG
 czKZK3AJBWY/2X9uFA9qYGYStJSNUdRaT9wJvyi63rgXgiA0EQ3CtNTKLtffNzvuyTj9
 JaoA==
X-Gm-Message-State: AOAM531b3psRvfDHXEGoiZMaVDWbIt9cPvvqPwlE+XR74KBQldDWfr8N
 haXullChQdEkZVRa8bu8W+I=
X-Google-Smtp-Source: ABdhPJz5yprmO6DUuT4eykSy9A3uyFxCsKA8MF6Jw4NpyFHCz1SjVK8wFQrQqRL7YoIwd7YsSY5Upw==
X-Received: by 2002:a5d:5301:: with SMTP id e1mr27521779wrv.36.1621184742096; 
 Sun, 16 May 2021 10:05:42 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f11sm17884608wmq.41.2021.05.16.10.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 10:05:41 -0700 (PDT)
Subject: Re: [PATCH] disas/libvixl: Protect C system header for C++ compiler
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210515183531.372925-1-f4bug@amsat.org>
 <6e79e8b4-32fd-da09-239a-0ebd085612f5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7b7a9f93-68fa-80b6-c276-e2554b55c739@amsat.org>
Date: Sun, 16 May 2021 19:05:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6e79e8b4-32fd-da09-239a-0ebd085612f5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/21 2:46 PM, Thomas Huth wrote:
> On 15/05/2021 20.35, Philippe Mathieu-Daudé wrote:
>> When selecting an ARM target on Debian unstable, we get:
>>
>>    Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
>>    FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
>>    c++ -Ilibcommon.fa.p -I. -I.. [...] -o
>> libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c
>> ../disas/libvixl/vixl/utils.cc
>>    In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
>>                     from ../disas/libvixl/vixl/utils.cc:27:
>>    /usr/include/string.h:36:43: error: missing binary operator before
>> token "("
>>       36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
>>          |                                           ^
>>    /usr/include/string.h:53:62: error: missing binary operator before
>> token "("
>>       53 | #if defined __USE_MISC || defined __USE_XOPEN ||
>> __GLIBC_USE (ISOC2X)
>>          |                                                              ^
>>    /usr/include/string.h:165:21: error: missing binary operator before
>> token "("
>>      165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
>>          |                     ^
>>    /usr/include/string.h:174:43: error: missing binary operator before
>> token "("
>>      174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) ||
>> __GLIBC_USE (ISOC2X)
>>          |                                           ^
>>    /usr/include/string.h:492:19: error: missing binary operator before
>> token "("
>>      492 | #if __GNUC_PREREQ (3,4)
>>          |                   ^
>>
>> Similarly to commit 875df03b221 ('osdep: protect qemu/osdep.h with
>> extern "C"'), guard the <string.h> system header with 'extern "C"'.
>>
>> Relevant information from the host:
>>
>>    $ lsb_release -d
>>    Description:    Debian GNU/Linux 11 (bullseye)
>>    $ gcc --version
>>    gcc (Debian 10.2.1-6) 10.2.1 20210110
>>    $ dpkg -S /usr/include/string.h
>>    libc6-dev: /usr/include/string.h
>>    $ apt-cache show libc6-dev
>>    Package: libc6-dev
>>    Version: 2.31-11
>>
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1914870
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> RFC because I've no idea about C++, but this fixes the build for me.
>>
>> Quick reproducer:
>>
>>    $ ../configure --disable-tools --target-list=aarch64-linux-user
>>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Thomas Huth <thuth@redhat.com>
>> ---
>>   disas/libvixl/vixl/utils.h | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/disas/libvixl/vixl/utils.h b/disas/libvixl/vixl/utils.h
>> index 5ab134e240a..fc28d7456c1 100644
>> --- a/disas/libvixl/vixl/utils.h
>> +++ b/disas/libvixl/vixl/utils.h
>> @@ -27,8 +27,10 @@
>>   #ifndef VIXL_UTILS_H
>>   #define VIXL_UTILS_H
>>   -#include <string.h>
>>   #include <cmath>
>> +extern "C" {
>> +#include <string.h>
>> +}
> 
> Could you please try to backport the upstream patch instead:
> 
> https://git.linaro.org/arm/vixl.git/commit/?id=78973f258039f6e96

Yes it works, thanks!

