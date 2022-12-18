Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40DD64FF06
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 14:47:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6u0b-0008On-1O; Sun, 18 Dec 2022 08:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6u0T-0008Lp-BW
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:47:11 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6u0Q-0007oR-MD
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:47:09 -0500
Received: by mail-ej1-x635.google.com with SMTP id gh17so16105119ejb.6
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 05:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KnH6xpp7FoN4/62oHmliiSmlW78NZonCjBr4Rjag6Yo=;
 b=VQppXJ15f/bGhe29obmuym2109ylSUbPvFrj4nrH9/+fS27IDCkPPB2omNt3NjOwx9
 H3Y3VSpW+RIdzXwTtfx7uLJDXMzCV/84BlHgPLxBwIAfzereNk96Av+kQuKM3XoAL7p7
 484+CL6siZle1bR3rEu3pkbpTdKm6VPrmGOJqhcVRCCRNMHnzqm5k9qcQxwe7fFfNvjt
 YXDZJ0C1Q4i9+n5DFurwmTOLlxvt9TqPgqm8Xk/8IIeTRCdQh6v7kqjw+Tk1QElcx0ef
 cPpLwN/djf0Fg0QSkmJ8HXOPsxn8N1dGFMq8f6sB9L0YVmaFhM10AhvWx0hVJGd4NBYu
 0Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KnH6xpp7FoN4/62oHmliiSmlW78NZonCjBr4Rjag6Yo=;
 b=ronsJf7c9f+ZbMFYGt/asElH428prtmhKP4cxEbnyQzz46KSuTVKp/VozHiA4iIXiD
 wYqElLAtlWIcFQ/WKhnHXCCruPK390HjFmvyq6w+0AfGKov73qH7bOehQaf8UfvnNMe6
 cFH+1yJ5ODPbT0ddedFWVbyQR4XBSt97dFt8mX7w3RRJNn85kPU0ize/k0Cnl2YOA+7V
 DDVi/SfxMPEHdPfz83LcXbUw742oJ1qCcawbf4evzfDNamQPXj1QPc8aPbNc8rXr6Z4I
 xzeSYH60tnVJQU12paTxl/LaVl/JjMwzoH521U8UjLghsyveKT/biWsqsTDRAT818mqI
 r/xw==
X-Gm-Message-State: ANoB5plg6LD350RuLP+i7O/CjYq3KvaaQbFyqoE418qDVYcoHMD1rFsd
 d8s5cxUE8kvkGY2ZUdJOSjWFgwEsX9GKs3z7dck=
X-Google-Smtp-Source: AA0mqf7gI/6dpySeqOxMClwY+Kicr8g+zqdilHlxi3jaK16tQzkBwH76xPuuCEkUzGTcBXM2VTD7SA==
X-Received: by 2002:a17:906:694e:b0:7c1:1752:da68 with SMTP id
 c14-20020a170906694e00b007c11752da68mr32884178ejs.76.1671371225174; 
 Sun, 18 Dec 2022 05:47:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a17090653d700b007bed316a6d9sm3213594ejo.18.2022.12.18.05.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 05:47:04 -0800 (PST)
Message-ID: <91ae0890-bd0b-4c10-65ff-d40b367dbdd2@linaro.org>
Date: Sun, 18 Dec 2022 14:47:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] i386: SGX: remove deprecated member of SGXInfo
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221218000649.686882-5-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218000649.686882-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 01:06, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/deprecated.rst       | 13 -------------
>   docs/about/removed-features.rst | 13 +++++++++++++
>   hw/i386/sgx.c                   | 15 ++++++---------
>   qapi/misc-target.json           | 12 ++----------
>   4 files changed, 21 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


