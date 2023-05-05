Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD396F7E9A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 10:22:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puqhS-0001JM-4L; Fri, 05 May 2023 04:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqhO-0001Cl-UD
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:21:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puqhN-0008Oz-9v
 for qemu-devel@nongnu.org; Fri, 05 May 2023 04:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683274912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ceLcOTiDCIC5w7+rBtsCy3UH/OkvRma5WbIbdWI2jyA=;
 b=FMZZ+ib7+EAHk9L/bQVI4KWOzsQ25nlH0+QY31d/vi3zDY5vPBmDwcU7VybTTmRv6s5Rx7
 Il/4c27pnqbqR1c+B+krVPUU6q1fyythxA4iHZdiCcZpfD7szSVCz1jdlOt44K/WHIRg5v
 AQn+je0aTVRq/CEfMywV2gxHXI0oJCw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-TIGjYVflPPWf4hS_dWT33w-1; Fri, 05 May 2023 04:21:51 -0400
X-MC-Unique: TIGjYVflPPWf4hS_dWT33w-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9590389b9f3so169655666b.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 01:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683274910; x=1685866910;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ceLcOTiDCIC5w7+rBtsCy3UH/OkvRma5WbIbdWI2jyA=;
 b=SHyVCT8TexSH7fnRbM9XtLlwD8aN/bBO1OROZ7NTag8EgSgZlBpNhWpJQ7p19ng8mE
 n74IaAGpQnXQNk4BsRObvEcegx1FO5tk0gkTYLOJMhgoInAVkEIZdDtGaZ1KPoMnk1c/
 1zVShHhJ9F6IW+lFZUeeVH1jnzeO+9mDbtj6RIYqFeMVnWJjzJPYDu6U6yJU08Flnv9U
 pwYgGBvdCUXfX3oR5RR95t/dKon6iQg8JMWKIwIRjSr3+6yYr6Qp9fPNNMOH0L85aeM2
 HOB/CekggqLv56JbmgD+lPL8mEGBgZYjOnRnjGKX+gQYSR68Cwzd/G7r//7dnrLBl2qd
 L8pA==
X-Gm-Message-State: AC+VfDxpx+l2hMXapEqgX5Y3tmJ30EHq16cZTZQJ9JSm1s6tFh0927r5
 AWTAODLWolUy+tcbQour5bEwFU3vB3b9BOMdU4JmVYY8GTUB4yoMg0dUrXiUWW+5ZkbPo6/bbag
 0/ZIaGHUz/Oq8wlM=
X-Received: by 2002:a17:907:7ea2:b0:954:c085:56b3 with SMTP id
 qb34-20020a1709077ea200b00954c08556b3mr530106ejc.53.1683274910367; 
 Fri, 05 May 2023 01:21:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7pt/20+Cvo3oD7PJk96B9lTuArI6WK/dLqESoBlcT4G2ilq1IPJrkB1QfF2lG51Q9sImaE7w==
X-Received: by 2002:a17:907:7ea2:b0:954:c085:56b3 with SMTP id
 qb34-20020a1709077ea200b00954c08556b3mr530086ejc.53.1683274909963; 
 Fri, 05 May 2023 01:21:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 mj5-20020a170906af8500b009611a489a88sm639322ejb.25.2023.05.05.01.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 01:21:49 -0700 (PDT)
Message-ID: <e69b4e20-5ac2-bce9-fca4-86b566f975f7@redhat.com>
Date: Fri, 5 May 2023 10:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] scripts/coverity-scan: Add xtensa and openrisc components
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20230504134526.2748157-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230504134526.2748157-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/4/23 15:45, Peter Maydell wrote:
> We have two target architectures which don't have Coverity components
> defined for them: xtensa and openrisc. Add them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> As usual with coverity components, these will need to be added
> manually via the scanner UI, since it has no import-from-file...

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

but the UI is broken and adding the components results in a 404 for 
https://scan.coverity.com/projects/qemu/update_components. :(

This has been a recurring issue through the years, it was gone about a 
month ago and it's now back; I've sent an email to 
scan-admin@coverity.com but I wouldn't hold my breath.

Paolo

>   scripts/coverity-scan/COMPONENTS.md | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
> index 7c48e0f1d21..add7c5a279c 100644
> --- a/scripts/coverity-scan/COMPONENTS.md
> +++ b/scripts/coverity-scan/COMPONENTS.md
> @@ -143,3 +143,9 @@ loongarch
>   
>   riscv
>     ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*|/hw/.*/(riscv_|ibex_|sifive_).*)
> +
> +openrisc
> +  ~ (/qemu)?((/include)?/hw/openrisc/.*|/target/openrisc/.*)
> +
> +xtensa
> +  ~ (/qemu)?((/include)?/hw/xtensa/.*|/target/xtensa/.*)


