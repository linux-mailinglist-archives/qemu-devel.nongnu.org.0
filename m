Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FF4ECBAC
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:17:56 +0200 (CEST)
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZctH-0005vR-H3
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:17:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcos-0001fn-0Y
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:13:22 -0400
Received: from [2607:f8b0:4864:20::229] (port=36635
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZcop-0006yA-Hi
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:13:21 -0400
Received: by mail-oi1-x229.google.com with SMTP id z8so22864196oix.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=21v3lpILhB41s5rfQrv6qb5/iDyxDo6F5qnxwzv5uOM=;
 b=OT3z/eK5IuPPs/fCXwjE/9NfNxgV3XKnk9xMEuQL38kb6qweVJsVJGwyF4zBZfdH/w
 maPlUoZxLg2n5e9dLakR1pMFfePOrMNDTTwJ3ifxeBr0d0qApZyQwrRfv7PgzKAkDUxs
 LhYkt4j+3BLtGr2WUXYabXsLZkV0pK3zB/L6MYIPhssX1BD0BXsmMLMTPMCdbM5Te3SL
 lG7rRYKygHreQDS3hzbe7UFxGjT7+UTnJvUxMjwBf9Dda1pw3Aks4qT5Ws7+iGVn5TEG
 We2Brvd5BBOCYydUDM5A3Lj35DnghEP7e5HCVLJ2L2/pOghmWnqlDQaO+1mvsLJkiZPf
 0Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=21v3lpILhB41s5rfQrv6qb5/iDyxDo6F5qnxwzv5uOM=;
 b=q2G4cYV2ktSK8/JIktnuOD4Nm9wmAJ8E5vhrl/BHP1vO7k6sffh7NGaOX2yrsDNsGy
 z/tiDUiTBEYVT0S3scJOY1VekijrJDuxpSUy0AzVGDDIimQLVVRsICJ06TpXbCUhYcX9
 mOJllBRKwV4yolC9eVVRN8wwuBIrTATm26VH5Rdtye9UC1hUa18+EChSb3ezwlG13GRI
 8PpA65w5IpqtSzR6e0J8z4cuHo5U6+WPgQC3zR2ehgSBchALz72QvJ9Fz1+YDXfep2pM
 yLexN9IBM85m+M0XjmEX95Yvlcx2efbY01XqPM6iMaqQR39kgOx2VD840Edc+VHKaKz6
 f0Hg==
X-Gm-Message-State: AOAM530pG7HI84srgnz+WbGh9BCe32llgyJB/e2m2+RTdjc8fgMXSaL7
 AbuQL0xlFsVKHiPXX5HAPuOhlw==
X-Google-Smtp-Source: ABdhPJymJSIjrWjDsa968bsrrv57ZFQoxJVEaCk+KIeHU2NljAaN4AUglncQ9f067HQodTCR5JVstA==
X-Received: by 2002:a05:6808:b3b:b0:2ee:f4cf:78fd with SMTP id
 t27-20020a0568080b3b00b002eef4cf78fdmr521940oij.213.1648663998361; 
 Wed, 30 Mar 2022 11:13:18 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 q12-20020a4ad54c000000b003245ac0a745sm10405718oos.22.2022.03.30.11.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:13:17 -0700 (PDT)
Message-ID: <c361ec96-355c-47b7-4819-402e36b46ac7@linaro.org>
Date: Wed, 30 Mar 2022 12:13:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 5/8] softfloat: add float128_to_uint128
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
 <20220330175932.6995-6-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330175932.6995-6-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
> Implements float128_to_uint128 based on parts_float_to_uint logic.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   fpu/softfloat.c         | 65 +++++++++++++++++++++++++++++++++++++++++
>   include/fpu/softfloat.h |  2 ++
>   2 files changed, 67 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

