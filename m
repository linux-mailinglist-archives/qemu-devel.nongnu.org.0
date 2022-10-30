Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44503612E43
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 01:31:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opIgd-0008KE-Uc; Sun, 30 Oct 2022 20:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIgb-0008Jr-R6
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:29:53 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIga-0006lW-CR
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:29:53 -0400
Received: by mail-pj1-x102b.google.com with SMTP id k5so1505364pjo.5
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 17:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5GsKhYd7WNrGQxpy6EfnOY7J/B4f9F0YcK4ifaCLzeQ=;
 b=uSTYCzZT2P87mdD4rxGUvLp40958mzhOCArIJwnMRfsl0H4W/knppyQJ1cIOXpmOJq
 MAbSpLWugJxCyDfzoR6Je0Ti8hGEa8LM4fZDju693xesVhES2FopGhNtkrkS0NQZXHXV
 AeK/1TYvq3nAktmhJnxRJStqdVTKX7z03kLy9zcKbFKuQGyZUY/F1GIwYOWZvgpSYc/i
 7f0ObWpd9XeDd6zMY/lZaPP5EHiUyXEAf60W+sGZUOUMuUYLqv4wv598ZPALQyEKU1G8
 kyVWRSD/J6L5z0kcCmrd0wcTwFRWfNX+RA3glPS3/O2H8ioJYnopeanbCwt+6dOg3DnQ
 B+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5GsKhYd7WNrGQxpy6EfnOY7J/B4f9F0YcK4ifaCLzeQ=;
 b=WeuYjFXIBbHv8m8P8NaZ8W9/JUGfjNgQnb4U2Njfh2uQSGWAlOv1TUVA2at38ex6Q2
 JXz+cxuFYtEpf9lOvJDvTvX04lgwBuOle+mWTnpul09o67CirOudpPV+yr6lEg0wy7lN
 BSpEuEwCYOMa6FTC4oaA+ga4TI1Qh0VtCf9kX9dkFvtyWMA1j767VB+4TfbjlLBUfvfg
 oEJSHO41tvdVMkqBrmORpkb9yTDjOK6K6kzEauy7a+2gQO7PINPfQrQV5mIpHfQYqjW2
 Y0uqMWaS/xLTsZK5fdpccg1lRtVDyVUSGVP11O8D4y2tSyV5dszUI0xQZqDSmde4N725
 CmfQ==
X-Gm-Message-State: ACrzQf1T4GYRWyPxUplOLaGChsGyZGy0uNhZUfIKpcZSiueW75/W9x0P
 9P4MFt0a/Ue/3p7purdllCw1gw==
X-Google-Smtp-Source: AMsMyM6rhOd5V7KhOj9yFYXtfknhH+l9wJlqzr9nPk0j6armHR/92F2+LbrBTH0I3/9XV6inWjzvng==
X-Received: by 2002:a17:903:4ca:b0:179:d21f:f04b with SMTP id
 jm10-20020a17090304ca00b00179d21ff04bmr11687156plb.7.1667176190393; 
 Sun, 30 Oct 2022 17:29:50 -0700 (PDT)
Received: from [192.168.207.227] ([172.58.27.183])
 by smtp.gmail.com with ESMTPSA id
 75-20020a62154e000000b0056cea9530b9sm3159412pfv.200.2022.10.30.17.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 17:29:49 -0700 (PDT)
Message-ID: <f5c9981d-b714-e89f-b576-88df8f2ddd89@linaro.org>
Date: Mon, 31 Oct 2022 10:24:29 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] tcg/sparc: Remove support for sparc32plus
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-2-richard.henderson@linaro.org>
 <CAFEAcA-7q2fat9grNuTVcvzozTiCUBaPSSwqHLe02Dos7zFing@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-7q2fat9grNuTVcvzozTiCUBaPSSwqHLe02Dos7zFing@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 10/31/22 02:45, Peter Maydell wrote:
>> +/* We only support generating code for 64-bit mode.  */
>> +#ifndef __arch64__
>> +#error "unsupported code generation mode"
> 
> We might as well be more specific:
> "no support for generating code for 32-bit SPARC"
> (though I guess that configure ought in theory to prevent us getting here
> in that situation ?)

Yes, after patch 2 configure should prevent it.


r~

