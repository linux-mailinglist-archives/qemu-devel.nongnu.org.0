Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760711948B9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 21:23:15 +0100 (CET)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHZ22-0006DI-9j
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 16:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHYWO-00041M-99
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:50:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHYWM-0000y0-Dj
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:50:31 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:40029)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHYWL-0000xJ-BL
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 15:50:30 -0400
Received: by mail-pj1-x1041.google.com with SMTP id kx8so2850121pjb.5
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 12:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NIt3XesI1fwrmf2gq8f1RPeRd063M1LoJ8lV3xfzdx8=;
 b=dCZZG4v4KFng5tTEqmxSEI91zPdOllFhNYVPDcQGCeTYYe3Uk/FAOk0zIhH2zbl42s
 55gs/vNkk/VXHwazbwJoeQ0ZOUHFA+tqFdoqNn1N5bEz9xppTBJPwLG6eBkL/YraJTTt
 Bmd4wBXx8PZL7n9s0BhWKmrnYaIJq7ZS/QV2RNEAs8HS5UpvNNN0be4hbjPOvSKvIEIS
 wLrB7ZmWzM0gdyzpq278lcDe5Bmeysigye2wt0TsmxwJ11zW0PcUHgiILx+doIKYURH9
 HmsSBS1lL/l95e/ZGvUPbd58meAmRkVg//4jhSxtlS1hue6ElqAuz7h3xK5b/MGarkLr
 Walw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NIt3XesI1fwrmf2gq8f1RPeRd063M1LoJ8lV3xfzdx8=;
 b=qhSD/JgBqvPSZY4d/Q7lWWmGq20ZgMAqq2gs9t1/oRSEpnvhNNDi6qVg6BPe/CAkvK
 NEuFPumkuN81BT8qUZnYtWWI371fyYKmylZKPutyi2aD/7Y3fZm4vI6/QbPNcE707EQ6
 qObSpeHp4gltQVhUMQVjKHwTU+Qez+wxJIjK6izt5SMZqZoK+nbPWocCc5MAa1XIm0ta
 eOc7Q6hv0+AbPPtm3pHyP00tFdkYKFokHqteVT35yZSimmFgybwwe1WM/Pd/o63UAslP
 +GUGMjoLsImT7K15kUltJNc7acUQIAyhZINuuMlzRlWfhXKa5iIUuSyZoo9jyL50uCKm
 bk8w==
X-Gm-Message-State: ANhLgQ2OrFehRTbZopeoNjcw86T/FN5lCiMe7nFFz8iiALF9UZq4EAqs
 CFImr8+X8Z+Ux+0Qo8gX1Yw4gE+yu70=
X-Google-Smtp-Source: ADFU+vsnyTpqw8/Mew3glXO1AiZEQZdeZ/2aRy9WAB1L9xdBn/7DB9XOyaPDvbYL1KgOOkbjlG6JJQ==
X-Received: by 2002:a17:90a:1910:: with SMTP id
 16mr1763874pjg.119.1585252227192; 
 Thu, 26 Mar 2020 12:50:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id d23sm2300358pfq.210.2020.03.26.12.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 12:50:26 -0700 (PDT)
Subject: Re: [PATCH] gdbstub: fix compiler complaining
To: Denis Plotnikov <dplotnikov@virtuozzo.com>, qemu-devel@nongnu.org
References: <20200326151407.25046-1-dplotnikov@virtuozzo.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04cfc174-2fa3-86d5-ceab-7233a4560477@linaro.org>
Date: Thu, 26 Mar 2020 12:50:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326151407.25046-1-dplotnikov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
Cc: alex.bennee@linaro.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/20 8:14 AM, Denis Plotnikov wrote:
>     ./gdbstub.c: In function ‘handle_query_thread_extra’:
>         /usr/include/glib-2.0/glib/glib-autocleanups.h:28:10:
>     error: ‘cpu_name’ may be used uninitialized in this function
>     [-Werror=maybe-uninitialized]
>         g_free (*pp);
>                ^
>     ./gdbstub.c:2063:26: note: ‘cpu_name’ was declared here
>         g_autofree char *cpu_name;
>                          ^
>     cc1: all warnings being treated as errors
> 
> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
> ---
>  gdbstub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

