Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD330FD0C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:39:25 +0100 (CET)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kTM-0000Oc-8q
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7k0v-0004wo-Ix
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:10:04 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:41025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7k0r-0002BA-Hh
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:10:01 -0500
Received: by mail-pg1-x52e.google.com with SMTP id i7so2774640pgc.8
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 11:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0eoPeo3qxFvbzNrmXid4kxAZR81SZHV5WFwqO/UBGiI=;
 b=ekbZnvbqp1B8q/1OQcKrc5JwHh8S78+ZBYiDtHl9eDtybOoEQ+o/D/nlgDjdgYTd05
 ccss4zFd6rlIlOUY2AZDwh8HppqXsROtcNfVXDDIp3+Dvme+WWsF6lSCqRHTo3uF/+NU
 wCRlWIeemQ4Yat8ov8DW57EVbMfXnjOa83C0hI/BrRT+s/543IRlWiez4bxiCN8Fl5T2
 jh24p/+kpvrn2KByQOthbuj5QI5HKmJUheZw4rovWZDLUXm0nJGq8t9VNVt+lZE13lwM
 1WGpaVy5LzAvYxFHeEwkAkjr4mI/G/9F6ZQEiKdU+vm7ARuRKi4MWwyciCTN38cQjBbO
 vWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0eoPeo3qxFvbzNrmXid4kxAZR81SZHV5WFwqO/UBGiI=;
 b=uRmzb1zFLLIpSPzOexTTJLe8++l/wWtonGXRCb42Z6RVt0IJGiuq4daXFOjgasU8vJ
 N1ZE4KbJ6eyit2NW+/xb2W8bxOHFAyhzMWzAfZ6i/ATzNnpGhVnVG70pKeAvJoHWFBKq
 Ai8YyALLgnFAWa/4zPYEboGMDsd98LtTsIf70HQbmkN3RCWHCjCmiPaeWlPZH/GUHqSd
 4dfIOVEmvrFsuj9Rm0Zin778Kfc9i7EaJbp42oBrR20KM8x/WFhTMbVbuXW0eagyQIV9
 eTiqCpA4KfcH/SoR0GA4TytS7k/lt5UDxor5S3RCDfKnVAtDJo4rrCvTysd97wdA6hRz
 sypQ==
X-Gm-Message-State: AOAM531GnVil1Yc09lO1/eMP7bdlE+2AgEXEeg8MozCF//CAeRJua8aL
 g/LmRGfG2pxkMtYLhEt6RJQ03w==
X-Google-Smtp-Source: ABdhPJzd/V0ZMpL56CUHPjRkZo/PTPwIeeBVTIJ4eQZwomSHB8b5hYTbphd5xsY53UAYTNCvSfO63w==
X-Received: by 2002:a62:7dc7:0:b029:1d3:7fec:ffb3 with SMTP id
 y190-20020a627dc70000b02901d37fecffb3mr927197pfc.12.1612465795366; 
 Thu, 04 Feb 2021 11:09:55 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x186sm6746421pfd.57.2021.02.04.11.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 11:09:54 -0800 (PST)
Subject: Re: gitlab containers are broken
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
 <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
 <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
 <6ec7bebe-587d-df2d-0221-e12cb6f4c775@redhat.com>
 <20210204100009.GE549438@redhat.com>
 <9e716df9-3be3-4c79-dff3-e6475b13fdc5@linaro.org>
 <20210204173736.GV549438@redhat.com>
 <f2a184c7-80f1-afb2-e502-3b03f586d4dc@linaro.org>
 <20210204185805.GA903389@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4066e14-12a9-04eb-564e-0066942f0c10@linaro.org>
Date: Thu, 4 Feb 2021 09:09:51 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204185805.GA903389@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 2/4/21 8:58 AM, Daniel P. Berrangé wrote:
> So consider you
> 
>  - Push 40 commits to tci-next with a dockerfile change in the 4th commit.
>    This triggers a build of the containers.
> 
>    Containers reflect your tci-next branch content.
> 
>  - Now push to master to catch up with upstream. This triggers a rebuild
>    becuase of if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
> 
>    Containers reflect your master branch content.
> 
>  - Push 40 commits to tci-next, but only the last 5 in the branch are
>    different from your previous commit.  The container build won't
>    trigger, despite the branch containing a dockerfile change, because
>    the commit with the dockerfile wasn't changed from previous push
> 
> 
> I've not dug further back into your pipeline history to verify if this
> is what happened, but I've convinced myself that it is plausible

This is exactly my development process, switching between tasks on different
branches as I wait for build results.


> The addition of the rules to make container builds conditional has
> broken the assumption that it is safe to use :latest for the docker
> tag.
> 
> I think we need to remove the rules condition

Thanks for the analysis.


r~

