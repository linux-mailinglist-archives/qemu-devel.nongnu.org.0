Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F62633117C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:58:27 +0100 (CET)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJHL0-00079k-9w
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJHKA-0006fo-Ok
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:57:34 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJHK8-0005Pp-U2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 09:57:34 -0500
Received: by mail-ej1-x630.google.com with SMTP id c10so20909966ejx.9
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E1SrcyMgQtiEyIP4agR0phsflV3b7ndmC/5mDSIjP+Q=;
 b=cdfIACrM7wd49V680aFll+18GzF2ZfBnyDB+F3i+IFaI1Ls44fJFZtng+B/2XpWDcF
 aEEmbm1D2HlMR7xm+HA+3x814SJFVXaoTU/HebPeh02riUsvkWRg7WLoKLNVlhRdEf4A
 k6X5f1zvAZD66XwcU4aNWuhnD78i+R+2D1larvZmy7n5g8by/O5hUWXD8X+CHjIQmUYc
 QyJ4Y3BXMFQeveIjgyLBSkCLBdiwcbR23NW6cSVE5KVngsDHw19SbmGsMS2pxBQKcmyL
 rlM8UYq8WIE0X+xLu8i3HWsJJtChFhgjqdQe3vr2pX1WAk6Mrzf7YNDI3/D27nvV/qKX
 NncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E1SrcyMgQtiEyIP4agR0phsflV3b7ndmC/5mDSIjP+Q=;
 b=lWVNIoQ7cAzvTsgQS6iNaBxIjBQge80jMDm4bGP21CUbMnjWZK8BUZj5eBRx4a8X5Y
 6r4sVCyRakwPojejnqPSzRifmIXEDRRVrPnBlVuTeKu7Or+ANs9ZzL1TgdbQJs9etKAq
 KM6np2Prs8wREEm9P4Nl7i+8aRWyiM2cZEq97uzC3G6v+Hws3tbrSKvANgQSQwYDjPKd
 Sr9ID5K/n1I1FYO/fkPRy3KfNFj7nYz6YeLm6lxT1wZg8kRNCrNl4s2aHQZgoK0aZrcE
 cexDegZAe5bWJP4x+uejcPebki7J35cWuBM6ef+em99BP5pHv69tO5y7fpYGIOP9nqpR
 qWww==
X-Gm-Message-State: AOAM532ieabli60qdj+V6Hi88DSrxgLOalui2KvT7DyGyq6Ks/f+g0Jd
 v/XsN9wVlg+duEcwAG44JJf7UgwEDqw=
X-Google-Smtp-Source: ABdhPJwkWvrbTXKjL3x61SxKe3vsteG7Lmpwuvp+CIwMs22aOmCothl+fzW8jw6sWqtNvFPQhZupQw==
X-Received: by 2002:a17:906:ad96:: with SMTP id
 la22mr15962190ejb.237.1615215451395; 
 Mon, 08 Mar 2021 06:57:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d1sm6893703eje.26.2021.03.08.06.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:57:30 -0800 (PST)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de>
 <6230ef40-c0ec-875e-dbd3-46fb5925322e@amsat.org>
 <81208ea0-f389-14d0-c366-0579dee3376d@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f3700214-baed-e03a-d4e1-028758b07054@amsat.org>
Date: Mon, 8 Mar 2021 15:57:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <81208ea0-f389-14d0-c366-0579dee3376d@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 2:52 PM, Claudio Fontana wrote:
> On 3/8/21 2:27 PM, Philippe Mathieu-Daudé wrote:
>> Hi Claudio,
>>
>> On 3/8/21 1:57 PM, Claudio Fontana wrote:
>>> Hi,
>>>
>>> anything else for me to do here?
>>>
>>> The latest rebased state of this series should be always available here:
>>>
>>> https://gitlab.com/hw-claudio/qemu/-/tree/i386_cleanup_8
>>>
>>> When it comes to the ARM cleanup series,
>>> I would like to have the tests pass for ARM, before doing even more changes, could you help me there Philippe?
>>>
>>> Maybe applying some of your changes on top would fix the failures? I tried, for example with the arm-cpu-features ones, but it didn't work for me..
>>
>> TBH I wrote these patches during my personal spare time and this
>> became a real Pandora box that drained too much energy. I prefer
>> to step back and focus on finishing smaller tasks before burning
>> out. That said I appreciate your effort and am interested in
>> following / reviewing your work.
>>
>> Regards,
>>
>> Phil.
>>
> 
> Thanks Philippe for sharing this, and I agree completely, it is very draining.
> 
> The effort of making tests happy that run in artificial environments in particular often feels to me
> as too disconnected from actually ensuring that there is no real run time regression.
> 
> qtest_enabled() (implicitly, or explicitly via open-ended else statements) is another painful variable to keep in mind in cpu and machine code, so it is not helpful in my view.
> 
> I'll try to push more to get the tests running again, if you have any comment or idea, feel free to just point me in the right direction,
> that is very valuable to me, even without working code.

Basically I gave up after realizing from Daniel reviews that we need
QMP commands to query QEMU at runtime its built-in features, so we
have build-agnostic tests easier to maintain. I agree this is the
best way to resolve this particular case, but also scale for various
other cases.

