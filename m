Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B865F689
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:13:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYUK-0006oe-1V; Thu, 05 Jan 2023 17:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYUE-0006oG-MJ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:22 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYUD-00026s-7C
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:13:22 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 g25-20020a7bc4d9000000b003d97c8d4941so2377904wmk.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZSoxsNdyjXhIvzf7CA4f11duf3jYGK550rY9iSqRboE=;
 b=lCG7HKsoo5HZFA2pXcScdo9JbCiJofthXmOz0xDUxBb47B/u23/op9IloQg+oZFZS8
 Wzir+XB2/MGpSpAePnKgIM4WPOv5/3MAf7U5nthAZu+Ce6vidFOMr/q2igEVvfm1wOcI
 zsC/8zeTWVylRYzynth/B1h62xhXLJlGEzILlN1vDHegvW4aB0X4XkRw1NgQO9JQEYsZ
 zBQgKFHLTPhyo3XalBCASdJkF002+gzJH/BAVP+a4UcqUHu11kJS1vT1QB56ot7H8QF0
 Q/3/hboe+uARg/sYaQQ33cDhfnXQs7e1Ai2Z/tsiIvyJt8fSwXsvCOPghq89QeHDBfoi
 prEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSoxsNdyjXhIvzf7CA4f11duf3jYGK550rY9iSqRboE=;
 b=z2/jq9rvaRe/x3EtZBbzv0v9gqwSwuMVH6bieVHZVDkuEFe57MlEcNgettc8qEm6Fg
 CfQM9u8dh2xpRzyhPOOHi2wZHTyj7AmpHh3j+1HhQDivyYhyy3yQt7EGdeF8pR2EoazB
 kV70qDHEfiyVgilv3i4KVjzttqBSiSgh1AVYj61Pu19rO19PXK30yDLXKwewRzgvbmWu
 Cy52fhq8p3SPHIzsfnofInVgJ4sNWnyMY8Tu8MqvLbYQ3OaC7fmFSzCToIBsjOZnQnm9
 N73VDIliYjk6MEUMagZlya4dQIAxgFZ3JahVtrTJwWqlJjrgxITX5JZ4FvUIZGS7fDzj
 rVQQ==
X-Gm-Message-State: AFqh2koyPTqar58YanWmqvA5IDQ6NwKbMT+GSUXILgaSSY86saZqMYPn
 lMMSfLDYKzODGBHepZp2+m66lw==
X-Google-Smtp-Source: AMrXdXt1IhGNH6CBDhMDTto2ctGZl2dAtDJP3FgoIkJ2xIRJUgXYNVDZW72VX8jhPhtMgM53R34cVg==
X-Received: by 2002:a05:600c:4e44:b0:3d3:3c60:b2bb with SMTP id
 e4-20020a05600c4e4400b003d33c60b2bbmr3580321wmq.23.1672956799329; 
 Thu, 05 Jan 2023 14:13:19 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b003c5571c27a1sm5185201wmo.32.2023.01.05.14.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:13:18 -0800 (PST)
Message-ID: <f41e34b4-bbd8-806b-4609-6a2bc1d67c61@linaro.org>
Date: Thu, 5 Jan 2023 23:13:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 28/40] target/arm: Split out xscale*_class_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/1/23 19:16, Richard Henderson wrote:
> Use two intermediate functions to share code between
> the 13 variants of pxa*_class_init.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu_tcg.c | 81 +++++++++++++-------------------------------
>   1 file changed, 23 insertions(+), 58 deletions(-)

Yay :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


