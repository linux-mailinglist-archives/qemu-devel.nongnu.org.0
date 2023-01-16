Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E891166C099
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:02:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQ3J-0005FM-So; Mon, 16 Jan 2023 09:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHQ3H-0005EE-Fy
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:01:31 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHQ3F-0000MV-TD
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 09:01:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id j17so1533035wms.0
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 06:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t4SC3LDronBq7O67yFthuNI67hPNRC3wNRgZUFqO9ck=;
 b=CDhP6DgbaUpI/l1/SWV6otiklfDwhk9KRpy411M5Vz2K7hqYCZ/5+o9iKD99pk2gFX
 K46iNsu8SHoq2wj32up48+8UahiqWiuz8AE0OUkRipbg/JKxD/jGBsl7bd/Q/PBnnMuj
 sBGf/5ZTxNh9q/C3ewwGzunA9U0fnWwMJkRMKA9h3ZHfC6Z2YMu6uPVaoPmwNlkdpEW3
 ZeqpigTYoA3m/t2SulbKAjvuPsQdlzxvv7UsQ9igRA2JCJyiDHvpN5/jVYQhRabwbrqi
 MOzgbFpqLnytYtVlqbuyOvQ9LiNs17TBy5SPm16nM3r/i30+GA8DZeVFZbOlmkm3kI7l
 /Q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t4SC3LDronBq7O67yFthuNI67hPNRC3wNRgZUFqO9ck=;
 b=EtU8vVAyzmmUVyr6Pdj9csLc+N8bPOX8117udknANWtECmgnqgahgbz5dEEjav656d
 xBdj3llIM+jio2lvx+8TdlbuFiMZ/prTxsPZtnWQhCygLrwIia1BjEbmbNgYD4ReKZSV
 nmR8MS9gph+hk5o5ksOrs4w3r+jRMp0qCw3haIUOqeIEvacVLMxjTjY5NBKg2ky7fpmI
 70SNoPRyTHHXFW7NX1MXJ7DLbsZXQUSXzWbRF42O3aKjS9A87bll9ypD6LjYuIoHdIhu
 Xp3xnfNk/XXM2dGRKwIKPQb/MUIr6ftArf5saGZrtk3GXBWnicxdPqwk5RxMwl0vevA5
 p0zA==
X-Gm-Message-State: AFqh2kpJHgmeFfpTeWxnvfvQf2NdQox9j0pWYT9HDR5/sUJbEX3Z4H/n
 GRR716w4l1WVukJ2Wr793IBLtQ==
X-Google-Smtp-Source: AMrXdXvtu+0qc7ioecYVNQKdkSIdixJkFCP+XbkaNX2hX/eBWuY81MvpJWHDtg4SA+vc0p8h4NuAbQ==
X-Received: by 2002:a05:600c:89a:b0:3cf:6e78:e2ca with SMTP id
 l26-20020a05600c089a00b003cf6e78e2camr8280702wmp.5.1673877687530; 
 Mon, 16 Jan 2023 06:01:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6bd12ac27sm37891291wmq.37.2023.01.16.06.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 06:01:27 -0800 (PST)
Message-ID: <96def17d-2c66-cfb1-d7b7-91b7a9183bab@linaro.org>
Date: Mon, 16 Jan 2023 15:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] hw/acpi/piix4: No need to #include
 "hw/southbridge/piix.h"
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20230116125842.66817-1-shentey@gmail.com>
 <20230116125842.66817-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230116125842.66817-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 16/1/23 13:58, Bernhard Beschow wrote:
> hw/acpi/piix4 has its own header with its structure definition etc.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/acpi/piix4.c | 1 -
>   1 file changed, 1 deletion(-)

Indeed, since 2bfd0845f0 ("hw/acpi/piix4: move PIIX4PMState into 
separate piix4.h header").

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


