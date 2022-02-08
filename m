Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8044AD60F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:18:30 +0100 (CET)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOVx-0003Zy-3Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:18:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHONe-0005We-T1
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:09:55 -0500
Received: from [2607:f8b0:4864:20::42e] (port=40907
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHONc-0005Fy-LK
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:09:54 -0500
Received: by mail-pf1-x42e.google.com with SMTP id e6so18241935pfc.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=grG1UltXc0vdKR2dK5dIo3rlFMzJOxEFOfJrAfgg1Ps=;
 b=fx03HHri9k8zNlEewG7pE1j8h/2sPxowYuPKO43CPhFJ8oyIRnZ+CHvJlDjZZ/7wUO
 R7RHWbdpE+fzdQDNawyPlw98F8npcWTWOBYvywKHBzt3P3u2b+/IYkKSzCoqy2e3fZqT
 LwPfoZ7HF8Vx8MbjGUK3wafv8vI8x15Hc85AnJiR1ftja/FAyn3AnL8WGI1LkImRkGDo
 uyh8SGaDANuHcE8AOvK9V/Ibmu4cbOlkxnPykvkKpSBhQ9wanljYT37URCrFzDYsytAf
 mGtDv19UuStdSQYeWvkTA+AsJct9umEjha7X7awrXooBGxfxFpdTV2QYUF9fIa2kBYsF
 G/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=grG1UltXc0vdKR2dK5dIo3rlFMzJOxEFOfJrAfgg1Ps=;
 b=i4iU5EI4oow80910a5qgzzAlSYDMLc5sCGWk0fMNRUXhrA+MNVIYiA+HAQ2dUag1Va
 Z1YsKeOFPtT9ERbVFZj9+6YQqmDLRLhORxIyOAXxkNHosraHbokyInJZ9FMVKJC1zKD+
 IT6Nuv9I84wUItQb9TgDv129W3jRC2W8Fnxbzzmnu/q/NMb9IXnwyGobPurNzHzWVqAV
 3BAR4KSIiQUOboWtu8IBllkbsiXoUZE/EcD/w7YYQ6+spMvULwOFwmVTHfjfomkucYrh
 CY4WFE6M3geQgFM30iBpOFmu5RvNBxwKqdTSW7mXVzW0PTJa1LGLFegVPLV0ARSYPntP
 +ghQ==
X-Gm-Message-State: AOAM533YBsGwzua0jzR5l0lb10jvl39Ht1y7uNs+FUMhZoAwEndPJBz3
 7cyPvoN2Wm9nhD7pjHCMxocjOg==
X-Google-Smtp-Source: ABdhPJz67jh3SiwPtPijdW+ntnR24+xVkvSz2x0OdQVtZulV4Wa3aW0zdHYH/Hi8Ve4whJ7NNfuJdw==
X-Received: by 2002:a63:8048:: with SMTP id j69mr2965222pgd.557.1644318590929; 
 Tue, 08 Feb 2022 03:09:50 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id na5sm2574434pjb.23.2022.02.08.03.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 03:09:50 -0800 (PST)
Message-ID: <e478cd62-9b81-91cb-8ce3-ca7872238c8e@linaro.org>
Date: Tue, 8 Feb 2022 22:09:45 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/8] tcg/sparc: Use tcg_out_movi_imm13 in
 tcg_out_addsub2_i64
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220208071710.320122-1-richard.henderson@linaro.org>
 <20220208071710.320122-2-richard.henderson@linaro.org>
 <CAFEAcA8guxNuHUhF38GT3rX15K_fTHEUBaRPooTxUFaVHx1wmw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8guxNuHUhF38GT3rX15K_fTHEUBaRPooTxUFaVHx1wmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 21:40, Peter Maydell wrote:
> On Tue, 8 Feb 2022 at 07:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> When BH is constant, it is constrained to 10 bits for use in MOVCC.
> 
> Where does this happen? I assumed it was going to be done
> by the constraint encodings, but tcg_out_addsub2_i64()
> is called for the add2_i64 and sub2_i64 ops, which get
> 
>          return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
> and constraint J is
> CONST('J', TCG_CT_CONST_S13).
> (and indeed there is no "constrain to 10 bits" letter).

Typo/thinko with 10 bit vs 11 bit:

CONST('I', TCG_CT_CONST_S11)

But there are different constraints for add2_i32 and add2_i64:

     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
         return C_O2_I4(r, r, rZ, rZ, rJ, rJ);
...
     case INDEX_op_add2_i64:
     case INDEX_op_sub2_i64:
         return C_O2_I4(R, R, RZ, RZ, RJ, RI);


r~

