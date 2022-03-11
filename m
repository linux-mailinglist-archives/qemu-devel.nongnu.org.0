Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA54D5721
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 02:08:19 +0100 (CET)
Received: from localhost ([::1]:51472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSTlR-0006GZ-TB
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 20:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSTi1-0004nA-87
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:04:45 -0500
Received: from [2607:f8b0:4864:20::630] (port=35673
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSThy-0004Si-I3
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 20:04:44 -0500
Received: by mail-pl1-x630.google.com with SMTP id n15so6413530plh.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5rwwg+/Tm5rlAjR6nGsca0tSF8XTXFmprC0Y7mKF9GU=;
 b=dkxpmU8l4AcbmXT6bJ9vl9GHi84lbjwQWhmLqePZ/BIw4/aC9jAA9LDsrsLh5IlPD7
 X9hqBbrdzMM1wy20ZAEXEOZDS69ZAygDcsZtfjySA4/uosNgf0ZjrP7BUhxp1Dv2f3j+
 5T61V8xso7U5gJJz8hx+DDULbj3adA8i+szo4Ue2A+jjVgQtNyTWhOEY3//UVovUUSEG
 477bDs7a/7aNC2WczvHFHRmE9i2fwD4X4vv3gaUUZr9h6yMxRqJtQ3tWhJvBTlUthoNL
 ErOcIfptxmzAtiaTdV7w09R2MTfOSluy+sLesxA3bg4QfYDKRijGK7QyckFeWoWZ9CjO
 fqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5rwwg+/Tm5rlAjR6nGsca0tSF8XTXFmprC0Y7mKF9GU=;
 b=J5+dJ+m5uxlTIUK8iFp6HYe68kgfL5QTUOx7SWIj3qfmH2sHf2qu4qEmn/23mtk7+M
 LcKdEoLLFtzTZgVFPR4tKbkz9YCBKH5ntOkf87t8bHC1GZWMDgaKu47ijmSl5Tm4M8ix
 qLbIT7kdOe89sH/pAp5zMdeSkjk2F/OJa/ldZ0l1Aq1aIWiexO72kT1T/J3XW9xS3giV
 ndOyY8MKE8RdpNQrOlh/fAWL4mqO2ef/4EzSlPterxQQ2aWglZs+EZe95GB3L0HBFm0E
 6FxiM4XZf2z2jhgFpPsgmXBO17A27WGYFvZlR2YrpOTlsD59YHWj/CTOpbsimIjHSGq+
 fspw==
X-Gm-Message-State: AOAM5314dQzKQMf9uen3C+tBrqZADlZNirOERKrTie9Y23hkVdGtVd/x
 vtDcVUE1mUSC3GMQ2m7ZENHrng==
X-Google-Smtp-Source: ABdhPJy1XbsGiObosl1h/xNuh58KJ5JxXLRL5Gn/o8K+gqgvrCI+26RZeXtYPelHGQ4N0uxFwJ2ORQ==
X-Received: by 2002:a17:902:eb84:b0:151:c730:c9a3 with SMTP id
 q4-20020a170902eb8400b00151c730c9a3mr7842011plg.144.1646960675424; 
 Thu, 10 Mar 2022 17:04:35 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 66-20020a620445000000b004f6c30d84cfsm7718629pfe.155.2022.03.10.17.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 17:04:33 -0800 (PST)
Message-ID: <34619c51-4cc9-c085-d320-a8ccf3859215@linaro.org>
Date: Thu, 10 Mar 2022 17:04:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/ppc: fix xxspltw for big endian hosts
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220310172047.61094-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310172047.61094-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 09:20, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Fix a typo in the host endianness macro and add a simple test to detect
> regressions.
> 
> Fixes: 9bb0048ec6f8 ("target/ppc: convert xxspltw to vector operations")
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/vsx-impl.c.inc |  2 +-
>   tests/tcg/ppc64/Makefile.target     |  1 +
>   tests/tcg/ppc64le/Makefile.target   |  1 +
>   tests/tcg/ppc64le/xxspltw.c         | 46 +++++++++++++++++++++++++++++
>   4 files changed, 49 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/ppc64le/xxspltw.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

