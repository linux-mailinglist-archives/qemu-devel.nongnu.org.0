Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC67252AAE8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:32:49 +0200 (CEST)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1zq-0003BW-F1
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1xU-0001TI-8M
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:30:12 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1xS-000511-FQ
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:30:11 -0400
Received: by mail-pl1-x630.google.com with SMTP id c2so364576plh.2
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ocoyXfCZgbsR4TfSvL0ereEqiXdY0X/bJsl0I79td3k=;
 b=qZXp/l1rBZee2gGEwFe2wcK4JctUMY3mzr3WaGjoY7atnuen8F4UNTOCBiX5D7F2Gq
 MZK+zbcn0JTctbPUEO4TZ39raG75/TR9Vb0Lf8RnNzeAobn4fzymwfk8I7LLDPFJFHhg
 dlUKitNOhuvNxfDyi+Y3W41Ru3R9FvQXpbD1utGHQffa5/uZa2VvjYYpfrhgcKPDgelu
 h8cbQ792ZOZ7kl1Z0TsWfI5qsP7pS12nrtwbtzNQNAQ9zEdeAbHfZv+5Yih4Gf5jQF0j
 f++hL872asdQtPaiV89+5SWJbeFjD3VCf4LnZ+YST9QniOuhYJz4cI/5FX8Gh/EyInnx
 hQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ocoyXfCZgbsR4TfSvL0ereEqiXdY0X/bJsl0I79td3k=;
 b=vYtjV84itsSpNnlMXlDVbIeWaSl4cDKxzI9/kfiT8QUydcJW0A18shg/n/5xVFKBdr
 2GtJXeNBiAT87/TYoS8pwdFtPN2p1oKmNleO4vq1pcapxfIvWeTozdd7RP5ZwIQoZ/ls
 6APkbEIshLxrhu/5JpDFizaVHPNRxholjD3DDZSo7pNtwP2+FjWDbuPdCR7xbu1XQJgu
 Yjedz0/VgdE7hNK8/AfJoSd56Q3KKcw908XoaSzaFVL71V3s+PMZdt0qCZY7grz1tL3M
 jL1ifNF5tAalSktcdL/62raFP+fDvDwY7nH6VOPXsnJ6h8BQoKnE2UwTVLegLjdN1BnE
 FN+A==
X-Gm-Message-State: AOAM533RYWMMZHovzXqAYXkSwAcycvQsDfBTf1lQb24i5eYEZXmgHRiK
 6zIq4ynUqyYHTW/UNBE7x+LUvQ==
X-Google-Smtp-Source: ABdhPJzhl/O7Vf2oQPVaFui4io7uqUySBax8eaoXIyY9LPrV9IF+KvjjW6NB6odFxovdvBUjZhXXaQ==
X-Received: by 2002:a17:90b:4a4b:b0:1dc:8bf0:feb2 with SMTP id
 lb11-20020a17090b4a4b00b001dc8bf0feb2mr37774472pjb.6.1652812208973; 
 Tue, 17 May 2022 11:30:08 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 g85-20020a625258000000b0051812f8faa3sm33450pfb.184.2022.05.17.11.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:30:08 -0700 (PDT)
Message-ID: <ec5142e9-f2f0-74c2-1ea6-e19dea2e26c8@linaro.org>
Date: Tue, 17 May 2022 11:30:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 02/10] target/ppc: Move mffs[.] to decodetree
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-3-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-3-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/17/22 09:47, Víctor Colombo wrote:
> index cfb27bd020..e167f7a478 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -607,6 +607,31 @@ static void gen_mffs(DisasContext *ctx)
>       tcg_temp_free_i64(t0);
>   }
>   
> +static void do_mffsc(int rt)

Perhaps cleaner to introduce set_mask straight away.  However,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

