Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA972FEC8F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 15:03:31 +0100 (CET)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2aYc-0002q9-CY
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 09:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2aWx-0002Dc-Ts
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:01:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2aWm-0000uv-4F
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 09:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611237693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPBvNsk39xkL/RosDa5LE9RiYLcLS5UZvoXorq6CJQc=;
 b=IrBK4h7kDGaZwWOQPUbCiCfobSCpudtDWFpcnOu+RC7msFSivpTzta/1ATjlvW1JLWqo/R
 UYNvjlKpGJGoJqR3loR9gcSevCbXLRH44p8Rcya+aQ/CDPIOS+IRtoItwfBOp2JA4g6LjU
 Yau5eQcYENIIPl6ManlNOBbeYboCH3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-zTOdCkp9MnO8WET3_bP9Sg-1; Thu, 21 Jan 2021 09:01:31 -0500
X-MC-Unique: zTOdCkp9MnO8WET3_bP9Sg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C70B1CC657;
 Thu, 21 Jan 2021 14:01:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 313695D9C6;
 Thu, 21 Jan 2021 14:01:18 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci: Test building linux-user targets on CentOS 7
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210121121505.1523156-1-f4bug@amsat.org>
 <59ac8f67-4e8b-f308-1308-497df09a1363@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b1c5d4c4-b026-5218-e72f-a1050c10111b@redhat.com>
Date: Thu, 21 Jan 2021 15:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <59ac8f67-4e8b-f308-1308-497df09a1363@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2021 14.14, Philippe Mathieu-Daudé wrote:
> On 1/21/21 1:15 PM, Philippe Mathieu-Daudé wrote:
>> Add a configuration tested by Peter Maydell (see [1] and [2])
>> but not covered in our CI [3]:
>>
>>    [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>>    FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>>    ../linux-user/strace.c: In function 'do_print_sockopt':
>>    ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undeclared (first use in this function)
>>             case IPV6_ADDR_PREFERENCES:
>>                  ^
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05086.html
>> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05379.html
>> [3] https://gitlab.com/philmd/qemu/-/jobs/977408284:
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   .gitlab-ci.yml | 7 +++++++
>>   1 file changed, 7 insertions(+)
> 
>> +build-user-centos7:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: centos7
>> +    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
>> +    MAKE_CHECK_ARGS: check-tcg

Ok ... just be aware of the fact that we might remove it again in some few 
months, since we then won't support CentOS 7 anymore (RHEL8 has been 
released in May 2019 and according to our support policy we will drop 
support for the previous version two years later, i.e. in May 2021).

> check-tcg calls build-tcg which fails:
> 
>    BUILD   TCG tests for x86_64-softmmu
>    BUILD   x86_64-softmmu guest-tests with cc
> /usr/bin/ld: hello: warning: allocated section `.notes' not in segment
> /usr/bin/ld: memory: warning: allocated section `.notes' not in segment
>    BUILD   TCG tests for x86_64-linux-user
>    BUILD   x86_64-linux-user guest-tests with cc
> /usr/bin/ld: cannot find -lpthread
> /usr/bin/ld: cannot find -lc
> collect2: error: ld returned 1 exit status
> make[2]: *** [threadcount] Error 1
> make[1]: *** [cross-build-guest-tests] Error 2
> make: *** [build-tcg-tests-x86_64-linux-user] Error 2
> 
> Apparently this is due to the -static flag:
> 
> $ gcc  -Wall -Werror -O0 -g -fno-strict-aliasing -m64
> tests/tcg/multiarch/threadcount.c -o threadcount  -static -lpthread
> /usr/bin/ld: cannot find -lpthread
> /usr/bin/ld: cannot find -lc
> collect2: error: ld returned 1 exit status
> 
> Do we need to install these packages?
> 
> glibc-static.i686 : C library static libraries for -static linking.
> glibc-static.x86_64 : C library static libraries for -static linking.
> 
> Or simply ignore testing?

If testing then succeeds, I think I'd prefer to add the package to the 
docker file.

  Thomas


