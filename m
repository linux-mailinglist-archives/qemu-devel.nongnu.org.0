Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981153BE090
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:29:04 +0200 (CEST)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wN5-00071e-MF
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wL2-00040z-UD
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:26:56 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wL1-0005Uo-7P
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:26:56 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 cs1-20020a17090af501b0290170856e1a8aso2676004pjb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B3HHX395898sL1hA+VtQvlcegUrojS5XQ8U5oVvMMzk=;
 b=HmLrgSwmT78g2/O3zEsq6GHqorsG9VWKXAWkSJaTce7ZHqHDma7WgKV29lE+aMTexn
 gCLUIPYleFIDzCkrc96bvp3Awagfh14lysGjqzyckpk34cFNxdYY+qONVaVGT+Uxo96Y
 fxkSxZcvWmlsDu269xyrep0G0DY36Oe+GjEICWzonulbe9XX7IOb4A/0BZXcA6tFkYaR
 vrFu+H7uj0Ob8/c3PA6cLerFVb2q8eU1xioF/PwQslwP/tG1b/vK0ONcx0+JZsiU2ksm
 EtCjC8PyNt1zyOCtZLh4gUn+aoYomMcFUBCPuBNxypDdEt2HeNUtmK1pTVyO8tbOYN5J
 8ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3HHX395898sL1hA+VtQvlcegUrojS5XQ8U5oVvMMzk=;
 b=GiVcKyucd/sz3VohMXUHfgFhQ+c5Ox+Xhs1bi8HK5JPNgNNm8qbB5D19MO7RJncHbO
 czFPNcCyrQmSD53NXP8Q3KgqHv7YkrcgGw7lRsdxiJY4Vl5/+ecpBPU0H0waSO58quKC
 jPTzQuy83bLZezn25zJSudyG3LzStkbOpgeicIiRcEh+XklS/WofXPuoET9AMbKrzQr0
 r6gDyf9xXEVd3PjYBBfKtpjE7AFCPpoULEz8iMjNAizUL17Ibdsn6EZXo7TLQxwUVm89
 A7TJJMXScjx1GfAWYmxiJNkDM9zI9/SDo48ZX9Iqs9Yk/RmEzvSvJSyF/C+EUuN4jYnp
 8SSA==
X-Gm-Message-State: AOAM532UqHudpcoGxHTg0Fm1uDBDMkchOOjYXA3fFSADUQYbNqZFWdGf
 obNw4Td1f9q8j85FDGSaGpLqvw==
X-Google-Smtp-Source: ABdhPJwaP4LtU/GZnEVbg8syhFbLl1R7IHZXqQvy6IJaOz5qJ9qjiSC13g4hnb8/cbowIpWHrw4rOA==
X-Received: by 2002:a17:90a:17c1:: with SMTP id
 q59mr22540354pja.231.1625621213803; 
 Tue, 06 Jul 2021 18:26:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z1sm15074159pfn.126.2021.07.06.18.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:26:53 -0700 (PDT)
Subject: Re: [PATCH 05/11] hw/gpio/pl061: Document the interface of this device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d1f0efe-a59d-499d-0f63-f7df4f4e151f@linaro.org>
Date: Tue, 6 Jul 2021 18:26:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 3:40 AM, Peter Maydell wrote:
> Add a comment documenting the "QEMU interface" of this device:
> which MMIO regions, IRQ lines, GPIO lines, etc it exposes.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

