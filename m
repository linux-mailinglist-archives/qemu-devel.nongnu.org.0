Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337460CD3E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:18:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJmo-0002x5-LC; Tue, 25 Oct 2022 09:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onJmZ-0002Ip-2l
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:15:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onJmW-0008KX-49
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:15:50 -0400
Received: by mail-wr1-x434.google.com with SMTP id bs21so4991644wrb.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=igPKnvZX1tA+V5jqnO00CBiLXcl+HMh4nJZtZXcAkM4=;
 b=EJP6EruJZYCtttDSPVu3C+4NU1FPpVy6M5ulR7snASf08ka9ToNG+nwDoeD5ydtJqx
 eW7vHBFnsz2mQEQq3nvCBkj7TDOSOHLBbh0aJP2f0DQTZOLcCwNVEF9fRaPGFgzHzST7
 +7P8HJ6MqInbmz4QesjzC4DBN5z5//7XVc48PxXhtL6AtmyLjAvGzLHRKSBnP7wHvgUB
 9H9IUFIysbj5yIj83RHT4jp/yo4nGMv1GJv1v9c47iHRRJATW3tDfbO6QoE84deR0RtU
 NV7LvPEE6A+A/mgdjyvKLjHZ7VMAfX2v47i65mZQMWCV1CgJC98R0NxBFmWrzFIjLZ5d
 hgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=igPKnvZX1tA+V5jqnO00CBiLXcl+HMh4nJZtZXcAkM4=;
 b=wkanH8FaIFy0iCReOnGMDNjVZLMEaNdHc38z6dgPq7Qn7WQBHrApGQRQUBGSp2Sgmi
 EDkDj6K9Zt0qusftwHE7cepVl7JWrwpodsTdizdjaNGxlgn4eBbgrhBJmFJoTRqGoYyx
 SlAP3W6JFcQZbbShJLB5/ctq6Mn8EwfZy1Svr5JPh1XOr2PNYJZGuTup3Tmfpi9Y1Uri
 eN4jbuqmkVmdd9phJjjY8xa7YKtlO6q5GryxAMnKBymuoS2a7+jbk/+xrTsbaUs53bDK
 ubW0IUF9CF8zcMsp89+pJOI8aLavYe0a+Mrm4vgibd5Egs/ReBcuXIhsc/HXKEei+Fel
 uIIg==
X-Gm-Message-State: ACrzQf3cfNU8YbHzFuAd93BGcaQ/Ok/Ny4PoD82P281CpAWjsBbrM/ug
 LQBST+GQI256iGTJWpX24yVKmg==
X-Google-Smtp-Source: AMsMyM6AzF3qDAELC7hDDIRWGV4DZmgpBHIAJdFHR2/0VXnHOuhI7RWNFyj/kqbLMzLlNlp/uB+MPA==
X-Received: by 2002:a05:6000:50a:b0:225:210c:a7e4 with SMTP id
 a10-20020a056000050a00b00225210ca7e4mr25061669wrf.704.1666703746687; 
 Tue, 25 Oct 2022 06:15:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adffe87000000b00236740c6e6fsm2587082wrr.100.2022.10.25.06.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 06:15:46 -0700 (PDT)
Message-ID: <6b525f12-2d4f-5b4a-3782-18b93982fcd1@linaro.org>
Date: Tue, 25 Oct 2022 15:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 1/4] include/qemu/osdep: Add qemu_build_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
 <20221024232435.3334600-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024232435.3334600-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/22 01:24, Richard Henderson wrote:
> This differs from assert, in that with optimization enabled it
> triggers at build-time.  It differs from QEMU_BUILD_BUG_ON,
> aka _Static_assert, in that it is sensitive to control flow
> and is subject to dead-code elimination.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/osdep.h | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


