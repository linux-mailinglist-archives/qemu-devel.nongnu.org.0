Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C54301416
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 10:02:40 +0100 (CET)
Received: from localhost ([::1]:39754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3EoY-0006it-MY
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 04:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wataash@wataash.com>)
 id 1l3ElL-00069N-Uj
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 03:59:19 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wataash@wataash.com>)
 id 1l3ElJ-0006r3-DJ
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 03:59:19 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x18so4650956pln.6
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wataash-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdOQwdujpqctM2xoHxcvr2PFvHjo0g/U5eIr0kdsAbk=;
 b=tIchIMRkV7HpPQMen5LAK3AZ//QFss2deeOcRZLWUVQhGnD432KQRWpk4wKXzoVYIC
 LBEY4uLBwau010FUZHJIQmEf+bApAn7LDDnTaYb62TrKV47g4jmYZ4XIzZbs9q0amGr7
 UUoXZM+fUmrnAKIFlaMz/gQwDiOxQPnuK6Tn4r75BKI0QGuxU0BEQkMSB8jKOl8DSsp8
 5WerrV5LgLcs0N5m5blQKJjUgIVn5JtsTtbOAoxNTL4tr0mGHaiFQ/EtAWNsF1ZsUpEO
 ycYTXKoQF3q/1r1XllCwtI8zjNT8koFJrCmPJx9FbByaqOAeupZzkYe8pmweIvhazbgJ
 Jtkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdOQwdujpqctM2xoHxcvr2PFvHjo0g/U5eIr0kdsAbk=;
 b=X4iCHmb9aF+52bdH+zLHgsUWs+Q+jtSUFUEBnH7NUqG22/BNosolE/QKLcSbAl+LBv
 CPTzP3qXQ4t+eMzKYHyqFTUw3kdjJ/WOVMfvJvIkcYrBgV1dGqMZyLcLuNq+56s1DvYY
 cVXn5o+dyHyxoIuPeB9OI9bwRDlhZhxET4qX1hEqeWn1+lzx4mFQWqV/34WpbDBdQqPA
 cPccsWIkXGv7CVv6sP6mZZNLYQyu7+gWxSjY5hCJx6YhZbiYHIcVVrl/ANJTIe8Yc3U0
 qps2cKbiD03ZB7D/2Dranq1FMKQH7txeWiCRRxB6jj606F5IdTl2uU2TgIS5QxtEyCn+
 rjpA==
X-Gm-Message-State: AOAM531k6aemowNHUitEg/SgJ1wLireJXlmCVX2jNMosq1O2unPpc2Fx
 0t0PKZNj/ZbIF5ILTxZJjY5HSA==
X-Google-Smtp-Source: ABdhPJyYa3CLmuLE+hdgv2OietCRHqsRJtRm9ajPYsL5M62FYi+1hysv0jC94dgIIVnwv2W4MvxBFw==
X-Received: by 2002:a17:90a:b10a:: with SMTP id
 z10mr10107481pjq.43.1611392355154; 
 Sat, 23 Jan 2021 00:59:15 -0800 (PST)
Received: from ?IPv6:2001:240:1bc:8005:716a:1219:d0c4:d6c6?
 ([2001:240:1bc:8005:716a:1219:d0c4:d6c6])
 by smtp.gmail.com with ESMTPSA id o1sm10643205pgq.1.2021.01.23.00.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 00:59:14 -0800 (PST)
Subject: Re: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <20210121103250.GH3125227@redhat.com>
 <b1309c5e-69f2-0c4d-eefc-9023e906694d@amsat.org>
 <20210121112154.GJ3125227@redhat.com>
 <e46b9117-59ed-cfb8-303b-1a5a013c4cc8@amsat.org>
 <20210121120241.GK3125227@redhat.com>
 <97b12e1b-e570-bd4d-5484-376f3fe6f7dc@amsat.org>
From: Wataru Ashihara <wataash@wataash.com>
Message-ID: <ada021e4-b6e5-e720-bcfb-c078488c835c@wataash.com>
Date: Sat, 23 Jan 2021 17:59:10 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97b12e1b-e570-bd4d-5484-376f3fe6f7dc@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=wataash@wataash.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/01/21 22:27, Philippe Mathieu-Daudé wrote:
> On 1/21/21 1:02 PM, Daniel P. Berrangé wrote:
>> On Thu, Jan 21, 2021 at 12:48:21PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 1/21/21 12:21 PM, Daniel P. Berrangé wrote:
>>>> On Thu, Jan 21, 2021 at 12:18:18PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 1/21/21 11:32 AM, Daniel P. Berrangé wrote:
>>>>>> On Thu, Jan 21, 2021 at 11:08:29AM +0100, Thomas Huth wrote:
>>>>>>> On 10/01/2021 17.27, Philippe Mathieu-Daudé wrote:
>>>>>>>> Split the current GCC build-tci job in 2, and use Clang
>>>>>>>> compiler in the new job.
>>>>>>>>
>>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>>> ---
>>>>>>>> RFC in case someone have better idea to optimize can respin this patch.
>>>>>>>>
>>>>>>>>   .gitlab-ci.yml | 22 ++++++++++++++++++++--
>>>>>>>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> I'm not quite sure whether we should go down this road ... if we wanted to
>>>>>>> have full test coverage for clang, we'd need to duplicate *all* jobs to run
>>>>>>> them once with gcc and once with clang. And that would be just overkill.
>>>>>>>
>>>>>>> I think we already catch most clang-related problems with the clang jobs
>>>>>>> that we already have in our CI, so problems like the ones that you've tried
>>>>>>> to address here should be very, very rare. So I'd rather vote for not
>>>>>>> splitting the job here.
>>>>>>
>>>>>> We can't possibly cope with the fully expanded matrix of what are
>>>>>> theoretically possible combinations. Thus I think we should be guided
>>>>>> by what is expected real world usage by platforms we target.
>>>>>>
>>>>>> Essentially for any given distro we're testing on, our primary focus
>>>>>> should be to use the toolchain that distro will build QEMU with.
>>>>>>
>>>>>> IOW, for Windows and Linux distros our primary focus should be GCC,
>>>>>> while for macOS, and *BSD, our focus should be CLang.
>>>>>
>>>>> Sounds good.
>>>>>
>>>>> Do we need a TCI job on macOS then?
>>>>
>>>> TCI is only relevant if there is no native TCG host impl.
>>>>
>>>> macOS only targets aarch64 and x86_64, both of which have TCG, so there
>>>> is no reason to use TCI on macOS  AFAICT
>>>
>>> Yes, fine by me, but Wataru Ashihara reported the bug... ¯\_(ツ)_/¯
>>
>> It doesn't look like they were using macOS - the message suggests
>> Ubuntu host, and AFAIK, all Ubuntu architectures have support
>> for TCG, so using TCI shouldn't have been required in the first
>> place.
>>
>> I guess we could benefit from a TCI job of some kind that uses
>> CLang on at least 1 platform, since none exists.
>>
>> This does yet again open up the question of whether we should be
>> supporting TCI at all in this particular user's scenario though,
>> since both KVM and TCG are available on Ubuntu x86 hosts already.
> 
> I understand Stefan envisions other use cases for TCI, which is
> why it is still maintained. See:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg461131.html
> 
> I agree with your previous comment:
>> we should be guided by what is expected real world usage by
>> platforms we target. Essentially for any given distro we're
>> testing on, our primary focus should be to use the toolchain
>> that distro will build QEMU with.
> 
> This rarely used config does not justify adding yet another CI job.
> 
> Thanks,
> 
> Phil.
> 
> 

Actually I use TCI also on macOS. Like the use case quoted by Philippe,
there're even other reasons to use TCI:

1. Learning TCG ops.
2. Debugging QEMU with gdb. e.g. diagnose codegen or stepping into
   helper functions from tci.c:tcg_qemu_tb_exec().
3. Guest instruction tracing. TCI is faster than TCG or KVM when tracing
   the guest ops [1]. I guess qira is using TCI for this reason [2].

[1]: https://twitter.com/wata_ash/status/1352899988032942080
[2]: https://github.com/geohot/qira/blob/v1.3/tracers/qemu_build.sh#L55

