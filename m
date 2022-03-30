Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316F4ECB8A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:14:36 +0200 (CEST)
Received: from localhost ([::1]:60226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcq3-0001hY-6e
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:14:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcnB-0007w4-6M
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:11:37 -0400
Received: from [2001:4860:4864:20::2e] (port=45797
 helo=mail-oa1-x2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcn9-0006kH-Nx
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:11:36 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-d6ca46da48so22833318fac.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QjHytE+NQ2GyVp4y7rLNVaBW30edt138wkWWCd1pVi0=;
 b=wejDlaCPuJ2m/b4aakIMWq3BkN1IXw7othOdrFgGTa7DOTKOzBjtwLDemqGNO7ZJ9/
 X3IWNkqIMZpUWs9SaTTym/jtxvlhFLgwDUARJPYpH62aoxZOQy4nRzeMIqSa9oHwoQ7T
 Nj6ciWpD806FLA5BR0ZzgGXS6Ril3HusxA9fNJfcooO/V1LhvwYm2vILvMRzg4G4FxhU
 WH2kWkcNKat/OeMKhTDlcSEUd4DTKN02Vyjluh/HeqBMq3Hm8sojRmPN/pq3VFim6PqY
 ChjhuekCS5b8HnRXtkTvtQ1ABI4AcZL15F7x12inD1qU5zVi9goBqcuD7UsYRJi72XyF
 vgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QjHytE+NQ2GyVp4y7rLNVaBW30edt138wkWWCd1pVi0=;
 b=oriKBZyMhCMf9UFattFKEqAlq9bEtrKTttW0Ssv6UD1Hb6VXbPduUZ8/toqJdnzkRQ
 LQVQ/24//uQ6N+aLSWba0AAY/Ra9emVopb3HFmcKpJWcC+VBmRX+lYmakEXG3Atm6mhK
 4EWGa+QmL170nn3L7OCEC5ojN58opZG5vW7EEhZZNmKnN/N10gjSZBFiXwBw4aLgxU+x
 gwXVH9X7QH6Cyx0aJjd0NfS4J/Vw6D9wr2o1xTpoO6vB/DuMrcY8fWgKVATKJXPN2Jng
 LOGRPTLAVuyBdeR6yTXsFubUGxznVh6yZduz2U5QeKQHYxDbQdQ28ArZEpi1b+SWCQe2
 XBVA==
X-Gm-Message-State: AOAM532gdM28mjNNubKMceL9hj8up/uCyQRArH+c8ykpzGVybA8OFx5O
 30eiK2YvFDM1NpywXSkbSJNiDL0uSxPX//3W
X-Google-Smtp-Source: ABdhPJzmTgIXlbt2zDidLrpn+BPLlxpWJVAyR2Fck5w4IraWPMSc3GdOcHXO5ebB6RbYr7WC79gvvw==
X-Received: by 2002:a05:6870:15d3:b0:da:c49f:9113 with SMTP id
 k19-20020a05687015d300b000dac49f9113mr474967oad.91.1648663894444; 
 Wed, 30 Mar 2022 11:11:34 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 y7-20020a4a6247000000b00324e9bf46adsm6145831oog.41.2022.03.30.11.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:11:34 -0700 (PDT)
Message-ID: <c888803b-90d8-5288-99c9-018294b49477@linaro.org>
Date: Wed, 30 Mar 2022 12:11:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 4/8] softfloat: add int128_to_float128
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
 <20220330175932.6995-5-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330175932.6995-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2e
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 groug@kaod.org, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 11:59, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Based on parts_sint_to_float, implements int128_to_float128 to convert a
> signed 128-bit value received through an Int128 argument.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   fpu/softfloat.c         | 29 +++++++++++++++++++++++++++++
>   include/fpu/softfloat.h |  1 +
>   2 files changed, 30 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

