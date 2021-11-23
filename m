Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC645A428
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:54:41 +0100 (CET)
Received: from localhost ([::1]:46208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWFs-0005qg-5g
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:54:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpWCb-0002J1-Kl
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:51:17 -0500
Received: from [2a00:1450:4864:20::32c] (port=39443
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpWCM-00050V-UZ
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:51:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso2309371wmr.4
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 05:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T4ghj0CJQ+lzr5lD8+C1cz7/BRbzYhxY6UpTaDjeAUQ=;
 b=hFpQx8jNhofmluwMHjIn6pV58XbEsztKnJQsGnnNNdgpp0H/2d8cQ1mKhcnOcuRU9+
 mK6/tn0s59l9vy2MC73qKZAcPepn/DQ88AzH12OfZMzs8jQb16PEevnfHK6YUtzDt8tq
 ry19zWYHFrvjt/YqYkZG6wfWw0rNHJGdHBMeKdATzd9Trz5eSynW6NuEXDNaWLz3UZiR
 oYt6/qPP+CD4wuA4DNnu2tQl8CZvfNZb117fOVkwFKuLrGQqxyVfh9n2sJn+D8PYcNbQ
 UEeQDRolAdYUXx/zzik48rBveAWq8+dA6/K3rdWLz+wDXGxQeCxSQltrCQWcBKlB/D1a
 yW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T4ghj0CJQ+lzr5lD8+C1cz7/BRbzYhxY6UpTaDjeAUQ=;
 b=21T8V0l9u0qlPLZpfNtqzQ9sJMqjc6yjvRh2Z2YL+4sbie1JAfgpOxi86QEh3oAR86
 XFww3fwcaZawMNlJb0vEskP5aD4Gdg/BmT7V37XpJf9aIEg9UgG/uVryFHpG4MxsTo8z
 f85pbchirmM+bZTBm0rTxC7hkoMBqXvrq/9+J8GGiyGIGzHlgqMSFgd346AFRuDZygbF
 z+C155qwNaptvMikXhBdKSZdOINSMyy4PWum31qiRkV/zcwXqLxxHUlOe8A6DubprQdm
 x7BsGIFGLiuWSSgxh11TpUJj7rwES+tpy/bVxwRj0WqMOpc290Ty9QUg5zDinVJr+kTb
 NfEw==
X-Gm-Message-State: AOAM530ryw422E70omdEp9PFuPx+7Vd6sicB3eliCnct+sbqxn/A9ba1
 +E6tK6+EDBGMI/hTZKv1p6b2A1XTeYfN9vdTqNA=
X-Google-Smtp-Source: ABdhPJxQbqRZ67wNHn/eXFrcjEpnEQPO6PDURCXIKSol6o+7sXlE4UmnjoL//wyr179Vw+ajhl8dbA==
X-Received: by 2002:a7b:c10a:: with SMTP id w10mr3229272wmi.183.1637675461320; 
 Tue, 23 Nov 2021 05:51:01 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id d6sm12003833wrx.60.2021.11.23.05.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 05:51:00 -0800 (PST)
Subject: Re: [PATCH 1/2] ui: avoid compiler warnings from unused clipboard
 info variable
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20211123134302.45741-1-berrange@redhat.com>
 <20211123134302.45741-2-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06d7e1c4-d267-04c7-35ca-18f677d1ac3c@linaro.org>
Date: Tue, 23 Nov 2021 14:50:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211123134302.45741-2-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 2:43 PM, Daniel P. Berrangé wrote:
> With latest clang 13.0.0 we get
> 
> ../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
>      g_autoptr(QemuClipboardInfo) old = NULL;
>                                   ^
> 
> The compiler can't tell that we only declared this variable in
> order to get the side effect of free'ing it when out of scope.
> 
> This pattern is a little dubious for a use of g_autoptr, so
> rewrite the code to avoid it.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   ui/clipboard.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/ui/clipboard.c b/ui/clipboard.c
> index d7b008d62a..7672058e84 100644
> --- a/ui/clipboard.c
> +++ b/ui/clipboard.c
> @@ -44,12 +44,11 @@ void qemu_clipboard_peer_release(QemuClipboardPeer *peer,
>   
>   void qemu_clipboard_update(QemuClipboardInfo *info)
>   {
> -    g_autoptr(QemuClipboardInfo) old = NULL;
>       assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
>   
>       notifier_list_notify(&clipboard_notifiers, info);
>   
> -    old = cbinfo[info->selection];
> +    qemu_clipboard_info_unref(cbinfo[info->selection]);
>       cbinfo[info->selection] = qemu_clipboard_info_ref(info);
>   }
>   
> 


