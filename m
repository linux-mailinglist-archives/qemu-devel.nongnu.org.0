Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B6B622FF7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnih-0000zg-M0; Wed, 09 Nov 2022 11:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osnif-0000zG-8H
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:29 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osnid-00078T-Nb
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:14:28 -0500
Received: by mail-wr1-x430.google.com with SMTP id y16so26431977wrt.12
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 08:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ckWQY73HHNvYQSKMKauX7ngk+P2ifnkSOcuKk9Tyg7o=;
 b=mu/YvG2rgd2KnO4zkkG28g5Cp0OoAQIoJUbRs0bbNISj2Ipjknb1iZRPlLtzQbnxHa
 CtADoUbKmG0d+wpXFWTFWv+br4wr8An0CIDDtDfqxHyZYhwH7HhTmUXAip7Ubo1xCfTB
 MDwloQi3vbEfpXxz/9YoFOlj+/db12pvKY5FilkfvZw5zJqUpnXzNMrEHH1aQR4nzclf
 OvKr1vZDBs9CcnsLTcu7FoZE7TYaYJ7ziu5v2D9mKZB56MOiqYMkXaM7gftTGEoQNOfI
 DO40XL46Qb2qIM8gYaHpyx5tWpXvhP8aGkv+wLNuXWhm4p0QkTc199sDbRbJTEtoztzl
 waBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ckWQY73HHNvYQSKMKauX7ngk+P2ifnkSOcuKk9Tyg7o=;
 b=1TzvSitQWC2InuVxqBGvpbe4iHnwJ0IZK/oez0UuGsQ0i553ILDTQ7dVWIrBHp/1sB
 /mYZuBRh2lVNGI2A6VPWU4XupLRLUJTQYYmouY3JuLCmNxEP0hOk6N/Sfqc6Kk2xFbdd
 2f6RYPbLhHxZcKOuuQMuHylkxL/b5s+YhG6DimjGQRSjShb/GExMUJTCkY+4ndDWf+5D
 ifyw7oQYrAqySKChv87Hr368i6CSha8EuMDPRDbDOK7CI6GRsaRhFq07EuYEm+ZVYQ/c
 PZCyEld8LBYUdoNt5D0b4MatVswAFOClbrBJ2EujxEedUkvYJ60KwFH763js0Ge8NmmP
 /DJA==
X-Gm-Message-State: ACrzQf31K4aaJQaiUlqaRk1bOGwQWH4UKOPswyCrrxGpszqIWFDdsJ7x
 RWCPgWezYsvypLfxt1vw9fEbFg==
X-Google-Smtp-Source: AMsMyM4EIvIsjDFrjcliT1stJmkFikb995CMyplbDahGqM/u1AdhHhRPK34rBzrLpCoQlOh/My8VCw==
X-Received: by 2002:adf:b612:0:b0:236:5d1f:143a with SMTP id
 f18-20020adfb612000000b002365d1f143amr37935647wre.364.1668010465955; 
 Wed, 09 Nov 2022 08:14:25 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b003b95ed78275sm2365685wms.20.2022.11.09.08.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 08:14:25 -0800 (PST)
Message-ID: <e5581406-3ce2-9586-5d5e-0277375747da@linaro.org>
Date: Wed, 9 Nov 2022 17:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] Add missing pixman dependecy
Content-Language: en-US
To: mrezanin@redhat.com, qemu-devel@nongnu.org
Cc: imammedo@redhat.com
References: <20221109153417.49132-1-mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109153417.49132-1-mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Mirek,

On 9/11/22 16:34, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Commit cfead31326 'acpi: pc: vga: use AcpiDevAmlIf interface to build VGA device descriptors' added
> a new file - acpi-vga.c. This file (indirectly) includes pixman.h file so we need to ensure pixman
> is available when file is compiled.

We don't need this dependency if we move the build_vga_aml() declaration
out of hw/display/vga_int.h, i.e. hw/display/acpi-vga.h.

Regards,

Phil.

