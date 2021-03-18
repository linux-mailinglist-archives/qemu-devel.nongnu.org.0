Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F914340332
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:29:32 +0100 (CET)
Received: from localhost ([::1]:48706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpuF-0007bS-CK
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMpsw-0006Fn-TE
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:28:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMpsv-00046M-4a
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:28:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id 61so4898294wrm.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z2IXIQs4wz8QvfCtiMLR726r3KgsRNr+T8I2YyRGyoY=;
 b=ZImTLAsaoqvHAFB7bWoyaxO2VqszcuMmhl2IWiuyU6RRRe3v8LINn0ZkRlv9Hj39Uy
 rSeFQFXBXEFaaxdycsMdQsxN7uL92fxWDx5BIcoj9TLXgHseqIoVVemZPcYr/LgU+V1M
 FcDNvouzV8NFz36cJepe0QoXXt8xs0am0LYkuduj5q3uORoENzLa8QWMduVrYkL1aWDL
 SvYu4DpTzfueQXeT7oUGnBF80XotSsXMi4Mxj+eog+MGs6dCCvEHBj8SgRUfbeo2bBvc
 XmNaBl9Gy62Cv2KPZ7hFJGjFhcSgIUBaDkgTnZw7z1ZImk6SBar61sNqt8UBA8/YN4aA
 ewGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z2IXIQs4wz8QvfCtiMLR726r3KgsRNr+T8I2YyRGyoY=;
 b=DHfni5E7GJhPv6LSdCGJ8NY+akObuU1o6yNKiTGuGI0YfjYP1u7x8m+XN8i+l0sMjL
 P/a5dcRpx2a5T1eCttbJwZFUdOW7ryprVfLRd3sn/liYYzKHsh8hdBKw8gW/U6fwejI4
 hDf2obRJ6jmyOlgxbIIZW+Z9INtu1W1hQMOghlILovMdKdFM7U+hvcg4Ydm7CcH/pvPL
 3vSjGE4nVNjnc+0EGwXDWXESdzBxr+hu5zBpslXw+GxPU81+lYgz9RNswJLYFqdc7Nsx
 k1L+5CBf9veKnwt/4hyLqesDg51jsqIqyNgH27F747aRmZgdpthH4ADXXU9P+fhwJfng
 Oc5A==
X-Gm-Message-State: AOAM533bs7cEa7Vw0QWLRpgfZCLi0LS184jJ0qKbK7Cyth4GReHvdBRM
 EzF42Pz0hzKJWdjCRl399IA=
X-Google-Smtp-Source: ABdhPJweIZixgN5YCmysZjyO4wjrcbnCKk7u9OOrkaTd3av6+AgJZHX5J0uZPCrZvG1NvKWTprY1wg==
X-Received: by 2002:a5d:4bcd:: with SMTP id l13mr9106096wrt.56.1616063287730; 
 Thu, 18 Mar 2021 03:28:07 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v18sm2457750wrf.41.2021.03.18.03.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:28:07 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFMegwL6SXX2/+kZ@redhat.com>
 <8c804b8a-fc98-0619-21e5-cc5dfe7d4567@amsat.org>
Message-ID: <71126451-6901-6a20-c1c4-8aee71eb874e@amsat.org>
Date: Thu, 18 Mar 2021 11:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <8c804b8a-fc98-0619-21e5-cc5dfe7d4567@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 10:50 AM, Philippe Mathieu-Daudé wrote:
> On 3/18/21 10:33 AM, Daniel P. Berrangé wrote:
>> On Wed, Mar 17, 2021 at 09:29:32PM +0100, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> For some (unclear) reason I got my free tier Gitlab account renewed and
>>> lost the privilege for users opening account before the quota limit.
>>>
>>> I pushed a single branch to my namespace repo to trigger a pipeline.
>>> 1h later I was surprised to see the pipeline was stuck, having completed
>>> 99 jobs of 119. Looking closer there is a red comment on top of the
>>> pipeline:
>>>
>>>  philmd has exceeded its pipeline minutes quota. Unless you buy
>>>  additional pipeline minutes, no new jobs or pipelines in its projects
>>>  will run. [Buy more Pipelines minutes]
>>>
>>> So I exhausted my 400 monthly minutes credit.
>>>
>>> From this FAQ:
>>> https://about.gitlab.com/pricing/faq-consumption-cicd/#managing-your-cicd-minutes-usage
>>>
>>> Q. What happens if I hit the CI/CD Minutes allotted limit and forget to
>>> purchase additional CI/CD Minutes?
>>>
>>> A. You will not be able to run new jobs until you purchase additional
>>> CI/CD Minutes, or until the next month when you receive your monthly
>>> allotted CI/CD Minutes.
>>>
>>> Q. Will I be notified before I hit my limit on CI/CD Minutes?
>>>
>>> A. You will receive notification banners in-app when your group has less
>>> than 30%, 5% or exceeded your total allotted CI/CD minutes.
>>>
>>> I indeed received 3 warnings in 7 minutes.
>>>
>>> Now I'm having serious doubts about Gitlab usefulness for the QEMU
>>> community...
>>
>> Per the discussions in the related Forum postings about CI limites, the
>> 400 minute limit is still only intended to apply to projects that are
>> marked as private.  Public projects are not even being tracked for
>> accounting, let alone have a limit enforced. They also said they want
>> to make sure they don't impact ability of users to contribute to OSS
>> projects hosted on GitLab that require use of CI.
>>
>> It feels like what you hit here is fallout from your account accidentally
>> getting blocked, rather than something which is hitting every contributor
>> to QEMU. Did they restore projects as private perhaps ?
> 
> Yes my repository was restored as private and I had to switch it to
> public. I'll try to blew everything (after backing it up) and recreate
> it as public from start, and see if I get the unlimited minutes back.

You were right, I forked the project again as public and can run CI
pipelines. I note this is different that my previous account, I am
restricted at 15 jobs at a time, so this is slower.

A also added '##.gl-alert-danger.gl-alert' rule to uBlock Origin plugin
to remove the annoying big red panel saying I'm out of minutes and have
to buy more.

💔

