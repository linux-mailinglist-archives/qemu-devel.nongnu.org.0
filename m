Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDEA40FF17
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 20:19:29 +0200 (CEST)
Received: from localhost ([::1]:38674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRISO-0002bV-FH
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 14:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRIR5-0001wu-VN
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:18:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRIR4-0004lK-CR
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 14:18:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t8so9569049wri.1
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A8y4EBHha0A64DSGk5LVKQNgIubXEAiNf6j3rKP8Q2c=;
 b=B9847i+epaqBPhjKw2F1l8eR6iKMsRID3uWLfIkPsO5NgsyI4AgVLxZPhbmieLiQQZ
 d+8y6okDhoQWzRAHtrWtS+d/gqt2xTONKmzkKGtjXurJpYw3iFnpsCZLaVq9sHQNpgHx
 oD7fpog2hNrBh4izb8N+2vNb/Pv+LL/otcxFIBNyW/Ye4Gvyhbdqih+ev0sikPd7mLGN
 sStdsV7EAL//mHdD4FH1lehd0xkkPrzQSvX5zXmgg0jbyE3c9AOy/DHR8U3c1NwX+0tI
 fmthYvOBNsfnt2CC/v50jyFmPboMbHYEoQWrTv89MHr+Uyql9Rnv7WH7jfJdOI6FwftY
 4/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A8y4EBHha0A64DSGk5LVKQNgIubXEAiNf6j3rKP8Q2c=;
 b=nVxW2p0DNtb48a34tJ7XDVb5+4cT9Ik38NPBu3gfhk19lTrAUjE6MTxyQCcFHDiMzr
 RZJ2fPis5cnkkXNSuvGaThY6O42qir00bBBcRuOtJaYLvQeZwFpdmLRkaqiugSnETEnQ
 H6W6pSZ0XqzB396hRFXVoiuzTQXEwAXHrYkQZi4/GkL3/W1r5O9kI3lI13k75Ecu7osV
 7hFUKja8CHaSfc9ywmFy/jP75UFYy21zTkVRy3hQueEygTg1Fy+qjAiRXO/2V96XHeQL
 k+EQ0x0tm9Wuv/iKh4VxBeITF/wILvLbr0NaoACkDlHHla0y5fVHSwUTUO9Hx3QdH9vl
 T1Qw==
X-Gm-Message-State: AOAM532Md6AUe1C85z6g18/Qqf7ZEmvBJTV5KQawDEfa/r1X7H08sbyu
 E8/JbE01uHuB/+u3myzL//o=
X-Google-Smtp-Source: ABdhPJzqOHAXreKlV0pv9U/vyGIXHcnxSlGmcjbsrrk6da7u8iYAAKVOoJh0vgzWsplqeH3GYPUUiw==
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr13342575wrf.312.1631902684346; 
 Fri, 17 Sep 2021 11:18:04 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id g143sm11528433wme.16.2021.09.17.11.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 11:18:03 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: Add cross-riscv64-system, cross-riscv64-user
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-3-richard.henderson@linaro.org>
 <a3c943e1-a303-7ff8-19ab-4aef67259706@amsat.org>
 <c50f761c-1199-00d3-3016-6329c2c017ca@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1d57f75b-c330-0794-2bc6-77862918ccad@amsat.org>
Date: Fri, 17 Sep 2021 20:18:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c50f761c-1199-00d3-3016-6329c2c017ca@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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

On 9/15/21 6:32 PM, Richard Henderson wrote:
> On 9/15/21 8:03 AM, Philippe Mathieu-Daudé wrote:
>> On 9/14/21 8:58 PM, Richard Henderson wrote:
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
>>>   1 file changed, 14 insertions(+)
>>>
>>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>>> index f10168db2e..0fe4a55ac5 100644
>>> --- a/.gitlab-ci.d/crossbuilds.yml
>>> +++ b/.gitlab-ci.d/crossbuilds.yml
>>> @@ -124,6 +124,20 @@ cross-ppc64el-user:
>>>     variables:
>>>       IMAGE: debian-ppc64el-cross
>>>   +cross-riscv64-system:
>>> +  extends: .cross_system_build_job
>>> +  needs:
>>> +    job: riscv64-debian-cross-container
>>> +  variables:
>>> +    IMAGE: debian-riscv64-cross
>>> +
>>> +cross-riscv64-user:
>>> +  extends: .cross_user_build_job
>>> +  needs:
>>> +    job: riscv64-debian-cross-container
>>> +  variables:
>>> +    IMAGE: debian-riscv64-cross
>>> +
>>
>> Pending discussion on patch #1 of this series, I believe
>> this job is likely going to fail, so must use the
>> 'allow_failure: true' tag or something else (manual?).
>> Meanwhile this is sorted out:
>> NAcked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> My only question is whether it's the image creation step that should be
> allowed to fail. If the dpkg deps weren't so broken as to not install, I
> *think* we should be able to rely on the result for the cross-build.

We have multiple possibilities:

(1) Have all jobs depending on riscv64-debian-cross-container
    use 'allow_failure: true' (see commit d3a4e41da25 "gitlab-ci:
    Fix 'when:' condition in acceptance...")

(2) Use a working snapshot date, see commit b4048a7cd10 ("docker:
    Use a stable snapshot for Debian Sid")

(3) Manually push a built image to mainstream (qemu-project namespace)
    and have forks (try to build) or pull from mainstream

Hmm I had a (4) but forgot about it... Anyhow, I personally prefer (2)
over (1) because we can use it as gating. 'allow_failure' jobs are
*not* gating and we often miss their failures.

