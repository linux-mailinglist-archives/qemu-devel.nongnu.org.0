Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F81749DC8F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:29:33 +0100 (CET)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD09n-0001U7-AC
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCziK-0000qj-Us
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:01:06 -0500
Received: from [2607:f8b0:4864:20::102a] (port=42847
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCziG-0001X3-TL
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 03:01:04 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2145325pjb.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 00:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zUY0e5iDsaIMFjIHtKNqoYKcQeXXQy00gcxbmsgD9AY=;
 b=UUoFWuUMDDw56WxrBItitbGSyZ4sz05Z+Z7Md35Z7t4jR+tRYD6unOd/P+7mku7QxG
 q8zB4uLMg6V5a2QttAHUTEpHU3EI5FKeScMTFJ4PKwJ7eYnkg3tLkmF0W3UwXRP23m1j
 cxi30clCUeaxWXs/GiUgEIoxNsbqxzC6eRBNZGhrbm1EExRHcI9dZQ1r6xVPNoy2azbL
 N+P8OqO/zPqjHI9OR5JrIg3q398QB0+oKs/lYN23OJ58EXwhEZX1TK8s5X0tUlszAUmC
 CqB+BpPJMum7WqopHWFGNzg5DEnooaJFEdQQHE8a1dqO5DHUuAiZrzwQd3Ax5txq0Xow
 9JHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zUY0e5iDsaIMFjIHtKNqoYKcQeXXQy00gcxbmsgD9AY=;
 b=rFyp1qlGZ+iWck6OxJAMDKzg972ba9nhg1vnm9SQTohLDGjNKqRe4yZjOFTmrWtJcz
 OKRBs7aSAEmRO8/QvWAvrBieOq1j+vMKPZtVAlzKMAa9QgCXEkk1h5mZ/ofJhvQMbJoQ
 /l3TPZeF2+P+FSp07uIhV1YiZXAPFyBkdCTw+hSD1EE0dAoHa93x896zA87l+UDcy86j
 yaXu4tfzt9QV2CcO+H0zimkCDZIpi18pA0/DkmAWA8qntCdwi2rQ4jAcc2s6vLalnUMJ
 RX7UBYsqqZfYnY+pUe/rLYUjh45jm1uB8RkNmsWOBMnu22gPmFJGUJqLbDmbJMUZz8QT
 MqtA==
X-Gm-Message-State: AOAM531DVmd9Wf4Nf1L4DY0yxnNBv6wmGlwpyypGgVN4s5Xq1VAhEQmn
 8bPex9b0cWyOJUVYgAQDat3koA==
X-Google-Smtp-Source: ABdhPJzV1z6oT2V8AAORwfOIU916vcJ5/0SjBgs0xhsc8vxToGHuioMFC4H8FKq3LsUY4U4HhVCeJg==
X-Received: by 2002:a17:902:f205:: with SMTP id
 m5mr2213342plc.71.1643270416178; 
 Thu, 27 Jan 2022 00:00:16 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id na7sm5846188pjb.23.2022.01.27.00.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 00:00:15 -0800 (PST)
Message-ID: <e1024fcc-94ed-4e62-458c-40ead1376320@linaro.org>
Date: Thu, 27 Jan 2022 19:00:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 37/40] bsd-user/signal.c: do_sigaltstack
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-38-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-38-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Implement the meat of the sigaltstack(2) system call with do_sigaltstack.
> 
> With that, all the stubbed out routines are complete, so remove
> now-incorrect comment.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 72 +++++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 67 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

