Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518374ADB7A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:47:32 +0100 (CET)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRmF-0006Hm-BL
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:47:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHQI5-0007J3-Ur; Tue, 08 Feb 2022 08:12:19 -0500
Received: from [2607:f8b0:4864:20::1034] (port=43683
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHQHy-0001Af-CH; Tue, 08 Feb 2022 08:12:16 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so1469682pjm.2; 
 Tue, 08 Feb 2022 05:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9/W906GFqZ6vOb0NUjho+AYmp1bR5+TY+jr9WH96xx4=;
 b=DM6jGy/jDB7/iAJVHiyN5jYRWftINHd655p3DvE5duvSD3BeunsaxQ7GMmHTbEmoFS
 6t6v4zETIhwYC2zVJSx8z8rzFfWMBJxwKVhDgbUY4Ei9UyEqXkJmKc7jHdJ8G3elNlss
 ZkKwBs3B6PddLLoge3jWidTmYQz7UpC0cYH22tylEQGPLcwKB6OGA3/hv6z9FPV55bu0
 +VuYQtpM5kAxtmTFZbQdkkfs6R9gjCrOHzmgyR9eBbau7KOmtXRiavJRDXuGI8EyRnSW
 TI7DehlfSjQYbTGShkXJJM8NrwzTPG7ltkjHuWMUbRK1DkWdWUt7uhmqZD4zHcTQgJ+w
 MGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9/W906GFqZ6vOb0NUjho+AYmp1bR5+TY+jr9WH96xx4=;
 b=Wbu/D6YRSosu5UVAK5Mg+kfjlN3vt1AgdgowIWw3KAndvO1Yi4EkojV3wi40cz2A74
 mMVPuyabsS3PKd4YrIEmrGGhgC/NEwWHaGUVRdyYD/3gyvqMaEI5RC4v04qKtRZQ+PjO
 GX+iVJ9pjIAE5uEp1s8JSTeoCOrLHgKkSGPrNl/FzSm7AgIAZxm8RLQUU9r/164B3+TR
 EZNiHlaTxgRtYssy76fP7DS6m7/wDOY4x+1esGMVmGhxIRj+tkdDV+SSJ+G/8/Nwh0bp
 e1ldulkDKrdeUcEvyLXOD6e76F/vKZmkGKLMbXA8A2KkqW0w4Ph7kEjlxT8XpilQxkAK
 U0hw==
X-Gm-Message-State: AOAM531jOaiqXf83kj3CWo6xPT93roOuexNlTEs77ph59kJ3vOUgmos/
 b4W75j0G5FotVWggckvokWidEJIrWDc=
X-Google-Smtp-Source: ABdhPJxyLGb3jcichr83EE6kFrnY++xnZ3AmjmPVB3J8QNb7jS5qw8DVGLSF/GqiqlnMZb0Odvevag==
X-Received: by 2002:a17:90b:1805:: with SMTP id
 lw5mr1263407pjb.219.1644325907266; 
 Tue, 08 Feb 2022 05:11:47 -0800 (PST)
Received: from [192.168.71.175] (174.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.174])
 by smtp.gmail.com with ESMTPSA id om18sm3154251pjb.39.2022.02.08.05.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 05:11:46 -0800 (PST)
Message-ID: <4cc4a814-3dba-11ab-3643-76ba974476c8@amsat.org>
Date: Tue, 8 Feb 2022 14:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-2-thuth@redhat.com>
 <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
 <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
 <1d5f544a-8362-6932-2f2a-6fd5f8e53978@redhat.com>
 <10264836-2ca6-c134-5eb9-018ef618edc1@redhat.com>
In-Reply-To: <10264836-2ca6-c134-5eb9-018ef618edc1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 13:38, Thomas Huth wrote:
> On 08/02/2022 13.28, Hanna Reitz wrote:
>> On 08.02.22 13:13, Thomas Huth wrote:
>>> On 08/02/2022 12.46, Hanna Reitz wrote:
>>>> On 08.02.22 11:13, Thomas Huth wrote:
>>>>> Instead of failing the iotests if GNU sed is not available (or 
>>>>> skipping
>>>>> them completely in the check-block.sh script), it would be better to
>>>>> simply skip the bash-based tests, so that the python-based tests could
>>>>> still be run. Thus add the check for BusyBox sed to common.rc and mark
>>>>> the tests as "not run" if GNU sed is not available. Then we can also
>>>>> remove the sed checks from the check-block.sh script.
>>>>>
>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>> ---
>>>>>   tests/check-block.sh         | 12 ------------
>>>>>   tests/qemu-iotests/common.rc | 26 +++++++++++++-------------
>>>>>   2 files changed, 13 insertions(+), 25 deletions(-)
>>>>>
>>>>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>>>>> index 720a46bc36..af0c574812 100755
>>>>> --- a/tests/check-block.sh
>>>>> +++ b/tests/check-block.sh
>>>>> @@ -52,18 +52,6 @@ if LANG=C bash --version | grep -q 'GNU bash, 
>>>>> version [123]' ; then
>>>>>       skip "bash version too old ==> Not running the qemu-iotests."
>>>>>   fi
>>>>> -if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
>>>>
>>>> This specifically tests for `sed`, whereas...
>>>
>>> There was a check for "gsed" one line later:
>>>
>>>  if ! command -v gsed >/dev/null 2>&1; then
>>>
>>> ... so the check-block.sh script ran the iotests also if "sed" was 
>>> not GNU, but gsed was available.
>>
>> Oh, right.
>>
>>>> [...]
>>>>
>>>>> diff --git a/tests/qemu-iotests/common.rc 
>>>>> b/tests/qemu-iotests/common.rc
>>>>> index 9885030b43..9ea504810c 100644
>>>>> --- a/tests/qemu-iotests/common.rc
>>>>> +++ b/tests/qemu-iotests/common.rc
>>>>> @@ -17,17 +17,27 @@
>>>>>   # along with this program.  If not, see 
>>>>> <http://www.gnu.org/licenses/>.
>>>>>   #
>>>>> +# bail out, setting up .notrun file
>>>>> +_notrun()
>>>>> +{
>>>>> +    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
>>>>> +    echo "$seq not run: $*"
>>>>> +    status=0
>>>>> +    exit
>>>>> +}
>>>>> +
>>>>> +# We need GNU sed for the iotests. Make sure to not use BusyBox sed
>>>>> +# which says that "This is not GNU sed version 4.0"
>>>>>   SED=
>>>>>   for sed in sed gsed; do
>>>>> -    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
>>>>> +    ($sed --version | grep -v "not GNU sed" | grep 'GNU sed') > 
>>>>> /dev/null 2>&1
>>>>
>>>> ...this will accept `gsed`, too.  The problem is that many bash 
>>>> iotests just use `sed` instead of `$SED`, so I think if we let this 
>>>> do the gatekeeping, then we should change this to just check for `sed`.
>>>
>>> I think we should be fine - at least for the tests in the "auto" 
>>> group. Otherwise we would have seen test failures on non-Linux 
>>> systems like *BSD earlier already.
>>
>> Makes sense, but I’m quite uncomfortable with this.
> 
> The current code with $SED has been introduced almost three years ago 
> already...
> 
>>   Can’t we just do `alias sed=gsed`?
> 
> Maybe ... but let's ask Philippe and Kevin first, who Signed-off commit 
> bde36af1ab4f476 that introduced the current way with $SED: What's your 
> opinion about this?

This commit was to have check-block working on the OpenBSD VM image.


