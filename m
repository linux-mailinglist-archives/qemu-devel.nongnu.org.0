Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC334B935F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 22:48:26 +0100 (CET)
Received: from localhost ([::1]:58548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKS9x-0001or-JQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 16:48:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKS8D-00014w-2m; Wed, 16 Feb 2022 16:46:37 -0500
Received: from [2607:f8b0:4864:20::1035] (port=52903
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKS87-0001J4-IK; Wed, 16 Feb 2022 16:46:36 -0500
Received: by mail-pj1-x1035.google.com with SMTP id v4so3714349pjh.2;
 Wed, 16 Feb 2022 13:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RzGi8smxUHc9ZtoZcmtBclCBkayJIu7CnfG9acluwH8=;
 b=VxcAyf9DMrKqHPZSAAjaF8wqRTaPTm/h4lnX801rv56po6pOQGtw6UHqDti07kC08K
 ecqXLpeeHHyH4uqxepYJFmleJEYdmcDNnm548iaSKM7lch/FkapkqOui+UlY7BzQFvIZ
 j5iTSOt1QmTRovg1XSNJ4/taOehQuO0Ti68sprktM6sErqvMGcqj0y+54EamIdmNkF7m
 ckldBTZsGrn0uZT9Y1JhkZxIkj27r7idjtIvBYOh4WlF5ek1F3V+YN7Kwzv1ZKqNuukb
 sVXo+OSd8w8GwmRWeCsC6zzqOLEY7EE8NtmLqVxqPmgLKQf3rAxt7Bb3GKrAz6Gl1RQy
 prMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RzGi8smxUHc9ZtoZcmtBclCBkayJIu7CnfG9acluwH8=;
 b=k8ChfEH2MzmehtQHZhBgbcydubzZOjVtGod0sVhfYrHfw+whopMsNK+o6gmnPgpLo4
 xnsrItvGKQTdE62+Ly0CbmV/k/Mo1jLq+3kyXuBPyE4wzo94Nji0x77LX00Ndt5c4hGs
 atfYOlriDhSUjkKBu5Aieh1L9PknKALNRuMpXuLpMG2COSQKKlZCaItp+mZC3t6QTtgd
 qZN/KYyCwwhS+Mb43URkDrbGvtFCKC1PTmzdzs9D5otwEAmV+k4DrQi69aDSAAutAd3q
 AD8zJMYC7HmvEreIXIR9rNnyzzonj8DWihFOtTCxai2seD+4ncxHgOcv/hAAaqkQUTIv
 uLqA==
X-Gm-Message-State: AOAM531ePa6p/Zv8gK1+ZKDLr885uptzhoWgkWPnus7+QcZNd97/XNv1
 fW2WM+4mvHs0UZG4khVQO/c=
X-Google-Smtp-Source: ABdhPJxlWn8rUEvqZdGxg2y/LUQEK9BdJWdJlWCtOkm8c3aPuDci6muWVYRBPkq5/Egpdke12NWgjw==
X-Received: by 2002:a17:90b:eca:b0:1b8:a62e:4125 with SMTP id
 gz10-20020a17090b0eca00b001b8a62e4125mr4012341pjb.88.1645047987549; 
 Wed, 16 Feb 2022 13:46:27 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id h21sm3670922pfo.12.2022.02.16.13.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:46:27 -0800 (PST)
Message-ID: <e46edd98-b304-d846-26f6-f1b7c73c9870@amsat.org>
Date: Wed, 16 Feb 2022 22:46:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] tests/tcg/s390x: Build tests with debian11
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, David Miller <dmiller423@gmail.com>
References: <20220216115102.206129-1-david@redhat.com>
In-Reply-To: <20220216115102.206129-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/2/22 12:51, David Hildenbrand wrote:
> We need a newer compiler to build upcoming tests that test for z15
> features with -march=z15. So let's do it similar to arm64 and powerpc,
> using an environment based on debian11 to build tests only.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Cc: Beraldo Leal <bleal@redhat.com>
> Cc: David Miller <dmiller423@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   .gitlab-ci.d/container-cross.yml                    |  7 +++++++
>   tests/docker/Makefile.include                       |  3 ++-
>   .../dockerfiles/debian-s390x-test-cross.docker      | 13 +++++++++++++
>   tests/tcg/configure.sh                              |  2 +-
>   4 files changed, 23 insertions(+), 2 deletions(-)
>   create mode 100644 tests/docker/dockerfiles/debian-s390x-test-cross.docker

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



