Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C0147E845
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 20:27:18 +0100 (CET)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0TkC-0004Er-UC
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 14:27:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Thh-0002ks-Uy
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 14:24:42 -0500
Received: from [2607:f8b0:4864:20::432] (port=45847
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0Thf-0000dX-NL
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 14:24:41 -0500
Received: by mail-pf1-x432.google.com with SMTP id u20so6014067pfi.12
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 11:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=myCejLcwpQ0ZxXmDJbNzmQKjEH7tJfriJj4CTyFQCaE=;
 b=yutt1gTVgl6BoIVFTOUeB5ZSe4fma7IbvvRWlFebqhUwBW8rRnw7PLJNCDCoA+zzjc
 L0+mJVKHrYB86EjPOFk1r2oamSBk5OS3031sOr4pCy8aTbiWV146ilRTYsOGZDu3Xh/7
 GVYlL3bX6jAYuplOlVbvymgmJxqb+EPB8MYod7D0fyXfTfSWOofj7dbjzc6ftlRvr2MY
 L5Bn0rER2Hlw/s7OPNsUDa5y2RAQwxq8NWKcNYUTdtUeC8dOTKKSStQEZ3/ermKcY/2q
 1t4hpUyJO6P2RPfs8eXrH24qKdyWGFR6ky94gwO+7MqMRGDBv7zguLg7N53RJu2y1MUk
 kmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=myCejLcwpQ0ZxXmDJbNzmQKjEH7tJfriJj4CTyFQCaE=;
 b=mVu90E57Q2c1F8GYJRNi4J9KuEVOV6a8hUk2LPvDfDHk/du6896J2YFKGkaR2pJyMm
 nCaHYwZTf1DJrRcefnrnyzjncDWAxkqxqCs0MbCEQAIJztnrAXoUwrmtLbHisnhZKf/z
 y9c1FD3VF30ZOFu7+1ohq0XhHysL9Vd86R17VSgIn0XB3DGLU2CZS+wGNroLgF+4YAMq
 qjTWTiMjHVo5zna1Iua4SEbjtyU8FU9CWJ9uWuxnda/XJlBqCaD2P4UrZJFfAmC2EK2n
 kP4L517VrAqx0kVDOnwXhSVjeVhNYYDy9K9IHm4BnJuuZTKlvh9HTH0mfu6khGWp3HXc
 Td8A==
X-Gm-Message-State: AOAM531dsPLfbRlA45/Wpj6AqrIUiO9XlmrJAbVdoUf0Acb4g9HvXLF1
 gi6FjV/x+i0GvHV4cwvR86mO1A==
X-Google-Smtp-Source: ABdhPJw0GyamIHNBiQtuJv0FzcPyjl3prX2qXpkbPpiKggROhkrzeGZusCmeHaLqJy8Zq5ci7OhiIQ==
X-Received: by 2002:a05:6a00:23d5:b0:4bb:332e:a244 with SMTP id
 g21-20020a056a0023d500b004bb332ea244mr3919220pfc.84.1640287476461; 
 Thu, 23 Dec 2021 11:24:36 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm6071978pjd.21.2021.12.23.11.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 11:24:35 -0800 (PST)
Subject: Re: QEMU CAS
To: Jasper Ruehl <jasper.ruehl@tum.de>, qemu-devel@nongnu.org
References: <67ba86a8-abd2-1715-ed8b-ed360b648c72@tum.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37803792-b7ad-85c9-194e-5f92c1493da1@linaro.org>
Date: Thu, 23 Dec 2021 11:24:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <67ba86a8-abd2-1715-ed8b-ed360b648c72@tum.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Redha Gouicem <gouicem@in.tum.de>, peter.maydell@linaro.org,
 lex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 1:51 AM, Jasper Ruehl wrote:
> Dear QEMU Community,
> 
> after chatting a bit in the IRC channel, "stefanha" advised me to contact you via EMail 
> about my problem.
> My advisor and me from the DSE chair at the TU Munich had the idea to improve the 
> emulation of the x86 cmpxchg instruction on ARM64 CPUs by improving the translation 
> scheme: instead of generating a call to the GCC helper function, we introduce a new TCG IR 
> instruction (CAS) and directly translate that into the ARM casal instruction.

If this is intended to ever be more than a class exercise,
there are a number of things that will have to be fixed:

- Host vs guest address size differences.
   This affects, to begin, the number of arguments to the CAS opcode.

- Host vs guest address space mapping.
   For system mode, this must go through the softmmu tlb.
   For user-only mode, this must take guest_base into account.

- Host vs guest address alignment.
   The x86_64 guest allows cmpxchg at odd addresses,
   the aarch64 host requires cas at aligned addresses.

- Host isa support -- CASAL requires ARMv8.1 FEAT_LSE.
   For ARMv8.0, you would want to emit an LDAXR/STLXR loop.

- No changes to target/ are required or desired.
   The tcg_gen_atomic_cmpxchg_{i32,i64}() functions
   are the interface that should be modified.


>     case INDEX_op_cas8:
>     case INDEX_op_cas16:
>     case INDEX_op_cas32:
>     case INDEX_op_cas64:
>         return C_O1_I3(r,r,r,r); 

Your constraints are incorrect.  For the CASAL instruction, the cmp input (1) must match 
the old output (0).  This would have to be "r,0,r,r".


r~

