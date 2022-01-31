Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AE44A3EAD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:35:36 +0100 (CET)
Received: from localhost ([::1]:47860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nES9v-0004wB-EF
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:35:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERyH-0006vy-Q5
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:23:34 -0500
Received: from [2607:f8b0:4864:20::536] (port=45630
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERyG-00069O-C4
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:23:33 -0500
Received: by mail-pg1-x536.google.com with SMTP id z131so11533679pgz.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Kp9VjTCL2AHLElXV5xi6TnBmPgw4uM0jceD12cDfB/Y=;
 b=f5T26x3je0WzJynFuE2hZ4JB0qrF2iY7xozOhs1VLxq/cd9VYiXpo3g9PUpXY7rY5t
 LePm8v/G/1JKQGG05vSggaTSXp3W/8HOR4r5uTyjV1HJU8Esad/boaV/06HF/A9l7rmN
 xrw6cZjNqIBwRo+6xhkFqBfphRxnvNfqY6veoNdqk2YOHdMl8sZAkxrl9SKFlajuRflq
 jRQ4wOcjMwk7HXNxWEleJsa75UTN1+FWPK4/PgsBZZ4TTNbdUnD7Xuw1ZusNYbqvoboN
 S4s4QV2IbILK3IfvREA5Bj+OmpfbvVr/jjzZ8H2Va98/xnJQrqxkEoH79i8BM0BMXgUN
 TPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kp9VjTCL2AHLElXV5xi6TnBmPgw4uM0jceD12cDfB/Y=;
 b=6u4Hu1ZYmovDRL8D/dr6zOlzz4WF6Ijgqch8qzYf9V1MKs8jtVzB+ftGzNMvOecq3K
 OfIOAt1jVMQ4ApmwvCEIZuCo+Q0gQSl3p+cSHykLW5sDLA+/lraTpFO/RpaW6DQLgT1r
 gxbhTkLr+vmUZk8KR9bPywfqvSwQ3NXrinlnbBWZXWIoo8/klTuyfAvqLTEaqCcvxEBK
 HcTgkMO52tQNs6jysPsfUvrewP/sTWbaMjTQ77rEFYDCTBaY3ZL5igqrMXfE7N0tWODy
 9zFutQZY0TLevYLvGpW5pc3D3PgFpW2AYkh9iDhkIOIH7JhQAXAOkxf1q3E0W940kUA3
 GocQ==
X-Gm-Message-State: AOAM53192t4gmTI4Gte7qgos29sopWZ7gw1oj+kf3jkOWK5DkZEyYX+b
 vIKoXBg/B1PFHwCxLWY7fc2JLQ==
X-Google-Smtp-Source: ABdhPJxwwFyVd6f18hRhfFsJk2ypj8vC4rdBN9rRmXb8Pr+sEbm1pPviJPYuBCt/v1woG77vBixWIQ==
X-Received: by 2002:a63:5004:: with SMTP id e4mr16251451pgb.312.1643617411047; 
 Mon, 31 Jan 2022 00:23:31 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id l12sm9955072pjq.57.2022.01.31.00.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:23:30 -0800 (PST)
Message-ID: <d18138a7-59be-5810-28eb-fb6b1c667f8e@linaro.org>
Date: Mon, 31 Jan 2022 19:23:25 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 1/7] target/riscv: refactor (anonymous struct)
 RISCVCPU.cfg into 'struct RISCVCPUConfig'
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
 <20220130235759.1378871-2-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220130235759.1378871-2-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> 
> ---
> 
> Changes in v4:
> - use a typedef into 'RISCVCPUConfig' (instead of the explicit
>    'struct RISCVCPUConfig') to comply with the coding standard
>    (as suggested in Richard's review of v3)
> 
> Changes in v3:
> - (new patch) refactor 'struct RISCVCPUConfig'
> 
>   target/riscv/cpu.h | 78 ++++++++++++++++++++++++----------------------
>   1 file changed, 41 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

