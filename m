Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609884FCD47
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 05:47:13 +0200 (CEST)
Received: from localhost ([::1]:59094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne7Um-0006P9-8I
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 23:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne7Si-0004Ch-7A
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 23:45:04 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne7Sg-0008JV-Jo
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 23:45:03 -0400
Received: by mail-pl1-x629.google.com with SMTP id 12so3825803pll.12
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 20:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EVOiwZcReQtG139L04rFkXjqVFXdzUBd2VivDzy+Jgc=;
 b=yElQ4kxxsYyAEQY//iyycu5c48UN2zQL8FXfRpLrIszgW2r0Mx5QXemrkZDAGx2v9o
 Djkv7o2QXVFPEFWIX9lPPj0/5WtTlLTgLKYvAJoLGFLMCgr6jS8PTUW7yuu9FFHrIsdU
 c4yzT+VZ0Jy1lvxBe8rqFD5Ug50YZGe/x7NFuxK8o8unfGWDmM19gpliS+bx2i6dBmfW
 9t8/XX6zqN6fotMmnYgv0/ul3s7fXPFD0QE43qPuBhFKVcNF5VWKMK/MEKNcUQFy10f0
 x0PWBgPrr7mym5voSjGe03JXEXqzI+kyewbLCwmdMUjINMWDVqv2lLVz3JEY09RQiyr5
 iUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EVOiwZcReQtG139L04rFkXjqVFXdzUBd2VivDzy+Jgc=;
 b=cYRpvvA4Bf0yeGwXc5Bo/PWqmy/sqqkzVPZJER/w1gZfJ1WsfOLWs0TBHVpOTyYRAt
 aEDmA8FiDjh7kFNjQ4/m193l/W5S227NjfOGGbPea25TN1DDoN5FoSLnvyIvQD3O5AAG
 XMK1dfRWPLBBQUU3a9pwKkZ5WdZz28hUvAzle7aRXCC9WoWfIIxp6aH35JDG63e4ethW
 Ghms3tLpqcQSLzXQ83tASGLd3yiDHYi/uvaphVogLqZT7x5TgJm7yT4Z0AIdGEIToZig
 ZBHjOp9yb+y9cwNUZzFEm5czF3jSHkyeNgk/Z+GHaHsrCPijtjQv2+Ni6rUg3kaReLpq
 Jw3Q==
X-Gm-Message-State: AOAM532BekrXs4BVj9TyVVZkzWHl2QS/fWvhbmvCkAtZXevqc3d6o4m2
 63Qq3Z08+Vg41oyZkbLPG3L1oQ==
X-Google-Smtp-Source: ABdhPJy2kc78GhrJnfl/yWVPWBqcQO2b3ceNIlXqzIiCuVJwqYPbiKWQ/YwGh2DdbBs3K/HLkmXQ1w==
X-Received: by 2002:a17:90a:c3:b0:1ca:54c1:a684 with SMTP id
 v3-20020a17090a00c300b001ca54c1a684mr2655184pjd.148.1649735101286; 
 Mon, 11 Apr 2022 20:45:01 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a056a000ad200b004cdccd3da08sm38640921pfl.44.2022.04.11.20.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 20:45:00 -0700 (PDT)
Message-ID: <9befbe75-7248-1430-d8ee-46961cd6e7c7@linaro.org>
Date: Mon, 11 Apr 2022 20:44:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 9/9] target/ppc: Implemented vector module quadword
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220405195558.66144-1-lucas.araujo@eldorado.org.br>
 <20220405195558.66144-10-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220405195558.66144-10-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Greg Kurz <groug@kaod.org>, danielhb413@gmail.com, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/5/22 12:55, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vmodsq: Vector Modulo Signed Quadword
> vmoduq: Vector Modulo Unsigned Quadword
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  2 ++
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/int_helper.c             | 21 +++++++++++++++++++++
>   target/ppc/translate/vmx-impl.c.inc |  2 ++
>   4 files changed, 27 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

