Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368B74C0447
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:02:51 +0100 (CET)
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdFC-00024m-Bl
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdDm-0001Ec-2K
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:01:22 -0500
Received: from [2607:f8b0:4864:20::52c] (port=44561
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdDk-0004KJ-83
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:01:21 -0500
Received: by mail-pg1-x52c.google.com with SMTP id c1so3384937pgk.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Om8FdBroLKIjX53yMZrP9WnKVHwImtGwXDoJM9tdoCc=;
 b=zaWfxsNT4ojNvRc9TfCTPrqBjJUcNcrxvfkPFWbB3UwO1zUFfDH3SDPdLLe+cOV2XR
 cTRXXtVgxwhfo+RNc3DQVTvvYe076YGJMpfNpx6/1WwEaowi5dz+W0FFU5Um6twZn40A
 MFL2qCyo9aCyKpuxtRVKzQyaR+wBftZWu1d2VJjoDlm/tc6xb7JSG8JOU7NJXi0YINz0
 KOpGhXDlqeB+EzUUZBqVz0kwEjpZzjAgl58759WAftLiwS17ar2wUosTgvQiAG4hE/zz
 yGvXVQ/wVtourPu7HoZDeZqUct1Ku1IW/UwxJByJN3UMBwRBgYCpzKp3e+PG8esraPPk
 +5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Om8FdBroLKIjX53yMZrP9WnKVHwImtGwXDoJM9tdoCc=;
 b=1Q0HyNmRGM+QIpHWeMRPBntLYUwUc62pG769DQ4qBEr/A1p/kkUgGiQ6C9h4SN2Of6
 PiybnG5/jgAkK20RdJWT2v/Slke9QwoTCjYlVTK4Sests8OVXkQOOZDp0CaJi/+nPahk
 EAx3ql0a1LC9p9WBUjSgPDNuh/znKZvVRG3NoWD+UQt1f0V5ujGcPX2Q+PlQmF/PZnpb
 J3Kb5Xu5fAwJ73tC1s2IMvZY4I3fMrYAFRkSIM7+8kxNPDW5B74BNXbkWKGO6D0UZ3PA
 AV98nlT6lATJ+C8G35Zz5ubWJh7341o1/yZ2N3ds0neiSrQD87o1zP15zdl9c1L6UcKA
 JQpw==
X-Gm-Message-State: AOAM531JIAsJNdU94LzTiV2HMIPq6jUxq/PJks9GxJFrRg0Ef9mjVuFP
 O/3eLkpAg3Za/FcEtubkDzlAag==
X-Google-Smtp-Source: ABdhPJwlq0UqwtlqqCabJFDXKWoWe8hhrFcz3ZY/Ui17d0zEoaed5gUOZvDkN89mao+iENq5I5qWEA==
X-Received: by 2002:a05:6a00:1694:b0:4e1:9050:1e19 with SMTP id
 k20-20020a056a00169400b004e190501e19mr26913551pfc.72.1645567278974; 
 Tue, 22 Feb 2022 14:01:18 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id c9sm18902170pfv.70.2022.02.22.14.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:01:18 -0800 (PST)
Message-ID: <0dccd77f-853e-a813-3bb9-b6987c4efcf4@linaro.org>
Date: Tue, 22 Feb 2022 12:01:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 19/47] target/ppc: move vs[lr][a][bhwd] to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-20-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-20-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v4:
>   -  New in v4.
> ---
>   target/ppc/insn32.decode            | 17 ++++++++++++
>   target/ppc/translate/vmx-impl.c.inc | 41 +++++++++++++++++++----------
>   target/ppc/translate/vmx-ops.c.inc  | 13 +--------
>   3 files changed, 45 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

