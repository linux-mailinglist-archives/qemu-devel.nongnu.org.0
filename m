Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C9F37760E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 11:39:47 +0200 (CEST)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lffuc-0006yN-US
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 05:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsh-0004Tt-Ex
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lffsg-000297-5g
 for qemu-devel@nongnu.org; Sun, 09 May 2021 05:37:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l14so13527504wrx.5
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 02:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2oR5wpqKnO7xvMZR+gFF8znOINkfZYAx/JaQVX6jfC4=;
 b=K6/0oHKRkIruYfN6uUGVxGb6yGt8DRkZLR/exO5E7+xfoblHNYkJqSu9YQHVkG3GIo
 j6M/Ysd/brT2ccXoxQ9jM27KUylHDuJJ+0I4oy0QOnEMBTAxOuehURpT/NvNKV0wOSxB
 YlnFipN5YcvON2M+Hym1FgEjiYUm4Kme57NrYqkAFK+Y7YQX/7pXEwIyyxS5NPhVWZJN
 xVCbTfX18AFaitIOQ3zHbXWSFf8E/Ox7JUyHCUzAlpZBfrqEPMUv7kbH2AZn3udQObAr
 l5dP4PG6sOYmVenYT71o+Fe/AhrcccgmFlizBCMs6XugpSWBSz7c7sIfwKIa76DlIF0f
 zcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2oR5wpqKnO7xvMZR+gFF8znOINkfZYAx/JaQVX6jfC4=;
 b=cPFmq4jqk++RPxMJQhpgxmyCKQok1f0eOxEB1tHswSl2p2W/5tvW0A7HtStQYlU/Oc
 tVtLsHLZIrAFvRTnyc9IQl1F1mIm+CGwTNQQYLwJqAK6srdzQQaujYPopskoipQGgem+
 /asRveSi8f7vh0MUG/s26igLOLAJKg5lAGqFS5nloEhjVEGhDUs4TJMTWMqK4mH2DG1t
 YMlNsfK76eOFGDXuK0xnAWxXjWuaLDjYI0yXssCvxP9NctTXmCOhTlWECXeDz2+NW2ge
 tZ31cTVJvy+D9RA6G/wHyrHk2OQNRfJ3/VK0sgA8EYOLWGEd4exl3VYjw7P3lIuITr1h
 IEZQ==
X-Gm-Message-State: AOAM532IjFw8BN0TqdiGORgzx7lzfRQ8/+IWFj0kU2nZUPgM5JFvajlu
 NyanVRSm/eZpBw2jgTx7Wnk=
X-Google-Smtp-Source: ABdhPJxpHBkYwAJ+XvKc5x/tcTpNPNtK+YEus7t1AczZZ34NpQEqBYx7vPnrsjee651YbGOUKXPm6w==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr25087638wrw.361.1620553064970; 
 Sun, 09 May 2021 02:37:44 -0700 (PDT)
Received: from [192.168.43.238] (45.red-95-127-157.staticip.rima-tde.net.
 [95.127.157.45])
 by smtp.gmail.com with ESMTPSA id t7sm17259450wrw.60.2021.05.09.02.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 02:37:44 -0700 (PDT)
Subject: Re: [PATCH 08/72] softfloat: Use float_raise in more places
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6749b0e6-09dc-87d4-0ef0-abb37761b76f@amsat.org>
Date: Sun, 9 May 2021 10:34:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 3:46 AM, Richard Henderson wrote:
> We have been somewhat inconsistent about when to use
> float_raise and when to or in the bit by hand.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  fpu/softfloat.c | 87 +++++++++++++++++++++++++------------------------
>  1 file changed, 44 insertions(+), 43 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

