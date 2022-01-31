Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BD64A3ECC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:44:16 +0100 (CET)
Received: from localhost ([::1]:55340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESIJ-0001sM-Gp
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:44:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nES00-0007so-9v
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:25:22 -0500
Received: from [2607:f8b0:4864:20::42c] (port=46704
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERzy-0006Qv-Pz
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:25:20 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i17so12230101pfq.13
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kW8KIVPHUUcLd+eJ5uU9lIFa6aCeXUuw52w2cFyHEDA=;
 b=uCBGTQ3AbAYIWsfAb6DidSekMMjr7spf/SnczqptspB4QtWaqNyVNEXeZ6sVrSZnO8
 aUNvFvSFWupvBAqE5mNushCajhztqZu9qoAhsCWWAsPRoDPKpNctdEI4fPIeLZtiHExN
 AW6t5vYLWhHKzKU5hgl8nVZl0z4oC0ePn3VhtciYhm94dgeFKsTWx6HiEfJHz7dCzAZN
 COE6u5NNKrltgE30WdKCLM+pF9Yc6WT4O7/GLsDjEN4NoY4iKXN5NLsQ9ssQBRyZIAs6
 P5oqeCJKqd5RqZeARA4zezJJlfmvxvP+safvHjOsoevTGcJJoiRpDpKLuLWseQAdGnmp
 2dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kW8KIVPHUUcLd+eJ5uU9lIFa6aCeXUuw52w2cFyHEDA=;
 b=UVwmm+pWnUU5UdUVCy8EsSL3M3fFDLgzXP7qzMNiaaGfglDx6t/geL/BP4KElVEyew
 vvL8AZdQ3MFlftreM3IvG1MMV1oL2K7VoKP7ikW5dDRzch1tXeiqVWT7/9SlMB4+8rq7
 SGqxiq1lZQB/ZVpbV84+onN97KtwO82ROSudkFiAB9Z4AQKunxiVRNqw5ibz541bd3uj
 V5Lc6OIJ3WxNm0G709H9dbQE8Yb2YlB63yq0g2XwF478MpbAE160m74kdLhwcni6SIvG
 iLE7NeoiM76pnwkkmmmM4rtbu17xYpvjqIAFRJOBf1ytQC0iRQ7cE+5JM038nb3pdwhx
 VyVw==
X-Gm-Message-State: AOAM533YGU7UD/YjRGjE98rWUA8JU/nvZX5xTmQ1iOiBlWfxk2Kl+zWl
 eODuh4Vs21F5uGLtdvwxFPOL3Q==
X-Google-Smtp-Source: ABdhPJzj90YdZ4gF7M2vmOYYYn25Y11oE05gvMnhA/sbvo1c3lwWpxrK/idHs8RPVFqymrc0nKkxzQ==
X-Received: by 2002:a63:2307:: with SMTP id j7mr15885608pgj.400.1643617517441; 
 Mon, 31 Jan 2022 00:25:17 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id me4sm10567302pjb.26.2022.01.31.00.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:25:17 -0800 (PST)
Message-ID: <a320b6f4-9e27-7e03-4e85-853028d6c110@linaro.org>
Date: Mon, 31 Jan 2022 19:25:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 0/7] target/riscv: Add XVentanaCondOps and supporting
 infrastructure changes
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 10:57, Philipp Tomsich wrote:
> 
> In adding our first X-extension (i.e., vendor-defined) on RISC-V with
> XVentanaCondOps, we need to add a few instructure improvements to make
> it easier to add similar vendor-defined extensions in the future:
> - refactor access to the cfg->ext_* fields by making a pointer to the
>    cfg structure (as cfg_ptr) available via DisasContext
> - add a table-based list of decoders to invoke, each being guarded by
>    a guard/predicate-function, that can be used to either add vendor
>    extensions, large extensions or override (by listing the decoder
>    before the one for standard extensions) patterns to handle errata
> 
> 
> Changes in v4:
> - use a typedef into 'RISCVCPUConfig' (instead of the explicit
>    'struct RISCVCPUConfig') to comply with the coding standard
>    (as suggested in Richard's review of v3)
> - add braces to comply with coding standard (as suggested by Richard)
> - merge the two if-statements to reduce clutter after (now that the
>    braces have been added)


Pick up Reviewed-by tags where they're given.  Please go back and grab them from v3.


r~

