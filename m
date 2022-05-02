Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A59517963
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 23:46:40 +0200 (CEST)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nldsN-0007JF-9v
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 17:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldr5-0005rC-20
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:45:19 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldr3-0003it-An
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:45:18 -0400
Received: by mail-pg1-x530.google.com with SMTP id 15so12629032pgf.4
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PeuW7BJ1muFyK1wKReKHwGb7/SecevdlBxdLDbNDutw=;
 b=KRMf26Eslj21jkP2IVssZPbR4ct2ai2eG/GpWFBIRme6Y9l+KkRWWkVpRhAw4uS2Ei
 bbYvm4b7d2VlHEkh7gR7C9FXMdWq7He7RGiEpPsNuOriTAr8RQV3tUqiCtuj5TD35eG/
 97AvAEyo5DLIVvABX9/5cMh0EzylSwGpzoavCbSpZDf+otJpoqNW1HHmRHFrhXpptSdq
 pnjSGkbtfHpedKPQ2PFZlv7AZt2jBabyZERARAtAckpWpI1cdgr8RXhpQAIxh99kMERh
 LzUCgS9/Pub5sD0ghHoxY0JctSsI46w8FjjNXnKGuA4IXG1iE9gTmw/ncgNUID866FgM
 QtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PeuW7BJ1muFyK1wKReKHwGb7/SecevdlBxdLDbNDutw=;
 b=kDtF9WHmU39VgDuYCYf7nqDGiB0qPMBkkU+Q8jPC28hRuoGMjTBp6RxslfsWQCMzB2
 sJYlK+vEc5ofcPzg0P2OZ3gKzXZuaphjRv46ltsZrvdDf+eRpcs88wLp6eAjN+ZZiSkq
 6Pz2U10z1TInMp4npBuSFlBdkke6ym78d/kcVhCJDX7WCtqBrfKyIJhCJQMK0Ng9+bkx
 2//AzxMBOnzOs2wZfVP5rgErJ5zRVN6hojuMlt+e4eTRcNbfpr7WYijSBvc0/CTQAZbh
 OYzKcq4VWAvyZUTI5iFTbHXU9Zp6K/GJJsA9fkr+BYgbhK+/rEHnjALeLXC+fjIDtuW1
 /jnQ==
X-Gm-Message-State: AOAM532xVS7jfPud+2WVtBhBgRyqHRWEfxI2R0e8vcsO8vqrFuQmcDrc
 5kR/jj77goZm/h3KTgno3p4zog==
X-Google-Smtp-Source: ABdhPJw/ZmkGu40btuVwCs2+rdcjRG3Z1RY+CBUQpuE0lyKD7T+sEIGog9T036QQwugZWtGd/lfGoQ==
X-Received: by 2002:a63:d04a:0:b0:3c1:65f2:5d09 with SMTP id
 s10-20020a63d04a000000b003c165f25d09mr11350283pgi.201.1651527916076; 
 Mon, 02 May 2022 14:45:16 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 i62-20020a639d41000000b003c14af50627sm11455540pgd.63.2022.05.02.14.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:45:15 -0700 (PDT)
Message-ID: <f15966a0-e147-5b3d-a6b4-d1dc4b55ed3e@linaro.org>
Date: Mon, 2 May 2022 14:45:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 14/21] target/ppc: Remove msr_ir macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-15-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-15-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 5/2/22 07:39, Víctor Colombo wrote:
> -    if (((value >> MSR_IR) & 1) != msr_ir ||
> +    if (!(value & env->msr & R_MSR_IR_MASK) ||

Likewise needs xor.

r~

