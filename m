Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A6494341
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:49:11 +0100 (CET)
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJlO-0000aU-E1
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:49:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAJkX-0008Ko-9o
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 17:48:17 -0500
Received: from [2607:f8b0:4864:20::629] (port=33737
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAJkV-0002DP-Vd
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 17:48:17 -0500
Received: by mail-pl1-x629.google.com with SMTP id f13so3626646plg.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 14:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=izMjAQZXZf6mnayhnOJsB/LflbRNCYfJBx+ZxaNhU/E=;
 b=QqXU/w8M1c98548g7fo9K7ISoRg6rVq9D9/yzo2fP6q8HyGdw6nzB994uigWabUchg
 DPK+9lsY5dxP0r1PL5lUdoErIGgvMNWjElgKuUegQXWgPSIEmWdWew84YUxKseIbt13b
 izbQa38C2gJ/qBlmawwPwwJEAdWzLk7/5TQW889fXUgTIUrap+W/G9cN8kb4ev9E9k+O
 pcvxD5C59/dy/VjCxohFjd3dgNwX9+TwecsplXD9aIWAFg1rfA4dTCNdX+D5D2ccInPo
 hPVNoE9obF0oXR4MY2IBFBIBTIB94KazP2WLNk877kucOtKf3wQFL+0nqRqOG8gxvKHx
 C/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=izMjAQZXZf6mnayhnOJsB/LflbRNCYfJBx+ZxaNhU/E=;
 b=jwCAr5JmyctEKhVXJkYJL0DKAM8cpYB+z/LzF84dnzEX0/CJYbUh50Hsy9waABOICl
 oKtOz1bZb8wQLFCuLSe+bb5BSQc+6yvaiy8WUcin2oDUKIvqB0w2rsuG7A6Ln/IljTOy
 NRqlDkTkKbaYl+kxExblKpNOUM4Cac9yr/HburqgCosK8Dsu5775NUV9mTJEyqWN634v
 +pznx9PuqJL4YZw0A6nOSwqj5k9JcxFw7N32GlA+SRhb9mnuTJ4xFgNJgKx4HiVKW9gP
 +sRT+Wovg6kR4zI9RQ/BxOqczMYeMKIfuigoNBs3foG7TjgJo0RF6kIzQK+vxX7/jAsk
 QWRQ==
X-Gm-Message-State: AOAM531gqaOxbM5D2YPBS6vyKSLhOk7fc9y4VIVxJuMhZ4J6lLWs+cYp
 S6E8vWvQVTqHNLzX+EuyNcM=
X-Google-Smtp-Source: ABdhPJxkio/IF532p5J9kSkhOBchil7XGi4cJNyCAbqUHzYAqQdYd1178tVVcvozUqJon42TenWZlg==
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr6936096pjd.151.1642632494747; 
 Wed, 19 Jan 2022 14:48:14 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h10sm662174pfh.49.2022.01.19.14.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 14:48:14 -0800 (PST)
Message-ID: <235e4428-fd53-21ff-c7e3-9b3f5ba9a893@amsat.org>
Date: Wed, 19 Jan 2022 23:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/nvram: use at24 macro
Content-Language: en-US
To: Patrick Venture <venture@google.com>, philmd@redhat.com
Cc: qemu-devel@nongnu.org
References: <20220119214329.2557049-1-venture@google.com>
In-Reply-To: <20220119214329.2557049-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 19/1/22 22:43, Patrick Venture wrote:
> Use the macro for going from I2CSlave to EEPROMState.
> 
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   hw/nvram/eeprom_at24c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

