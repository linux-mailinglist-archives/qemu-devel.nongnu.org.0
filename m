Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9C03B6A76
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 23:33:37 +0200 (CEST)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxysq-00024A-NZ
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 17:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxyqs-0000ij-Hy
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:31:34 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxyqq-0007mH-Pf
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 17:31:34 -0400
Received: by mail-pf1-x42e.google.com with SMTP id s137so7708691pfc.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 14:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hr/HqFwyaxwuUtL8C88DoheE0hTXDB6Ak4xGH2dk40s=;
 b=xid3fZkjr991bMwyWklwt6f6sckRUg8GKJ7tLdUxoHjbVY4wj2atpTH7TOm78kr9Io
 SubmHbKlCNcU43eprzjQdFIsvB4NpNyOYUyE4emFxEGeNHcSxy3jJTLUWeseVdBi7LE9
 pKCOkmGUaGQ08MfqJJl1K/O+ZUtq7Jrgfx/rq9BxZEjGZP8YkIcJDVtJqRLB7k8i3tTm
 9xrcS6pFFLuOYctbmYQHD4pdmmgoWHvOn6oAq0FXkGFX/7yOeoKKEiZ6StUxrTCUY/pF
 MViXJqLco68aqozq3pQq6YEhxNynmlWWl0ZV+ttpfSPjd+4sZz7SVbFKRvY40dzv6i7C
 YsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hr/HqFwyaxwuUtL8C88DoheE0hTXDB6Ak4xGH2dk40s=;
 b=o5kx1c5VAqN5H9UJPC06cETV2YoRBwi0xpmalKBB7NUhPX6E9Pu8mR+f50lI49xj3X
 BEkgCeXfCDOMWw5OlmeVV2NfPDpEI3fybV4mbmHxVises5sMgDEJ1ATiBMftSXzHJymS
 6VDqiIH/i0cn64wpFTDEiYHYa01xIl/DV/SIB9kvHhIbRBWBvBEj/GKT6GXkErKyaXbP
 VD0qQdbMxAp5APdB3d3Qvj+iJodIN58p8Yyk+0orrLqu09ktY1+xw+XPpJVjrW/j6cM7
 Q0z3pycaabNutKsnyDoVfdApD25xykZ2nx/1spZgPgPqZMS8LXPTbrdxTzgSPqiJG+NY
 g/Iw==
X-Gm-Message-State: AOAM530uxwp/JpVBtmbdUKgWULZ5dcbYMqT+qeJK1e8dg2vXW1pLIgo6
 0spKSj8rcxW2QIkDrYtaUXumfw==
X-Google-Smtp-Source: ABdhPJxXZg5+VjjYFtaRYd4D/IQwfZ+umkARhZz0cX67+c3DDa19r+1+mVOQl6JEjM9xX6TAdArTtA==
X-Received: by 2002:a05:6a00:17a4:b029:304:a2d1:25a6 with SMTP id
 s36-20020a056a0017a4b0290304a2d125a6mr26773855pfg.68.1624915891144; 
 Mon, 28 Jun 2021 14:31:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z27sm15801609pfg.91.2021.06.28.14.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 14:31:30 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/mips: Add declarations for generic TCG helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174907.2904067-1-f4bug@amsat.org>
 <20210617174907.2904067-2-f4bug@amsat.org>
 <a586a9e9-ea77-04da-f1f0-45d79d6eb626@linaro.org>
 <ea1ec188-d011-e8f2-7131-3946bfd6d963@amsat.org>
 <79cfc24f-d271-fbf6-33bc-b8c2f1381b5a@linaro.org>
 <876235ff-c85c-9b6c-d1a7-a3fe3f602cc1@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <188995a5-2612-2d4a-9956-3eb3467a5ff1@linaro.org>
Date: Mon, 28 Jun 2021 14:31:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <876235ff-c85c-9b6c-d1a7-a3fe3f602cc1@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 9:33 AM, Philippe Mathieu-Daudé wrote:
>> I don't mind the ordering, just that there's a reason.
> 
> Is that OK if I reword as:
> 
> ---
> We want to extract the microMIPS ISA and Code Compaction ASE to
> new compilation units.
> 
> We will first extract this code as included source files (.c.inc),
> then make them new compilation units afterward.
> 
> The following methods are going to be used externally:
> 
>    micromips_translate.c.inc:1778:   gen_ldxs(ctx, rs, rt, rd);
>    micromips_translate.c.inc:1806:   gen_align(ctx, 32, rd, rs, ...
>    micromips_translate.c.inc:2859:   gen_addiupc(ctx, reg, offset, ...
>    mips16e_translate.c.inc:444:      gen_addiupc(ctx, ry, offset, ...
> 
> To avoid too much code churn, it is simpler to declare these
> prototypes in "translate.h" now.
> ---

Sure.


r~

