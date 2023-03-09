Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EBE6B20BC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCye-0000kP-JQ; Thu, 09 Mar 2023 04:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCyb-0000k1-Jo
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:54:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCya-0003dN-6X
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:54:21 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so834843wmq.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678355658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sd++dA/g63HTwmtR9UocDiVcMAlUCKtd11sYFiiBzAE=;
 b=K1Pp/HCLvqrObpBy65dgC2y0+lQZMM0iTWDS+l8C2KOOV9V30SDsJxgya6vB+FnflP
 e9WaHWM2/DUVfS9JZiE+v+dM2tJazQIl5OPWosCoK1/p800JwWiTt4NZKHCcNokee6j6
 pMznZM8S787lnn40ZznJMdHdPByOrJ0z7LYA93elqilMB+cIoq0CeW7jfbl8yJWKaPRw
 V0rTOU7BpbJMx43rvARjy54FxOjX7HDsCN07wCdnfORoUE6EhPnO1TagCRtU+qHdA8L6
 tqJyYW5ZUmvA1/5rayx9AyMwR1hxs23sGuXxhwDHTnwei9tDU89lPw1iR5D9YGpsG5gi
 dUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678355658;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sd++dA/g63HTwmtR9UocDiVcMAlUCKtd11sYFiiBzAE=;
 b=VjXOJVf18EzTtkAeCeCf96NHARuepdGUcj0WA61K4T6CKWJ4i0MXl4osNYwVCuiniH
 H0hlfMzyN9gaPmEi5u8vreccPmSrzsSF//WeLY13JJQYSiKFzejzxagP/dOm1voj/aDe
 ce4rp99HyBG3Lp0B190ZC/AHpHJuQ1fVATnYyIgPxfg+wpVmV2Wu/OzCYKfkgjsCPzy8
 3sfAeasZqia1imS74Is5v8ZT8sa00Q/exQ2lhDUq3fWy2/mmmvMGzQ11NnE9uXNeWph2
 jtuh9o7/eSAWdlrG6X5g58yyb3gKNyVdVJAkJL1ln2skQXtOBn9TUB85kLWSlEsrnErX
 0Qxw==
X-Gm-Message-State: AO0yUKW2J3gPYK2IVjcUxZtybtLQ6Tu+VFjSVUaprV9EbQXERzlxBAgg
 M97rS3nig4mD9AFW2luzFrG/iA==
X-Google-Smtp-Source: AK7set+etlIT7oJNEe0q7Xxedo6r2WOQ+stRgavPVj7/2AK6Wfe7sgTSDhFyCSD98/kwqsFQERmYwQ==
X-Received: by 2002:a7b:cb01:0:b0:3ea:d611:f8 with SMTP id
 u1-20020a7bcb01000000b003ead61100f8mr20172906wmj.38.1678355658305; 
 Thu, 09 Mar 2023 01:54:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c510800b003e215a796fasm2316421wms.34.2023.03.09.01.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:54:17 -0800 (PST)
Message-ID: <67bc25d4-1499-80e4-b33a-dbbeeda8d635@linaro.org>
Date: Thu, 9 Mar 2023 10:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 18/25] target/ppc: Avoid tcg_const_* in fp-impl.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
> All uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate/fp-impl.c.inc | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


