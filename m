Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BC51EB2F
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:06:57 +0200 (CEST)
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXG4-00082e-Cq
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXED-0007GW-AD
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:05:01 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXEB-0006g4-CS
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:05:00 -0400
Received: by mail-pl1-x634.google.com with SMTP id d22so10949309plr.9
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=UdMzjDXJ/3ZC4iLIhxyv0ycEHPbBnTRSsWmAZv2dJGw=;
 b=kMMIgbXB2Sd9qFaDmzd7PgFz1ReDirfq8Mu1BR3y688NTrs7gm8li39+wZuu5JSkzI
 yn3fU/waOhyLlQaGbxG4l5Ohfx1C4LDLPb5Gj4/cblEqY8P4chqax9Qr5KGpfdSRmVjj
 vIFwKsO21TQGxI4rDrAeJiXNAXLiPJ112TcEwX8+eP0MFYdiFy6kv2Brw1wrDQbZcWGl
 KDehEKHf1P/B/OMxZJDqUAbNEoMxCKHlEexjsgiwlw8rPxEeMGTzxEtmKZNh2ghA0AkA
 bsbI87LHl5SuFQBILOQLVj1FG32GG/6rP4lDtojRh9UBVBKdNTo9LpQXQ3IYxKuNyjHg
 X3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UdMzjDXJ/3ZC4iLIhxyv0ycEHPbBnTRSsWmAZv2dJGw=;
 b=omJRDRyKfYGhlDO6qmtTUXhrW6JxVL34D/XDhi8biDjmlSNUOk2eYeouljWrokExQw
 FTL/Bhgt+uvBlQBglwlR2iOJ/nh3mB/EMcB4iicvIOmgIuMZODIYfngxiFgislTz4JJ6
 nfTBMxAHYFidZ0HqALQER4FyJ/ThyjuGXnwEuuNN4rxH655MfzDUymQK1Smsx9zlwMZZ
 nKQbdK2+4iQTqJEiuqEGAbyUGJ+LqeGirmR3i0CKQ9VjJaAIzpo4KE5QbXgkyNDG03/d
 3AwF2v30ltqokEBGrH8/8zfoowPARMtnHihr93X35fiwxNaMEkqQXIOvcl6EYEtaUC7Q
 QH4A==
X-Gm-Message-State: AOAM530XDniqgSyjN6SXdoP3LfC7zz04Ri2knKjvR7dYBCtu0dBsaJ3A
 BbD107hOtwdQb+B5wxY24FVYeQ==
X-Google-Smtp-Source: ABdhPJw+5T5MMcoc0nNJwaXiDzXANDZXuxOuP611dudtntmA66CFgBOOGr+BZ/j0HufK/5Dwwc6P8g==
X-Received: by 2002:a17:903:1c4:b0:15e:9f34:378c with SMTP id
 e4-20020a17090301c400b0015e9f34378cmr10247384plh.87.1651979097972; 
 Sat, 07 May 2022 20:04:57 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 ob12-20020a17090b390c00b001d95c09f877sm6132346pjb.35.2022.05.07.20.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:04:57 -0700 (PDT)
Message-ID: <9f8eb850-f8d8-2f3e-19e0-7f1bd97fe527@linaro.org>
Date: Sat, 7 May 2022 22:04:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 39/50] lasi: use constants for device register offsets
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-40-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-40-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Instead of generating the offset based upon the physical address of the
> register, add constants for each of the device registers to lasi.h and
> update lasi.c to use them.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>   hw/hppa/lasi.c | 28 ++++++++++++++--------------
>   hw/hppa/lasi.h |  5 +++++
>   2 files changed, 19 insertions(+), 14 deletions(-)

Worth removing the final usages, and the old definitions in hppa_machine.h?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

