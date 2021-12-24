Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D22147F13A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 22:41:42 +0100 (CET)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0sJo-0003cb-QF
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 16:41:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0sIN-0002je-BG
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 16:40:12 -0500
Received: from [2607:f8b0:4864:20::533] (port=38815
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n0sIL-0003jk-07
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 16:40:10 -0500
Received: by mail-pg1-x533.google.com with SMTP id s1so6949353pga.5
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 13:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZznejU394oWD0Pzi7sfSds+mjvZI5oc3gwA73KQwbO8=;
 b=QX0hgta8dzplUNtH49wygRkCGWk1/5zxh4sQ04tQc2VoGsSwPkSvMWyK4C1IxBcLH0
 BA7Czl8P0GJFPgxnSSO2PdApt27FeOtzQ0TTbLeoIhuyWJ9/1LuLrSiSppQFWER5Lu6J
 r7eLPOPmEjHtwWM8StBiyfDn35hDtWTO1j8o3IoSVPut0dYkb3WbzJSDs5o8KMwMZe2Q
 xOE6/ej3b7n+KvLyYYmtBkQTzJegduybxIyOTniano1hE/d52kKkFgG4FeEZ0QTerlFA
 TQwNCPFGOnORiyXuMk8FgzjKt9OIgyzJsGC76sT1GbVbif/0GS1YqzIi7gUXk+rrvmsN
 0inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZznejU394oWD0Pzi7sfSds+mjvZI5oc3gwA73KQwbO8=;
 b=oKiZXCgr5ZKBam3FdrrG71eL74F+ExWEnDup74IQS0BJAfPCRr2TQAzPMjKjgCXTIA
 O69TIiCcaarbq+I1FYvs4Nl4xW8PrCWljrQQ2YB1QQXCsTwL4Jr0MEZyfafreGyEGIdE
 8uAVJPwmiLqSamU2nID/7U1wISo5nzOc+nCK9amWnzHBxyIGTqweNba170msDJ5gvGTc
 0f7sCgQLJnC4+zBtAsY6ZxKXLFyW4SDb2x5NDmSMfDu7bRgtNmQU37EtGyCAI8L5vsWZ
 fSYZtVSurX2BgT9UM4cS3l7b4IJn8N9Vc5abihsVXgM6rrLRkr/QJrbfupl0AxOkuNB1
 m+VA==
X-Gm-Message-State: AOAM532XRGU2bLT88YlMLnSvBeZzOnAZ/PGN146yIRZDAt66qXZkV0Th
 leJem7VqLKhga5sqebm7Aud2DA==
X-Google-Smtp-Source: ABdhPJxrGT2LWjvEj1rkFXBBBJskZPqlvrrEsMZ9p8ILBO3un/TaU08xOVjwyiaKg7jj1MiMXu+NKg==
X-Received: by 2002:a63:3307:: with SMTP id z7mr7424119pgz.498.1640382007288; 
 Fri, 24 Dec 2021 13:40:07 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id c19sm12490579pjv.39.2021.12.24.13.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Dec 2021 13:40:06 -0800 (PST)
Subject: Re: [PATCH 1/6] target/riscv: add cfg properties for zfinx, zdinx and
 zhinx{min}
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-2-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7c1d52b-931c-8e75-7076-2af32b346aa2@linaro.org>
Date: Fri, 24 Dec 2021 13:40:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211224034915.17204-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 7:49 PM, liweiwei wrote:
> Co-authored-by: ardxwe<ardxwe@gmail.com>
> Signed-off-by: liweiwei<liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang<wangjunqiang@iscas.ac.cn>
> ---
>   roms/SLOF                |  2 +-
>   target/riscv/cpu.c       | 12 ++++++++++++
>   target/riscv/cpu.h       |  4 ++++
>   target/riscv/translate.c |  8 ++++++++
>   4 files changed, 25 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

