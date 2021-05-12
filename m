Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92637CD22
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:12:44 +0200 (CEST)
Received: from localhost ([::1]:47154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsPb-0002Hi-Ug
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsLx-0005pF-WD
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:08:58 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsLw-00037v-6v
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:08:57 -0400
Received: by mail-qv1-xf31.google.com with SMTP id q5so12417185qvv.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZKpTyOA9vrJQWLtq2uFIadBbqbpGUzY9zNWjNxIc+Ys=;
 b=c5n3up6yOEvgdo/g1nO5Qx7IP1ZwMECU/NOp569nuoUarSKON5udveOQuHbqD+PExh
 O3vGjO7DWCvJSfnIdceTWKYC8K3AEKcRwY5/suWUpsgYqRLY+zYl12PFcpArtUf/HHK8
 IDk0VQvlemMTDTlj33PBLQV02QHlm63hBG4bcmw/aNFieNEd2+5waU+7qz67x83jEzeM
 7t7UwyLcrprk6qQVvmzHWX986eS2X5YAkgwlCA6GVBl/2+BxcIpFMcYMErHIbGZ+w3GJ
 A699UTkPOuU06XAs3WdxmyiEs2pl/MYu86Ut6Laoo5csvkAveZvzGh3g2AmNdOgliU6+
 TBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZKpTyOA9vrJQWLtq2uFIadBbqbpGUzY9zNWjNxIc+Ys=;
 b=CdMnKJkBcPR77jvQKsKJoXWRIuXmymHKEXRcig6i9vjv8nhH11yeTG1AOi3k9bTQYD
 XwCgW+Tsy8/EviJEPVar8LDMzk35hnJRWgMCdqUfpRIjezIQk46iULAwFcpAI8anrhrS
 may+sRx5/+ToDyNUQcIQYtASXnLBPGF3XFYNU/pqUhDmdhnFaTv05RsYCTa3nPdZyiMJ
 +r97x643zF7TQVOq/BZAdnFuAbL6Tq0GrbVVJzKrZfguV2YHoHnE4C33Qb2bf/bu7Er9
 a48NWDuKtAIIAy+4dykWyr1qsmGlazSX6rEwHQAEFsw09+HhDqSqzxmFCS8UCPXnr65S
 XlEw==
X-Gm-Message-State: AOAM530op32jhYF9zLEwAv1FOJba88t2PBB5ZOC9IH4fv6pe+Q0YcgZE
 X8KUas3eamjnlX284HstLaGnTw==
X-Google-Smtp-Source: ABdhPJwRu8daruqbwI0PS4ubFf6AiXckoNqMaWCIZF8sJsswDLaNBhvVj1LK1pb4giL/Jj5S8dXGuw==
X-Received: by 2002:a0c:f603:: with SMTP id r3mr36124589qvm.59.1620839335042; 
 Wed, 12 May 2021 10:08:55 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id z187sm453382qkb.129.2021.05.12.10.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 10:08:54 -0700 (PDT)
Subject: Re: [PATCH 06/11] target/ppc: updated vscr manipulation in machine.c
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-7-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <38a6063e-7b38-4469-891c-b5fce2be4ce7@linaro.org>
Date: Wed, 12 May 2021 12:08:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-7-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> Updated the code in machine.c to use the generic ppc_{store,get}_vscr
> instead of helper style functions, so it can build without TCG
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/machine.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Squash this into patch 1.


r~

