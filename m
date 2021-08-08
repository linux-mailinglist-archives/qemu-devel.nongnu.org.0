Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D8E3E3877
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:40:25 +0200 (CEST)
Received: from localhost ([::1]:45252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCabo-0002nl-Qo
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaZz-0000pu-3v
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:38:32 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaZw-0003Im-QR
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:38:30 -0400
Received: by mail-pl1-x632.google.com with SMTP id bh7so3999284plb.5
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5hbwtXMVHpNFzKB6ouIHtyiQUqeXS7fifM44+DBiLDk=;
 b=nJGg/mnIwnrt7t3ado1nLybz6LJA+VVQUkYWw5mAlTfY3H4qXpAb371V9qtIkY0q8S
 I3aoofhLF1A31RXRQNsizedvZZTMP2GQH5/UnO09tBg+cMrdPofLscR0efXAqAxsEAKQ
 AebZXVxzf6ayNI7/Jo4x3y3Zm92BzeZ0LyLUSq+5sr/hvVmGi9SZhx8piMMgUVdGZ8+k
 pPT+VDV9aVQ/ZFwxc/7MkT3ioStLrgwgA7Ghmhc1qmpDsZmjhMFiCKPH51M1N1EgRFT/
 iqNPf+nqo3G058SvWsJwCN2P5VaioMJQYPta2+OlYuu3xBtavfEOqo/KG5NVUgNR5r8F
 DI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hbwtXMVHpNFzKB6ouIHtyiQUqeXS7fifM44+DBiLDk=;
 b=hUFU0K3jIguN5iBYWL/r2cmLy5E2fBdmSVtokA0gWPSUqTQI7meACDRnVQ6BQcqmfC
 ecTz3Q6w/pKnfQWgMRqhS2XMn17zCfPE3rKsrdr4um8VMxo7fd+aseup/UaGI++YyeJ0
 +7lwhQZ65uePCET0+HGT1tHoAiOYnDpltvAKXTg3FH26jvYAS4Eb+BePbS9enpj48tpN
 BPE6500xDfM4c1TcE+Y8vnLLV/GLY1gGv5sxxp0QuhhjxBdzjgJySQu59zP0iPydSmhG
 DiiOUBkVS1nO3/qKzrI/DR4I2kEVv2ohmSDUu3UoHoOE14l1D6h8tU4SOpemidnQrA4J
 P0dg==
X-Gm-Message-State: AOAM531KRPIJ+zucVZfEz+11W9jHe3iAgYrH3nnnKuoQGxdHplN2K7Q9
 z9b5JxnBlPqZ24XqPKyqIuqmIEaVb7Cc4w==
X-Google-Smtp-Source: ABdhPJxE3vB16rB/aifGjdebMDPBff/chLthbBgY+lP5C/HP6n9slgtyzbrGZm9BuoSJZWamCmrZrQ==
X-Received: by 2002:a17:90b:3ecd:: with SMTP id
 rm13mr18098494pjb.109.1628397507519; 
 Sat, 07 Aug 2021 21:38:27 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id w130sm12682933pfd.118.2021.08.07.21.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:38:27 -0700 (PDT)
Subject: Re: [PATCH for 6.2 08/49] bsd-user: style nits: fix whitespace issues
 to be qemu standard
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5fd29a6e-f08b-d629-6462-b08d67e2ee6a@linaro.org>
Date: Sat, 7 Aug 2021 18:38:24 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-9-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

