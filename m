Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B079E4EA617
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 05:31:09 +0200 (CEST)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ2ZY-0003RM-Qm
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 23:31:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZ2Xm-00023d-CW
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 23:29:19 -0400
Received: from [2001:4860:4864:20::2e] (port=39839
 helo=mail-oa1-x2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZ2Xi-0005Cf-Al
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 23:29:17 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-deb9295679so10174775fac.6
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 20:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kq09xatLbRUkx9Q9szbuOfg6SaUUS90+w/BNYg962xs=;
 b=IeEWS+jL+CizaXdhfvdC1PoVAmF3fSlSi/NLGeGh+M/Hyzk3mk7Iyf79jwEYmf057c
 +dHXuJPgrRz/h/QYu3g3Wy7S1WLA/r3sU3Qvas1LQ3841G6nS/o6mqrAqTrZDv3mYfix
 Hk8bDA7jyrCId6KbUJ1LOpRE3jtlV2BSwCN50KPHEO41R80DiLL4JuBq4xOo2Xxihk+s
 IEjFW0h9nAF8xWqmGuW772w7qNbNFDM/MH/AjOWhQ3EJ2l1eY+3YxOV7VabYj3yLxoiM
 WMbDrOr/YE7bQ9rMc3KjS7OhfKAEr5w6SbrTsudfiWphBHWhH0MD6MvyK22TAgKDLTUA
 /8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kq09xatLbRUkx9Q9szbuOfg6SaUUS90+w/BNYg962xs=;
 b=WPpcQhwISZpe6QjSq6LcW6ug80qfoFnfaMii3DnfHN+I4MYzEZ/r4jUQ1C5QmtnXhT
 O2BnEp2498PQTzKWeZX3doI1ojKZv+/KDHBNN7MeJAGWVDxA9L/9GlrBDMXlQjcRzLqP
 5fWcYckiOxyQBf3PSJH/oVm4rElKBg0VaKkvlyBK9yopSXGNgVhESNZZF31hQrS0dX3j
 r1r1aHZz2p4vjwYKfF9qd8mnWgSSD6Rsz9T2Y8YVTOdW8AaHjikVmNztEWIQ2t09faJc
 fk9N5wjVeIwHSMUgayrNoqpbtOIugtsirYxxUIDkujtPaDOIgQXcFkoC81bSavP1qo54
 69EQ==
X-Gm-Message-State: AOAM533axm1kea322+Mby92mugQk6s30hARh+R25nxmdmFIjp15gDPa7
 bOzciASHv8jgYrX8m7ysvbvnUA==
X-Google-Smtp-Source: ABdhPJwDncad5jPh96SvdT73OiHWcdtGtKpqlA+Hs71iG2dCmefcKNYSwu0Yhj9ETknIlh4EHCZ4Wg==
X-Received: by 2002:a05:6870:888a:b0:de:6122:2bea with SMTP id
 m10-20020a056870888a00b000de61222beamr1269159oam.130.1648524552153; 
 Mon, 28 Mar 2022 20:29:12 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 hi21-20020a056870c99500b000defdfbee5bsm2579616oab.28.2022.03.28.20.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 20:29:11 -0700 (PDT)
Message-ID: <0d37a7c8-439e-eaa9-7fc4-7e914647754d@linaro.org>
Date: Mon, 28 Mar 2022 21:29:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 29/29] tests/tcg/loongarch64: Add hello/memory test
 in loongarch64 system
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-30-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-30-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2e
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +	.global _start
> +	.align 16
> +_start:
> +	bl main

You must at least set up the stack.  This must work only via some interaction with efi 
bios?  What we *want* is for this to run by itself on the raw virt machine.


r~

