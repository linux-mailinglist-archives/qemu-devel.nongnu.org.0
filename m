Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3394BBFD8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:48:07 +0100 (CET)
Received: from localhost ([::1]:34356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL8IX-0001hS-VC
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:48:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL8DO-0000Hm-Ci; Fri, 18 Feb 2022 13:42:46 -0500
Received: from [2607:f8b0:4864:20::1033] (port=50696
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL8DK-0007oi-Mb; Fri, 18 Feb 2022 13:42:45 -0500
Received: by mail-pj1-x1033.google.com with SMTP id y16so1156335pjt.0;
 Fri, 18 Feb 2022 10:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mMZ1gf+sJWLyy0weUMQG4qllNaVlQCHhtLXhqJTHYkI=;
 b=XSg3mE35F/aK/KQbGKT2Z8egvcqtRcFhXoE/vcfFB9Xo1BcXcwGfLUyv5MjT4Yqt48
 4kBXAyE8/7Z46ee5dIeI5XIeVDJaCZq9FDXVwrDlkGquE5k/W8EfepnqEzI4wuuhZNjg
 At506jprEWO1iYMCmC3hS/xAAbbRkXUT1E56zhLeJ7LZlDkvukI0OL+rWkgD1n8dd4Tm
 CyEhoE88D2vrwMyqs5lXu+WuJAfbNONNR3en0dePsA2Y9SzeBdMB1i7QoQRdMrA0JA9D
 Cte/qyjvDQ+/yre9RXCdmSsoMhziu4UYVkoNhs82zKWgwflyHa8g4jQnnjh6iKOG9Bhc
 TlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mMZ1gf+sJWLyy0weUMQG4qllNaVlQCHhtLXhqJTHYkI=;
 b=LR+NZxEk2Zzu2HCLC9lXEKXHjrWy5X4NZkk9O/gTET0yF76Ap7GkQG8LNAipf+MnHG
 M1sclXiNCxa8CCisBNgt59cLCHl72fMA0axjtxX3PKLhDamF1nJ/RuMBagif7nReF4mH
 iS7LkNvjYvdP5pAY0x4NanJk4vUeBbjQPQ2gHBFlPX/zWPe8CnEP4HnlXkS5ZPlpCzJQ
 QKx332npjDIqPSBF8W4jR2dtt0iGj1tWJPHKoaXvBz+w7KpOjbphoNLIcDoZNcXfKVOk
 xg5MVmqK6c3ASnkQ1VphmXa3hhuHoIlIuh71bT7YQsb0s/nwQ7KcwXRvZxWEgbDcy6wg
 nAIg==
X-Gm-Message-State: AOAM532viOD+ijM5hw5WQImU7n6ZhXn+JYlJOz2i7H5wXJqg+1N62P09
 uc045qFtpU8UKcVSm3d/Yz8=
X-Google-Smtp-Source: ABdhPJxWrlq2bvFePosOmVoYlwM7K85IO92gU4QbBVGAi3zWWMkOnxftJk9cuVqWc36xpmQa6a70MA==
X-Received: by 2002:a17:902:ccd2:b0:14f:8182:96c4 with SMTP id
 z18-20020a170902ccd200b0014f818296c4mr2434376ple.67.1645209740221; 
 Fri, 18 Feb 2022 10:42:20 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 a38sm3672689pfx.73.2022.02.18.10.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 10:42:19 -0800 (PST)
Message-ID: <84cbfcca-648c-8e4c-9966-28086acfd5c0@gmail.com>
Date: Sat, 19 Feb 2022 03:42:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] ui/cocoa: show/hide menu in fullscreen on mouse
 ungrab/grab
Content-Language: en-US
To: Carwyn Ellis <carwynellis@gmail.com>, qemu-devel@nongnu.org
References: <20220103114515.24020-1-carwynellis@gmail.com>
 <20220103114515.24020-2-carwynellis@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220103114515.24020-2-carwynellis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/01/03 20:45, Carwyn Ellis wrote:
> The menu bar is only accessible when the Cocoa UI is windowed. In order
> to allow the menu bar to be accessible in fullscreen mode, this change
> makes the menu visible when the mouse is ungrabbed.
> 
> When the mouse is grabbed the menu is hidden again.
> 
> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
> ---
>   ui/cocoa.m | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 69745c483b..42dcf47da4 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1037,7 +1037,9 @@ QemuCocoaView *cocoaView;
>   {
>       COCOA_DEBUG("QemuCocoaView: grabMouse\n");
>   
> -    if (!isFullscreen) {
> +    if (isFullscreen) {
> +        [NSMenu setMenuBarVisible: FALSE];
> +    } else {
>           if (qemu_name)
>               [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
>           else
> @@ -1052,7 +1054,9 @@ QemuCocoaView *cocoaView;
>   {
>       COCOA_DEBUG("QemuCocoaView: ungrabMouse\n");
>   
> -    if (!isFullscreen) {
> +    if (isFullscreen) {
> +        [NSMenu setMenuBarVisible: TRUE];
> +    } else {
>           if (qemu_name)
>               [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s", qemu_name]];
>           else

[QemuCocoaView -toggleFullscreen:] also has the calls to [NSMenu 
setMenuBarVisible:], which should be removed.

Regards,
Akihiko Odaki

