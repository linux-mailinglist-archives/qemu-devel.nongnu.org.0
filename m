Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F7E2CA7D8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:14:02 +0100 (CET)
Received: from localhost ([::1]:53426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8Hx-0001Bs-Ga
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8GR-0008To-P5
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:12:27 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk8GP-0005Yl-AU
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:12:27 -0500
Received: by mail-oi1-x242.google.com with SMTP id v202so2275990oia.9
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 08:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dZjUR3w8Q+tZRAEMI5SpYGH5dpTGsvXBnfeVTSRR11U=;
 b=Jbovz74bLRvT9QLM++GqejivgUPrZ/InnKSfBwSbSqZCHD7h9m1amhwf+sQGogJf56
 5Usys6T/VB7nfzb8th3rZK7is9WcgfxiBjcSLSUIqRfI3fqG4gHInD4Zay3xey47B5mH
 PpLnBFeGsvnJnHU1vL9AEhQmnIyUJP0i5DDS7atWZ1pi4aIm4TmvaGfy0gATXFkQ/yw4
 /DFRlDNQ7I05DQpkB1U20BXTgs7wOYBfHNpI8vez7vP9ExTBBg89yqo6N3UvzVi8SHAB
 82kx6tKhhPPZyN5nrMdYgbfDh30lBCC20vQsWneM4+Hcx/XCE6DFowYFLFB5wGxzMU5W
 ZdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dZjUR3w8Q+tZRAEMI5SpYGH5dpTGsvXBnfeVTSRR11U=;
 b=YqCIqEOz+NQUDGIKdML1f403zN9WILmL1AAhQ46qC7sXV0m0KZNKWuv4l79SiQvHxW
 AbMXK/sGEGmNOyOxX9oC0iPfhRfbjtz7Nr5ph+vetN9ULRSekI+xelsPhEIuMdmd8Qgv
 4Q0tO+BTpBHaCACGlLhMjMTxY11vMqIJ9cKORowg08VJ3uG3LE8hOkIPhlzuIkA+Zy2T
 VHk50UF0mE9rtNC/uTDs+BnWCQL9qRxZk1ROh9hPwSs/R2oybJtN6Extaj2jWSnCquws
 3VlSwcFeotZn3HZjqFsxp2IFxcWsq6K6AO30KqcidQr9oiCwf676tZpN3U5aicxp+QkR
 +Qjw==
X-Gm-Message-State: AOAM5327O6zHponaMq6XWJNKD7LslqCQqSUdV50P0XJf7djcuc02JW4B
 Fo7pBxNAPYgF0jPv8blnd5ioEmqWac41HGGq
X-Google-Smtp-Source: ABdhPJxXPW4sEvoJN3xNQrRlS99moLFFmRCWQVaErsOx0axpkmsFlfaz6zCSOqaMZSbmOpYUQ0Zmgg==
X-Received: by 2002:aca:4d51:: with SMTP id a78mr2096792oib.27.1606839143720; 
 Tue, 01 Dec 2020 08:12:23 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j8sm478176oif.55.2020.12.01.08.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 08:12:23 -0800 (PST)
Subject: Re: [PATCH v2 27/28] hw/arm/armv7m: Correct typo in QOM object name
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b571f823-569d-04d0-a643-9282c5f36421@linaro.org>
Date: Tue, 1 Dec 2020 10:12:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x242.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> Correct a typo in the name we give the NVIC object.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/armv7m.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

