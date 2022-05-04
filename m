Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA39E519556
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 04:06:12 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm4P5-0007qT-AL
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 22:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4MW-0006x9-OH
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:03:33 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4MV-0003TD-6D
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:03:32 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso44855pjj.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 19:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ViDLWTOHs0lmjM8Y1ec75ZlbxeD4rKDU/qx6ZPm/67s=;
 b=z7oyFGtLLDhPQBPo/MFn/Lf6jFuylWv0uWK7sfSVu0B3z818MUJso54x9HNhbxqkDt
 082CxVDqhXcuCe+uDPBJMeYxXbnQ+S8fBhtwRDqdx5qtsisuIXFB4x+7PcOZKM95JHOH
 a7QrlOXiBuDCx9FuaXAB+/Eicwlg3T9StSOkZ9nJmE3LMKwoz+TqAZprBIXVFnY8dh/x
 nzDmI28p1HzX3nSU5PiEu4MVqHx2R9FxH2n0Q3/32ZdKwDTRefJvn1Gr+z9fL7O06UBx
 QJC+z5kGR7MNHxo+1uoilw+G5Y4xIGcsE6p9KT4eDPGeYZetImkUQQKLKUA+N2KMxawU
 uaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ViDLWTOHs0lmjM8Y1ec75ZlbxeD4rKDU/qx6ZPm/67s=;
 b=M1+yzzLF9/7mXvTiYIv+4Gay3RoLicsc7jxjH9gnlZRq9IcPN4YL35fI4V/224apdo
 QdwKmEyFMTDIbtU8olV32g8TMCzmyv5Q1VT3BS7RlaTkCY0TGrictH4uXl+7SJImAXgh
 HdSjDHrr69U4sUcUuwUvcoN8MKVsTR/eVt3SSAkkqiM46gtxUHn2e7XnY344rUzSG9rC
 mwGFb1bacCdMrPZxVnq48wPf8wPHDPF5xl8EUDIXIdOUrQIEW0hwXQo7N20CWZT+Gzn2
 HFnF0ntuDe/rJBDw59MtkXa094iu9D/jOBPm+WuO0rflTy/75em/YlOR1dL3PkhkrDk+
 i7Fw==
X-Gm-Message-State: AOAM532+xOvgYHDCHfJSjMNyWBdr/8czNx6mQV+9fXcRuzZVAZ18kHB6
 BqiNlOg2Eu+hII8ObmBJo82eow==
X-Google-Smtp-Source: ABdhPJwaSeyS/d9M1I0IxqDPK5DWCPsIj/CaXoWmh6gKyQTjpDcOU2oS7mCNtHSxqaFgJALalBlCUg==
X-Received: by 2002:a17:903:110c:b0:14a:f110:84e1 with SMTP id
 n12-20020a170903110c00b0014af11084e1mr19487667plh.7.1651629809213; 
 Tue, 03 May 2022 19:03:29 -0700 (PDT)
Received: from [192.168.4.112] (50-206-49-78-static.hfc.comcastbusiness.net.
 [50.206.49.78]) by smtp.gmail.com with ESMTPSA id
 y13-20020a170902cacd00b0015e8d4eb2e5sm6931715pld.303.2022.05.03.19.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 19:03:28 -0700 (PDT)
Message-ID: <5052e7fb-9dc3-eddb-26a3-f5e4afa6c6e9@linaro.org>
Date: Tue, 3 May 2022 19:03:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 11/21] target/ppc: Remove msr_gs macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
 <20220503202441.129549-12-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503202441.129549-12-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 5/3/22 13:24, Víctor Colombo wrote:
> msr_gs macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v3: Fix
>      !(value & env->msr & R_MSR_GS_MASK) -> (value ^ env->msr) & R_MSR_GS_MASK
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h         | 2 +-
>   target/ppc/helper_regs.c | 2 +-
>   target/ppc/mmu_helper.c  | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

