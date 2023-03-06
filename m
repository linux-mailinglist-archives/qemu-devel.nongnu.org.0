Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56A66AC5AB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCvx-0003cr-06; Mon, 06 Mar 2023 10:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvu-0003Gu-Br
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:39:26 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvs-00036s-Np
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:39:26 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso5476486wmo.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678117163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UtVjH2sDogYueOKls5bNvgQLXSqTejDIJIH5fHS98zE=;
 b=DTxFRPXcb4SCyM3BKWwZ9I/mBqmVJ2p1/u6uTbsEpblXloYGrDz4ajswRUWzMLNV4y
 d6i8pVIRS6lmB4st7Kr3mQaXZdnS3WMwoG0+RE8Am/vCo8JxdeLsBQv9Zn+yrY9yRkfZ
 rNp2o8SqJ1n3CBseWCsJP7H3mYgt/4Kg+vzfhknd1r6e5codD/cTftQFlVzYb1rLn60t
 0iOxG+96EWZS++cCCSU2ZbxCtZ3JNp3gOfhHFhQ8NJjn63JhiURUK2NjGVzAtz69vy8l
 V2nPA/b7I34YgKM2WKZeG/nxWtG3+8sLNMG7iN4oJtnvnyKmom8H9+UioyFg3ZRIy7FK
 V7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117163;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UtVjH2sDogYueOKls5bNvgQLXSqTejDIJIH5fHS98zE=;
 b=vNyK4I62npdHqAI8gI+DWeVgYIPBOtwMvAClX9Cz2pUgk13AELjMvuokfugeyfjG3K
 a0Tsxra0KhWRA58fM0IJvJT7JdVDI4o3diJRPkv2wfClii1OtK9LsTItij4QxI6Pf3pM
 0RP7Qu0J+aPvvxSLp7I9My3VeB8up4Enh9A/iO/eOBAXI7g45XNQI0Ift+788ldk3Fvv
 HJiJHTpWHMeRmmUEGYS5Y9C0CpHgbjHXYK+H03w6m2iwIHcxgpvzSEd6wy1uGuSRZF1x
 18livjfSGodCjZRoEQ/oolP8teB6PZYj49j16PsDwt8CoTI47S64jYtZlFQUby41juvS
 bvXQ==
X-Gm-Message-State: AO0yUKVOgftZDLzRbvMamVCJ9nYHdh+YBSoOjoKaRonoGK8Sv+SLhl1q
 ZqsPhTUtY8v7vfJHtjowgOgE7A==
X-Google-Smtp-Source: AK7set8/OodzGNJTsy63o8faeEs5uo449LqjKZLGVZm4wpOATIr/4N8u5hM+qnFU9OsFIY92tNBPvQ==
X-Received: by 2002:a05:600c:3c9d:b0:3eb:598d:6494 with SMTP id
 bg29-20020a05600c3c9d00b003eb598d6494mr10401598wmb.16.1678117163444; 
 Mon, 06 Mar 2023 07:39:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q30-20020a05600c331e00b003dc5b59ed7asm10362405wmp.11.2023.03.06.07.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:39:23 -0800 (PST)
Message-ID: <f8e7b83a-f8da-d2ca-022f-033a960a26d7@linaro.org>
Date: Mon, 6 Mar 2023 16:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 59/70] target/tricore: Use setcondi instead of explicit
 allocation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-60-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-60-richard.henderson@linaro.org>
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

On 27/2/23 06:42, Richard Henderson wrote:
> This removes the only use of temp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



