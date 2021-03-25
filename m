Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AF734947F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:48:05 +0100 (CET)
Received: from localhost ([::1]:53520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRHI-0007dw-Ux
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPREZ-0006es-H2
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:45:15 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:43619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPREY-0002nF-1x
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:45:15 -0400
Received: by mail-oi1-x236.google.com with SMTP id n8so2334622oie.10
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N6oDIwfimGuyCxiRZcYNpN5AaP52oY3lMKxvjt5fJbE=;
 b=YoPWB1ReHV04IDWt1uSixMvx56InggMYsnb8CuXnZStAPHvOxGA0CDY59p6B/vfN7r
 SowmFzL3HsvjgihtA1IM9TmUmQgSJ7+xCemJGVYNj7KYIJvw5vyngAlyVZX340Gxl0Su
 dDsxwc4V89wwIKK9jIUNrRgnOm9tT/iWrIhyZm3PXLUmkncniHuFplLKBCFqew2LYlY1
 wZDxV1uCcj3yqNTpm6GkSyvj9fp6gqKD0IS4na+27cuvkBTrHKp4IilfZMWA5Y5Kyw1T
 ijUhh+MbwxLHzTyu3jrEY3Xll+iCxiyd5Fw8olrCRnNP7uP8PpCU7k7ccODXHFfsRh8Q
 UOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N6oDIwfimGuyCxiRZcYNpN5AaP52oY3lMKxvjt5fJbE=;
 b=Lhn0bUU0kOf79j575tpljia8yX0HGIG0TZJHYIrYKsVptrp1tBck1l3mYbZmvkrVAj
 586ljF6NXio/scuPOZxtD5vh9Rhx2lY8IJfbaHxK3g9Q+KnSIOesyCrxpDxRwZ3DNY81
 wmWyNkHN/lFn55Ikf8Jr1B6CgWCJC3PDZlqqzMz+OvAAgLELIgpP7rJi+sTeNhMwoAvs
 Lx0HD/1fVTLaiRj+lZIya1wRPr7NfQrSUS1BVeBoZwYSHvBqWxIL5638EKvSm5GCbU8y
 U7MoTb7D8LyqhNzu3TMi3l/rdP/LpnVrp6gbXgfyLP6XB2AudSD2OeRr8mtKqIcULOaC
 N5zg==
X-Gm-Message-State: AOAM530OxvnCQ0NZKZJyRPX+grNjZ/y2it8v0FK+qjUt6XhT8XAVKYjc
 VIOU0KrDYaL61NX93Jpjz+5M6g==
X-Google-Smtp-Source: ABdhPJxPOgDi+TpzqJJ7hcc4pzwAgSYqDKGYrDQpEjusrycLY+KtJgtdxI1hDbChn9mrvohKH4HKoQ==
X-Received: by 2002:aca:c7c3:: with SMTP id x186mr6396090oif.96.1616683512950; 
 Thu, 25 Mar 2021 07:45:12 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id m129sm1126097oif.34.2021.03.25.07.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:45:12 -0700 (PDT)
Subject: Re: [PATCH 06/15] Hexagon (target/hexagon) utility function changes
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-7-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11558e41-a0fa-5098-624d-a72136dba80e@linaro.org>
Date: Thu, 25 Mar 2021 08:45:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-7-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> Remove unused carry_from_add64 function
> Change type of softfloat_roundingmodes
> 
> Address feedback from Richard Henderson<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/arch.c   | 15 +--------------
>   target/hexagon/arch.h   |  1 -
>   target/hexagon/macros.h |  2 --
>   3 files changed, 1 insertion(+), 17 deletions(-)

These are two separate changes.

Split them, and you can have

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

for each.


r~

