Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365E730EC7B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 07:28:29 +0100 (CET)
Received: from localhost ([::1]:58554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Y7v-0004p3-QC
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 01:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Y6w-0004QH-7L
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:27:26 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:32928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Y6t-0007rf-IH
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 01:27:25 -0500
Received: by mail-pg1-x52c.google.com with SMTP id j2so1442959pgl.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 22:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oIsN5UviQMfdFyznYWR2H4n84tCDhodc4Ww0WX+ilpY=;
 b=w+OJTwIxzO89a5bARfI9jxb8BoazegfA654F8M0bmZoCPdGI08oIUCALRNrpCYu8TG
 vjag/r88nuwT9uFiLreob55R7olPd/aUWE5h22eiC1tTObAcBjM4MwWcGb9kBMttljF6
 A+PjUEE5Hq/R80T4y4GJT/DjGnIQAph4Mmgo2TMHxcgk9TYUNFvOLOdRd3CCEVNL9lSQ
 6zvkvYtfRGSo/aPYb9bg2C29mGki38uH3wtRUrlRe5KoYC3L1SU/hrlRKs1q/ZRkvSt6
 RuGt/KLRMMD5TDH64D3S50yHQwmGBftQAHfZ4++F/K5xG88Kia5B/KJ3KR/9XRkDCcHg
 OjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oIsN5UviQMfdFyznYWR2H4n84tCDhodc4Ww0WX+ilpY=;
 b=E6n7UmVBLHtczAsJ+6h6qTinCRtqQnJl85yoGFhZqpPmzzV2vGRbKoIz8VjOI/uWH7
 XlMbHfI8Iax0z9vifwO/Emps/3jtR0KT0dwaTOKE6kDCZC0WH+XM9QbjYb0fqkLwA7Za
 aNv4mWDRN0HLau9kCmDg4bz27tqv4UL0tEglsKbpoFPbIu0JCu0IpTOkTVGmVRudUyK0
 EDZGWMx318Y7cbWtgqX91XwqlIBbE5wFkoA9fnCPJweN94aJGRFpGuav02v7dzk9ffJI
 ZmqDe/r1eoCHK3S96FlOhtIBkO7JNchQvXORlLi0vvB1c1TAMHQGJraJDB3ERiS7vMoh
 3HiQ==
X-Gm-Message-State: AOAM530X3IR6oN081F0oUQUu/IYTfxf6A1kuq+/ykxhrVAswBzGMho/o
 g/lCQK3NDyXXLsljhyb4uuyIyA==
X-Google-Smtp-Source: ABdhPJwpzg61Mqi9F/q55RZ43Eh4LvTQCGsvxfaukT/dta+VidGeBMjDBZgLHBTk6kKK/5ZxvSEolQ==
X-Received: by 2002:a63:78ca:: with SMTP id t193mr7640584pgc.391.1612420041968; 
 Wed, 03 Feb 2021 22:27:21 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id a2sm3982675pjm.51.2021.02.03.22.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 22:27:21 -0800 (PST)
Subject: Re: gitlab containers are broken
To: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
 <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
Date: Wed, 3 Feb 2021 20:27:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 8:03 PM, Thomas Huth wrote:
> On 04/02/2021 00.04, Richard Henderson wrote:
>> Something has gone wrong with the building of the containers
>> in gitlab, because *all* off them are installing Alpine Linux.
>>
>> https://gitlab.com/rth7680/qemu/-/jobs/1006336396#L155
> 
> I think that's ok ... the output about alpine that you see there is just the
> output from the container that builds the final container. Later you can see
> some "yum install" lines in that output, too, that's where the CentOS container
> gets build. And the final compilation job runs on CentOS, too:
> 
>  https://gitlab.com/rth7680/qemu/-/jobs/1006336699#L35
> 
> (look for the string "Red Hat" there)

Hmm.  Is there any way to get the full output of the container build?  At
present it's being truncated:

#7 [4/5] RUN yum install -y bzip2     bzip2-devel     ccache     csnappy-de...


In particular, I'm trying to add a new test, and I have added libffi-devel.i686
to the fedora-i386-cross.docker file, but then the actual build fails because
the libffi header file is missing.

I know you may need the actual patch to comment, but pointers to how to debug
this sort of failure are welcome.


r~

