Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0F45344C8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:19:26 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntxTZ-0000b8-80
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntxRE-000815-6h
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:17:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntxRC-0002P1-JN
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:16:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 o9-20020a17090a0a0900b001df3fc52ea7so2595416pjo.3
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d1YX1cI8tQ9+wdiLzfn8SdNBP0qt9u1gcZj3rIByMDc=;
 b=XLX7mE9uTy9qovQQSqjpXZdHOADqH/1OPHrkXucX6FbrQUBp0z6Bio75FwpGGONwnj
 i4gdeu0tX1OVUyuyMsHJGnU3OcSRoznRBzLAZTxKoQW54J8adKSXTZuD26krzJ3pMh6k
 D+QrnKg8abHYXQ7RbBwlFAlr3KSKKMbOewH7Q0LT4u1NLGyk7eR9GC1IYn4aFnJNyzBi
 i0G44UtpmXVtpqFVjKgwJdCZLROM+cWHYs+NDyT7Q6v9Y+zJyg9VJw025msYweig3BsE
 Be5M/kBhkAsPqQvtFy9FBXi2yOKQTKj5REAI2pH+GzlcgKRsGJ6vk7+h3K+AyW/LZzsX
 vXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d1YX1cI8tQ9+wdiLzfn8SdNBP0qt9u1gcZj3rIByMDc=;
 b=mxg/UIHVamipNtnbRmArLb66ixaTjnDmdG7x6vC0xK2PiSZIHWphqtKnbyd9Vzqv0f
 xp4yqwsyGggAu0Fn1h4BFN1RJ0JZ3DQgJp4XWcO2tlFNs7wFiZTxm61xdZLd4tMeQgpV
 SUbDUVGQYUrXyP+Cap6DyJ8G+YCkseWT06DB3u9zTBsVjeptIKxaYYSw16k14FCTuVcK
 LwBiqMKgsy311pJVcRYkE07tkGJqB633tGwcAETKo0+pul8Pp10LFHxrBG0CNKCWogEC
 jodC363V/Y36+450Qrs3Efc28762bThfVGM/4oHzJOGStVlKFPRv5OVbCvRvaxu6Y3iI
 BydQ==
X-Gm-Message-State: AOAM531wI3WXsugoN+7zitrycFHYzqwyUHiTHw+0ZlzMR0Qdx8+IB8or
 Wu6nYNCcNdb+UuN2RqP9tAUuyg==
X-Google-Smtp-Source: ABdhPJwjisoWHy3UXWQZh5/DjtiyGM4NRSif0DZjp3QnRKdx19CVoIF8d3p4ZJNTJObYs4kUEDjnfw==
X-Received: by 2002:a17:90b:4c4a:b0:1df:9cbf:879f with SMTP id
 np10-20020a17090b4c4a00b001df9cbf879fmr12142658pjb.84.1653509817268; 
 Wed, 25 May 2022 13:16:57 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 w76-20020a62824f000000b0050dc7628174sm11834019pfd.78.2022.05.25.13.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 13:16:56 -0700 (PDT)
Message-ID: <dbe09d66-dc14-c37a-af08-2378a4640e53@linaro.org>
Date: Wed, 25 May 2022 13:16:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v9 08/12] target/hexagon: import flex/bison to docker files
Content-Language: en-US
To: anjo@rev.ng, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 mlambert@quicinc.com, babush@rev.ng, nizzo@rev.ng, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>
References: <a430eb4a-20db-8c04-e9ce-0d3e1d4c3c46@linaro.org>
 <87czg11s8w.fsf@linaro.org> <67c27109-2bb4-7147-ab7d-215b6b03b4cf@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <67c27109-2bb4-7147-ab7d-215b6b03b4cf@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 5/25/22 13:14, Anton Johansson wrote:
> Just to make sure I understood you correctly, I should:
> 
>      1. Make a standalone patch that updates libvirt-ci and runs
>          the refresh script, in case any package mappings changed
> 
>      2. Change this patch to add flex/bison to QEMU's qemu.yml,
>          and run refresh

No:

* one patch to update libvirt-ci and does nothing else.
* one patch to update yml template.
* one patch to refresh.

Just like you enumerated before.


r~


