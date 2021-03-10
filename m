Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20C333FB4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:56:01 +0100 (CET)
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzJg-000369-U5
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJzHP-00029g-V5
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:53:39 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJzHO-0004gV-16
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:53:39 -0500
Received: by mail-ej1-x62c.google.com with SMTP id bm21so38848670ejb.4
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 05:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J71h+J6XdwnAX2cEf8iwdCeQX2EGWDWwWV9LLG/+9Y4=;
 b=D+cg4XVnYfYa480YG1EJU6Eh4858mlNubgrAGJwN/KpoIV+MMmqPO+l+WWCo4uHQE/
 hIv0ZEDcFONQgn7nZ+pKQZRcGhkBQMNkXexsKgkyfb3rtrhw2ql50EgGW9FNz5ZcVEt6
 BmpjDsdJsvGvR/9usczIYQxIKna7CqO2QYY3nHB6Ryy/Mk6LkLKwe5GYPatQMmWlarfD
 qcYISRYzVqqIRXmyhsuBJfDjfc3GRcN+Cjnzk3OYd3aUWKkPNWs0WkDvJ8p0Zg7X2DUr
 uUOcV/8i/dRUl4cqoGcUnEPoRJrPDY8T0jrGlLoUP2YkYJ+u9Yx/vdy9lJg+dn04IC18
 aSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J71h+J6XdwnAX2cEf8iwdCeQX2EGWDWwWV9LLG/+9Y4=;
 b=J22Y4y/1+nebURb+7yzKiaTweVqBM0oKPC61QXS2MSDTMKR/uYYyGmmV0L4krqP2Fm
 skWIgAccpYuXdlsXSasDIBLp15do5YzMLpSt8j6gblymIdJ2n4C4VbQ63K7OjO+oPQMy
 ZF7+MMtP0iGpfu0bQYnXs0H05852I8znoLLJUxcF6cySzvT+hcV4sAG/p7/3SGDFdf2c
 wQsdKXoXDcu6RjOBT+AFpcaDCtmnb+sYAGqzdQDS2Q3NQxAoLS2nd8YWWiHt/LOJEWnp
 DMa3WqKIH7LZn9aMPNCZFwdadeUf1WE48dfWIbdQzpUpFY0bwv2GDM1c/hZFQK4ymrD1
 mrGQ==
X-Gm-Message-State: AOAM532r1ePRVEgOu9krbW806yL9IQVLAhacCK2tV7ZRwYCxv9FmMM6F
 ddiThoOLjo5OEpOW7NY6GC8TPoVsZOw=
X-Google-Smtp-Source: ABdhPJxKrZHGRQkMLdX+MR+sM7UVoXIFw0Gz1fl5bKUqQae5xe84o6Iqb/j+tTZ3JVGZOeO3Q4L6vQ==
X-Received: by 2002:a17:906:7102:: with SMTP id
 x2mr3782580ejj.355.1615384416165; 
 Wed, 10 Mar 2021 05:53:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id kj3sm10121781ejc.117.2021.03.10.05.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 05:53:35 -0800 (PST)
Subject: Re: [PULL 00/18] testing, docs, semihosting move and guest-loader
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <CAFEAcA9d01LaFRW=NnqivAMCsxPUbRP8kqOuL0i=P3o42tSZEg@mail.gmail.com>
 <87czw78f0d.fsf@linaro.org>
 <CAFEAcA-DmTGgAgpwocj5vO9W0E9RFtbdvO0DVThSa47S=yPJvA@mail.gmail.com>
 <877dmf87az.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92f99bfb-82db-67f2-290c-a7b1ee3d536b@amsat.org>
Date: Wed, 10 Mar 2021 14:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <877dmf87az.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 2:27 PM, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Wed, 10 Mar 2021 at 10:44, Alex Bennée <alex.bennee@linaro.org> wrote:
>>> And then I get the same failure as you. Can you confirm the docker
>>> version you have now?
>>
>> e104462:bionic:qemu$ docker version
>> Client:
>>  Version:           18.09.1
>>  API version:       1.39
>>  Go version:        go1.10.6
>>  Git commit:        4c52b90
>>  Built:             Wed Jan  9 19:35:23 2019
>>  OS/Arch:           linux/amd64
>>  Experimental:      false
>>
>> Server: Docker Engine - Community
>>  Engine:
>>   Version:          18.09.1
>>   API version:      1.39 (minimum version 1.12)
>>   Go version:       go1.10.6
>>   Git commit:       4c52b90
>>   Built:            Wed Jan  9 19:02:44 2019
>>   OS/Arch:          linux/amd64
>>   Experimental:     false
> 
> I swapped out the snap docker for the docker.io package from the
> repository but it's still a newer version than yours:
> 
>   13:25 alex@bionic/x86_64  [user.static/testing/next] >docker version
>   Client:
>    Version:           19.03.6
>    API version:       1.40
>    Go version:        go1.12.17
>    Git commit:        369ce74a3c
>    Built:             Fri Dec 18 12:21:44 2020
>    OS/Arch:           linux/amd64
>    Experimental:      false
> 
>   Server:
>    Engine:
>     Version:          19.03.6
>     API version:      1.40 (minimum version 1.12)
>     Go version:       go1.12.17
>     Git commit:       369ce74a3c
>     Built:            Thu Dec 10 13:23:49 2020
>     OS/Arch:          linux/amd64
>     Experimental:     false
>    containerd:
>     Version:          1.3.3-0ubuntu1~18.04.4
>     GitCommit:
>    runc:
>     Version:          spec: 1.0.1-dev
>     GitCommit:
>    docker-init:
>     Version:          0.18.0
>     GitCommit:
> 
> So I guess somehow we've regressed something that doesn't work on the
> older version on your system. I can't recreate anything like your
> failure unless I switch to the snap version (which I think is related to
> visibility of file-systems from the snap) so perhaps we just need to
> detect that somehow and disable docker support?

Why is Peter's Docker trying to rebuild the downloaded image?
Is it something the docker.py script is doing (like final step)
that invalidate the cache?

Peter, just to remove one variable from the equation, your system
RTC is correct?

Alex, why not simply remove the 2 Hexagon patches from your pullreq
until we figure this out?

Phil.

