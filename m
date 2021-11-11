Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068744D861
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:34:33 +0100 (CET)
Received: from localhost ([::1]:34810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlB9s-0000fn-ES
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAvU-0007hd-5g
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:19:40 -0500
Received: from [2a00:1450:4864:20::436] (port=33701
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAvS-00079q-DB
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:19:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id d24so10153741wra.0
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3fOFkohG3qyA/UV33IdKTYFO67S0NXKRuwHDuPMC+8I=;
 b=ztObB9YL8SX4GZGgoyzns5K6sqMjnpVEWtphKznxvuzQYl/rBMT+0XeeJe5VpWXvOj
 ANJ0ugfJkFCEMOjE0b3P6pk6P2Io0pzo9yQm5PzEKMiulCDAxW0yRYLLh5X4AqLmPmJZ
 ro8Go7P33ScuHae5MACCBahB0ZV7Fj+WT529lxvLiP/wk58nEIfyLvgnyXaDCZmcoq9m
 Q7AuqCCVxtgbcY9bDFhm/tKB42zuYNGUcTaE3Df5ahgIwdrphz2eA+PmCZdRbwnNsNrg
 wR1BOA13AK4dE6LqlxvMHhMsmz/J4bo12B2IH7tcYdZG/dyhK9FG0fXjSXJ6cIS5RwO+
 iNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3fOFkohG3qyA/UV33IdKTYFO67S0NXKRuwHDuPMC+8I=;
 b=lRpEwHo4w9BnuMCbOeiOr7vWoSiw0MN73b5ldrHuNo0up+AMBt/RUwNZU+ffeNtDXK
 dQxYoxt2ZZYbLVDxc8Ej2b2/+u30iBURLLcPngsSW8kpa3wkMT/T6+MyUTtaSb0EH+Ev
 /QsnD2TudGz8GhJHWb8l/W90IevQfFwCGeIhxrqTJuLnv106kOOaqkcwQzGBjG+YGEXn
 xe5gu7YkLzmmBmui/8l35FWRSLdAVe5xXusdmQshlIEZ6qosycNu/d+gcMKPSiOqGpyv
 7oNXvoL0Mx7r9HxzKA5mGd0HbcrJ+3sVuul9tfC9lWpL7rdEqAQ5YTgS33KAkjuNR7tE
 C4Qg==
X-Gm-Message-State: AOAM532ryV1u2dw6rX4H6pxo0pEFroLvj0jUabWxnPe/SQyWXl2NqorI
 ud/CqhVPhWjsaOeEzCnM48M/Mg==
X-Google-Smtp-Source: ABdhPJx7ItYJj2ludhvJHINRzw+Xb0mZavcH30OIMEfn4vzbisA30BVI9EjLr8fRqD1nt1E3xASuFg==
X-Received: by 2002:a05:6000:1289:: with SMTP id
 f9mr9562948wrx.329.1636640376857; 
 Thu, 11 Nov 2021 06:19:36 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id m21sm3001251wrb.2.2021.11.11.06.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:19:36 -0800 (PST)
Subject: Re: [PATCH-for-6.2 v3 4/6] tests/unit/test-smp-parse: Simplify
 pointer to compound literal use
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2993b0d3-b9a0-35eb-2a20-c7580220f04e@linaro.org>
Date: Thu, 11 Nov 2021 15:19:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> We can simply use a local variable (and pass its pointer) instead
> of a pointer to a compound literal.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 64 ++++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

