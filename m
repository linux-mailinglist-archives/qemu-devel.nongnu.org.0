Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964DF4A3994
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 21:57:36 +0100 (CET)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHGR-0004ZW-Fm
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 15:57:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHDB-0002rw-Dp
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:54:13 -0500
Received: from [2607:f8b0:4864:20::1029] (port=40572
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHD9-0004DV-W3
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:54:13 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so16239047pjt.5
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 12:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rAlvq0TJ/hBRUcD7hL7faGzwmRJG99mU1tPOmfDeSH4=;
 b=llMJaK8OQNgswMt361XvV9du89N9YiMcW9PKy6Eoz9v0F0NhkmluMCyHGBBFXwj11m
 4MZ7zGUNDTd9Ze4CaON4sN8aDZJaVuL0p5pJUHA2kvjTwUoD5oAX1jUx/cBZIdzvzexk
 kUW4WbnovBQ8LeKgDpmrGsShXu61i03ZEJPwBzu/eRNEcRVJnN4f08ZVtQiEG7s7FnV9
 0a0SU9gRBE/oXoJ+zhUtCNy0LOLFH7+xrQM9kreDz5BDcZcmFsojHcHb+UN8ANd3mA07
 wnuTk4Mxzb7oM5eGsHOIPZjAe7DxrbPBngRFg5HE5JQNOcFSJF/tSbbIHQ9Xh69WKEYj
 Bq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rAlvq0TJ/hBRUcD7hL7faGzwmRJG99mU1tPOmfDeSH4=;
 b=jiN4wb7RlVkCC+UnlDRJqdT/eF78AZHvlxn/NycEgwvRhvZjx8BxhDpFzzQFs6NGSN
 X8IhXlW4WWbhNceHn0iUPcF5I+9jHNGTBLnHbhvaJDnfa51FmPMAvhArl4DwaUWXnW7j
 z30YBuL3z5DzmsTlv7zpi6/RNwLe8tNcHcIaTSNu2l/GJ7kVoFFnXQLpcf2RsmnX7Ta/
 CEbBbWZ3aRDvY5XNQUYHh/V3aSn7nZuU1VmHRucw85XQbOpiCCvaCFW+OwKH4q3V0vuV
 C02qu1XLdGYLui+1mx/dcQeS5fBZCSngv8X+hdZenC9wDREwB2JIgcTvSQRnhIz6Ht8S
 5GQw==
X-Gm-Message-State: AOAM531mY56vFS6pZUjE8WLG6twky9nz+axPSPhAIoxLXqHCI4XPFuIO
 tICJ0SazO6p45IAGH3btPb0WyImz3iIiorq2
X-Google-Smtp-Source: ABdhPJxSb5R7ZZDYU6hytNhKcv9NH3nCcrmDbyDDt8f4R/BtMmzjF+LhOGvW9+AshwSivVdZ8iBHRA==
X-Received: by 2002:a17:90a:f406:: with SMTP id
 ch6mr30969511pjb.180.1643576050720; 
 Sun, 30 Jan 2022 12:54:10 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id k15sm16258793pff.39.2022.01.30.12.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 12:54:10 -0800 (PST)
Message-ID: <307d5fcc-c1a4-099b-c1c9-fe6ba3e2b449@linaro.org>
Date: Mon, 31 Jan 2022 07:54:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/7] target/riscv: access configuration through cfg_ptr
 in DisasContext
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
 <20220128145642.1305416-4-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128145642.1305416-4-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 01:56, Philipp Tomsich wrote:
> The implementation in trans_{rvi,rvv,rvzfh}.c.inc accesses the shallow
> copies (in DisasContext) of some of the elements available in the
> RISCVCPUConfig structure.  This commit redirects accesses to use the
> cfg_ptr copied into DisasContext and removes the shallow copies.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> 
> ---
> 
> Changes in v3:
> - (new patch) test extension-availability through cfg_ptr in
>    DisasContext, removing the fields that have been copied into
>    DisasContext directly
> 
>   target/riscv/insn_trans/trans_rvi.c.inc   |   2 +-
>   target/riscv/insn_trans/trans_rvv.c.inc   | 104 +++++++++++-----------
>   target/riscv/insn_trans/trans_rvzfh.c.inc |   4 +-
>   target/riscv/translate.c                  |  14 ---
>   4 files changed, 55 insertions(+), 69 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

