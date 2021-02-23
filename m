Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED8323116
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 20:01:33 +0100 (CET)
Received: from localhost ([::1]:45326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcw6-0006Z4-Sm
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 14:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEctV-0005lh-0U
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:58:49 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEctT-00056M-C5
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:58:48 -0500
Received: by mail-ej1-x62a.google.com with SMTP id n20so10177011ejb.5
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y0rV3nLkNtLf/FoAdGRCjQbLVdC5Hapw/g2M3flHqiE=;
 b=kTNEaFd9WIvOVvG2PcNyaKpmxCtA3C8//vvMM/a4Y4h2VPB99txI4WfRd3/B6/wJcV
 G8saBjdz5HV7/oxK4SVHgFVWuH5Bt5tcGgfbdY7nAq08L6BlpzddaI7xP7KK/cQzCiXt
 EsfcQuqHZzu0asflfldoSpiZUNXu7vHWmSUoguI/o4slLdtBDaevuPEvOLjOAA1Hm+6L
 wnb+Y2m5PfOqkN3ryt0eNbkO1T/X9wBD91k+nl7YKHSE/8x+qQstETv9bCaTvbGA8c1e
 J0nU9HoGSl4CH/+9bqyvyd4DuVwhsBi1lXXtR+ShzM2bJcndjK9S4QYdxs3MraEhmZfQ
 XmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y0rV3nLkNtLf/FoAdGRCjQbLVdC5Hapw/g2M3flHqiE=;
 b=kqu/pj6cw66lduNt9B59W7V3sq41rNFI4XMmK8dXLwCZzq/wq9FOhBNW7x5EWLcsT+
 J/Ds2gWw/lLmninF/ZZszpIpHwl6k667JMALdv+2q11wiMcApEhnrUw8UG/cNnVI/fin
 u+9v172BCKGT5CYh0owQ2I6ZfyM6yWJawuWnKmD1eRM3whg2IRkBCz0+G7cp5hB5YLwQ
 UXVEKvigc/DU9soCUQRfR/sEHullw2kp5iZGyqjbAkyfQJgR9zogvxAo6fAOfbqPvnX2
 DL185uqJCGdsN9agtanjNwLF4QzlgFSSIv2qaWLsNcuI7wsHEj4XUIL3+SJPXkeKi41J
 HvqQ==
X-Gm-Message-State: AOAM532VbjniM7KQz1tDXoRrX8myVCswHijqoDAmn2lXp0qCJHt8nyxe
 SM1aWeCEoXExobL4XqGVqpg=
X-Google-Smtp-Source: ABdhPJzroerOICAVMEzMIyvVuWkFfT4tuX01ku9sYkGE6S3N9QlTNXnmQc6vRd6ZaOxR5EIO754Y8g==
X-Received: by 2002:a17:906:3916:: with SMTP id
 f22mr27648450eje.328.1614106725929; 
 Tue, 23 Feb 2021 10:58:45 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b17sm13257652ejj.9.2021.02.23.10.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:58:45 -0800 (PST)
Subject: Re: [PATCH] tests/docker: Use --arch-only when building Debian cross
 images
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210223170910.2916721-1-f4bug@amsat.org>
 <87sg5m3af7.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6c21c83-cf5d-c05f-cee7-27bf74d06cdc@amsat.org>
Date: Tue, 23 Feb 2021 19:58:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87sg5m3af7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 7:28 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> When building a Docker image based on debian10.docker on
>> a non-x86 host, we get:
>>
>>  [2/4] RUN apt update &&     DEBIAN_FRONTEND=noninteractive eatmydata     apt build-dep -yy qemu
>>  Reading package lists... Done
>>  Building dependency tree
>>  Reading state information... Done
>>  Some packages could not be installed. This may mean that you have
>>  requested an impossible situation or if you are using the unstable
>>  distribution that some required packages have not yet been created
>>  or been moved out of Incoming.
>>  The following information may help to resolve the situation:
>>
>>  The following packages have unmet dependencies:
>>   builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
>>                    Depends: gcc-alpha-linux-gnu but it is not installable
>>  E: Unable to correct problems, you have held broken packages.
>>
>> Fix by using the --arch-only option suggested here:
>> https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1866032/comments/1
>>
>> Suggested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/docker/dockerfiles/debian-all-test-cross.docker | 2 +-
>>  tests/docker/dockerfiles/debian10.docker              | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
>> index dedcea58b46..593b7ef1023 100644
>> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
>> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
>> @@ -11,7 +11,7 @@ FROM qemu/debian10
>>  # What we need to build QEMU itself
>>  RUN apt update && \
>>      DEBIAN_FRONTEND=noninteractive eatmydata \
>> -    apt build-dep -yy qemu
>> +    apt build-dep --arch-only -yy qemu
> 
> This is just going to fail later on when you discover the cross
> compilers are only packaged for amd64.

Yes, I wonder if this is a Debian bug (we can still install cross
gcc for the host target -- which is pointless) and the cross libc.

> Perhaps we need to mark this one as amd64 only somehow?

OK.

>>  
>>  # Add the foreign architecture we want and install dependencies
>>  RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
>> index 9d42b5a4b81..d034acbd256 100644
>> --- a/tests/docker/dockerfiles/debian10.docker
>> +++ b/tests/docker/dockerfiles/debian10.docker
>> @@ -32,6 +32,6 @@ RUN apt update && \
>>          psmisc \
>>          python3 \
>>          python3-sphinx \
>> -        $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
>> +        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep
>>  '[all]' | cut -d\  -f2)
> 
> This bit is fine, without the all-test-cross change:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 

