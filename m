Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B754A3A93
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 22:37:31 +0100 (CET)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHt4-0006hI-Gc
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 16:37:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHqK-0004bV-Nm
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:34:40 -0500
Received: from [2607:f8b0:4864:20::629] (port=33758
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHqI-0001ht-LS
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:34:39 -0500
Received: by mail-pl1-x629.google.com with SMTP id k17so10922833plk.0
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 13:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Sk4uqAJ7WTYfoEL7Qneo8uz4mZW1IjrIaoL4tW2iFZ4=;
 b=KBA26eZUJS9Aoidjl8XTHLWLMhM6bnnWI/ejpuo+h9CYC17mVWQ/e4a+IKjpaeU7Y2
 Vg/phc44o0CHD0I9YFjU3EssZ9qrWOhSbkcl+ehT4dgkOOtHWxnLZo7Jjfh0ULONYCe0
 +jjtZhjOfxWgyas+p1SKrvS8x8ZyQTx8CuH0FVVLINk0CRy95TjgS68SXawcYM3ZAEdX
 6zrrUc6Z8ZDQncem9ENUIdcHV0+VdLvTRbkBaH8ONNHfcgy5+s0KwcJn4YRQcCrRIIk5
 XnCdMYYmnTlYhy1lJ0cu7XRWeJadsk9RxYmLO8OxqXM55j3s4zBdN1cOp9EImc1CBS5o
 VN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Sk4uqAJ7WTYfoEL7Qneo8uz4mZW1IjrIaoL4tW2iFZ4=;
 b=fB6Qv2TFC1xRtklBCH3WkFmuOBvPLBgqB+HOMu7sJ1ZKiE5JFYOPtuJfbQ3SXVy6EA
 RC4A71PgMFs4z9Xpz86AaPDg1aFDYdI4KGvHUYJ5366sh80cxJW14IR5cQL17ds2NDYi
 ahUHKlvVrUWgItMjCf1391qSlSnQwqFr4QxpCF+3VWK2NQZh/mCgo5XkxxpnONUeqg2a
 0g/0+dzZm6SBcl8vMoIhm4qq4R1QkABV2MNWAlU6QAlGx7K/JiMv7EZ8v1mFO/NZnVDB
 OGafnI2UrSvDlnh35DhDCVzBvG+3goaNXVMwqfQxQuh3J4+yMfb9SL5YAV+nt/4XCYLF
 /1IQ==
X-Gm-Message-State: AOAM532sotCet5YvlQ/77O9TcSYVkiCRYZFFjyHj9hOktlxtdOpBi5Az
 okbiTuT+N1YIN25IXC1Ro2U+Zw==
X-Google-Smtp-Source: ABdhPJw/KGSGa8GdhA6nEOo/tobe/3BRkdvapvo1DOPC+4SVjxwYS8+m3U5NO0uW1eaSdWERHDQn4w==
X-Received: by 2002:a17:902:c10c:: with SMTP id
 12mr18525418pli.111.1643578465027; 
 Sun, 30 Jan 2022 13:34:25 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id qe12sm8597827pjb.14.2022.01.30.13.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 13:34:24 -0800 (PST)
Message-ID: <d59d75d2-c060-ea7f-e653-ac986543f6f4@linaro.org>
Date: Mon, 31 Jan 2022 08:34:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/16] target/arm: make psci-conduit settable after realize
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> We want to allow the psci-conduit property to be set after realize,
> because the parts of the code which are best placed to decide if it's
> OK to enable QEMU's builtin PSCI emulation (the board code and the
> arm_load_kernel() function are distant from the code which creates
> and realizes CPUs (typically inside an SoC object's init and realize
> method) and run afterwards.
> 
> Since the DEFINE_PROP_* macros don't have support for creating
> properties which can be changed after realize, change the property to
> be created with object_property_add_uint32_ptr(), which is what we
> already use in this function for creating settable-after-realize
> properties like init-svtor and init-nsvtor.
> 
> Note that it doesn't conceptually make sense to change the setting of
> the property after the machine has been completely initialized,
> beacuse this would mean that the behaviour of the machine when first
> started would differ from its behaviour when the system is
> subsequently reset.  (It would also require the underlying state to
> be migrated, which we don't do.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

