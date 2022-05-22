Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE71530655
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:48:31 +0200 (CEST)
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstR8-0002tj-Lu
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstQ9-0001ZL-6M
 for qemu-devel@nongnu.org; Sun, 22 May 2022 17:47:29 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstQ7-0000Lm-Hh
 for qemu-devel@nongnu.org; Sun, 22 May 2022 17:47:28 -0400
Received: by mail-pj1-x102c.google.com with SMTP id gg20so12394620pjb.1
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eZeHGdVd3Txq2Fkk7SfCu4PKcT0lZ8WnQbQAr+8Efnc=;
 b=iB1lsYaTVI7DVF1HcKJ9rSzp6qdL4JgB+h/J46QnNNQm+cA9s9KOxEUybCT81XT7tn
 83xo1LXQ3442f0HzZT4KPx+Da7gEsBjmX6ruguLeWC3Id/COhB6I+rhdwPN7KQfav1i3
 55u0BgSGkEQEVBbrbPrZ1hxKsKdYOUddCpeN4GXgmbJEaWovCimTr93ZWLlHM+H0who9
 lga33lm1Z08PcCLSl6RjjBsAD4Iqm41nSnUVFIlxa3TVOEl479+oq2oBfY+2FazHBiAd
 bLe8C3rqZ8NctEXJ9GBj64LQjvS/j7/7swdTFSkT/PD+WRoVJF5HKXn1BjvUeasaDQtQ
 Q3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eZeHGdVd3Txq2Fkk7SfCu4PKcT0lZ8WnQbQAr+8Efnc=;
 b=B9p9S30fQ0ZY1E3EMpz0LJNJ8cq5U0LPmeDm6Jr/3m6r8+hcu/0pqPShA03LB5GUfe
 oyfFzSe8Q1kDhCqdvW/7ufH8jXE/mpxLsmQrVs4gtgpHg3kJZwpgNyt2Umxj1KlHrJpV
 M7dF7spo4UVfGMoxphwzpiSS5aA7Cw5GrZmrD84NC+U8nnNdJFX+g39KWQsu7RLrl9Tq
 rriEzAGIcJtZZHaRP15gqp6rtLFfy2wRvDn71aZ8xpA9egWRGqv8hEnRql9Izl6/J0Vv
 SnVBdIZngtpN36NXDzxL8Y4FCtVbqILDuF7dx37aZvTzJsOd5OirTGADeNjGrNl4zW57
 /VdQ==
X-Gm-Message-State: AOAM531rBvgZPp4H8LfMdqCmV3fa7Nk/FKc4kpVQtYyegnX89zoi0vrZ
 KMekOFhSBnz/TZF1tGu6K3U=
X-Google-Smtp-Source: ABdhPJxsUcpxfaQnOBkuf70i3au9a0HaAELYoMMgYJ10t6tKU5VV/b94b4jpPa0o+4KrxmjtvB0OPg==
X-Received: by 2002:a17:902:d5d2:b0:161:f03a:eb41 with SMTP id
 g18-20020a170902d5d200b00161f03aeb41mr14455579plh.65.1653256046142; 
 Sun, 22 May 2022 14:47:26 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a62d045000000b0050dc762817csm5689680pfg.86.2022.05.22.14.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 14:47:25 -0700 (PDT)
Message-ID: <235df19a-1a1c-f7a0-96e8-885f15aff831@amsat.org>
Date: Sun, 22 May 2022 23:47:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 03/17] target/m68k: Fix coding style in
 m68k_interrupt_all
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-4-richard.henderson@linaro.org>
In-Reply-To: <20220430175342.370628-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/4/22 19:53, Richard Henderson wrote:
> Add parenthesis around & vs &&.
> 
> Remove assignment to sr in function call argument -- note that
> sr is unused after the call, so the assignment was never needed,
> only the result of the & expression.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/op_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

