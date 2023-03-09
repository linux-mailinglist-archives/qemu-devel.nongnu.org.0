Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DB56B2133
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 11:19:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paDLw-0000iR-1X; Thu, 09 Mar 2023 05:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paDLp-0000hs-Mi
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:18:21 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paDLn-00029Y-DW
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 05:18:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so3193234wms.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 02:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678357097;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4HGW4u37pZyA8+q+Mq6RcyMcikpDKhmrs1r82V9q72A=;
 b=GhEFDVRfFF5W9Y5e0p1GbW2E3laBRiU7hWXprSkB6n14jqbRGBOTGhqcL6Ewmu62Gj
 Hh/ebH5cyfMtu3I4/xdIa/O8B5jMfs54j7IB4nh6uzeJ73x0uk5DzR5QSZ4YL2Nxxcel
 4oDiAZ8vmkhPPwbVuQuPx5Jvifs9vwJieO2BWFhmwb8oxlUMh5DrpIk9CCn3N+RH47dq
 6e+b6xqmGL0rF04xnRi5XN2EXSbs3YmG8u8E6Ay3CujEQ73d/O5I3k1NfsQjxQ2yEcPX
 bIw87aUEo/Q+i6CDY3mB2viRbPOkykKmh2WDeJbQdIV0pQ2wNY8P8Tl8pwo6kB9v0fOM
 r5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678357097;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4HGW4u37pZyA8+q+Mq6RcyMcikpDKhmrs1r82V9q72A=;
 b=t4QWKa4UhsRwJRwQs3lc8GD11aDwz43jyjp85XXa/mhEzipmyk3DxdeEmxQ5d2C8NC
 qeoTWYdk+CIGxHcUfysXVKV4xXwbntVmOvzzfeleFOsnsFCoa+TUjWCatehgeUF4Hsoo
 9InExBI6+XwSW29K+PE+Z9Os4d6KtoT1kXzg8nlddjKdm+1rMEPD83NkzXVFFxNeegFt
 NAUr59SE5QvHhPsfNJWNQRYqX19glYVTxUHIVExDt8aPgEIUQU0fuF6d5bGZpRBSH1Dn
 /e6oHCCCxo38W40G5wxhDcsiqtEw7RLlY6/pXnG20UYW1xi9UoajiqTQ4Fa7rIez5LiS
 vx3A==
X-Gm-Message-State: AO0yUKWIUqO2jJCExT5z8UoxHY7rdv05jpPldNZaZpzd5hB+IQ/b0zcW
 4A4OAbfmtSuZaE12/p9CQDpfOQ==
X-Google-Smtp-Source: AK7set/42VP0ExI/y6BEF56lJwZ9LSMkJqGWMoPaCC7RnhCFBqKahTXFoCysF8LASlYRNCfVJXvGRw==
X-Received: by 2002:a05:600c:a09:b0:3ea:c100:e974 with SMTP id
 z9-20020a05600c0a0900b003eac100e974mr19880240wmp.26.1678357097705; 
 Thu, 09 Mar 2023 02:18:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003ebff290a40sm1811356wmb.21.2023.03.09.02.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 02:18:17 -0800 (PST)
Message-ID: <c32bce09-a02c-6311-a281-43a46e1d5e6c@linaro.org>
Date: Thu, 9 Mar 2023 11:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 14/25] target/ppc: Avoid tcg_const_i64 in do_vcntmb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/3/23 19:34, Richard Henderson wrote:
> Compute both partial results separately and accumulate
> at the end, instead of accumulating in the middle.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate/vmx-impl.c.inc | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


