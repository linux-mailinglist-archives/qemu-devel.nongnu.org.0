Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B910B4430E8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:55:59 +0100 (CET)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvCg-0006G9-Rg
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhuqi-0003io-Nz
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:33:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:44842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhuqg-0003SF-D2
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:33:16 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2241307wme.3
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 07:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x8Pfoj9dDViHtuPQvl24yaAbC6mW7YrFQBGIBnOAQC4=;
 b=CgF5LCBkEBtxdii3TEee4i9gIHRX96tNRvvu/SO3wH0Xvw2T+QL+h0/qXfb7KG2j8k
 3tmKnPCn7JMEYX5xIG1dzuqFi1lmb7ushV30gdcT5l0WjhG8gqxwmCKXTBbYVlQDcktJ
 Bj1LqZyVBYRWH0Exwpk8YhpMmt0kpyn/o8Y7tuG0U2+z/DlJLQ0oIFcf7mak6brnDJJ0
 7FpKXJMrCGF/J7izLvZ1TYjXda+yMaTFGChsxzlQLvcXCRs30P/JZ6TvEPhL1SrLhvfq
 rbEtcxvjTr+e/0Bfj73jEKoJiAo0tupsO1YrRtj507r479meML16MayLXoAC63s701m0
 IPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x8Pfoj9dDViHtuPQvl24yaAbC6mW7YrFQBGIBnOAQC4=;
 b=nSH7iotdtupRFlrNUkcTEJ6iPhUYpscFXWOJX1+Tgbxmiw+2M0f5VVX6OMkhW3ev+8
 gVSdjbOmeAU2VHvq0AsJa9c+IHiLpO2jfbOltijXzuBVTo0ypCQjIVmwZoDNuuSSPjTC
 2pcJJ6BFUQvChO2G/Y9hrhxtBeXChghSqRQ8WpmZRtfDu+36TA9pdKbkN6QavCD908E1
 eyHe3ItJL/x3ebE/fxzlYlkIq9HmN6YBE5d/Yd2s1k0NkIiOHDvRc8vAEm58DgN3XJjm
 7s8uvmkpfAFj7cy/7mffbcHXfW1VAjw9i3BaCp6aGC+tT0D9eWjCeaomPAn4Hj67EYw9
 1H3g==
X-Gm-Message-State: AOAM532/HEoanQwbrcJohWZaSjUNpCrzPe//xqy9pdX4TA7Qqz85Jf/j
 Sj1Fsc/5He4ymHWZ1DQZzSzkSGaBwMw=
X-Google-Smtp-Source: ABdhPJwFqgtOWu+C3tixmdaUyJTGTP9FEtMyduFAqKuQNV9Mg8l1hqZAEYyYppdGJWEan2WmvwYX3A==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr7539253wml.6.1635863592462;
 Tue, 02 Nov 2021 07:33:12 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v191sm2719204wme.36.2021.11.02.07.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 07:33:11 -0700 (PDT)
Message-ID: <f0ac4624-43fe-42f5-02b7-211c2bab0649@amsat.org>
Date: Tue, 2 Nov 2021 15:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/7] tests/docker: Simplify debian-all-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
 <20211014224435.2539547-3-richard.henderson@linaro.org>
 <87ee8i1u2x.fsf@linaro.org> <1b40cad7-e2f7-c461-6cf5-b1a77b76eae8@amsat.org>
 <871r4i1s9g.fsf@linaro.org> <878ry6lot1.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <878ry6lot1.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 13:24, Alex Bennée wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>> On 10/18/21 12:54, Alex Bennée wrote:
>>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>>
>>>>> The base debian10 image contains enough to build qemu;
>>>>> we do not need to repeat that within the new image.
>>>>>
>>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> ---
>>>>>  tests/docker/dockerfiles/debian-all-test-cross.docker | 5 -----
>>>>>  1 file changed, 5 deletions(-)
>>>>>
>>>>> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
>>>>> index dedcea58b4..b185b7c15a 100644
>>>>> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
>>>>> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
>>>>> @@ -8,11 +8,6 @@
>>>>>  #
>>>>>  FROM qemu/debian10
>>>>>  
>>>>> -# What we need to build QEMU itself
>>>>> -RUN apt update && \
>>>>> -    DEBIAN_FRONTEND=noninteractive eatmydata \
>>>>> -    apt build-dep -yy qemu
>>>>> -
>>>>>  # Add the foreign architecture we want and install dependencies
>>>>>  RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>>>>>          apt install -y --no-install-recommends \
>>>>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> IIUC if we keep --arch-only in the previous step (previous patch),
>>> this step is required here.
>>
>> What for? The --arch-only prevents the attempt to install cross
>> compilers that don't exist on a given host but we install all the cross
>> compilers we need for tests explicitly.
> 
> Well patches 1 & 2 have been a cause of hair tearing the last two days. If
> we replace the previous:
> 
>  $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
> 
> which only installs (all) packages with:
> 
>   apt build-dep -yy --arch-only qemu
> 
> it breaks all the cross compiler images that are based on on debian10
> because suddenly their:
> 
>   apt build-dep -yy -a $ARCH --arch-only qemu
> 
> will fail to build. However this is somewhat hidden by the fact that
> most people pushing to gitlab would have that effect masked as the
> images will be based on the older ones in the registry.
> 
> Of course I ran into the opposite problem trying to test things as we
> aggressively used the upstream registry. As a result of the dropped the
> build-dep in the all-cross but without being based on the new image we
> end up without enough deps to build stuff.
> 
> In short I need to drop the first two patches.

I remember I had to do it this ugly way to simplify the
rest, and later I came back to it because Peter said it
was confusing, but I couldn't find a easier way to remove
this command.

Today I think we shouldn't bother to include intermediate
Dockerfiles. I'd simply use one plain file and let the
Docker daemon worry about caching/reusing.

But the whole machinery needs some thought since we want
to be able to use non-x86_64 hosts; and on the CI side
we want pulled images to be stable.

