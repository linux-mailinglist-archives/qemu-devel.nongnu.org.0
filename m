Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4637193D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:27:08 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbPX-000496-L6
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbNT-0002E0-K0
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:24:59 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbNR-0007Sg-IY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:24:59 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so6044275pjn.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sOLRYpwacY6j1PzxXuHkqseGzUDYqpKz3OYDcor6+dY=;
 b=O8Zzz2cC6D7YcePI5LPKOucHSCVrWgdBfZC5+UMYCzavvZuuu7Yvufh/twiw5Fll+U
 6va2vEMdPxsP0Xh8/mUTZQ+3UCanEPdv4YuwcnwCL5IjiMFFIMCJ5p/0AzdV/eon+Ddk
 R2yqfLum88WTwc/+ZVlb1pk1Ba6+yf3P5iQKAoeSUz1gwI26VpMGz8qHqcXIRzU8zpcN
 FIW9zUPQciMqih5mMkS366oH0yDJDDUPaGmz0afI+O7giMkDMdNhMixYPDO0WYP5l7x7
 qz+1thYxHZN/2W4E8CR0hhA7qA16bceywwgUljexfKdA+QzUYW32ug+IeaDoLskOV4zR
 uySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sOLRYpwacY6j1PzxXuHkqseGzUDYqpKz3OYDcor6+dY=;
 b=UE3N4hOhoFWAnwsumrk21lLUF8kqpQ88wkGBwCgEQy0X8oHhXyiB46GmLIA2LP1ObU
 +5Bsz4rgsPumbBuldIYgEAf/7XJ5FQJfNIXrIIeDFGAG+Z3mfKgD69HCyva+fvA6d7Ew
 GUxtSHAuWJvU53sAplTzYCGbqnU/azoD9WaK0EmsBKZ8w5TzuVU5E059djDxVrfCtPu9
 IAxmipbg95kRAkGga4e6TWKpTb5DA887X+HmUlvXDTucaoAsT/6cDU8eFpZ1jvTufJ0w
 vIuw2J0/oK5SMnHryZfjomltwHxBjtZ1QB7aFZNxsey4HBlytyzDdiH4+qcjK87Eh5c6
 45OA==
X-Gm-Message-State: AOAM531VTWccFhBQnLwGxmMu70RR9o3MrCEZMWMx6LG5gIKgf27BXd8/
 ilbQpnUSPvzYhtXBGqDvf4KH3w==
X-Google-Smtp-Source: ABdhPJxFreOxCIm/yWSY3G2A/JkWq/f+jLUInBskgQdWqTyK8ThMIk/dtvEpq+yfrzT+6ZcT/Yo6Bw==
X-Received: by 2002:a17:90a:2a84:: with SMTP id
 j4mr21477134pjd.42.1620059095450; 
 Mon, 03 May 2021 09:24:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id c6sm7889385pjs.11.2021.05.03.09.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:24:55 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] hw/sparc/sun4m: Introduce Sun4mMachineClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502185441.599980-1-f4bug@amsat.org>
 <20210502185441.599980-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8695ce0d-59a2-dc17-5eb1-c444343f39c5@linaro.org>
Date: Mon, 3 May 2021 09:24:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210502185441.599980-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> Instead of passing the sun4m_hwdef structure via
> machine_init(), store it into the MachineClass.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc/sun4m.c | 50 +++++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 39 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

