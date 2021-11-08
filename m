Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67658447B5F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 08:50:00 +0100 (CET)
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzPj-0007BM-8j
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 02:49:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzMt-0005d3-E4
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:47:04 -0500
Received: from [2a00:1450:4864:20::336] (port=33755
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjzMr-0000me-QF
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 02:47:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso9810385wmh.0
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 23:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IthQ+mlQFbgWxO9KJUBcF7kpM2+zuTOqs4LpF4AXIvw=;
 b=jwFU4LVIdtWGfIq16KTouM07wCMeY3Ptk8lbT/tCAjERewaANC5kDh594/6h5sdOTn
 F45p/j6T3bueFFbMnoPRuqGtOMOQwSrr3Wn3NlRsrBKz/elwTgN5W80boeCzkscg1bTu
 7Kf82Qz6N55o1yk8shuoa0wwoDlHauGz4LwkpPqpqF67zJtj+la8/u18z33tf1eywMG2
 2iBnnC5OMmk6h5rfK0Lls33I5o+iZmK8U2IUQvNpWmAFAIrHIV4cHS8kKVubO0rWSIen
 ou8XPbgt2Nd3+hGmr7C5kp20ctrOw9ZaHJ9r2d3EMA/EPti/K8fLlEhIDDP6tJ80wD1W
 lX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IthQ+mlQFbgWxO9KJUBcF7kpM2+zuTOqs4LpF4AXIvw=;
 b=cbcmGcu1hrf/alOoGWBKVorJsergSysl0l5oKsUi8zXh32t8gIvxH2mopCJeHPDCfC
 z2GBPsUreBccO7wZ+9EDaR8+3OBI2OwPF5mDzvUusDHfqcCegiDaYdRihZ28V5kpg6LN
 keNuCy8mzbmCOe9Ly6e9/+RrBHnOhvVRILnCh06rqu3rwy73Gjsn486cQl37xztJK54V
 avu+a6QEvB2LnpgwZpomtMfFbLgDr/ytTZQda48KSQ00qJXPg9lVLBgWNPufrgZMW6Fi
 T1pzlhDNFPQtG++XKARSv0v466pO9NkD9nkMNG0aQPIEeuECTfZ/Wjx/tVllLhUuZpxv
 r9cg==
X-Gm-Message-State: AOAM530C4/KTHktOdwP7eqXm1esnQJjDFe+cJxrdtJ9mX5SLCkGPkH49
 cxJM4yhDi5L41lLqeDbikbPHmpcDPxA=
X-Google-Smtp-Source: ABdhPJxkKg1aTm4U70wslVsDnPd8CVebUckuMg7djWJCmV2vqkRxeTsG8hbpC5xYwvpjoyupQ5jmUA==
X-Received: by 2002:a1c:a592:: with SMTP id o140mr50504975wme.10.1636357225546; 
 Sun, 07 Nov 2021 23:40:25 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o25sm15327204wms.17.2021.11.07.23.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:40:25 -0800 (PST)
Message-ID: <a0a0f7c4-c420-732a-71de-dda66e2abb6f@amsat.org>
Date: Mon, 8 Nov 2021 08:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] linux-user: Fix member types of target_dirent64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
 <20211107124845.1174791-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211107124845.1174791-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/7/21 13:48, Richard Henderson wrote:
> The host uint64_t (etc) does not have the correct
> alignment constraint as the guest: use abi_* types.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

