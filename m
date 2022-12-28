Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609B965769A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVmk-0005Z6-D5; Wed, 28 Dec 2022 07:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVmg-0005T6-BC
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:43:51 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVme-0000H0-Mc
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:43:50 -0500
Received: by mail-wr1-x431.google.com with SMTP id n3so14104743wrc.5
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FUO/PeFzeq1jPg1WvfbF3LFq+yRCoH1pTLlAjTJbb0g=;
 b=vEWUMS02xMrVVaCMjxCR3VLB55SNEzBMXupYeWb0iojuSFaTU38cBj1D+kPPkau2dg
 E0mV/D4gmzhHC4kVmSkADDEFtuKOa7tjashRFUk/F4p/UJW1EUKHhObg35YW/IYsDs6z
 A7NdiRVMNknsxHhxiCNHPjP/sWtC2Ra4Wna4affBxOo+d7zeQ3HPP/YTC7HwdCPik8dQ
 gV5U5tlEIL9xUw1ZKkfNCqfVr9lBjq6/ht+5lnJR0SntSa+5XnMPfNemankHY1+jvrdV
 ssDVLDmIF6fjvh1UQ0LvnmPTrBuJPFtunABjZJwghClS/TggAW4tNn+Us8jIEP2Gi7Rx
 9uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FUO/PeFzeq1jPg1WvfbF3LFq+yRCoH1pTLlAjTJbb0g=;
 b=LWkj6Rz3Nr5flP8DyiJr2MKqZ+1YryHpEnHGPES1e7qgZdnCzqFhBokZwhgNeBzMWw
 G6zt/W3iVq1YAL9SdFhASewOXzaaM9pFk29z0Lh1B9aKBRDT+K01SAzVQE4RmhVQzb/s
 vK9RrnWiQMHiny/BzMXFcAd0OMAxtSxywsJKILGGT45CGx8dOuxjeG9SaSsz/3wG3qAX
 /pC3eo2kdcBMcCyx0j253Ku1fE4GYh4Ui2CAOzsAcwPEbT4NcW0VIk8itzQNEU/PqfMW
 4d3MZpIIYpgZ+s3ZxI5QWjM/0D7W6N0zfZmeZ5iXEtMTrDZdPhkVOPCjBJSzCxEibE/I
 z2tA==
X-Gm-Message-State: AFqh2koB3yZWjjl+FOG3UYgYfkFVlSh20712FAmpXLczjrYvbC2NIJ6a
 3lSro7sLjo3qwV64J3mJUt9kiw==
X-Google-Smtp-Source: AMrXdXv4HzzKOMvNqBsPcRUPJYiquWLYr7G2L+lAxSncOq6pGsJ20gSXC8havk4VaI4uANP3lPUbtw==
X-Received: by 2002:a5d:534e:0:b0:277:e258:cccd with SMTP id
 t14-20020a5d534e000000b00277e258cccdmr8135856wrv.15.1672231427047; 
 Wed, 28 Dec 2022 04:43:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4148000000b002428c4fb16asm15375120wrq.10.2022.12.28.04.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:43:46 -0800 (PST)
Message-ID: <e96b708a-b695-aa6a-0971-fc22caa36fbd@linaro.org>
Date: Wed, 28 Dec 2022 13:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] target/hexagon/idef-parser: fix two typos in README
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, ale@rev.ng, tsimpson@quicinc.com
References: <fe67371e03f9dde38eb7554937da0a96a230730e.1672174122.git.quic_mathbern@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fe67371e03f9dde38eb7554937da0a96a230730e.1672174122.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/12/22 21:49, Matheus Tavares Bernardino wrote:
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   target/hexagon/idef-parser/README.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


