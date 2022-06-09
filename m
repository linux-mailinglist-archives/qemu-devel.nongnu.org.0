Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD65450FF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:38:06 +0200 (CEST)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKEU-0002Rg-Th
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIwu-0004wM-0u
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:15:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIws-0002Ek-6E
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:15:47 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h1so20327790plf.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 07:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l9sR2Lfq1JDcSOI2GJgS8GMe44nAxbs4lyy+H67n2XU=;
 b=O4FxV5s9nfrrhqlQBLAQbHNCm/3dzks1qwaUdOTXPUQ/jmrrvGmCZ4lJr0iekbCEfa
 ijalZzwwDdF1mzYW152UgtqkP4LolhTpZoxxJ7uSoEoP6DiQ1Sp5s4gjmk5/w/H/mOAd
 pJvKmYC448zrrD+0Bk/jAlJ79bfKs2esr6lflPgwO1LZUbvwKs8p5broAXJjaRFJzcWO
 EKOYUrO7yTnzJQiMganvbiPLntndvKyhSxC2Leew1YolXJeLm9czT3p0xvw+iOSFX8dw
 NBrIN1yvJK+xGzR7BjHw4jlGv0Imy/431QIigppz6ePYK3Qrb2r0VPpotmUqm14Td5U6
 LE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l9sR2Lfq1JDcSOI2GJgS8GMe44nAxbs4lyy+H67n2XU=;
 b=HPt6+WpgCnSwX7mizdNg5GsGjGd/1rFTGcfqgOyufJ+bIqJZjr9A614vRC0zokOjT3
 GYd0BEQ1S2ndvcsX11NP58ksSK1N76bOcKl+N3KAzxysFbvR8ikiQqK5vGeMEtrS2dv/
 +WUH5hOS8NwCPP/8/bPJk660tZdEKJCl0/Np486xMQUwWxOZci3mmX6YT1zzYC333H0R
 SZf6NLBknJ7hNeXYstP6gCFJSHYutgyef6pfZ2nLHs9zEc2XXRxnoJmzhO3tLwNHAOT8
 BSHGjcm0gCdoUauJNcGsP6/ORo0PEgrj/3WcVThvpKogpN9EZam/Ujb6wF6hunnD414s
 mb1A==
X-Gm-Message-State: AOAM530liI8xweCC82sL/tH9vR6wNk/eaiDE+fSkH3wR/y0a+vVUC7kD
 bgaTM4kZl+EjRLemT1Jg5VMgag==
X-Google-Smtp-Source: ABdhPJxavdYGeY9oXGAzqGgyiRzGlteOhajRrEHUQhuwbaDNUFsCl/KwTg0DZluYHAZxchpGmgPqbA==
X-Received: by 2002:a17:90b:3b46:b0:1e2:f8a2:cd03 with SMTP id
 ot6-20020a17090b3b4600b001e2f8a2cd03mr3676988pjb.229.1654784144530; 
 Thu, 09 Jun 2022 07:15:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 jj19-20020a170903049300b00164097a779fsm1791489plb.147.2022.06.09.07.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 07:15:44 -0700 (PDT)
Message-ID: <7e7edf85-e5b5-041f-384e-c2c4b2bc3be5@linaro.org>
Date: Thu, 9 Jun 2022 07:15:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 6/6] bsd-user/freebsd/os-syscall.c: Implement exit
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@freebsd.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220608211711.56158-1-imp@bsdimp.com>
 <20220608211711.56158-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220608211711.56158-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 6/8/22 14:17, Warner Losh wrote:
> +static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
> +{
> +#ifdef TARGET_GPROF
> +    _mcleanup();
> +#endif
> +    gdb_exit(arg1);
> +    qemu_plugin_user_exit();
> +    /* XXX: should free thread stack and CPU env here  */
> +    _exit(arg1);
> +

I think you can ditch the comment.  There's no point in that just before exit.


r~

