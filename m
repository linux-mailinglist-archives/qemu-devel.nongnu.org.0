Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C543170C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 13:18:06 +0200 (CEST)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQeb-0007Dn-DD
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 07:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcQbc-00060r-Hj
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 07:15:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcQba-0003ZV-TM
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 07:15:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id v17so40590764wrv.9
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 04:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9qBVCEaNHVJgkM01xLy8+Mb1Rsl0s0YtNlWwvEU8a6w=;
 b=FBat1PiAb+LCwhAXfWEpPbb6xLzNEz39kaRWdTSkNWgzAtUTLQ1wMBSHhowW68nGA5
 BztQlo1bLiKyLNiPx2NCGvDWRXKY8xPhSQNhKgS1X+5tpC/Dvvx2DTwkNXaxbjRjZ28k
 y587CcZLwfu2ak2GB8Mo/EYY6yeBIZGppnxGDbMu1/aSaLHuYqyDAXZ21Nf1mNJh6S9a
 k3eFzN2wRMTbyUOW1o8dlNkXN/xazMjcKq48lUW2y/pkuLfTgy7HowM1pa7kxwD7m+xi
 YEI22myEP8ZnDBXXknolQkEApZRxRakM3oKLbThYkOI596NFhLJF29sdbhvX8qjni0Uk
 1tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9qBVCEaNHVJgkM01xLy8+Mb1Rsl0s0YtNlWwvEU8a6w=;
 b=QPFdN+BbBlCMr5N+s6EUTOEIEcwiCaYzVtTJI7LqSY8zxInu5UbbtlrlqVY4URybrr
 HPZYjO3zleP3dCaYWaz/eqW79CvoSEYHF0bPT2yvcp+1NyJ7vS4yt8Y0NVCFahLVLJD8
 UL4U24RLg//Bd0T9qDXYVSAEgqIBet7ncNKFKbggeDbQWooXzsf7KsNrj1Kze+CRkAgj
 OEyXfVXUCZtV2/nXeOuiMMRu6sQlQEhP4YdCU/wRh2GO2KVDwGUypc1vwWr3r+nci/ht
 FBI6M3kvQBlO/sj8DOqsPU468dToYUhTAaI6/MRwWJJV3xIjsGJO+cTeHD1bcD7GD8eO
 VKhw==
X-Gm-Message-State: AOAM531QY0ZXboH5uUQSZUfxeBwj1DKxISpihSpzfCVYrUCIGnVFHwVO
 TU3SRxIEy0xS2D09Y2sBi7w=
X-Google-Smtp-Source: ABdhPJz/oxNb+oXgQczl3MkmAKolmMIk6ykxZo5GfTWK7/sPWVndAYXKj07gCM1jQGhiWriGHwQUAw==
X-Received: by 2002:adf:8b4d:: with SMTP id v13mr2935538wra.438.1634555697216; 
 Mon, 18 Oct 2021 04:14:57 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id e15sm12171819wrv.74.2021.10.18.04.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 04:14:56 -0700 (PDT)
Message-ID: <1b40cad7-e2f7-c461-6cf5-b1a77b76eae8@amsat.org>
Date: Mon, 18 Oct 2021 13:14:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/7] tests/docker: Simplify debian-all-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
 <20211014224435.2539547-3-richard.henderson@linaro.org>
 <87ee8i1u2x.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <87ee8i1u2x.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 12:54, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> The base debian10 image contains enough to build qemu;
>> we do not need to repeat that within the new image.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tests/docker/dockerfiles/debian-all-test-cross.docker | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
>> index dedcea58b4..b185b7c15a 100644
>> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
>> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
>> @@ -8,11 +8,6 @@
>>  #
>>  FROM qemu/debian10
>>  
>> -# What we need to build QEMU itself
>> -RUN apt update && \
>> -    DEBIAN_FRONTEND=noninteractive eatmydata \
>> -    apt build-dep -yy qemu
>> -
>>  # Add the foreign architecture we want and install dependencies
>>  RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>>          apt install -y --no-install-recommends \
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

IIUC if we keep --arch-only in the previous step (previous patch),
this step is required here.

