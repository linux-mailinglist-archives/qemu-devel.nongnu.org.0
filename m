Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10334127CE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:16:35 +0200 (CEST)
Received: from localhost ([::1]:60576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSQeQ-0004lX-EL
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSQcj-00045w-2y
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:14:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSQcg-00029v-Lm
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:14:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id w29so33401649wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XD5fRSM+OU8tHAahOoEuvs9RA5AEjddTn0+YTvLoRLc=;
 b=hiUuHXGU8LUTuCkyD95Lho+HZKzfc4iYRAgS/FJRhO3afz7O8lh8pQJoSq4SExoVl3
 OJjSnw0hmaXTNyaNCzxOBhdSJLTJncHRNSXMSAw+pB6FVYmwtfDjiyfmVWr/Zo4Np6B+
 jOop2z1dxvz4GUH+GLi0wbPURAen/VeaPGQu/jztABjXg+4uSVqmM3Pu8MufpgzDaIFs
 fPWx4fzYpyBKOPSppUm/1wAhTYqbjp2E0TbFzvM0Wvy/XTpJn83yVUlw2I0/MNPsVCjx
 wTldjQ+DEgSb1W43Gt/5ohqGH0BrQJ3pgXro5VqDWfnn//6laPydUo0vhKgNRsmGpBhQ
 AM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XD5fRSM+OU8tHAahOoEuvs9RA5AEjddTn0+YTvLoRLc=;
 b=3U5aWSXQ5UPwl8kWDkkMRBbzx2zTV7rfUX+2N/fQS/fl0zGz+hIVx07BgCcUEVkyJS
 yzInSxk7DEsGxfe2jlqiFEwDWKpiYVdjVQpVg3DPgrEVS9WABO3CZ0VDqbDnlZ1g6fq3
 5QLKq0XjsVwyZfLtR/LjtQjiC+LGGd1fq5Qx5dUxjA7HJzsHIM+RSj9jLUjmLAPtPkBv
 wbZcar49edpWf+yF2GesXecemaVWOo1V3CQK/V5cug0yMCweOM1/bkIlBUCztbJ6GeFx
 ITmfmGcqCwJy4lM/2FVtV5oN7ae9r1HNSnflDuYPDEK2muPtrxKoahYSXzOLOs9cKkXz
 wU9A==
X-Gm-Message-State: AOAM5331pELVkY3XJcaWpHDnuU6Cs2PLVC5CZWjLQUgsyUs2jT3U5HSv
 BH7UeTe3nrvXUDbcV9cN2vU=
X-Google-Smtp-Source: ABdhPJwhPCRM9dM/0ahNc3FVXLypAp3+nsY73gYiATyQOSEePUaY1DBfyPk+BHpd3RpM0n7k325c7A==
X-Received: by 2002:adf:ec02:: with SMTP id x2mr30634257wrn.407.1632172483227; 
 Mon, 20 Sep 2021 14:14:43 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id q7sm17209115wru.56.2021.09.20.14.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 14:14:41 -0700 (PDT)
Message-ID: <8b4592e8-ad3a-b38a-3ee1-3c38e62b253a@amsat.org>
Date: Mon, 20 Sep 2021 23:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 07/16] tcg/mips: Allow JAL to be out of range in
 tcg_out_bswap_subr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <20210818201931.393394-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210818201931.393394-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 22:19, Richard Henderson wrote:
> Weaning off of unique alignment requirements, so allow JAL
> to not reach the target.  TCG_TMP1 is always available for
> use as a scratch because it is clobbered by the subroutine
> being called.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

