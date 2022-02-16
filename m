Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC464B84FF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:57:15 +0100 (CET)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKH3i-00020P-NK
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:57:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKGYL-0000zY-NK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:24:49 -0500
Received: from [2607:f8b0:4864:20::629] (port=39720
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKGYJ-0000dH-EH
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:24:49 -0500
Received: by mail-pl1-x629.google.com with SMTP id w1so1553773plb.6
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 01:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4166yeff1dkXsd2kh4oVryecIas3IOy9l1fPw94wCVU=;
 b=uHecwOdsibIqpX+lQk2eHpz5TJIM9XIGBcJI+Vox+8HJJea4jr0tKDw5NvyeTAhBR3
 cm7hs12AibrR08mPUA4mdgTraGdjhIbjeF86YZklha0GqD+nBXMY36cWc1+njVXwaPqd
 I9Q5Y78jc6Cjf23tT8Y5GaTRTA1UwEYVH3/wpo73IJiqMrHh7Y1a7GiSioz40Mw8tGYp
 XcUgajVEv4Y/gK7CLGCsfykGja//+CQofk3GrrKjR8q+VwYw2AmabipKulzApvOAlXBB
 /L0mSr/49bcz6uIfYu+vq/Xz9CgZVpGkQ5c7TWS9LW35NQX9QyCFy4YV4pI8RxwI6vmn
 bBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4166yeff1dkXsd2kh4oVryecIas3IOy9l1fPw94wCVU=;
 b=sOSdVs9ciJrGubMH7WstpUZMI9pH9nulaz5p9M64er3Qz6T9GtiySV/WBr5hUQdopc
 txSzOZ9OD4izbwuaVqdTZvFS/RKfLF/IbuZG+/fO+30FsPIFehzW1KpeFNk5NgpDjNE0
 zXA9Q/YIm7lneSH6Nt0NN3qXgFTINQrZn0QOefJRx515JPB+PXYdEkD2smdX7UO3cAP6
 kGRjkegJh3eoX2cd/03rnW57c/AKhL0fBSctZomn2nDmWFZIfXtwU1wKTUkQ6gLyDP2Q
 eiXrg/JmGfVa6nEvk9MxqoAXB4YWc97rgTBSJOF96SmgF1iq9dIM6LqMCq/thfmVSkQ8
 EitA==
X-Gm-Message-State: AOAM531RJHHcyaLEXamsxwotxDoZ5jGZ9PN+yib0MWt+2Hb5t+LuYXI5
 ysaBNrhJSYiHYeztaVOR3HNbig==
X-Google-Smtp-Source: ABdhPJwMO4QhXhKimRhL3qBfDpZJk5lRPspWRe5pVQEMRpw+WuCLGt5e6fricHOW8rnAhl4y53DRxg==
X-Received: by 2002:a17:90a:d58b:b0:1b9:9559:4ae7 with SMTP id
 v11-20020a17090ad58b00b001b995594ae7mr683477pju.144.1645003485396; 
 Wed, 16 Feb 2022 01:24:45 -0800 (PST)
Received: from ?IPV6:2001:8003:3669:700:fe11:3bc:6f06:c324?
 ([2001:8003:3669:700:fe11:3bc:6f06:c324])
 by smtp.gmail.com with ESMTPSA id g19sm25326175pfc.109.2022.02.16.01.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 01:24:44 -0800 (PST)
Message-ID: <65399dfb-02bd-473f-a7b7-23131fde30be@linaro.org>
Date: Wed, 16 Feb 2022 20:24:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] i386/tcg: add AVX/AVX2 support (severely incomplete, 
 just for preliminary feedback)
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, qemu-devel@nongnu.org
References: <20220215205637.36863-1-alex@linutronix.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220215205637.36863-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Alexander Kanavin <alex@linutronix.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 07:56, Alexander Kanavin wrote:
> Lack of AVX/AVX2 support in the i386 TCG has been a significant gap
> for a long while; I've started work to close this gap.
> 
> This is of course nowhere near complete, or even buildable, I'm
> just requesting initial feedback from the qemu gurus - am I on
> the right track with this? Does something need to be done differently?
> 
> There's an enormous amount of legacy SSE instructions to adjust
> for VEX-128 and VEX-256 flavours, so I would want to know that this
> way would be acceptable.
> 
> Signed-off-by: Alexander Kanavin<alex@linutronix.de>
> ---

Have a look at updating some existing work:

https://lore.kernel.org/qemu-devel/20190821172951.15333-1-jan.bobek@gmail.com/


r~

