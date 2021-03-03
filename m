Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC1632BA00
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:47:34 +0100 (CET)
Received: from localhost ([::1]:40822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWWz-0004UT-9d
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHWPX-0005F7-In
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:39:54 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHWPS-0005bG-JM
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:39:48 -0500
Received: by mail-pg1-x534.google.com with SMTP id t25so17032591pga.2
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4e3xHKwqoVWi0i1f4fXbrXF+AkXuV+auZpFkRH1LJTs=;
 b=ZTO5ypHYLMyKauP/pqIzoNSsZDSQ5485n9cGTZCDKy17lEv6Wdw5U6lLmdPWkiFX4b
 YWHY6GDTgLWXhayWZ77Q4VxRH/01OCZRiuDswHfXgkYyaqlnFtpZi9c4qsOfQpgLpRSm
 Q2sptgeXyj54Hxt/CsbxK4fvFNakF/gt91tPMk7e3AWjJ7Xjrifw+L19Jt/xXAUMxTnM
 yJkdbz/pRe9obnNccFVaAZYyyW/Og3330/KEju87PuhZ9Z7C6ZFkV5WBBJmfuu03006N
 GtoW3BR1bqWspaOt3QU8YqFS5T92jySlUEZJ6p4WJu7W9CLIzfeosJIdHk4LkSPHV2RH
 /6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4e3xHKwqoVWi0i1f4fXbrXF+AkXuV+auZpFkRH1LJTs=;
 b=Q3BKxy58wjrx3UaFG2op2SboSHR2RgC5vIx+PpHG9U611q223SYOGwhKF8ajzrPA/T
 t61QRHu0+b8Jek2P45afihf76AwM11N/iHtusbGohO/BNCNRiM+eweo+ullTtUxqc9EC
 YvFBwTd2u5jXL32pItqBDU8lyApwGeqjM3HNfdrkq2NgKSHOvc37tHGvrFHM+fpEAUGs
 EfmHFazelLwBXF1IuPx7OsnFMP4A1RQspTt0uyAxlDbXoPJVRca5Fh55KAiRLTHMlthh
 f7+t7KK1tdfMZnTnnSBavCOlkPnnq9Y72MoLzrTrHGr6gnnAy6efsnSBJNwI3bQbXeY+
 1B1w==
X-Gm-Message-State: AOAM5327W6kstq4IkF+UFmwAgxd+RS8ZeT1QwnWSr4BD1IJXbhgl2w/A
 lyTgeoytPUFkb0CvH4bfAPAggw==
X-Google-Smtp-Source: ABdhPJw59X8AwC3mPNVtuuNyDpVpNAqqCBKLBN1m5z/m2Aai+lGrZ9VS3/AdmcMnsznlMXEjxa7L+g==
X-Received: by 2002:a63:5625:: with SMTP id k37mr285641pgb.96.1614796784961;
 Wed, 03 Mar 2021 10:39:44 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d75sm22372188pfd.20.2021.03.03.10.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:39:44 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
 <5fb3cf49-fc09-7e7c-d34e-299f04e9842a@suse.de>
 <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9190376-ba0b-02d5-124d-a336c586ad5d@linaro.org>
Date: Wed, 3 Mar 2021 10:39:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 10:20 AM, Claudio Fontana wrote:
> On 3/3/21 7:17 PM, Claudio Fontana wrote:
>> On 3/3/21 7:09 PM, Peter Maydell wrote:
>>> On Wed, 3 Mar 2021 at 17:57, Claudio Fontana <cfontana@suse.de> wrote:
>>>> One thing I noticed is that tests try to run qemu-system-aarch64 with accel "qtest" and machine "virt",
>>>> and the thing tries to create a cortex-a15 cpu model for some unknown reason.
>>>
>>> That is expected. The default CPU type for 'virt' is cortex-a15; if you want
>>> something else then you need to specify the -cpu option.
>>>
>>> -- PMM
>>>
>>
>> I see, I'll experiment a bit thanks.
>>
>> I assume changing the default to "max" is out of the question,
>> and we should instead feed the -cpu option from the tests?
>>
> 
> And since we are on topic, should the qemu-system-aarch64 still contain the cortex-a15 cpu model for some reason?

The goal is for qemu-system-arm and qemu-system-aarch64 to be as compatible as 
possible.  That's why the default is the same for both.


r~

