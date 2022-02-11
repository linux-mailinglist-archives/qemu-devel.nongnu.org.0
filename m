Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E54D4B1D40
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 05:07:40 +0100 (CET)
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nINDf-0003AN-13
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 23:07:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINC1-0002Io-GD
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:05:57 -0500
Received: from [2607:f8b0:4864:20::1034] (port=53235
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nINBz-0007J2-KR
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 23:05:57 -0500
Received: by mail-pj1-x1034.google.com with SMTP id v4so7018513pjh.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 20:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SbfZRKZvJu1ZJZXESFgx2uJf/Zn3qD8ix6cD/qteUA0=;
 b=J8ciuhKhH3DzIcgE1Z3UkdD1vK+q93/JAtbZ/PtH2idGUNyC5TMWg8ioLgLlyUTonM
 ZtNi/0gtT00zrQtEnlSImDfdcUDuHubdSS2dU+p2PCm9954RKHZoZ2maCE1jbeiphuOL
 rxSsaMqapRLOjdbwZytlEewrAS6q7RYyFYEIi/OHuOdolmnXjJtho3iWYUcKURlxAXPW
 o4zwU/LGkm4paRpOiYxn/RXCzdeQ6Dk3KwCvIYIKBQZYfrP4EvXM03s0AQrH2Ocb9bj1
 0OznPbQGnRKZ4JO5FXFj5o+kdJWxqp8A1SXywB+KjIxwDk1EAGDNDP1icnS4racBlWbu
 RfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SbfZRKZvJu1ZJZXESFgx2uJf/Zn3qD8ix6cD/qteUA0=;
 b=spYLAu/dXywelUOd8qk0uXEuPLbP7lLOdPF9MSrO+gtUEn1RxP10Y5yal16ySyQlg4
 yGJqRonf4Onw4XBcnX7lDCsHoK31ocAS8p946AB2jCVnltL9+pbq8XJfXi5xOcNbF1ia
 tYC95wRvkT0OVAfsmvWuaoy5cvXTkYnr/nEE8A2930nujoo0ey92AXwNuDXxL2igt+0b
 n9Tm5TBodrxSxb6BUljh+cm9A0LmT7pzZYujAicnZLVEQ27inw7IkVJ8m1p4xZ/zumkZ
 piqmyS5B0xgQz7mMqrRuONHbmDV7FA+IlAF2cyQR/TQhm9r2DwpzqHCaZ3IMMxHa/X4y
 NsgQ==
X-Gm-Message-State: AOAM530epbBYtFIKC03vrNAjK/aKti4wSMB2E9xi4ODPZEAURr2srsAw
 Fk30SV2+s1aEBAjX7CDRq9B3AQ==
X-Google-Smtp-Source: ABdhPJwBopk90DxyBOfY72wFweSjL4gxEx0/aflNLI6IKVpeAYw+gaMGv641X2DJ/bYCDnTWbdgfDg==
X-Received: by 2002:a17:90b:33cc:: with SMTP id
 lk12mr733370pjb.186.1644552353999; 
 Thu, 10 Feb 2022 20:05:53 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h26sm18044628pgm.72.2022.02.10.20.05.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 20:05:53 -0800 (PST)
Message-ID: <4f1dc46f-3951-3fde-a761-87f4121c85a6@linaro.org>
Date: Fri, 11 Feb 2022 15:05:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 05/37] target/ppc: Implement vmsumcud instruction
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> +    /*
> +     * Discard lower 64-bits, leaving the carry into bit 64.
> +     * Then sum the higher 64-bit elements.
> +     */
> +    tcg_gen_mov_i64(tmp1, tmp0);
> +    get_avr64(tmp0, a->rc, true);
> +    tcg_gen_add2_i64(tmp1, tmp0, tmp0, zero, prod1h, zero);

The move into tmp1 is dead here.
I think you wanted a third add2 here, adding the old tmp0 + new rc word.


r~

