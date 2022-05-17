Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B352A952
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:34:40 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr15e-0000oa-2S
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr13T-0007ON-Pw
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:32:19 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr13S-0004nL-7M
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:32:19 -0400
Received: by mail-pj1-x102c.google.com with SMTP id ds11so6447469pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SFVTVi4awHSwDB82D+/8Bpp9dJ8a2rigwCEd3Ebospw=;
 b=TulWaya29gghJhnO77eif3wYySrjpGuJ6siG0XyQx6jvlc2qRu5REYRroAOzpT7M76
 vaONiA86I1hHzFwjvqV7NywBWi9/olKjLcT0yfJldQHS3yJAQlD1QPxAj3UFhDFvUDrO
 eQ2oo1pOimmjn+0o4LBbTQtlJ9BRTl/i99erZv3hrcvWwGQsXY3I1unl2LcDlADLsHOT
 dxKU5Tx/HjiN4LpbMjG59HvrHtevmqRK3gsMZeX6pWfeBoHYou5JQT8M6ATDj3XTQquO
 PpRV9R32vtGkPbeq37K2YqHZ4u1usX/6AL/S4tnDwTji7k6/RSRv7AcWNiw8c561Hk9y
 cFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SFVTVi4awHSwDB82D+/8Bpp9dJ8a2rigwCEd3Ebospw=;
 b=zgDGo/5DzvQinZxFWAD6VMBPgGM1De/faGqua/QctEBL5ByWBE9/MMPVtUtQEUxkCL
 pIyLBYmw34v+isYVUgr9yDM7beGr+Qyu3HrY8sgD4YuZ5dE+ZkMNsWSY/XQnrJG+4B7N
 u2vy+KU+HeM+s9q+y2lxCfdlfcRPj9alvLxUikShIvJrEqc2csQVMWZR4lAMquZ7LRw1
 FYiClVS5Z6QoIPx+yqA4Fguzo6XiCFvF5tyNUyvkPJmqXrcXOb8kyRfkAfHfwAK8RFKy
 FVBm5HrQItdE1nkZcZebjnsAwZvpbgSN/n4PpaLkOdNAg3RZZhiz7GjpdFfismHeIy+B
 vflA==
X-Gm-Message-State: AOAM531h+52LDBzkt2NYvXhflTIF9CW2VrUi+6PoCHifwMpHGSaAcGSK
 WMkwXbXbvKoYTxjfIzEgFbSpTw==
X-Google-Smtp-Source: ABdhPJwi3r+rcUsYgeaf4PxKmwarJHAkdVSoWum+w4+NvzFaVekSd1Bnjo1tMN36/vRXpTS7MK5ZUg==
X-Received: by 2002:a17:90a:ab90:b0:1da:375f:2f44 with SMTP id
 n16-20020a17090aab9000b001da375f2f44mr25922618pjq.33.1652808736716; 
 Tue, 17 May 2022 10:32:16 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 o130-20020a62cd88000000b0050dc762819esm67802pfg.120.2022.05.17.10.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:32:16 -0700 (PDT)
Message-ID: <dd2a9048-1760-782c-980f-b39c0e3fb044@linaro.org>
Date: Tue, 17 May 2022 10:32:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 08/12] target/ppc: declare xxextractuw and xxinsertw
 helpers with call flags
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-9-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-9-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Move xxextractuw and xxinsertw to decodetree, declare both helpers with
> TCG_CALL_NO_RWG, and drop the unused env argument.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 +-
>   target/ppc/insn32.decode            |  9 ++++-
>   target/ppc/int_helper.c             |  6 +--
>   target/ppc/translate/vsx-impl.c.inc | 63 +++++++++++++----------------
>   target/ppc/translate/vsx-ops.c.inc  |  2 -
>   5 files changed, 39 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

