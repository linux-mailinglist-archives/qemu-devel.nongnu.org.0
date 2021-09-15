Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD92340CB35
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:50:18 +0200 (CEST)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQY6z-0002av-QQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQXpd-0006HV-B9
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:32:21 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQXpZ-0005lr-NV
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:32:21 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 c13-20020a17090a558d00b00198e6497a4fso5345143pji.4
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0V6YWnUnmZ1ddwbsVZtFS6SjTitdtj8tFr2hA4pH/g8=;
 b=XqdXY+oxjinyFiyDwayIcutVHRuNHE+fHQ104r2uD/nypFWyUGpZdkQPCnnKO2xW4N
 /Dc3kbfwxZnc5W2lXi1EPJ+MLPAgYAmzqKKcRyOFSgQMjoxQt4V561Sax8aqksGAQ35A
 0w3qEEWhAgSeYoj+ItO0kbN8MxIn70zcuoDS7DXvVezZNOwNjDS92uK7uPdYD7uSY1kb
 FMumvjRBk1XPT29xEgDCDNm1R7u4phJpeO/5rC+M5bvNrcnKnnjB6u79drpFK4t2ti6Z
 eXxKOjyDyJ0I9pKh+Yng/LhxoAq9TqF0LNkb4PldYlPaawzcCTRtxURVuyGRO2TPEAaA
 nvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0V6YWnUnmZ1ddwbsVZtFS6SjTitdtj8tFr2hA4pH/g8=;
 b=G7qfID2q4XlzhhD1SzWDrLsa+S/r+5xlSRa0mrh1NJdnBlO4q3C5V3pXd1lglUx3Sa
 3QnAgEiRIF6qddWjf/u//6s1gW4OkzGVd+otm4RLz0yIkYgH0hziC5MM4Rsngr07b1CR
 yATdb23p+/eFJltZi0nk+Xhehkigap7gwJk2QEElqYjW3ompNrI9MyxWFbd7yP3PH+9R
 9MBxQLP/EOJiGH8E1dqFaLsa8N6kesqNmYeA6Ofu5+OSkByW5qFPg95gZcYyrbB6B53Q
 tojyMhElivlV5oY9ddV8WiQtktqIlN2q2BDA3I65I6vi7Jq+qbcYkvLMqwDfPgUTokjp
 JM9Q==
X-Gm-Message-State: AOAM532kgx7R3IYPJckKL99/r6x/x2HVikw88HsORMVVejQQd787DVIu
 g17mK4U9DrIgZtrDHfHdJ6E0XA==
X-Google-Smtp-Source: ABdhPJzeLb+1s5U6GYog0dXu2ZlLUXsA64w9GXpF85GAMg5vlvxHXvFFd1upq0j1a7rKBHxFl8Gfaw==
X-Received: by 2002:a17:902:e790:b0:12c:c0f3:605c with SMTP id
 cp16-20020a170902e79000b0012cc0f3605cmr494645plb.70.1631723536106; 
 Wed, 15 Sep 2021 09:32:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d22sm432169pgi.73.2021.09.15.09.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 09:32:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: Add cross-riscv64-system, cross-riscv64-user
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-3-richard.henderson@linaro.org>
 <a3c943e1-a303-7ff8-19ab-4aef67259706@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c50f761c-1199-00d3-3016-6329c2c017ca@linaro.org>
Date: Wed, 15 Sep 2021 09:32:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a3c943e1-a303-7ff8-19ab-4aef67259706@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.698,
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
Cc: willianr@redhat.com, thuth@redhat.com, alex.bennee@linaro.org,
 wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 8:03 AM, Philippe Mathieu-Daudé wrote:
> On 9/14/21 8:58 PM, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index f10168db2e..0fe4a55ac5 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -124,6 +124,20 @@ cross-ppc64el-user:
>>     variables:
>>       IMAGE: debian-ppc64el-cross
>>   
>> +cross-riscv64-system:
>> +  extends: .cross_system_build_job
>> +  needs:
>> +    job: riscv64-debian-cross-container
>> +  variables:
>> +    IMAGE: debian-riscv64-cross
>> +
>> +cross-riscv64-user:
>> +  extends: .cross_user_build_job
>> +  needs:
>> +    job: riscv64-debian-cross-container
>> +  variables:
>> +    IMAGE: debian-riscv64-cross
>> +
> 
> Pending discussion on patch #1 of this series, I believe
> this job is likely going to fail, so must use the
> 'allow_failure: true' tag or something else (manual?).
> Meanwhile this is sorted out:
> NAcked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

My only question is whether it's the image creation step that should be allowed to fail. 
If the dpkg deps weren't so broken as to not install, I *think* we should be able to rely 
on the result for the cross-build.

At least that's how I'd prefer to arrange things, if it works...

r~

