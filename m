Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC37436D09
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:48:06 +0200 (CEST)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfuv-0003RZ-Ea
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfQN-0006if-6G
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:16:32 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfQI-0000Fp-E5
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:16:30 -0400
Received: by mail-pf1-x434.google.com with SMTP id o133so1777957pfg.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EWYl+CpxNVEWnUbsZ9ombisIYluolFv+IscRU5PXOwE=;
 b=NByz9K3dtInir0yApw710JdKWl0DauHBxKMYynkdMo25tw/muMiXNhLtym5T/mOGRm
 bXdUXVcO1edFeKQ8EoHyv7tHfNiMaEsDFpuIYP2DB+venojyEDXB527cA4zGUCuBBE5h
 8wqkLAP7OvSwCESmkF+dLzXGNEdTCW3iIBtBxSyTnLdcS0j0D5s8rqPD8Gfc5fF3nJHU
 u4Bip2M5Fs7S9PXOrku/6tTVdpdL//wB/CXqNzqwlAIfg6E8Quxwo101CLBL2klsvi6M
 vT1YH+ARbv1BG7MxQY0Go4lPpoONqDh3+xqasRF82mEL70iu1sVyIvBIjbwZq3MDdrFu
 dLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EWYl+CpxNVEWnUbsZ9ombisIYluolFv+IscRU5PXOwE=;
 b=SlI7uOU/mUVcGXq32wFywo4LSTr4O4p5UWsgbY53R8Qy9K3vhB4DAZQDIUTFeJcXkl
 JCuyThtmluz+0aWyTf2Y5wzFFl0ODoPQslbJ5wj64Yqtcl6NPWuoqoqniSpvMfLvj2LZ
 waY2kWf8NHV6fCJPB3fiI9D5AF1jQOKvtNKltiTrY89skpexM1vL3x7674f0ssZmR1zn
 gOWwQlvTkgnHdINh9A9mto3/aHGTpMvbDv6VhEvx6BSTUMNea5ZZAkQ3mw0NagP+Ojm+
 fF4Ofv/LMNVo/Ha9ppnKmXCfxs3TyblqPjHABrZOioWYyzAzv+6ZPE7bO3eObCpGezLg
 L+jg==
X-Gm-Message-State: AOAM532+hYAG9DkpoY7bU0C6mg6EnKvUxWASx0UDriOJjjmr0DR0dg1p
 QsLRgqBvM4cr/hy9J0JR0nbYdQ==
X-Google-Smtp-Source: ABdhPJwXcMWgzfQYUYVFkD0iqzY8129AnNloOUBN7Yb50zrN/ED8TTztqsTIGTDBLkQWDHZbZeDbzg==
X-Received: by 2002:a63:6888:: with SMTP id d130mr6263413pgc.234.1634850983861; 
 Thu, 21 Oct 2021 14:16:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm8104512pjb.39.2021.10.21.14.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 14:16:23 -0700 (PDT)
Subject: Re: [PATCH v3 08/22] host-utils: add unit tests for divu128/divs128
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-9-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <060b43f3-b479-7633-7061-d972d4dd64a0@linaro.org>
Date: Thu, 21 Oct 2021 14:16:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-9-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   tests/unit/meson.build   |   1 +
>   tests/unit/test-div128.c | 197 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 198 insertions(+)
>   create mode 100644 tests/unit/test-div128.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

