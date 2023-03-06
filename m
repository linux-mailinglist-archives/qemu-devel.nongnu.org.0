Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85A6AC1A7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:42:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZB5W-0004G2-36; Mon, 06 Mar 2023 08:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZB56-00046t-Rb
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:40:50 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZB4u-0001Id-GL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:40:43 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so5567178wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p3Cd1ABbVq0JFlqW93E4SrJdj9q3tAZb4gww9t0ZB6s=;
 b=tEuGeBxEJQ4EaB0AGrlzV91EVzQVhbHsQ7ctlcjvgdnWQNgdIjm9+bLf12/qBlDTRk
 04AURAUK9tNilNtmt148N3ttj7Mo2QiUJKOqnInWZaabObgnXz36QrIis0vfnm1Uu92v
 iFSAluxWeEWKkTkGoMtdzgvtTaqyi9kRc1Vv5j/fUpizJWnYupGik02bigLM0KG0F9+f
 Obzkn9gRNOTL/akLFGXSR8LcWgsdWaAZ5AtX/eYYurWareSSIHAk6QeZUDSrLdW/tSSi
 F/mE0NjRKJGKj3d1oUgQSvMOngMD+JHeb5MmOf8ABnm24Y95OSSZaQGUTAsX2pDUz8RS
 JR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110025;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p3Cd1ABbVq0JFlqW93E4SrJdj9q3tAZb4gww9t0ZB6s=;
 b=opl+B7AHV1kvBHm+nyC+4Jhw24wThJSBjosIYnRqUETpI6IdTVyrFR4EGL75WbwMM1
 R0H5qBalyx3bHFMDBRRggcc7KuKHrxtiVW9YP/8YlkukT5D1OPdVdODZ8hNkgHOtyhf4
 LZTFds6G10OQd2Ck9ojDyoaWyGGpiDCs5keMMAcL8FjNy657MU3Zotd1Fqmd8v4TqUcK
 l5RDaixfraweeSdV7SLriJMFSoopQGtfJ9DExCA/BNlb/Gybo/cFmL1P1t/OQBkht5en
 r2giK/NXd1nAKPF1wBWp4MAqxeVko5A+iEmxJb4y8enM65qxS8XwzCn/BtibNEhji38T
 Y0Kg==
X-Gm-Message-State: AO0yUKVh6WuwDCUhVgV59MoQOpHJLEku4+bBw3+/nzjbxFMUbygwOjWF
 2kiJtwEawNSoMexDjQrwh0BR1g==
X-Google-Smtp-Source: AK7set/cY1KHHh/Oh4wLuwsG7PKGePiL/bHrWq+6ZIdPr0Hep9X/M9jj0yOcy9FxFfL/l7a5h1+cNQ==
X-Received: by 2002:a05:600c:3151:b0:3d3:49db:9b25 with SMTP id
 h17-20020a05600c315100b003d349db9b25mr9881206wmo.26.1678110025218; 
 Mon, 06 Mar 2023 05:40:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003e876122dc1sm13682220wmc.47.2023.03.06.05.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:40:24 -0800 (PST)
Message-ID: <8c2be250-4c17-6fd5-f013-6825b8c9a637@linaro.org>
Date: Mon, 6 Mar 2023 14:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 31/70] target/mips: Split out gen_lxr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 06:41, Richard Henderson wrote:
> Common subroutine for LDR and LWR.
> Use tcg_constant_tl of ~1 instead of tcg_const_tl of 0x..fe.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/translate.c | 116 +++++++++++++-----------------------
>   1 file changed, 40 insertions(+), 76 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


