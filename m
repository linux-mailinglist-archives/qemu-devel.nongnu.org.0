Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1674A6520
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:44:40 +0100 (CET)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEz4x-0008B5-6J
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:44:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx8u-0001r6-Ma
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:40:36 -0500
Received: from [2607:f8b0:4864:20::d31] (port=43876
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx8p-0002Wt-TO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:40:35 -0500
Received: by mail-io1-xd31.google.com with SMTP id z199so22146372iof.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o1s7KJL0q/5s/IsbgT4FVbVayf7HSGh6/xm7WYxH+Uo=;
 b=OlvXdoAfeOLF+FJud3Q1KZxALNewMRikhlUyIddZu8b6UGxj+mwSbn8/HdBBlPXyth
 biojvP+Xmm593g5koiovkkDYsd6cqFm33yqbxcAw0VyJmcV8ZRoM/zwPGP6ke8SOC/fY
 IVzwUeUJgWjhXxm4myq6F8okuVofAr2rdYqzENPVYdYaKbhANHszV4sqLQRxPwJM1zCw
 wPrbj8oRRAKAca4Sekhip/33529+Nb2yzSx6TCo4h9xaTKIEHZJyJqs3IyQmWsaCGDGG
 F6YgDPpYhgFXShZ9MQirOnsIK4AD+rBTGuSy193is86oWll4aniyqPdpUuTovjmTcyd0
 q4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o1s7KJL0q/5s/IsbgT4FVbVayf7HSGh6/xm7WYxH+Uo=;
 b=gfIfLeh+sJ1T7TyA1dHtahlE6NDZaloC2YhQzfnYNDa40cQwg5tzE5d8cWOw4ngOa2
 GiKgwhZogpxTCVd9DV8rXqx8X8j2UIa5r0kPV0iGK25ydKxZJi+Ki05YQlR+Q9lDyNQY
 1ZYVRQFbl8j5PGcr8tRDVYmZKlPFZlHXFXVrxyikU+o4zSl2TdEVRvAUOtY/1ZDRCKIk
 79U093xkGFqWTOGzcMstG1T/IydTCDsTT4pWNR4BXYao543fmsMvk3ewdwQsFMo3vRn2
 qh5uJ96upY1Kr8VNQaIfjcQatHNCh0SobfPTEBTDNaG0DpSWdg9ZIWdoGRuEqpemqkw5
 FkLQ==
X-Gm-Message-State: AOAM531G+rVsrOpPbKI9j3oUgSafy7d4beQgQgVDUMcgnQUiBALWzJZX
 9EjO4jQPMuG4Z9SBJJFCBT4vCw==
X-Google-Smtp-Source: ABdhPJyqdpj0/Z+Y814ZdHPwQkOKwsQYc8ZixwAvhZhlCIv+rzrIVovvs51oHur3Sy50A/BzBmP9Mg==
X-Received: by 2002:a05:6638:10c5:: with SMTP id
 q5mr13013714jad.113.1643737211793; 
 Tue, 01 Feb 2022 09:40:11 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id g14sm8903617ilr.12.2022.02.01.09.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:40:10 -0800 (PST)
Message-ID: <a7220dac-e41c-43af-61b6-f2a3576f38f6@linaro.org>
Date: Wed, 2 Feb 2022 04:38:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/22] bsd-user: Move system call building to os-syscall.c
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-11-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-11-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd31.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/meson.build | 1 +
>   bsd-user/meson.build         | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

