Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E728D633B70
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 12:34:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxRWs-0003t4-Qd; Tue, 22 Nov 2022 06:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxRWm-0003oO-G2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:33:27 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxRWk-00016N-L0
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:33:24 -0500
Received: by mail-wr1-x430.google.com with SMTP id s5so7059306wru.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P2lFm7LgHy2qlg7Z9YNME5AqkYzbdaIukNwUhqn6dlw=;
 b=eSRtgeDDLxpGZEj8/IyBYdKH681QcwvYPAVH7gi5ctoy2n1N30DNjm4HP6eZ4IWqDt
 tpeNUVJCML4ul4duPEi3aRnQMHRA6uXNks3WKLcy0fFiZKChpJZfQl4hEcLM9eqtAoCo
 i4UCr7SncLsnVdesc0y6lTJOfr4MeMzNTacbhpYv2KB/YeIVHVg0b7WqM3AbAUJYlvSI
 fYo41JXpGYEeAcls5tWvuf0xuDiIBSuxtbdRnr6/X+/xmHytpFWGoZkvEQCvSU7+5ytK
 jP6Qi70PH6sXKx/Sgmq89SDLG7qR3VtfvyiGim695x4dquISMMo36rIGRRB8B1rUwpxp
 D6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P2lFm7LgHy2qlg7Z9YNME5AqkYzbdaIukNwUhqn6dlw=;
 b=V7NTwliSAftqVxVcnCTZqmDFcl83PgHTz6/vU2ajfr2e2h8vl/UaBvqm0gI1U/DLGi
 oFAQ26/8SkYvgxl5WiI9xPPRcPtblgeaZ0qJFt7C2OQhe3vRKbmvkH9iRHBmMEYZcHUv
 QZcj9BioRijp8aq+9UJOjDeqrZ78Mk2rnLKSa3MVClSIoQ+PCd3Ec0gZV565yGzMTZXv
 iKhccRvoqDLT0w4QYjuhsAvczWYg4b/Ywtdkc4e+2YdIa9dB0d9V6WA2G3BYuRwQZk8+
 /yJajUuIimBYUDtpIYnUQIA7ga6pz9tHinT9JbtIjpMF8WUg6fmrobp8Bmz9S/mwWMJ1
 lqAA==
X-Gm-Message-State: ANoB5pl3l/KYeDmxVQnIo9jwDfsCPZnpSi+zq4nh1alE3YZTpUX+j9YK
 WMkNsosRLeSiQrnhMCj40cjlWQ==
X-Google-Smtp-Source: AA0mqf5/ipncl8SWf7iD0nYv5N28pOCoIcQzY7WRbDwMvg0BCazt4WRo/pxVJKPNNIN65SXDUI5Aqw==
X-Received: by 2002:a5d:558b:0:b0:241:d71b:fd4c with SMTP id
 i11-20020a5d558b000000b00241d71bfd4cmr5717449wrv.435.1669116800891; 
 Tue, 22 Nov 2022 03:33:20 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a5d490b000000b0023691d62cffsm12003824wrq.70.2022.11.22.03.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 03:33:20 -0800 (PST)
Message-ID: <ebc7d093-de91-7b48-c632-a1b141edad50@linaro.org>
Date: Tue, 22 Nov 2022 12:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 v3 15/45] tcg: Introduce TCGCallReturnKind and
 TCGCallArgumentKind
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
 <20221111074101.2069454-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111074101.2069454-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 11/11/22 08:40, Richard Henderson wrote:
> Prepare to replace a bunch of separate ifdefs with a
> consistent way to describe the abi of a function call.

Nitpicking, s/abi/ABI/ like in patch 40 "Fill in the parameters for the 
host ABI for Int128".

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-internal.h | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


