Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0094C3601
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:40:04 +0100 (CET)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJy6-0005Wv-Vn
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:40:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJbb-0005DZ-IF
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:16:53 -0500
Received: from [2607:f8b0:4864:20::52c] (port=34753
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJbX-000131-QY
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:16:47 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 139so2572073pge.1
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KMhdgKuhwSde0FOMtfszNXB8/zfsTp8nMWRPc6pOx78=;
 b=FTgMpufalpzjrGvW3sWBt0EoZVWsIAsWTAb8U1mk1wOtyF6seod/J6DqZGrZQvLNLT
 c/LUh53NZfUZETf0E6TEfeTGfjxVVULB197Mz1hJf2xWTucGhvruS5SVZ5sZmYo6i4xv
 yWrp6lvRa7kC0t2gesIjyKpPsDUQjDV7EWID9tQ+OqGwxyFowXcBOoHYBZnZgtNRlDP7
 WSI/zpcpEUEQU+MIFu4wGsHmD3hyPnRbQHypOJ3aWndoh2efgEPUNrUXbdbyC8bZmIaT
 Qv42AhdO1UilTunyuvBPh9SbY7YY+p8N76OcCX8iQsxHTUFHNUXpDTMFNabt0Gqi4hiR
 Z7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KMhdgKuhwSde0FOMtfszNXB8/zfsTp8nMWRPc6pOx78=;
 b=qtG5tvXYfQoctXyoSoIm406TNjn5L8P7vko5h41qX0HNoXdHWVhQQ99KVA6hM4uFVl
 zHsdlaE7RLCcZdasntbP+JQv/uI+PHncKIfvee7S4C/O3JY6BSV43yzyxQr8eeHFpngm
 TQPRBUISxxnZuY2ec+EQKqMBlEhZedDRLLxTtn/dvXDQxK47cbl9YElIoJnC17R9EeNS
 A+soChjlSDNGaDGA1xZSQra/I45xwhqr5JyJQs7TptF3qFuXXF7lxPDkzMtvLf8OFHZQ
 4baYj7jS4RYS/5f2i2rbEqL7m94LXQER1/756vMCnoffTDQTQR2OMZmuoO/2Wm2Q8qbm
 9CKw==
X-Gm-Message-State: AOAM531jUK5pXIkv1SUW0sFh4Y20FiEBrH62auXvNLP2soW+7rx80s7z
 0X0dr6hMRjHjtdFmbPjoRAT33Q==
X-Google-Smtp-Source: ABdhPJyKONAB9wJTQ07t6YumH5EfCfGpD5LpK3bBB/Z+mm8rEY3sqla+DyHZo/VFoHMyfXXYHpjuCQ==
X-Received: by 2002:a65:6e93:0:b0:362:da8d:88d5 with SMTP id
 bm19-20020a656e93000000b00362da8d88d5mr3328381pgb.194.1645730200655; 
 Thu, 24 Feb 2022 11:16:40 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 o5-20020a655bc5000000b00372f7ecfcecsm284152pgr.37.2022.02.24.11.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 11:16:40 -0800 (PST)
Message-ID: <b1c6daeb-73a1-7589-4ebc-3bf401276046@linaro.org>
Date: Thu, 24 Feb 2022 09:16:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/12] compiler.h: replace QEMU_SENTINEL with
 G_GNUC_NULL_TERMINATED
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-3-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> One less qemu-specific macro. It also helps to make some headers/units
> only depend on glib, and thus moved in standalone projects eventually.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qemu/compiler.h    | 2 --
>   include/qom/object.h       | 6 +++---
>   scripts/cocci-macro-file.h | 2 +-
>   scripts/checkpatch.pl      | 2 +-
>   4 files changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

