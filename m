Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC133A0EF
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:14:45 +0100 (CET)
Received: from localhost ([::1]:47934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAeq-0003sl-L5
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:14:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAIC-0001NA-Qo
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:51:24 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAI8-0007yc-RV
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:51:18 -0500
Received: by mail-qt1-x82e.google.com with SMTP id r14so6500913qtt.7
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tfa67K4zkw3n9C6DkHkVVbO3l9MhREAp6jMpon3ZC8s=;
 b=E4cRkBCoPcCanHGBenofW+JxHjSaNmCW8BFISKdhkTlhRvZX9xt2XTWc+SH+Gc8/1K
 6PP/dGpxGfwB/lq245VxC7Zb7GExVMn0Ei3XBlce7bDDtjmxHGLUA57efH56r8oV2mpY
 cTIe0SyL6PgKjUYK2WHbo0emVUWEcWeWwk3u+BxkC7F3Uboivd2WLwnOrjdStctXD0Bd
 mV/LwxPpPUI8Z6ZHwarOuIcXKrRJ5Q9fIboDm70yX0Vmxq65HYnIWsLC1SdQObZNdj8T
 bsxtLcBSYV4GsRk+kHu/K4PiYec3JjguULpNv1vzP2DSowIDMlRyUw8geemlVPnF43fH
 mLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tfa67K4zkw3n9C6DkHkVVbO3l9MhREAp6jMpon3ZC8s=;
 b=ZPT16vrJrg0Vi2ZKIZGudH1MMn9SQWrnr/2ULYLE3o71MGoIdn6eorLpbqAfMs9WW4
 P5mvLuSan0CNXrvpoXedsNQDwOYIr1424HYC/1qOf83q0tZuU9wwBYWsoexuzh5MuE9K
 gMi7mmdUZE+vSTRqZes0E9KhRKzT/Dx6C/JE8JzbF8uPHOkeYrBrP/gralawy/PdLiw+
 o3nlVBRUxpmg0WIH6O8aRvKpqfb95yZ8omit7a/cGiY/tetK0OmM5YtxEpzyvO/hIthi
 ZxHrWch/A6YdUE7BmaPcyIl2KdDUvDHku0vx2RSFdK0r7zpkk4cn3y1igambii/Lt2+q
 sqTg==
X-Gm-Message-State: AOAM532L4RTptoxDWXJjE9y2RNRTvMrftlSML/7+bITFr0YxqFAWY2I9
 e/cDbreoZkGECGzXZjjEfplkBQ==
X-Google-Smtp-Source: ABdhPJx0F6YYgfsCoV5zLqZagcdtQXM+InaaODkrgRO4GDQNhI+FR1VORK8XqRfNcei69bSyOHjwdA==
X-Received: by 2002:ac8:7a69:: with SMTP id w9mr6637978qtt.60.1615665075675;
 Sat, 13 Mar 2021 11:51:15 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j6sm6126572qtx.14.2021.03.13.11.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:51:15 -0800 (PST)
Subject: Re: [PATCH 01/11] hw/misc/led: Add yellow LED
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c8f057a9-84ca-9f33-b4a4-aa6e493e3e45@linaro.org>
Date: Sat, 13 Mar 2021 13:51:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 10:54 AM, Philippe Mathieu-Daudé wrote:
> Add the yellow "lime" LED.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/misc/led.h | 1 +
>   hw/misc/led.c         | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


