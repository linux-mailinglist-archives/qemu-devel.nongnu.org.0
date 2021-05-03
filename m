Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98FD37193E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:28:11 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbQY-0006Ue-PS
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbOH-0002oz-9f
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:25:49 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldbOA-0007lK-EZ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:25:49 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so6070367pjh.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yO6K4vK4Z2S95on2CtDFThXiBcFAbdGD5QgR43L73J0=;
 b=LSRqYVgu7cwsFc9kkGqjy4ATlOgX3bAHgP42PAWJtm5N3wPg5b8mzlWDVSiPsnI8SP
 uzwDxkiOxLlv7zwbi7gDildV0XymbTeUfqjhpDOwCljwAHKbahay/XjqyIxOY0ZG5OEI
 3EiV6mBhAkBjgCWEVEBdhJTnaY2BqBbRoTlWu2pBNzBjlCzSI1warzg/hMSEfwcOmY6i
 az4W17mxkavV42KSQGaBrCsfAIn0uMv9eLp6rd8dbRhiPUR/de0MQmIDhuLgHaoXVINU
 84QF7mTA6icROkTHQMzsiftQEKb0B/UdAqO/W0RjTaovKJ5cGnuobn1EuF8ouv0e93+2
 7NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yO6K4vK4Z2S95on2CtDFThXiBcFAbdGD5QgR43L73J0=;
 b=IdEVN7NGwwQMewzQcmrhD/i/Qmg1AVdLYy0ziWrRfs5ItZ5f62GlLEbydWjULN16lu
 k7+4pN5baBKAPh3csO+Bb8CT4kpC5EubwMC7/Jp8M+DBHrMr0mvyW9aYG58P1WNHwYVL
 d7pBfxSJJlm+SEHF9GQmEK8MmRDqIhU30xhNlxg6r3Cc8nZ0T72JAwtVxnokpZb27YFi
 6tttGaxA6/kBiqpqpVIQSeRAbEtRLQNtAcxi0hwFKWrm7OKBkJsxBiyTYnLaG0DGGous
 PM6UWdqBZrgsJtAUg+/cMaP7SdCastBrQ8eaOOHyNLTUcWkvaVaoszs4Xauh4DDLZf7/
 g3YA==
X-Gm-Message-State: AOAM532+5OJ5FS/YWoYWeNVwuunG9U7flqW2ZcOt3XlJLiisj0hFZgMT
 dd9LshnB6S5t1RWAHoFagRgJDg==
X-Google-Smtp-Source: ABdhPJxdz1i4jIreYg842b8x/XQmpQZu7AuH07W+8WROTHK1uwZLYYQaY1PSn6/Thqv8qmduRpnPLA==
X-Received: by 2002:a17:902:c745:b029:ee:8f40:6228 with SMTP id
 q5-20020a170902c745b02900ee8f406228mr20814909plq.22.1620059141209; 
 Mon, 03 May 2021 09:25:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id j26sm9323780pfn.47.2021.05.03.09.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:25:40 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] hw/sparc/sun4m: Register machine types in
 sun4m_machine_types[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502185441.599980-1-f4bug@amsat.org>
 <20210502185441.599980-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97596021-48a8-ea99-160c-fc871777d97d@linaro.org>
Date: Mon, 3 May 2021 09:25:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210502185441.599980-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/sparc/sun4m.c | 100 +++++++++++++++++------------------------------
>   1 file changed, 36 insertions(+), 64 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

