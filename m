Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CDC4ADFB1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:33:55 +0100 (CET)
Received: from localhost ([::1]:40952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUNG-0008D7-UJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:33:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHRr1-00051Y-Ph
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:52:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHRqy-0003My-SW
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 09:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644331944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5Lg32jZhORzrGx1Pv2OXpcHKx+vcWcVYcdYnDYT4r0=;
 b=DLtWwjZmEPp4K0BTmisGXyyDTg0A2dwSRi9J3Gvx+6CXzbzrD9CzwbC3vRRIlI074fhA15
 ncjWgA+t7/wI9PBcgf7NVoSH5oBkeETS9H7mM0ZwQwGJ+Jl6xeflc5Y7i3iFYnfmSGKPFx
 XfLC5lZYsk6nJKLyCsSZvv5f8+KN9d4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-6JZMsqeCMh25nkCgbZmJFA-1; Tue, 08 Feb 2022 09:52:22 -0500
X-MC-Unique: 6JZMsqeCMh25nkCgbZmJFA-1
Received: by mail-wm1-f70.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so1145686wms.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 06:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a5Lg32jZhORzrGx1Pv2OXpcHKx+vcWcVYcdYnDYT4r0=;
 b=h/JAsXrGIKgIgCUpshclobOFeGEs1pB/NkLVDGVMjY9dTqLsVWRXKP+5moKo/QmrP8
 OKhI6BdwJctvj5EMNJFb++Dkjxpb4faA59DpLJxDtn7d/2cE7Llqvw2abZlhT/HX2xTU
 uXvsXn8uvYSzMBR4Yw9O6ZtV23PrRlVyBSIAHyRlpABeaUQaR4dQhebxGJjGzHBWHJTj
 jUOVFyIzoqJjaLRLAEr0yr8Nk2R/W24LZEbVcRuOB7jLsGbuZEhPB5sasANxexns64Wp
 mngZWNbLV59xV+jy54VSsUVIFt0BoRkFnHmnL1jXPsfIJa3klwflXOzYHeNdLYNh0WTj
 AGDA==
X-Gm-Message-State: AOAM533WJh61ubhuwFkELSLDDJJ+bSC00SdTbziSw+TxcoWuhLSnO7bd
 gjbCUyoe3MUtz5EGzF17RvClL3fCflXQsyY22mqUwbrxaRHeIte45iJEXekWJdmqqmBdaGe8MJh
 yk3QRHZnOttyx5tY=
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr1460579wmc.192.1644331941349; 
 Tue, 08 Feb 2022 06:52:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwalqWRiQYNSJO1J/hx4Td0TamLYQHZORbjqsLC0vWQ1sUd7CIhrdxeDsWGh4af64kkYs7Y+w==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr1460565wmc.192.1644331941155; 
 Tue, 08 Feb 2022 06:52:21 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id f14sm2600467wmq.40.2022.02.08.06.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 06:52:20 -0800 (PST)
Message-ID: <80372081-ca28-7566-9fa7-6e6820a7b37f@redhat.com>
Date: Tue, 8 Feb 2022 15:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-2-thuth@redhat.com>
 <8332fa43-9e77-34f3-c012-062342d62c92@redhat.com>
 <dd7f32dd-807c-d389-1f19-323141178bba@redhat.com>
 <1d5f544a-8362-6932-2f2a-6fd5f8e53978@redhat.com>
 <10264836-2ca6-c134-5eb9-018ef618edc1@redhat.com>
 <4cc4a814-3dba-11ab-3643-76ba974476c8@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4cc4a814-3dba-11ab-3643-76ba974476c8@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 14.11, Philippe Mathieu-Daudé wrote:
> On 8/2/22 13:38, Thomas Huth wrote:
>> On 08/02/2022 13.28, Hanna Reitz wrote:
>>> On 08.02.22 13:13, Thomas Huth wrote:
>>>> On 08/02/2022 12.46, Hanna Reitz wrote:
>>>>> On 08.02.22 11:13, Thomas Huth wrote:
>>>>>> Instead of failing the iotests if GNU sed is not available (or skipping
>>>>>> them completely in the check-block.sh script), it would be better to
>>>>>> simply skip the bash-based tests, so that the python-based tests could
>>>>>> still be run. Thus add the check for BusyBox sed to common.rc and mark
>>>>>> the tests as "not run" if GNU sed is not available. Then we can also
>>>>>> remove the sed checks from the check-block.sh script.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>>   tests/check-block.sh         | 12 ------------
>>>>>>   tests/qemu-iotests/common.rc | 26 +++++++++++++-------------
>>>>>>   2 files changed, 13 insertions(+), 25 deletions(-)
>>>>>>
>>>>>> diff --git a/tests/check-block.sh b/tests/check-block.sh
>>>>>> index 720a46bc36..af0c574812 100755
>>>>>> --- a/tests/check-block.sh
>>>>>> +++ b/tests/check-block.sh
>>>>>> @@ -52,18 +52,6 @@ if LANG=C bash --version | grep -q 'GNU bash, 
>>>>>> version [123]' ; then
>>>>>>       skip "bash version too old ==> Not running the qemu-iotests."
>>>>>>   fi
>>>>>> -if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
>>>>>
>>>>> This specifically tests for `sed`, whereas...
>>>>
>>>> There was a check for "gsed" one line later:
>>>>
>>>>  if ! command -v gsed >/dev/null 2>&1; then
>>>>
>>>> ... so the check-block.sh script ran the iotests also if "sed" was not 
>>>> GNU, but gsed was available.
>>>
>>> Oh, right.
>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
>>>>>> index 9885030b43..9ea504810c 100644
>>>>>> --- a/tests/qemu-iotests/common.rc
>>>>>> +++ b/tests/qemu-iotests/common.rc
>>>>>> @@ -17,17 +17,27 @@
>>>>>>   # along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>>>>>   #
>>>>>> +# bail out, setting up .notrun file
>>>>>> +_notrun()
>>>>>> +{
>>>>>> +    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
>>>>>> +    echo "$seq not run: $*"
>>>>>> +    status=0
>>>>>> +    exit
>>>>>> +}
>>>>>> +
>>>>>> +# We need GNU sed for the iotests. Make sure to not use BusyBox sed
>>>>>> +# which says that "This is not GNU sed version 4.0"
>>>>>>   SED=
>>>>>>   for sed in sed gsed; do
>>>>>> -    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
>>>>>> +    ($sed --version | grep -v "not GNU sed" | grep 'GNU sed') > 
>>>>>> /dev/null 2>&1
>>>>>
>>>>> ...this will accept `gsed`, too.  The problem is that many bash iotests 
>>>>> just use `sed` instead of `$SED`, so I think if we let this do the 
>>>>> gatekeeping, then we should change this to just check for `sed`.
>>>>
>>>> I think we should be fine - at least for the tests in the "auto" group. 
>>>> Otherwise we would have seen test failures on non-Linux systems like 
>>>> *BSD earlier already.
>>>
>>> Makes sense, but I’m quite uncomfortable with this.
>>
>> The current code with $SED has been introduced almost three years ago 
>> already...
>>
>>>   Can’t we just do `alias sed=gsed`?
>>
>> Maybe ... but let's ask Philippe and Kevin first, who Signed-off commit 
>> bde36af1ab4f476 that introduced the current way with $SED: What's your 
>> opinion about this?
> 
> This commit was to have check-block working on the OpenBSD VM image.

Sure. The question was whether using an alias as suggested by Hanna would be 
nicer instead of using $SED ?

  Thomas


