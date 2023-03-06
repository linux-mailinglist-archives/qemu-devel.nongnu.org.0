Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8B86AB9E4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7Bt-00039c-Od; Mon, 06 Mar 2023 04:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ7Br-00039N-Fd
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:31:31 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ7Bp-000133-Mr
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:31:31 -0500
Received: by mail-wr1-x430.google.com with SMTP id r18so8087654wrx.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 01:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678095088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sy/6usdOUvVnuITyEJdak+CMe+arNWSR9mojW9w/dxw=;
 b=swGn59mF0QsZxZcTanJcufFjB+vyemDJ4ROyZDN/VK+d3Y9vy+KL4LBsBOKTr1huYD
 6qMB/+70vtWXz6kPJQs39/2hdtf5Tt+7Ao9fc6d4e/2DA53d4EiLckr5v3OewI5gIkzo
 iYlzKE+KYjd6a7Xp23/D1cFxCvZCHJyiH2/HJpApjq7ZDhwoRUYrAjqo2umPmRdB37Ig
 xpClUPNaK6dNioYXnn9wWoVWwq1petkSOI8WwmO6HI1ZsZVpjMhmAQjul+e9jb+g2I33
 QDf9jKgodgCLzVqXuMSf81N5MyLI6dzaVqyVMFdVaT0STi756WyqZEt5jDjsWLIkAv0/
 Ai5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678095088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sy/6usdOUvVnuITyEJdak+CMe+arNWSR9mojW9w/dxw=;
 b=U/t4vvn5+sxtNrKRt1gRnlnBf+xJYzPZuiBi4HA7d8k+ocCvseUZg0jHo50UmnHMwh
 2xWy0KebK6gFjXCYR2Uf2YbrdN1/udHjGl6lAhhiBdqCbivfeEokpKQmpa8p4Gq2xx6Y
 rXkNsQ7Ac0iuad0hFpo2ZXomodElgtLrtNDqZjIIFcxc5Q4qbIUBC1/Jwjl8eBR2rLl9
 KI5EC7o6ysvZLryQnUBFIjtFAEL7ciTTXCKCe8l1BOAuntGRSd45t/WL23IsPWDnGiqQ
 uiZ+hnjov9NFOwsrrbwRHqlqTXYcqN+l7HPKzk0L4y3FtTaDsOaJ7S6IEbkRjTnK1BW1
 JNbw==
X-Gm-Message-State: AO0yUKUvEvgKk4fgQ7B/TOrvLEm+c/quO/BoFqKqMbWvLyJpEa/9SNWV
 Jo6Ei+osbQJS5VPGrnc0jXdmww==
X-Google-Smtp-Source: AK7set8iFoq1gT3HPUnJljfaJoxPRi6p8KR8ZvxFwzwyaVdTaiFWMNFLLxg9C/fnhavUR1YOGfMMtg==
X-Received: by 2002:adf:f389:0:b0:2c7:31cf:8be1 with SMTP id
 m9-20020adff389000000b002c731cf8be1mr6154616wro.12.1678095088143; 
 Mon, 06 Mar 2023 01:31:28 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f9-20020adfdb49000000b002c59c6abc10sm9480710wrj.115.2023.03.06.01.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:31:27 -0800 (PST)
Message-ID: <541532c2-9c92-87ba-b649-3440e65c83c5@linaro.org>
Date: Mon, 6 Mar 2023 10:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 03/16] hw/9pfs: Replace the direct call to xxxdir()
 APIs with a wrapper
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
 <20230220100815.1624266-4-bin.meng@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220100815.1624266-4-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/2/23 11:08, Bin Meng wrote:
> From: Guohuai Shi <guohuai.shi@windriver.com>
> 
> xxxdir() APIs are not safe on Windows host. For future extension to
> Windows, let's replace the direct call to xxxdir() APIs with a wrapper.
> 
> Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   hw/9pfs/9p-util.h  | 14 ++++++++++++++
>   hw/9pfs/9p-local.c | 12 ++++++------
>   2 files changed, 20 insertions(+), 6 deletions(-)


> +#define qemu_opendir    opendir_win32
> +#define qemu_closedir   closedir_win32
> +#define qemu_readdir    readdir_win32
> +#define qeme_rewinddir  rewinddir_win32

Typo :)

