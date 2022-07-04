Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E18565168
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:54:30 +0200 (CEST)
Received: from localhost ([::1]:49200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Imj-0000uE-Vg
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IcF-0000NH-Pu
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:43:43 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8IcE-0006ID-DS
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 05:43:39 -0400
Received: by mail-pg1-x535.google.com with SMTP id o18so7280293pgu.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CxWVM1GFhyYrlDd0j/64Apcntnr9mcYj5ATkJO+2Weg=;
 b=vEOj4K8SZNX/y6oo5LwN4lyfnZil7qRoSNSabQiYXZorobN5b9eFj5qVoapSfnJqzN
 OszsgZWNFo3uv3T7Enkk7S2YBicSjijaPDEqqOy5EUPBZXcGhC51Hp3y9Bb5qFb4+7B7
 KYtiNoo/AVFfQ6xuTOZaGLQzhinsLgk1vebz4Xbqxh0dbJJzqzM49AZlibWrjIF7qSeJ
 /+2UflZ9BcGG3/9snWb3mPOMedNqK2WZSIq7Xzec0L7l10YOoCA8WvzTS+MAgMZZ76dP
 Vyy1s24OZ81gVlx9Ow+Zb4PyT4huduNTIQ2WbykMQSOdxEVL2+GQNk70LLEt2QKr4A6K
 ypow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CxWVM1GFhyYrlDd0j/64Apcntnr9mcYj5ATkJO+2Weg=;
 b=g6/0iJd8GXRBrR5Kfdk+WhBzQRtP0vJsCAOqY/38y6tbeW+g4Oyq25Cr9xWwWDk5Aq
 jriSXm6J1OR81C3Wci1/PskAlpYdMp5yP3P7JD3AIR9acjHXn8lZ/n3lCmEKnICrMWbQ
 qaoAC/XT6ZYWROmeiGyAAaV8UCGpSAkQF7yBVt9ARFhFDA08j9obqjbshAZ0sOJ8KfiE
 1rcaW2xu+eeD6pBS2mG+68+ltittIkXpvH4XbySQoO9yqAWrhgK53TT9PTpnFRyZbQk9
 QJQ29++kgktR3WtBmXm6qOEijHJGEpYGI39mgIkznMnrRvzaNQd110NNcYySpR4HfGA+
 NSjA==
X-Gm-Message-State: AJIora8qRjPeegXUQg2sJRf+CGaaSx80h4cWOahf9iCUGzbS7/SsmGE2
 s4mJQF5aL9D3xU11qY8BqZILQQ==
X-Google-Smtp-Source: AGRyM1seBjvX4q02fzrI2m5XmoZoStIMUFzAjjfcf0kXQ3j0THt8wd0nHqKbYh4cKs9pwZoW4PH64Q==
X-Received: by 2002:aa7:9f9b:0:b0:525:1e0a:a6b4 with SMTP id
 z27-20020aa79f9b000000b005251e0aa6b4mr34745296pfr.5.1656927816877; 
 Mon, 04 Jul 2022 02:43:36 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a17090276c400b0016188a4005asm20577935plt.122.2022.07.04.02.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 02:43:36 -0700 (PDT)
Message-ID: <7a8da72b-6898-f83c-1849-83831f6cdf11@linaro.org>
Date: Mon, 4 Jul 2022 15:13:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 19/45] target/arm: Implement SME MOVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-20-richard.henderson@linaro.org>
 <CAFEAcA-v6_atdSMggO7mAfW0H96F8s2fZWLD3biHLjsFnbzYgQ@mail.gmail.com>
 <6176e126-60ae-7de5-1b22-dcfa585f4de6@linaro.org>
 <CAFEAcA98kHvZbh0n+sAYSVo8EFkjbL0n9q+-HMsmSyssLLraFA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA98kHvZbh0n+sAYSVo8EFkjbL0n9q+-HMsmSyssLLraFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/4/22 15:01, Peter Maydell wrote:
>> Columns will not be 8-aligned.  On page 38 of 0616A.a, see the illustration of ZA0V.B[22],
>> which is 6 mod 8.
> 
> Yes, but the column slice number isn't part of offset, it's
> in index, so (contra the comment) you could do the xor before
> the "add offset to index" if you wanted (ie it doesn't matter
> which order we do these things).

Oh, whoops, yes.


r~


