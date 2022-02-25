Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52434C521B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:32:03 +0100 (CET)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNk4A-0007DU-4h
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:32:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiUA-0005Ee-D2
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:50:46 -0500
Received: from [2607:f8b0:4864:20::635] (port=37695
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNiU8-0003qY-Qj
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:50:45 -0500
Received: by mail-pl1-x635.google.com with SMTP id n15so3635218plf.4
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 13:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D1cghO32f7t+WuQ8WwAshjI3EDMs7gN2Yg98rn6OrQA=;
 b=Hs8ErTlgTB3h3JLxFcQH3WjTtew5qu8do1LJBJvMTbCkEwGQfC9/AQowo1inS2o7r3
 YE4nKxE6dNmdTUnVROaw8D9PFP9UOBORmX6kSMceGynMIg+eDVdDQem9qGLzO/V6xXin
 H4wpI7S26ulKbhyzksRfIr1v3H3YgHI1QIroH5Yvcwibze7ubQcn0uCd3PYER9A3GR1V
 SNjdfWPWDbLqzHEmtDmSbJuaGtWIXg3aXrcUJaPkZ4Wf3bKzMJYFYz6SsfnNTS7LcE/L
 SRCoWAfaJtiVkrrwQvId4cOaH7QeR13j66zsDd6X0c7B6ObTrhcu2hkZOIwNoEIUYD/U
 cCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D1cghO32f7t+WuQ8WwAshjI3EDMs7gN2Yg98rn6OrQA=;
 b=Ztobylz0f6rgU9L6dTQ9NjWadvLXD+btABTZNvhzz3+IGjZNl3QU07nwVb3papkyP3
 ROM2kJwCr+uep3HWIGIYVNbpZxff5CF+qMtkdh+YQXyEKv2hyQdfi2cfLF8Z9PZzpuKo
 P69o//h/5E7UejiIpPoF//XISotLY718osTmXEb6EzpCbLUIlNIkGe5aIDAN+mi6yP3I
 Ngc7HTYv3dCCLtNLNu75haIiHdQrjxRguIplYToKgu25VPfMZ4eDLpVy6nlSYeofZAI2
 KTE6p0mZb8BSiaT19QQnshXBMZnVaO1zHWlS1TpuNhodddhzrmVWOyrwi+fn0pHguwvp
 2LeQ==
X-Gm-Message-State: AOAM530Qa85HonuYcQ1Q96iVuSQZ2LdZ1O1NIZMsrTPP4jkmVRK/Mu5c
 nNLAV/zi2svgaOSmQN4zAXyBIg==
X-Google-Smtp-Source: ABdhPJxI8pOgzBBk2uSY8pcr33Qd2jMtG4zJsg1vq6XZ9Rr5JTkyWL4X5TF9D/+rwRnooDl1oYQGQw==
X-Received: by 2002:a17:902:aa91:b0:14f:96cc:1ab7 with SMTP id
 d17-20020a170902aa9100b0014f96cc1ab7mr9532719plr.30.1645825841962; 
 Fri, 25 Feb 2022 13:50:41 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 186-20020a6214c3000000b004f3e534b49esm206432pfu.122.2022.02.25.13.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:50:41 -0800 (PST)
Message-ID: <b8cdbcd0-87aa-380b-31d9-0d79495e036f@linaro.org>
Date: Fri, 25 Feb 2022 11:50:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 34/49] target/ppc: Implement xxeval
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
 <20220225210936.1749575-35-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225210936.1749575-35-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 11:09, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v5:
>   - Some equivalent functions implemented with tcg_gen_gvec_*
> ---
>   target/ppc/helper.h                 |   1 +
>   target/ppc/insn64.decode            |   8 +
>   target/ppc/int_helper.c             |  42 ++++++
>   target/ppc/translate/vsx-impl.c.inc | 220 ++++++++++++++++++++++++++++
>   4 files changed, 271 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

