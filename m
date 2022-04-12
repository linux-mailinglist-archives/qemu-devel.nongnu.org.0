Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B526E4FCD44
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 05:44:54 +0200 (CEST)
Received: from localhost ([::1]:54156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne7SX-0002yG-D1
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 23:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne7Qs-00028h-5C
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 23:43:10 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne7Qq-00083n-Ho
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 23:43:09 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso1458383pjh.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 20:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=V/soGH2XTP7W0Pz0skFFdxwaiQwXbgiteaaIWpTDZzQ=;
 b=O3bwLK4Fq+x8fp3QAC9l145WoNkPxGv8bnewr8YmgbBtMaVTCkInFsdGaf2rF+Zjun
 xwRwYXrLAYHN3xsMJG7doP7MyQbZubs/+rdfhuTYmVhKm9u8sLIY9ey3qKbyABui9JL+
 9kxI8q/AXQiD7kZRqIafjjSeOx9EolI0G6N0uZ6iBXVVXV9D2VCsJuVTkI0V/LfYL5ul
 phGrHNQtHNO55tSfOw/B7fTcmMs4NKApBnvLqk3Fz81TUNrv7Sgb7eDK6KYVH0SlnWPB
 TfTEDvr+HzgmEzm3CKADyxmx546ih+3siJ/59OTQduDsGsIIIVmw1JZWbiWLGplUiQpx
 tG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V/soGH2XTP7W0Pz0skFFdxwaiQwXbgiteaaIWpTDZzQ=;
 b=0lnjDXH/dMkxvL1FNxcGRrv387sA42ijf4l1v4iPUGjY+iAk87jimF3fSEOXhkuIJe
 MJW16V40ogXv9VG69V8dzV1gsY5XBsPn0A+HI9SNvrYiIhWfioGnDleyKqetNqsH/I1F
 5BXOCfmo0huzD7Rzr5wFpNXUhD7KuCrsWA3p+0RUv6ACQmkSFFiGtNvCrVRG1OZqS+p7
 FMoPfnMgYMD1neVvZLOehURJbG+Lon9LlijHKbM7no0cCeeMWwyRqkSJEzviQiL/6YFr
 7UnOWhOKSYst7Ady5nEK8b8vtNNobCJWvyGzmyyjIbia3W/zOw93Xp0ijLr+MR38zVlc
 qKOg==
X-Gm-Message-State: AOAM530NQ1XXXQ7/tVeCAgekcfRpS9UZ813M7f4Mg2QL8+Fw1AKYIqtI
 akpNpFBHtqh+BHnro5hp3TzECA==
X-Google-Smtp-Source: ABdhPJyT2bc6Fnr4BBDEK420THAsW2H03yMNKMoFu8Ax5Ul6nPOdTiobYLWEW+PlvNfcVmD0OxccCA==
X-Received: by 2002:a17:902:a585:b0:14d:58ef:65 with SMTP id
 az5-20020a170902a58500b0014d58ef0065mr35439641plb.139.1649734987062; 
 Mon, 11 Apr 2022 20:43:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s20-20020aa78d54000000b004fac74c83b3sm35465585pfe.186.2022.04.11.20.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 20:43:06 -0700 (PDT)
Message-ID: <ee29c9a6-743e-2fce-a74e-6143337f80a7@linaro.org>
Date: Mon, 11 Apr 2022 20:43:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 7/9] target/ppc: Implemented remaining vector divide
 extended
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-8-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220405195558.66144-8-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vdivesd: Vector Divide Extended Signed Doubleword
> vdiveud: Vector Divide Extended Unsigned Doubleword
> vdivesq: Vector Divide Extended Signed Quadword
> vdiveuq: Vector Divide Extended Unsigned Quadword
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 ++
>   target/ppc/insn32.decode            |  4 ++
>   target/ppc/int_helper.c             | 64 +++++++++++++++++++++++++++++
>   target/ppc/translate/vmx-impl.c.inc |  4 ++
>   4 files changed, 76 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

