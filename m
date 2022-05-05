Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB75451C70C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:18:50 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmg3t-00005P-Nb
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfeX-000258-Vt
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:52:38 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfeW-0001Li-D2
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:52:37 -0400
Received: by mail-oi1-x235.google.com with SMTP id j12so179886oie.1
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=XbGFQgvHobnMywNofVqwhpDLkFSrp1jENMtUQKe0JcA=;
 b=mDV68AxvCh8ECg5HbGKnVYt8BBfkT7gXaFzDmuajjSpOFIGQUcefaVUKIBT7hY5YWh
 kFggSYQlleGl9RQACr6IkWnjU/JDk+WyVfWGmiuE1JelJe9fSOulppyU70HN628OMywh
 x3iL+KNhgRymv1cnF3nB5XCOg/hwmTUylLJBmtrg5J/rLpVZES8fo5M1zruiKUZOffKy
 8yPRJ4HUPzDkP9RHKeik2itnwSxL0nb+QHRe7g6okeic+nGocf9hnYtvRKJD4oKZyHP5
 VF7WtEusaqq5XoPxoUmxzFD6MDE+1NriUJYhvSKaCnkJMHVIdXPbPG2RkVijsrWb5V1Z
 LdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XbGFQgvHobnMywNofVqwhpDLkFSrp1jENMtUQKe0JcA=;
 b=c+dBRox4axlx5HuIqilagWQfE8dGUFur20gHEO5QJYcK/vW5aBe9PWPlLd2LaNz7LT
 kNNuOl9GOcgZqTmEhFDFGfOUKjwUU2WYcrz+Zo8MbkBVJy0onL2DXn8VKZYrWSQBbe54
 BZrkIFkMOz5wD+2cYvrG+25wY01DOuMElgkZgOBXR4/Qn1CRjvpgXSM4E7TyVdL4dIaU
 HbLfrTz1o9MVD13s+Pz/qPV1Mxy+cZB0bsGneh6FxbFFVgHHwEtvhbBAK+t03SwH7c4C
 /8I/mmiEW1Ti9+rL7PPiR829FcGMGirSjS7WUV5WhbVGG9YN8Jdby6/mCv41pCUqE9uW
 rkPA==
X-Gm-Message-State: AOAM531Ps3/QVYL9dmBe43438dH/PIMRbZZzrDdEr42wwimc3syecStj
 8oDGhknpuE9cVtxucduLzqUdow==
X-Google-Smtp-Source: ABdhPJyuLNrkwx9HSX6JD0DeucGQWEQRV6OE6FVwNq7+FtJPWVt4H5bzDUhxnn9LTsjzoyAJFYWXcQ==
X-Received: by 2002:a05:6808:23d0:b0:325:204d:d0bd with SMTP id
 bq16-20020a05680823d000b00325204dd0bdmr3124390oib.122.1651773155358; 
 Thu, 05 May 2022 10:52:35 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a056870971300b000e92d5a54ffsm719082oaq.26.2022.05.05.10.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:52:34 -0700 (PDT)
Message-ID: <7bc9e32c-4831-1ac3-2857-87b97a84bd06@linaro.org>
Date: Thu, 5 May 2022 12:52:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 21/50] dino: move DINO HPA constants from
 hppa_hardware.h to dino.h
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-22-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-22-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> This is to allow us to decouple the DINO device from the board logic.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.h          | 5 +++++
>   hw/hppa/hppa_hardware.h | 5 -----
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

