Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F4391FC5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:56:14 +0200 (CEST)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyhR-00045x-7M
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyey-0001Dj-8t
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:53:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyew-0003L1-PE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:53:40 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so888216pjb.2
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zTA21D+JWySKspDJ4H8EgaTnAwY3lJHRwUrsCHQAU/U=;
 b=AQA1vJYVpRVZV3SSV65F41CFrbwLwEIhyBbXjEkJe69+TnZwBwWuhA8DbwQUABbIRi
 eVZmTbc536klTcfLi54A0Obd9+hqiFMhAQ4tNP62BKrQcalpDM4WpUR6Y5xxy/O23S5W
 6bBCE5FNeDqG11GaCNC8ushDi6zrBE8eXlfw9530sEWkkZG9uUQ32e7ExNKqDXX89MI4
 GSCVPj0VRohdqZ2M6xMLNAYJt6fW5sl8Z/hoO3QdbjiNW4LPpJhqxd6KMm6y1KXz2g/O
 T3RhWBoucXSzFt8AIq6USKEjDdHXXrXEnmJtocvkJy3iyO7S61UwC55hjixOf/gFe8zP
 sRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zTA21D+JWySKspDJ4H8EgaTnAwY3lJHRwUrsCHQAU/U=;
 b=q6YQAZPjMR1JY9Tf2TpsPx5EalRrbIMF34qPipF2a13xG8vdSad+KN5eaYlAa8yVoX
 LsiGAWIm0b/mstlYPuNLgPPyncDDGSIV23Y1ZdyNrTsd1uXBX6S0L4nQcc6t23tfdohv
 EHvKTJTdG/93cS+7Sqepz48PN2qW4sx4s8gdBBHP9ZsGX2eEpDPQPpmfiWMbOhGtcXgL
 phwysBtZIs80KhiLW0g9GKYoQtZuCbZLE08YgA6IUU59xzca8vabwPb7skdrwlDnM6+J
 F1HU1c4yBq7vGtg0OZzfm54rvbGSB9wHu+LIzmZbqA3r5ir64ReMiSZ+1F79sfCMEIfv
 ru0g==
X-Gm-Message-State: AOAM530HGhzA/huRtnGJ44zfluujoKMUcGB4i1ROGtQwR6yae5/x4zT5
 3NOotSZtn/9zfrjn8bD9JF+xaw==
X-Google-Smtp-Source: ABdhPJzFZtXhniRaCqivRV2uOzZMSxsPAbx9TQOwDV+yB1frRoVTsUu3dWIKqzaCiZ4xAY10hF57rw==
X-Received: by 2002:a17:90a:8911:: with SMTP id
 u17mr37623770pjn.165.1622055217411; 
 Wed, 26 May 2021 11:53:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m14sm16487416pff.17.2021.05.26.11.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:53:37 -0700 (PDT)
Subject: Re: [RFC PATCH 06/15] hw/acpi/memory_hotplug: Remove unused
 'hw/acpi/pc-hotplug.h' header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d87e027-1b50-c508-084c-f01d3addef80@linaro.org>
Date: Wed, 26 May 2021 11:53:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/acpi/memory_hotplug.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

