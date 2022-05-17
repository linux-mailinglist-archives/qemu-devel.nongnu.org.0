Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E852A7AF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:14:32 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqzqC-0005vz-0q
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqziO-000662-CT
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:06:28 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqziM-00085K-Nc
 for qemu-devel@nongnu.org; Tue, 17 May 2022 12:06:28 -0400
Received: by mail-pg1-x535.google.com with SMTP id 137so17323121pgb.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=FpI/XA4Hjbi4axvP0wG94IFlZqdcsG56Wu0EawV1NxI=;
 b=AIf59DIzAnW7mv9RFdZ81RTYGa4GaNAkk/v9YhPF8XRy9bKGzqF0+ei27s9Z2W76Le
 eDYW4xJv5WfRi5aOqx3h5gFn3YmOqanWTiQwXWK6nmKku30ctSaxJ3GgvbCtUsE0bo1U
 YBCSp0EKdWO95UAeWr4oga/+MsG1+d4VAsBJYtwfSw6awV5cIhZxRxJlYPZZb//TU7Jk
 aZRABdsfi53p569roZiL520Zt1rX/JXMmQQpUetvjgegRFTUcEZeiOgd8g6KN5vnMwez
 EmQSZs7Y5w4UbWnLhdmPour1ZXbyqZnTFQIvOQoIpuq1xqORnDWsI94G6gNEE32LxW2m
 hhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FpI/XA4Hjbi4axvP0wG94IFlZqdcsG56Wu0EawV1NxI=;
 b=oU1SHSY6Wi37BV7yp3mfolhVVgq58VDey+NmEzKOAAz4HuG2ht5iHIulThTxuVLtCX
 ZTHZOYkjifuR/UH5TGYC3U4khYAoNNHStydJIf8hWClGe5dbGVs0Br4Hw3V/GGxr9Jgm
 5gXHGAeNdCROEMZ1TMy+7qv0vzHNuW6FvJ+MaCTVDB50llH/7nlyWUQfKZlx1ztYNKCA
 5OCuTzvBW+8ROt8V/yrEpTmBz3GhNyT8CfPqVRwuVxcEURE3hDcBVaokXE7l211dVFsL
 EMI5VkqLyZ8L2sxudmnSTYL3iHkcrzYkWChxoi1JeRDbLeLvQ4umAV/DDb+pE+wS+QRf
 ApIQ==
X-Gm-Message-State: AOAM533hsNLQJOfXH7MLIdnxqBiSZykyuizAKYxXUG/YWUt9pLFS2xCa
 UVHhXBdCERdv0AiTu5MzJndFIg==
X-Google-Smtp-Source: ABdhPJzMVkFgeKyOnq4NvGCyqR8abNlS+pXYsQlE2j61Kq2kWmZ0hGzWqEHI24FSTS60dSBRroI0BQ==
X-Received: by 2002:a05:6a00:428f:b0:518:c6e:e5a with SMTP id
 bx15-20020a056a00428f00b005180c6e0e5amr2592385pfb.41.1652803584951; 
 Tue, 17 May 2022 09:06:24 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170902b70200b0015f032ec665sm9287263pls.255.2022.05.17.09.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 09:06:24 -0700 (PDT)
Message-ID: <f0318317-5a50-26d7-0365-6ed48dd070d1@linaro.org>
Date: Tue, 17 May 2022 09:06:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] target/m68k: Clear mach in m68k_cpu_disas_set_info
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220430170225.326447-1-richard.henderson@linaro.org>
 <20220430170225.326447-2-richard.henderson@linaro.org>
 <4fd55674-87ae-5e19-f43b-04ba102e4300@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4fd55674-87ae-5e19-f43b-04ba102e4300@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 5/17/22 07:06, Laurent Vivier wrote:
> Le 30/04/2022 à 19:02, Richard Henderson a écrit :
>> Zero selects all cpu features in disas/m68k.c,
>> which is really what we want -- not limited to 68040.
> 
> But what happens when an instruction has to be decoded differently between 680x0 and 
> coldfire?
> 
> for instance in disas/m68k.c, we have:
> 
> {"addil", 6,    one(0003200),   one(0177700), "#l$s", m68000up },
> {"addil", 6,    one(0003200),   one(0177700), "#lDs", mcfisa_a },
> 
> {"addl", 6, one(0003200),   one(0177700), "#l$s", m68000up },
> {"addl", 6, one(0003200),   one(0177700), "#lDs", mcfisa_a },
> 
> {"andil", 6,    one(0001200),   one(0177700), "#l$s", m68000up },
> {"andil", 6,    one(0001200),   one(0177700), "#lDs", mcfisa_a },
> 
> {"andl", 6, one(0001200),   one(0177700), "#l$s", m68000up },
> {"andl", 6, one(0001200),   one(0177700), "#lDs", mcfisa_a },
> 
> {"bchg", 4, one(0004100),   one(0177700), "#b$s", m68000up },
> {"bchg", 4, one(0004100),   one(0177700), "#bqs", mcfisa_a },
> 
> {"bclr", 4, one(0004200),   one(0177700), "#b$s", m68000up },
> {"bclr", 4, one(0004200),   one(0177700), "#bqs", mcfisa_a },
> 
> {"bset", 2, one(0000700),   one(0170700), "Dd$s", m68000up | mcfisa_a },
> {"bset", 2, one(0000700),   one(0170700), "Ddvs", mcfisa_a },
> {"bset", 4, one(0004300),   one(0177700), "#b$s", m68000up },
> {"bset", 4, one(0004300),   one(0177700), "#bqs", mcfisa_a },
> 
> {"btst", 4, one(0004000),   one(0177700), "#b@s", m68000up },
> {"btst", 4, one(0004000),   one(0177700), "#bqs", mcfisa_a },
> 
> {"cmpib", 4,    one(0006000),   one(0177700), "#b@s", m68000up },
> {"cmpib", 4,    one(0006000),   one(0177700), "#bDs", mcfisa_b },
> {"cmpiw", 4,    one(0006100),   one(0177700), "#w@s", m68000up },
> {"cmpiw", 4,    one(0006100),   one(0177700), "#wDs", mcfisa_b },
> {"cmpil", 6,    one(0006200),   one(0177700), "#l@s", m68000up },
> {"cmpil", 6,    one(0006200),   one(0177700), "#lDs", mcfisa_a },

They're all compatible encodings, it's just that the CF ones are more restricted.  When 
debugging a SIGILL on CF, it would be nicer to see

	addl	a0@, d0

than

	.byte	xx, yy

in the -d in_asm dump.

r~

