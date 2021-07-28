Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19AA3D8922
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:54:25 +0200 (CEST)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8eOW-0002lA-Tv
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m8eNU-00026O-CC
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:53:20 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:35390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1m8eNS-0002fI-9D
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:53:20 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 i39-20020a9d17270000b02904cf73f54f4bso1242223ota.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 00:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FerKPdNaFDKCfscT4TU+H3pHmBs7p/zLOTgpsEPpRyc=;
 b=Gv11WphHbOsIk+BuBIB8WxPTOdewbcOmi2CQEmVUbTH43p3buIqGkAOvHs/kF1fLh5
 ST6o5fM6U/gF9f5waUfHNJ+uhjRJojFvpkuQSQw8zht+Zegt8RDqisYAkboZE/KpBOpq
 59YCYfwekcbiU81okOZNPWq+HZIsTKvfnY/5PwntQDESQLve1xNbXWFEsS0OK3+NXz6X
 aiCKPN4/Mkn0CACeJn1dVWaYkFU8LGi1HXJmKK1lZ1EZ8SNCbzSpLD88Y+mkz8x13Q3X
 aRkIE4G3inHNlX28Q5Pw6GhBiNU7QHlioZrU0bbzqz4SuElJdvvKgSjK4hpuoiq09XGq
 0nFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FerKPdNaFDKCfscT4TU+H3pHmBs7p/zLOTgpsEPpRyc=;
 b=FnNFw7PimT4ey/nexRmfNrg8ufSOjP6vu4N2R4sEb23EIXLZAsu7tfzt1LJpwfGzEC
 xR557E/mpfRniEbPJZiHEidrF73GcULV2B/hAUVhYNmYKqbxXyHurEKO+X9VUl2EUmz2
 Wid4m6i638n+mXLaO5zlG8H2RqOYomTRMo0xMg8nJclPDQsapYWCfhp4VU+YDME8x+TH
 onpD4DtLyD5n1GbTEbAxZkk1Z73sqkqPfHPUXaablYt39jFFN9/LP1a95/ld9/O/HKYv
 HOTHpTEMXmyRa2h3j7C8CQbJtXlZAoou+aknHeCQDpcp1ajASJaMU0O4EfxIkTsSzxJz
 9m3g==
X-Gm-Message-State: AOAM533KD4dqzq7z9kryV88O0Duj5bOF+8tg8MCACLA7IJniW5HZx+xl
 +mqwIXL2v1UZFJnBYvy9ihJYxw==
X-Google-Smtp-Source: ABdhPJxiAnAXYW7cpc2jt+bzVAQGVqgfDJGlXPpwmDDgeEdmrvc4OGxvN0UcPZbElDk1DDPBI2YULA==
X-Received: by 2002:a9d:7a8e:: with SMTP id l14mr18003709otn.304.1627458796387; 
 Wed, 28 Jul 2021 00:53:16 -0700 (PDT)
Received: from [192.168.147.11] ([172.58.97.139])
 by smtp.gmail.com with ESMTPSA id b6sm9734oib.51.2021.07.28.00.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 00:53:15 -0700 (PDT)
Subject: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
To: Taylor Simpson <tsimpson@quicinc.com>, Sid Manning <sidneym@quicinc.com>, 
 Brian Cain <bcain@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
 <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
 <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
 <BYAPR02MB55091DE5B976956075B46FADBEE19@BYAPR02MB5509.namprd02.prod.outlook.com>
 <8845de00-ddc7-86a3-600f-6ede81e168c2@landley.net>
 <8192e9bb-a0de-1b2a-271c-ac7323be8244@landley.net>
 <BYAPR02MB48863186EDD71439C60792A0DEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Rob Landley <rob@landley.net>
Message-ID: <b902f367-d911-7e58-2b7e-8a753431eb6c@landley.net>
Date: Wed, 28 Jul 2021 03:11:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48863186EDD71439C60792A0DEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::32a;
 envelope-from=rob@landley.net; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 8:59 AM, Taylor Simpson wrote:
>> Anyway, I still hope somebody else has already done most of this in a git
>> tree somewhere. :)
>
> We're working on system mode support for Hexagon, and we plan to upstream it when it is ready.

Yay! Thanks.

While you're at it, why is llvm's cmake config unable to do:

  $ cccnext/cross_bin/hexagon-unknown-linux-musl-cc \
    -Xpreprocessor -P -E - <<< __SIZEOF_POINTER__
  4

I'm trying to genericize that llvm build script to do all the targets musl and
llvm agree on supporting, which means not passing in -DCMAKE_SIZEOF_VOID_P=4
because the compiler ALREADY KNOWS THIS... but cmake/config-ix.cmake line 196 is
REALLY going to barf if we didn't explicitly specify it on the command line? Are
the llvm developers not _aware_ of the "cc -E -dM - < /dev/null" trick? Even if
they aren't, why couldn't they just sizeof(void *) in a header file?

*shrug* I can do the above trick in the wrapper script and then provide
-DCMAKE_SIZEOF_VOID_P=$BLAH on the command line, it just seems DEEPLY pointless
to go to all the trouble of having a ./configure that has to be manually told
stuff the compiler already knows.

Confused,

Rob

