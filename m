Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505F48D6BB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:36:08 +0100 (CET)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7yOk-00089t-RP
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:36:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yIn-00027b-Rb
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:29:57 -0500
Received: from [2a00:1450:4864:20::529] (port=44963
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7yIm-000142-Es
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:29:57 -0500
Received: by mail-ed1-x529.google.com with SMTP id w16so21806114edc.11
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1r4dVmVyQMYBua75G2kC6ooHBOmQ26uBGiFJpV9lYBs=;
 b=cdtzU4rP7yTJcrCHR2Po6v6nAvHUHHhPPRnMccmJUW5O0d32/SrtiwHpqtP6R1H47g
 7b0fku1O0pCJH/R6cMeoBoJqJ1QzmJYnBkHRKlFY/qe8QxdMlaroc2DLb6zO8IMlASq0
 ejE8EGJ59gqYNExAAw2qu96d15vMYKmZRaqa9h5N/j/5dj3iZ7h28JgufaMlzGYQqolm
 DCBO18sfR3yFTSIfApveDK9Dqcl22QoahH7StjH9ZWPa3kd2jcKlqydIQm1RS+cIHcUI
 iSlpV9YMmVOBavAKQQW2xRV7X18vyeBlg6KqUi5sMrb3/a3lrlJx2qknI5DpMeGvnmZh
 glXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1r4dVmVyQMYBua75G2kC6ooHBOmQ26uBGiFJpV9lYBs=;
 b=uGU5nm5u9xdMCh0B3sZz+ocSu2F2v7AlWTzcSSh/+388nYNiW0U+nBubNMoZJlEXjS
 +1lXNyyV9eksrtV/lvvueaJAkSjfy9PgMX7SNsE3pMj0pzxFClF4umwpjIgL2XPFwZrG
 ecyJrAqc42bqD+gTMOMH97eKrBfcQIASkf0pr3ytHg/Sw02QeL7cymQZns2Ff1GU/Pf7
 CENPBf2fpTVWnpmTwa2lMZMyiAd+xF268yljab0SsqZX8yHOn5+9qgmwME2BA7RkJE2v
 FKr6RqlnYh3divUeFY++pJlRFRURNqZDApkt7bna01dXr58QYyo8iG2qIm5x5OzA6TcD
 EiRQ==
X-Gm-Message-State: AOAM533u7wbfzvVfw0NQ17aK2ymfHpsALNamw+Re/c9N445vpVrSRDW7
 NCMLZuJ392R1oBXAmf/OqMw=
X-Google-Smtp-Source: ABdhPJyM308MDZacFNDDd712X7yodWRJyjw83RI4lBY5EdmwX4zFgfqBg566lkqZg1gw2IE6lUqLxQ==
X-Received: by 2002:a17:906:254d:: with SMTP id
 j13mr3190943ejb.628.1642073394932; 
 Thu, 13 Jan 2022 03:29:54 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id hs32sm777518ejc.180.2022.01.13.03.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 03:29:54 -0800 (PST)
Message-ID: <28397260-27dd-02bc-d96a-7424af445062@amsat.org>
Date: Thu, 13 Jan 2022 12:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/4] dump/win_dump: add 32-bit guest Windows support
Content-Language: en-US
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, philmd@redhat.com,
 qemu-devel@nongnu.org
References: <20220113005248.172522-1-viktor.prutyanov@phystech.edu>
 <20220113005248.172522-5-viktor.prutyanov@phystech.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220113005248.172522-5-viktor.prutyanov@phystech.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 13/1/22 01:52, Viktor Prutyanov wrote:
> Before this patch, 'dump-guest-memory -w' was accepting only 64-bit
> dump header provided by guest through vmcoreinfo and thus was unable
> to produce 32-bit guest Windows dump. So, add 32-bit guest Windows
> dumping support.
> 
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>   dump/win_dump.c | 231 +++++++++++++++++++++++++++++-------------------
>   1 file changed, 139 insertions(+), 92 deletions(-)
> 
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index df3b432ca5..d751cd6d36 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -24,18 +24,18 @@
>   #include "hw/misc/vmcoreinfo.h"
>   #include "win_dump.h"
>   
> -#define WIN_DUMP_PTR_SIZE sizeof(uint64_t)
> +#define WIN_DUMP_PTR_SIZE (x64 ? sizeof(uint64_t) : sizeof(uint32_t))
>   
> -#define _WIN_DUMP_FIELD(f) (h->f)
> +#define _WIN_DUMP_FIELD(f) (x64 ? h->x64.f : h->x32.f)
>   #define WIN_DUMP_FIELD(field) _WIN_DUMP_FIELD(field)
>   
> -#define _WIN_DUMP_FIELD_PTR(f) ((void *)&h->f)
> +#define _WIN_DUMP_FIELD_PTR(f) (x64 ? (void *)&h->x64.f : (void *)&h->x32.f)
>   #define WIN_DUMP_FIELD_PTR(field) _WIN_DUMP_FIELD_PTR(field)
>   
> -#define _WIN_DUMP_FIELD_SIZE(f) sizeof(h->f)
> +#define _WIN_DUMP_FIELD_SIZE(f) (x64 ? sizeof(h->x64.f) : sizeof(h->x32.f))
>   #define WIN_DUMP_FIELD_SIZE(field) _WIN_DUMP_FIELD_SIZE(field)
>   
> -#define WIN_DUMP_CTX_SIZE sizeof(WinContext64)
> +#define WIN_DUMP_CTX_SIZE (x64 ? sizeof(WinContext64) : sizeof(WinContext32))

I'd feel safer with functions rather than macros. Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

