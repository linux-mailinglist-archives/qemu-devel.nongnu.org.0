Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8847830FC3A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:10:06 +0100 (CET)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7k0t-0003qK-G7
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:10:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7jLS-0002wr-Gi
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:27:10 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7jLP-000188-NE
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:27:10 -0500
Received: by mail-pg1-x52f.google.com with SMTP id g15so2694180pgu.9
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u8+x8WkL1M8tckQ1iNNSeNtVeKzdbQi5D/31HDAUV78=;
 b=ktqVf0c1PrFuakdT4GWoULh47GUdC7rO2+mNquG0+VETcGUB8PzhIc9RDIR7V31HzE
 5AwGaUgP4FMJidbqrX3DdCU/d3aUqvXz8vHxUmd2iIGK5iMoewgPb9zqSd9eqEOuLeZn
 U/5QLPFPy2jrm0d1gOeTZz7EKltxhg5U4jLO65H9sdvESaAg1yhbrz/mq2KwEFLQyRBB
 eFsPrvgMvHUaNaSaJ0cpNu2oywwkba1jmqc4Niw5NdRdum06zFFd/Kkj4dzPcnp38FlF
 hHGWM26sVglMvJ7D9S53EchcPmeCLNN5vvednjCIpHFm6EYZQXZN8NvPafAxr6DKAQUI
 HHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u8+x8WkL1M8tckQ1iNNSeNtVeKzdbQi5D/31HDAUV78=;
 b=K60nXut3GJKr8YkT/u8q3lMqwmcjVDC+BWRCx1dQGkyfmBBBzeESFnwZY5/mMazu7n
 x55OATlCtnyjJGS5XAtoAqzDBZoEfycSspbufiUTLptUsRhnDXN4yQl1Ov9LSB1vuysN
 BqPYsnc88R7W4NTrEaVleeJnU+MFOgCU9VNogyJbu+VBn0spt3NRkObfquNsHvaiyA+P
 M+GWulC5KdFGgXYItx2iOlz6gLTeQQzco3RvEr8LEAbwOgSyi2p5igEDcIRjR6z1Q4Lu
 4EnZc688qrNY37xQj3viaAiEhvD+J7j+uvjpl9oVT7J20Hq4/8oxeZfisIZAJKv3qOn4
 Vqsg==
X-Gm-Message-State: AOAM5318jZJVJaoxsLnwI8+dMU1sPldityg1LKJNmouIg7H7PCQCucaw
 FkJ0XqZcTpf8lU/LyrTVGw52mw==
X-Google-Smtp-Source: ABdhPJz0uGAuDMvs+DYPMcjJKBDHx1Fb+zBS/6l7pqW4M1/SxywOBaRHCsDJIGU12S1i8yBIAmZNzQ==
X-Received: by 2002:a63:d246:: with SMTP id t6mr245896pgi.283.1612463224753;
 Thu, 04 Feb 2021 10:27:04 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id n73sm6557225pfd.109.2021.02.04.10.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 10:27:03 -0800 (PST)
Subject: Re: gitlab containers are broken
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
 <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
 <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
 <6ec7bebe-587d-df2d-0221-e12cb6f4c775@redhat.com>
 <20210204100009.GE549438@redhat.com>
 <9e716df9-3be3-4c79-dff3-e6475b13fdc5@linaro.org>
 <20210204173736.GV549438@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2a184c7-80f1-afb2-e502-3b03f586d4dc@linaro.org>
Date: Thu, 4 Feb 2021 08:27:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204173736.GV549438@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 7:37 AM, Daniel P. Berrangé wrote:
> On Thu, Feb 04, 2021 at 07:36:19AM -1000, Richard Henderson wrote:
>> On 2/4/21 12:00 AM, Daniel P. Berrangé wrote:
>>>>> Hmm.  Is there any way to get the full output of the container build?  At
>>>>> present it's being truncated:
>>>>>
>>>>> #7 [4/5] RUN yum install -y bzip2     bzip2-devel     ccache     csnappy-de...
>>>>>
>>>>>
>>>>> In particular, I'm trying to add a new test, and I have added libffi-devel.i686
>>>>> to the fedora-i386-cross.docker file, but then the actual build fails because
>>>>> the libffi header file is missing.
>> ...
>>> Alternatively just make your changes to the dockerfiles and thne push
>>> the branch to gitlab. Gitlab will run the build and you can pull down
>>> the docker image from your fork's docker registry
>>
>> That's what I did, with the results as described above.
> 
> Ah, if you can point me to the gitlab pipeline / branch I can have a
> look at diagnosing it.

One that failed is

https://gitlab.com/rth7680/qemu/-/pipelines/250583359

where the cross-i386-tci job fails.  It takes some digging to see that all of
the correct bits are in place: from the head (84f9ac62) up to the ffi patch
(7bdae288) which modifies the docker files, up to the gitlab patch (a1d93694)
which adds the cross test.  I'll note that for this particular push, gitlab has
failed to rebuild the containers, and I don't know why.

Irritatingly, I re-pushed a combined cross-test+ffi patch on top of my current
tci branch (since I had removed both patches shown above), and it seems to be
working.  Possibly because this time gitlab decided to rebuild the containers:

https://gitlab.com/rth7680/qemu/-/pipelines/251596167


r~

