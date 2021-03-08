Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B119331743
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:29:34 +0100 (CET)
Received: from localhost ([::1]:37824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLZN-00061z-Ec
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJLIX-0006UK-9i
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:12:10 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJLIT-000791-8S
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 14:12:06 -0500
Received: by mail-ed1-x530.google.com with SMTP id v13so16339096edw.9
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 11:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jtO6+tu29GfTHSaCAwtutLrpHxlNLEaq3CVTH4ng7DY=;
 b=kt9f69qy0ezdGWJ3ru6/BYjpgXQi/x0M9RNHi/rSJWgFMxuIo7ZhoyWEvMDmO3IpHN
 ftp4IRZWpLPRVaAi1X3JRSNhhKol9rERu58HDNWX3jCqKWLKJzHh5F1OhmmyrTs1QrvI
 FTDtEFMEHQM2aIaQtXSATERNrN27tkH8pbH64kB3THW/h0B8Mq648I7Qj5g8KMu9or8q
 MB/PrTQMZJqmEvPgCWNZSF3NFrOk6/7xNDTEz2H5lEA1wp2/fZJU8jm5xWDseZuwJ4q/
 Ey/JvXL0pYhjG9wR15QO5xI0Mi7VmMfcKVtheywjbbG8yx5d8glUUZ5zSHl2eoYz5j6D
 fcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jtO6+tu29GfTHSaCAwtutLrpHxlNLEaq3CVTH4ng7DY=;
 b=Hhb0npKZuckEWz2M3KTXSVpgCQf3WyIL7ssh4DpwMWFUbKFhZDd7trmZBQ734Q6P9W
 384jMME8/xARymBuwP7U7/wsRpmK7rA8ofB0vfmWqN2hGlXr/Moc1IsxP1dQM8K8ormm
 /XH83F+lyzdnqJ5n0H0PtHrBLxzupEQtcRtc75AKHI3uKnFDVG+M3z3qI7xJLplXpmCt
 1bkOCTEUtpmRW077ol05t4/I4tW6g1E6ZrXJ9xOLZeF51jaHxKfiKrkYtOKpEPKWcq8+
 yNsYE1DSZeDeL0AWByzFcUt5XBC4HD6s3xI4lf+u3RcMc1UB8YJ8PE2tu/kfR5zj5Bm+
 nTQQ==
X-Gm-Message-State: AOAM532dm3bGORpfrxMWyvNuKp2MmI+wdNKvVskvvsjbH6e/xCDWqckk
 l8L5lupxrITVNotTOex6leU=
X-Google-Smtp-Source: ABdhPJwk0g+RfArLwOdQpRauw0BaZq9U2AeXU0qKWDStySn1y/8aLu3X9ZPYyDdeHa6iC78Ox+dEEw==
X-Received: by 2002:a05:6402:304b:: with SMTP id
 bu11mr68529edb.157.1615230723227; 
 Mon, 08 Mar 2021 11:12:03 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v12sm7275336ejh.94.2021.03.08.11.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 11:12:02 -0800 (PST)
Subject: Re: [PATCH v2] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
To: Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210308154633.158915-1-thuth@redhat.com>
 <CAKJDGDYOivmpA+qS-ZM7m68GudUKkwM=wCgA3feV8WKuT=dqFQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <28f6cfdf-f83f-efdb-cccf-a57195ed34de@amsat.org>
Date: Mon, 8 Mar 2021 20:12:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDYOivmpA+qS-ZM7m68GudUKkwM=wCgA3feV8WKuT=dqFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 6:49 PM, Willian Rampazzo wrote:
> On Mon, Mar 8, 2021 at 12:46 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> The status of the gitlab-CI files is currently somewhat confusing, and
>> it is often not quite clear whether a patch should go via my tree or
>> via the testing tree of Alex. That situation has grown historically...
>> Initially, I was the only one using the gitlab-CI, just for my private
>> repository there. But in the course of time, the gitlab-CI switched to
>> use the containers from tests/docker/ (which is not part of the gitlab-CI
>> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
>> completely for the repository and will soon use it as its gating CI, too,
>> so it makes way more sense if the gitlab-ci.yml files belong to the people
>> who are owning the qemu-project on gitlab.com and take care of the gitlab
>> CI there. Thus let's merge the gitlab-ci section into the common "test and
>> build automation" section.
> 
> Makes sense to me.
> 
> Acked-by: Willian Rampazzo <willianr@redhat.com>
> 
>>
>> While we're at it, I'm also removing the line with Fam there for now,
>> since he was hardly active during the last years in this area anymore.
>> If he ever gets more time for this part again in the future, we surely
>> can add the line back again.
>>
>> Now to avoid that Alex is listed here alone, Philippe and I agreed to
>> help as backup maintainers here, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  v2: Keep Philippe and myself as maintainer instead of reviewer
>>
>>  MAINTAINERS | 21 +++++++--------------
>>  1 file changed, 7 insertions(+), 14 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 26c9454823..5c4c179abb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h
>>
>>  Build and test automation
>>  -------------------------
>> -Build and test automation
>> +Build and test automation, Linux Continuous Integration
>>  M: Alex Bennée <alex.bennee@linaro.org>
>> -M: Fam Zheng <fam@euphon.net>
>> -R: Philippe Mathieu-Daudé <philmd@redhat.com>
>> +M: Philippe Mathieu-Daudé <philmd@redhat.com>
>> +M: Thomas Huth <thuth@redhat.com>
>> +R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> 
> Feel free to add me as a Reviewer: Willian Rampazzo <willianr@redhat.com>

Thank you Willian! :)

