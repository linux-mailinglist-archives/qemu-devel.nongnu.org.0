Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290AF57F603
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 18:34:31 +0200 (CEST)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFeYo-0002hu-4x
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 12:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFeUe-00082f-UX
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 12:30:20 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oFeUd-0001FT-9T
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 12:30:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id e16so8397212pfm.11
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bRfQ3u8GJnnQK1vnwzadWJV2hiEFfHrk0u4JIPXqwdk=;
 b=TIKr6G9FHJAFRZl16xwP2fl+nj8ZVdI+xhdc7yrCcDbhCoATgiXsteTcYnmlz9IewH
 zWcH3NVXUTTprsucjX3sJO7cGItk0iqIpyFN9MKKEneA2WFxLyFNwAZK2CY8I6l65Ahh
 Vml7xSI2UEfBu2eIucCej+P4dzOFMsdt/6bYNikgDrEMQwaZU+TldF1Od0hQRSQoSw3P
 srBOvyOW1p/DM3nXDiHHoOi7ry7HG1XjKXSUNtxsRJegobOWLuOitnLr0Mgi7YQ6VTA6
 Wx3eEKzM2KVAwfEoTnu9F+vCWdhPkQlsLWSeAXjGa1TlvBlAx76iqU5uSvrZcoi8Tey4
 9XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bRfQ3u8GJnnQK1vnwzadWJV2hiEFfHrk0u4JIPXqwdk=;
 b=Z1rxRB5PYg7mJuhNtcr6x76UAYxXTHGcWXhqwK/H0Z6cEMXh57HufTVMvAWrcKycId
 xKEKe8rXMXr6DDC1B+U3ycrnoXnwONjWxEVBjWe1ouroapYzRgNtoeW51ZhjZbRd3usG
 OU3CMgq7zM1EDphnfZCbkVIkVBgXMt6JopEoXFPUsRLSwrxIiOHvcI5hfKW344S1Zj2p
 9ev+SZkhbaL56KT161lG7iteV56Cm3AIO4r/BDEKQ8RFJu6L7QOczVl0w32qWfRpxNOp
 q52v+49QiYKbT2w/jm/uYKKSsoe6eEbf5ndJUuQRPEL768D+uQwuWyQ8a/UYpMw/xVdG
 DGIg==
X-Gm-Message-State: AJIora9faKX5F2ZCRdkhRe3DyPpoh3M24sJm6Lxw0QRrmubEt8ySWtMB
 3f8CTyiejzF8ydurRGH3tUQe8g==
X-Google-Smtp-Source: AGRyM1u97neAsECUvXOXb8UyilxOB9AXKlHRMOSykWowPeNeyfSqGv319xzN6lpqq4Os7+sBQVHINw==
X-Received: by 2002:a65:60d5:0:b0:41a:625e:4c44 with SMTP id
 r21-20020a6560d5000000b0041a625e4c44mr7568701pgv.364.1658680209598; 
 Sun, 24 Jul 2022 09:30:09 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:f67c:fb58:6d94:30be?
 ([2602:ae:1549:801:f67c:fb58:6d94:30be])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a170902d2cf00b0016bd67bc868sm7517066plc.210.2022.07.24.09.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 09:30:08 -0700 (PDT)
Message-ID: <77d61a47-8e92-d239-07bd-5ae8f281cab6@linaro.org>
Date: Sun, 24 Jul 2022 09:30:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] semihosting: Don't copy buffer after console_write()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220719121110.225657-1-peter.maydell@linaro.org>
 <20220719121110.225657-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220719121110.225657-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/22 17:41, Peter Maydell wrote:
> The console_write() semihosting function outputs guest data from a
> buffer; it doesn't update that buffer.  It therefore doesn't need to
> pass a length value to unlock_user(), but can pass 0, meaning "do not
> copy any data back to the guest memory".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   semihosting/syscalls.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

