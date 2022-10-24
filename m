Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6677A60B165
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:21:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyvS-0001aH-Tw; Mon, 24 Oct 2022 10:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyuk-00018C-LV
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:58:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omyui-0003dV-LI
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:58:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id l14so9452436wrw.2
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6a5ttLCcZqMYEoVtmxClVQGTaQT8WGldW6cNOtMdTSo=;
 b=YDCqNMYtDiooNYvBIbtfawAsLeo6e+d/d04ugw2pUw/ZVVHINfvsWk7VX7xrn+80AC
 xNWnXQlB3/s7mhxK4W8AoSdYClXwAtX4OKgN0PXdjIG/mST7kH5ajJdecvRf1kXjPlwj
 nsXVLmT+3frrv2FF8TEoeT5iNpsScc5EhmhlQ5VT1X3+ov6ASec9daiBqLpSfHGky+NC
 Mrnhgo3SZ2EgpyYHxkOMKwof5MQ5sjByONVEnBBttc/pYEFSAiQpZOOxpvOWT33B1hV4
 mhBXyFhLBxmmBGogEGKxeIwcOFm8GEIzA6qlJw0CelqHZt31ILzkbjH6PXmMRYAmU6x6
 CtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6a5ttLCcZqMYEoVtmxClVQGTaQT8WGldW6cNOtMdTSo=;
 b=ll6j9US7hQETe7n5W6f/mb+dJOAAhW5d/uyh3tgJCLYQm1GXceWtCiGWiHePJEBPLn
 lhX5y1IKRERDADZNEKcZEPDfngorAmDjhftbn3dmZ89mo8rzRxDxWDBmnLTg02680mtL
 oSONV5RFrsA0jAj+2mHamp1xlx8Nica0+5ZtvDczhU7Fjk1ry54FIHo3WiWUqbEUucZT
 8qAZ9z2lW3avpmKo7GNylhAnYHOwTwZpYxsr7VcjMaJ301V7jGVv4eECtRmURAVpsN5O
 PfrIPYON2x2ul+Jow1bzTo3ZWZKnh39txziwJMJcBTibyXi++yAobiscNIpWKYP9woiM
 uZ0Q==
X-Gm-Message-State: ACrzQf1wv8SG2YrQ7IOowkTJToMfX++bvHw6QvTFaiq0SDcR1WE2f5cO
 VMYloO0ckzP1uXEO4Km6NN2FLw==
X-Google-Smtp-Source: AMsMyM6585ImITqws09gPyqQZAhwfJpZkqyIsDGOsAfyLcDlypnLBPhm8X7qM8ZaBCEufRTJmT5Bcg==
X-Received: by 2002:adf:e6ce:0:b0:236:76a2:fc80 with SMTP id
 y14-20020adfe6ce000000b0023676a2fc80mr2483467wrm.163.1666623531007; 
 Mon, 24 Oct 2022 07:58:51 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a5d49c2000000b0023657e1b980sm8656435wrs.53.2022.10.24.07.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:58:50 -0700 (PDT)
Message-ID: <26b10163-60e8-297c-e574-cf7f2ecec495@linaro.org>
Date: Mon, 24 Oct 2022 16:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 05/29] target/cris: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/cris/cpu.c       | 11 +++++++++++
>   target/cris/translate.c |  6 ------
>   2 files changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


