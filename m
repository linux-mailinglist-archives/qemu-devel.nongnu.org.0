Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2A4516025
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:36:39 +0200 (CEST)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkstS-0005E7-SK
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkssW-0004UW-1v
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:35:40 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkssU-0004Lh-Eg
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:35:39 -0400
Received: by mail-pl1-x636.google.com with SMTP id s14so9709937plk.8
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pD5Qb8ExSE+VJ7BwgqoxAJzH2m9gRB5cknxjI08KTT4=;
 b=jGePfrnPAgDygI1TCoMu6b2x2Jbvne9xHUgGi5qPxeBPYyBX71g0pIbRKOIqiibIPT
 BDgyuKj9rNMglUIsynvLrFlClEPLj4c2LV7GP1Gb7oDZgjCk8tQU2CWFsc4nU9aQ/EBD
 +viy+kJMPu1h5gbcBg0rmtjKFG1AJlQP30DMtWazyAvs5MhJ6qEibeYN+S6ukkzxKn9E
 WbclLnS8W/2f6PhW6GNFoVSw16BeeqVZjU/N36uBDzkOse93hxL8Ua43zfGxheH+O0pE
 Vp4Weg9IM47WhQjcP6b2gZgTqP36ErJXI/f13iOmTcjeoMrwJciECOUt7/sulYAOg/dG
 6Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pD5Qb8ExSE+VJ7BwgqoxAJzH2m9gRB5cknxjI08KTT4=;
 b=h/gDjkcgPH07hLdpYipbtBXxA16z6+uPKi+8+n4T7TVgF5LkIYbSf/0V8JtBLIttJu
 3o5cU1SbMZ7viFCnLzWlnxS+xUDPfhLogCaNghG9vTvGC+U2eTMeLUULfd1MaGGIiQA8
 GL30aVm59nTFQ9UajnEv80FRIFTkgcEVbFiD2a7nq4dzykUj1hjaeVwhQE3pNIjbNTuQ
 mx2zx9SFrQ9DBn/iNRQf1q55igynEtjaXA/1+odDRmS8bLqwmEf5GZCGMuJaWHsi0jEh
 YUT1f+fb+mv4c257CC7UwDdx9pB3pKr82DMrbp3AT9UgDWiLwpNaDMGcDAVDN+4RouJG
 Uv3w==
X-Gm-Message-State: AOAM530jaZn7ZKh3HqyBLpLGxyuMZDDY0Pp1xVKj09O8FzfCSJyE7LpQ
 Z+2cd0RxnCn7M9Eq0taloDlxUA==
X-Google-Smtp-Source: ABdhPJzx/fbMN2UYjOrldaJ9T4q9ERX159aYdGOcs57N2C4lKXeqvq2YNJUz5GNIwU0ap7zhD58XGw==
X-Received: by 2002:a17:90a:f3c7:b0:1d9:6832:7be0 with SMTP id
 ha7-20020a17090af3c700b001d968327be0mr5339405pjb.209.1651347336664; 
 Sat, 30 Apr 2022 12:35:36 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a632f02000000b003c14af50601sm8386135pgv.25.2022.04.30.12.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:35:36 -0700 (PDT)
Message-ID: <a4563102-e696-b62e-0284-8eca34a5301e@linaro.org>
Date: Sat, 30 Apr 2022 12:35:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 02/12] configure: add missing cross compiler fallbacks
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 07:18, Paolo Bonzini wrote:
> -: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
>   : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
>   : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
> +: ${cross_cc_sparc="$cross_cc_sparc64"}
> +: ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}

We don't want v8plus for pure sparc32.

OTOH this patch is just moves the line, so

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

But this is definitely an error.
Probably -msupersparc is the best we can do for -m32.


r~

