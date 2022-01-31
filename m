Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE724A3E87
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:16:30 +0100 (CET)
Received: from localhost ([::1]:59082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nERrR-0000mM-AS
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:16:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERgJ-0004Vz-1J
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:04:59 -0500
Received: from [2607:f8b0:4864:20::535] (port=41474
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERgH-0003QV-99
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:04:58 -0500
Received: by mail-pg1-x535.google.com with SMTP id f8so11522018pgf.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gsr+K1ewk3YwFz7gBYBwzI/6z2+xXrPh9GMm5NxTDrY=;
 b=VAl34/pwnzWmFsNce1y4n5evuijDRtbTEtFzwwoXfwTetxy1DpzKIEqzCBqE2PPs+V
 PdEDJRwaAJNBgL0OtWuP7glSRqNk5IAxb+ifdU5N+cTDZbeVibAqjEyKmm1r/R3gkVha
 vKm4w1q2AJLVVl1NIyRv/3aKKLiwRziqrGk39ko81/t8geJ9SAHAwZVD9d4IgZlKXLKZ
 Rd1g3kcxV5PY651vpekkGpIO6mGD5gY+Lp0Bnk5aFYqMPZJW7viXO1sNAUu/0225Qo3C
 UJWz7nTGQSFrKLpQQmIZ6IaCtzdLeH3rpHseZY/Kr3Kq833pbuqwS3McnuHdYMpeftng
 l9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gsr+K1ewk3YwFz7gBYBwzI/6z2+xXrPh9GMm5NxTDrY=;
 b=0GE+/gz0YIiwe5hGl0o1nRC3W4RL3lWIMPI75HOaAcVoGrsoaZ5g77isfHgCmqNfZ8
 rpmFZHBJ4HUlCo9jH/sCCSCL+Pqqvug8ibggAGMICOBTPhCpy2faGQZVplOfOINg6vzW
 j6bpnXMjA36lusTWDF9OzasOUU7HDm7wP0+ZaK6Ws5Mqr8BrQx/R+GSX5uI6gT9a1f3/
 xoju2cA0prynJSaMVUaAIzTxizNPLHwsRjz/gmljZuOefaTJROoq1rCgwfPu3ya3DdtG
 ht0g2jH+8RjfKIoxzBgCQ/Ld17Pv1d2VOz4aZQRSSut9gb6kxXP4nbULc8aYQf7m0P6F
 ITWA==
X-Gm-Message-State: AOAM530RVIe/fifDv2hvCusagTVpNErNPBeKjFwJhYksbzJd2N+WmD5T
 znWee4gvXN1d7AAi7NEhtN8s/Q==
X-Google-Smtp-Source: ABdhPJxiFI+loG315lHiWlzDlcxhzuhBlHY5uIZj+bImF8UId7sj/nu8gKwMGfRXjimr7IJ3ZOGDvw==
X-Received: by 2002:a05:6a00:1594:: with SMTP id
 u20mr19237926pfk.75.1643616295886; 
 Mon, 31 Jan 2022 00:04:55 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id f12sm16859967pgg.35.2022.01.31.00.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:04:55 -0800 (PST)
Message-ID: <1e92a442-6689-4528-ed3e-28da4df3919d@linaro.org>
Date: Mon, 31 Jan 2022 19:04:45 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/16] hw/arm/boot: Prevent setting both psci_conduit and
 secure_board_setup
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
> Now that we have dealt with the one special case (highbank) that needed
> to set both psci_conduit and secure_board_setup, we don't need to
> allow that combination any more. It doesn't make sense in general,
> so use an assertion to ensure we don't add new boards that do it
> by accident without thinking through the consequences.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/boot.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

