Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC5D698462
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:20:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNKP-0004U0-BY; Wed, 15 Feb 2023 14:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNKF-0004Ro-Qw
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:20:22 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNKE-0004gE-BI
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:20:19 -0500
Received: by mail-pl1-x633.google.com with SMTP id h4so13421714pll.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Chs3r8IDztFa7Xp1TEbxR8yj2KxkhhXQ+C3DNmPhIEE=;
 b=qoEZh1dEP8mPwmLrztyUDg972I8YQWXp9pmskFMtbc+uWkCq4j+H9NKrvxPp8x67go
 Ekh6BOf0C7MTfUg3tmfuoeBwju+2spMAkRMsOl3jDatX+3r4KLflFToEoI2nJ1Pfu8gB
 hsohMbsvC27yluSG9opJIeIgUtmJOLo+5tsRRh+8ORGqBdKuFpVvHsimbFfAB9jOdgup
 3hSNBAaG0Ll/0sxjHTHvxjUiEjGns6INlrRG0keLe3X0CaZ10Ws0Cd32+AuPDZLiq66P
 Ac36oXAaj2IZQ0gM9YLY2HDlLkUb9FWkyJRQapCJDoJv11w3fDhoSEOm62R22GbCIlIg
 Yo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Chs3r8IDztFa7Xp1TEbxR8yj2KxkhhXQ+C3DNmPhIEE=;
 b=2txFiknIdN8mcxyya7oUxwzy6X1aKiED+eut8ll6bf/YDkzFncYOP7FmPkpcco/S0K
 QOWjvk54SajjPkr1MsO7RXi6lU8alB7Vt9peU2kcErMhEHdypCH/uZjUMTXFQrULsEEt
 JJJBgt2t77BnYtRMQ2nXQcbuV53yInsgPfRyQJILWtbpMvrfroXYcdZokkHOnttvj4Kg
 txfuDc06b05zv/ejMG2wyGAZbyeDlzKyWVWzfpXGsgsPbGvAM+Ra1f1lcTGA3L5SHidV
 Vp7Wcb7LrTEZg8ybDp5dT1NVnjCaR/1ZWF0lpNTOmGeVGbjY5qYHVjShnjLTDlzL4yp3
 wkBQ==
X-Gm-Message-State: AO0yUKWxTOPav4VMzxg5fidNqjPzlm7UmP6TTJWW6hA2wtoPIYXGh6ed
 NSfXqmBXRhlRiYnFCSU5pgm/gg==
X-Google-Smtp-Source: AK7set/pXxBf33ftf7h5hr7CRG/PEYXB9p1dPy/1cpkEmag+rLvsSBXXolTOjNr/Y7AMs2kdnoCzTg==
X-Received: by 2002:a17:90b:1041:b0:230:e771:e1b0 with SMTP id
 gq1-20020a17090b104100b00230e771e1b0mr4057761pjb.28.1676488816673; 
 Wed, 15 Feb 2023 11:20:16 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 il5-20020a17090b164500b00231227781d5sm1866165pjb.2.2023.02.15.11.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:20:16 -0800 (PST)
Message-ID: <2d0ed895-e9a8-51c4-90a3-8dd8a37ac1f9@linaro.org>
Date: Wed, 15 Feb 2023 09:20:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 19/20] hw/ide/piix: Pass Error* to pci_piix_init_ports()
 for better error msg
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-20-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> -    rc = pci_piix_init_ports(d);
> -    if (rc) {
> -        error_setg_errno(errp, -rc, "Failed to realize %s",
> -                         object_get_typename(OBJECT(dev)));
> +    if (!pci_piix_init_ports(d, errp)) {
> +        return;
>       }

The if is unnecessary.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

