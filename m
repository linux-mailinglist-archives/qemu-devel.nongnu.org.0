Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF01841F417
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:58:34 +0200 (CEST)
Received: from localhost ([::1]:50248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMnp-0007CM-R7
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWMGE-00087H-I3
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:23:51 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWMGB-0005wd-Ua
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:23:49 -0400
Received: by mail-qt1-x829.google.com with SMTP id e16so9674133qts.4
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oXG9/nUzRVfQFoYdRhJmTFx/EvVk9I3jETZCgxmSsL4=;
 b=lfWOWnqZzSQRdQnPSkciArcCMu2P4Yzw6QdG3j5Cji7wCvUGkNEswACxphZzoew95R
 l34rqdJilw/tfcSQevUHCQfeIIYNa7n05LvSxIkLTU3ZvLH9unUTWZq+XeO6kp3/9iU1
 03pl8oE7gKpZ9q+WnwZDbs+bGrCNvzgbptZfZ0UbRE+uCL0iHUQqubE8sJGk6LenA1Du
 BvEIUmmepUm8obgUVr3aHWUwbgJaK/bazepYqIY/zOyq/eth7QRd/SJOMRzriePahg4w
 vk1aO2bROh69I0Rle/Fy4O+YCCKkYv7y98ty9Vlf+JcARq0W5lI9K+oFGbLppM3X65V2
 XLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oXG9/nUzRVfQFoYdRhJmTFx/EvVk9I3jETZCgxmSsL4=;
 b=hefgBFQV51g4+9os9kmz/j7G2rufYQVpwmMsjGkXerc2W7fsQNqy8img0V5USJ2hyv
 ZxS12djQtrmFqMrOHHRvpWmt5wlJOQ0mJyZXwMPp7ilQE9xc2ABgfP1CLXz/9gpr72Wu
 OT6SIPfhDAkoyjoafameEqRLulvtvcSwjSOHuYNXubIqR9BH065YwSwcS0SYxJFg9inA
 +kN0+NUiucqFbUzQi02pQB0DedWykqjDzk8NNmcF7cmlvxpn4nRnaPQQyQoAqiREzEDs
 JcbEiwuP9802Y2M9H6Q0q3sH0jDBUEcys7lNkdHKBYiUY932dQabPxRVPlOYKqWPpp00
 pSJA==
X-Gm-Message-State: AOAM533WzeArflkAC6DIiKaKggflyck5RNVwOMDZncInsFkUZb+AhEBh
 5bj6NKXrlJa4Rjm5wD4rI+ie+A==
X-Google-Smtp-Source: ABdhPJyZk7UvNtBRhvYqLsjGdbqmnaFei4zz1pKOWvJ7JMNlxXRFrZvOUHzo5sQPgVg2JI2Due3AYA==
X-Received: by 2002:ac8:1090:: with SMTP id a16mr14445444qtj.297.1633109026207; 
 Fri, 01 Oct 2021 10:23:46 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id 188sm3272229qkm.21.2021.10.01.10.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 10:23:45 -0700 (PDT)
Subject: Re: hexagon container update
To: Brian Cain <bcain@quicinc.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <107df921-3339-7b73-15f3-daba2d61882e@linaro.org>
Date: Fri, 1 Oct 2021 13:23:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB42057F473618E661B72E1FF3B8AB9@SN6PR02MB4205.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 12:59 PM, Brian Cain wrote:
> Alex,
> 
> We need to update the docker container used for hexagon for new test cases proposed in Taylor's recent patch series under review.  Thankfully, CodeLinaro has provided a binary of the hexagon cross toolchain so now I think we can simplify the hexagon docker file to something like the below.  I hope this also means that we can remove the exceptional handling for the hexagon container.
> 
> I can propose a patch but I'm not quite certain how to test it.

make docker-image-debian-hexagon-cross NOCACHE=1 V=1

and then make check-tcg to use the new image.

> 
> The "--no-check-certificate" argument to wget is very bad but I'm not quite certain how to upgrade/change the container's certificate store to accept the apparently-legit-but-perhaps-newer-than-expected certificate presented by codelinaro.jfrog.io.

Hum.  This all suggests that it would be better to update the build-toolchain script.

> RUN cd /tmp && \
>      wget --quiet --no-check-certificate ${CLANG_URL}
> RUN cd /opt && \
>      tar xf /tmp/clang+llvm-Sept-2021-cross-hexagon-unknown-linux-musl.tar.xz

You'd want to remove the tarball as well.


r~

