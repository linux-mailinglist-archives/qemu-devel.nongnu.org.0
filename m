Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1C85651BA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:08:16 +0200 (CEST)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8J03-0000SF-FZ
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Iz2-0008CH-NL
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:07:12 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Iz0-0001lV-K4
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:07:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 89-20020a17090a09e200b001ef7638e536so4934545pjo.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0LLDximVoXso95yqO79Lpec54t/OYLgNimh7zgdksdc=;
 b=NQNyBv5tK3cd7+l6mbR9u7FEtAHZM4ncLL1pm+Ehn256hbBTlyEyIzl+pw1gT8OKKQ
 lylXbrSJgdpUv+cmR1yYSpzA5tV0EvgFutQ8ybH3rierH3TvBDm8GzqY7KsjHN+KViQX
 juqmTVwmR+AeAHSLCqM03FcP9FRZqlFgQouXHIF7jxS+fwjC+rzZGJlhNkQ3nNHC8Diq
 OG5ZjWEwSZrLCg7NSewS3frbyNS7LjyUmMXFCqtLahKgHWrNunKz77YJryYgNZlRlnLC
 J2YmuRqD0tBpO22Sp0FB5X3Hruo75P/OVu8TYP3RqOckqLsJuktZt9GVHEdZETISyLqU
 MDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0LLDximVoXso95yqO79Lpec54t/OYLgNimh7zgdksdc=;
 b=zBE8Y0Gxq9p2Hetz/jhupVXjEJ06WTxxr33OCop4l5Rx0AX66W8VnEmFhtL28tgyOH
 gzg1KBIRdJF3vbnxkT4wU/6fxwaxi9Yf4xQIhpz5d5vra4fMkk6joMg4GKMw1qm3xk6S
 GKSq3VbEzOheInIBAfqlj7OJFFrMS9+Q4IXgOO067ArPM0LPAvOyVS8B+NjkW8HlJzrP
 mWwLVd2C2M8aR8tkQItvTZdSySAc/2xDaKf8ffg74wFM0CKqW1xezfXrXkf1sKWZm+aP
 DgvZfEo4Lsr8WycXOCL42W0JxbD4oXHOZEtYcOjeZA2P/YawPZuOvxeZUt64MDB/vQ1B
 pCIQ==
X-Gm-Message-State: AJIora94Pd+iYKTyvvMTmZ3ukP4PU0crwCeh+gUDAgM/nZuotr9t871I
 qyCAPEWpUJBajnW+AucEnUZxEg==
X-Google-Smtp-Source: AGRyM1sB0m59WyBKOSj/jtWCy7BJuJrJmytp9amAISwUlwbWpcCLc5zvzb6a8x6apWz6lCwgzj8NGQ==
X-Received: by 2002:a17:90b:1bc4:b0:1ed:361b:702c with SMTP id
 oa4-20020a17090b1bc400b001ed361b702cmr33187976pjb.136.1656929229074; 
 Mon, 04 Jul 2022 03:07:09 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a17090a318700b001ef78b9d0d7sm4289880pjb.30.2022.07.04.03.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:07:08 -0700 (PDT)
Message-ID: <13726190-bef1-a987-3158-0f60cac69d1f@linaro.org>
Date: Mon, 4 Jul 2022 15:37:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 08/11] target/openrisc: Enable MTTCG
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-9-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703212823.10067-9-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 7/4/22 02:58, Stafford Horne wrote:
>       case TO_SPR(10, 1): /* TTCR */
> -        cpu_openrisc_count_update(cpu);
> +        if (cpu_openrisc_timer_has_advanced(cpu)) {
> +            qemu_mutex_lock_iothread();
> +            cpu_openrisc_count_update(cpu);
> +            qemu_mutex_unlock_iothread();
> +        }

Lock around the whole if, I think.  Otherwise looks good.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

