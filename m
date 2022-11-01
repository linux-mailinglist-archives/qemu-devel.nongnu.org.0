Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF8C615045
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:14:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opuZu-00019v-Jj; Tue, 01 Nov 2022 12:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opuZm-00019C-Sz
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 12:57:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opuZk-00051O-RR
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 12:57:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z14so20972966wrn.7
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kh5k6Gcs103O3hPkb/jnYTBCgB0//+5piMyuK7GnP1I=;
 b=zTvz07EsesMwDtd+1Wo37M2mmc1GPJxbbD2eq2wk3RgK1DnotkasI62vQa5+nsp9Jh
 bw5nOxfMfxgrZCgj/cC8VlgAVbPDRKYXs9R2OPMCooM6YCjPDwPqyM7Jx2WRvXCMK5lu
 7D43LGC6GPZg7i7kvzwj9teaXmFMc5BFwD1D1CsFYrto7bgfsPwKDp6AghYd+GmbeCg0
 fi7eC8pqWS9tcqUdRmCDEkPSpGXw4OJJGC4kQB6i0BhPYPj82amckrNl2/xi0H0tkBqy
 nLbT8f+/hiJe/RAVSvtm0owzgSBBwSkHlvo15edfyI1I4JNYirOsejjXlgMGA7+NRTXT
 dWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kh5k6Gcs103O3hPkb/jnYTBCgB0//+5piMyuK7GnP1I=;
 b=P2nIS+B+rJsQMKIgZo7LVDneWuP2SCVzZKCE7fMaFEEJZ7jPrBegMub0D/gP2j0b8F
 6NWDuORjufWdnYqn51ltaW0sxM+5q2xljR/jHmTTBQp47vVAUz1/x/KHMDB10rGtR53h
 dXmlgb0IZ5Xwpdkkm94oALR+Xh0vFIOMkzPs9irSeL99mth2h0NwChK53YRfGRq14I5M
 y28kPBZ6PrVwAuBfIZ8MlWNsGgF4e91NSsLlwCV+VkTmZMAO0/b1WzkkfnH/knunSf1N
 gi/AX139tx6GVhIuPCYehXeLWw2o7yEPcCaDxE5Pr1m6kThxbUZmKlVwioL78GuQi5GF
 ViSg==
X-Gm-Message-State: ACrzQf0eqzHu448EW38m9WzXip7XzpSlTHnsgLfYFemwcf6xgUvpxk2W
 jVfIOyKN/VoFEJKrMEuZD0+JlA==
X-Google-Smtp-Source: AMsMyM4vX4qX4rRtbObIDemnmR25bRBQLeZIjmtQgdvKcdYtwBveJcdqZMFYOJHA/8Jab8hJG1c0iQ==
X-Received: by 2002:adf:db92:0:b0:236:9d4a:476f with SMTP id
 u18-20020adfdb92000000b002369d4a476fmr12367496wri.654.1667321839210; 
 Tue, 01 Nov 2022 09:57:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e7-20020adff347000000b00226dba960b4sm10646318wrp.3.2022.11.01.09.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 09:57:18 -0700 (PDT)
Message-ID: <aa4463f4-30d8-cb84-b38f-9d359974e543@linaro.org>
Date: Tue, 1 Nov 2022 17:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PULL 08/30] target/arm: Add ptw_idx to S1Translate
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
 <20221025163952.4131046-9-peter.maydell@linaro.org>
 <2a7722fc-fd5c-709b-b7d5-2ccafb82b363@linaro.org>
 <425d6322-3cab-01da-e6c6-f8e07564e7c0@linaro.org>
In-Reply-To: <425d6322-3cab-01da-e6c6-f8e07564e7c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 1/11/22 11:10, Philippe Mathieu-Daudé wrote:
> On 1/11/22 00:14, Philippe Mathieu-Daudé wrote:
>> On 25/10/22 18:39, Peter Maydell wrote:
>>> From: Richard Henderson <richard.henderson@linaro.org>
>>>
>>> Hoist the computation of the mmu_idx for the ptw up to
>>> get_phys_addr_with_struct and get_phys_addr_twostage.
>>> This removes the duplicate check for stage2 disabled
>>> from the middle of the walk, performing it only once.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-id: 20221024051851.3074715-3-richard.henderson@linaro.org
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>   target/arm/ptw.c | 71 ++++++++++++++++++++++++++++++++++++------------
>>>   1 file changed, 54 insertions(+), 17 deletions(-)

>> Since this commit I can not boot Trusted Firmware on the SBSA-ref 
>> machine.
> 
> Do we need to set in_ptw_idx in get_phys_addr_with_secure()?

I opened https://gitlab.com/qemu-project/qemu/-/issues/1293 to track.

