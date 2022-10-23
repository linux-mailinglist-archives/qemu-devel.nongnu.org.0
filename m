Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5F0609ACE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:55:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omnKQ-0006AW-DP; Sun, 23 Oct 2022 22:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omi9h-0006uv-KG
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 17:05:13 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omi9g-0004NM-4p
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 17:05:13 -0400
Received: by mail-wr1-x429.google.com with SMTP id bu30so13078434wrb.8
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/n/KNocwNNep0LYtWhpFuXWHrMd9Z6ei68Q4xIzStlo=;
 b=vSQ7ByXJzzMBApS1lXYI+7HnutNRIc/aXIPg41S12WVNV4ciULlAb+7TCdYq7pXuYm
 akkKXH1V8/uBNhwOiTEYJk0CQildflOPvMKK0r9sz6+Ie1ZESrMYUCfQfz0He9ICVRtw
 JBZ2QXQVz0X3ET4+wV+wEXFiZ6pO65u6WLRks8x5f9twJpiB5CEJwan25k0UWHxA4pJk
 yV3Ul3AmYeMgSXrqkvT/1fB8YUpMP5w8Y0qRfkRYaCY6YUArTMCJyXoRIurenlBezA+Q
 k6nsVVFhCEbKcvCKgR677CPhmiVkd8ql2HYG82eNYnotHqPhPHzoICm9kyJaSA9M1A+X
 Cxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/n/KNocwNNep0LYtWhpFuXWHrMd9Z6ei68Q4xIzStlo=;
 b=UHG7cusfIugGEu8ePkgtWxBYEbM410uJKWSViXFeMQ0gez6/+zLEr8nsm5E+vnU1Aw
 G3v2d3lCT3TUmm2J0gKJpf7tboq9NJtxeYYIIiJmDmlWV+3/Ymfn2oOfh/bhMAUGE7t9
 gbatMXsGr6U7BKpBM0YjZ31Uimw0ofIve+ND8QOlU9Cfa30ZBLQ58YqmQeXuC40q81QP
 6gWpeJCxcHpkX1usIJoKhZCtmmc2yJz3XnVeoolawFlaMai+07269BrYJ+Yvcpo8V6vS
 Jj1S6AvJR9j1zP6PE6IlvTWsf2S3EKdDJa7roST5WkZncTksWM8BL+yJdSz5Dd6DE+Mf
 5+Ww==
X-Gm-Message-State: ACrzQf2RUcFiE7kWougXrWnojSi/5p6gPU6+fq16WZUzQgJ65qtiUjvv
 j2xAZWFeJcWx0IqWJV+VlQMDZg==
X-Google-Smtp-Source: AMsMyM6ERAa6cAX5MsS39AZibo7Cm2u1tFAfYOcU+970Myyvee5X6REBE4RwUudZAIMYD4+V3KcOOw==
X-Received: by 2002:a05:6000:1a8d:b0:236:4810:9966 with SMTP id
 f13-20020a0560001a8d00b0023648109966mr11739560wry.366.1666559110435; 
 Sun, 23 Oct 2022 14:05:10 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 bv16-20020a0560001f1000b0022e6f0d0d7csm29712144wrb.18.2022.10.23.14.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 14:05:09 -0700 (PDT)
Message-ID: <73d3b8a1-f25f-3979-2e96-ddc3a316ea92@linaro.org>
Date: Sun, 23 Oct 2022 23:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 18/43] hw/isa/piix3: Remove unused include
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-19-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-19-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 22/10/22 17:04, Bernhard Beschow wrote:
> Ammends commit 988fb613215993dd0ce642b89ca8182c479d39dd.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


