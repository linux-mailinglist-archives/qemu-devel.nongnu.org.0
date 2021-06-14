Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFC73A6454
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:22:56 +0200 (CEST)
Received: from localhost ([::1]:38474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lskgB-0003Mn-Gx
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lskcW-0006Ga-48; Mon, 14 Jun 2021 07:19:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lskax-0002eR-Pl; Mon, 14 Jun 2021 07:19:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m18so14125260wrv.2;
 Mon, 14 Jun 2021 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=si4W+BxO32mr+uUvmrTNUZTvEQ4cRLKTO3yFOrVZNi8=;
 b=OtE6wfNOGWeRbLdo2ma/UQi9Tj1YbSGfzMDni2TUi87YgEUMeNB7Ik1/8SV7pu2uzs
 r+H5sFo5j7JLircqc3iJqwMSP6BGavzvohMLXBBGD9OhLdbqP3IpYNX/pPd+5GjSfwKs
 qdnoVqmkWrLMFsdS0c4rdDAtDvL3TlYSj8W/ZBXilE8GoA0oKY5VdCmE/MDx/f8k1JZ3
 JO8CAxVHUhvX2BWlloYV0JuknBLv2NUCwm12eEz3tkNNQ2005KLWBKW8eTt5fDlD8UWC
 fpyNvxAB0m+4FebY8E5ZZd9Cm/T+zPy7wD5IwoZFsES597QFAhzEpt4D3c63ryWjyKcw
 05Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=si4W+BxO32mr+uUvmrTNUZTvEQ4cRLKTO3yFOrVZNi8=;
 b=koubZuM/2TeH98sgfRApX5+8XMOlwkc322Tde+ojgBvlkpumfY6vsbCK59fRvu/rUl
 NshLRA2lamaF73TVF/Mi0xkX9RY4jlEHciX/3Mg7luFj3vZtE6ZPofsvHWKxDOZ+k/HO
 3NlfEH6hEkV057FdMmaM7YDgKqUEAkqQZ+u/weVbduz1jBUA5N4p7bi7L4eugyHCUX1v
 fgBIWIU9iKTOwqzmVoB3ZkSPkfpq1kzBpmmdUWfPHZuP1eN7swDyR5Fw04MxCqY4bfQ3
 5489Nta0XYb/Nh+2mSgGJy3fjScRd1lS3S6FI1Z0M5uptg9nxofnemXEWh966tw1YmqG
 qxDg==
X-Gm-Message-State: AOAM530WIVkj5a34iVQgWaOW1IE2gUAV/MCrQwzMaI+3CmzyliJ6Yzxj
 Tw5PrMc2gbUQe6FXAZoidtar5UTrXVLpoA==
X-Google-Smtp-Source: ABdhPJxcDsEGhRhy928FdL8MRi2xoU5SEBeYs/iR7PPaH9Os1USwWU7Ze+CLWVARN9BcthZKSP/Ahg==
X-Received: by 2002:a5d:6c62:: with SMTP id r2mr18077574wrz.407.1623669449964; 
 Mon, 14 Jun 2021 04:17:29 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm20403039wmj.47.2021.06.14.04.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 04:17:29 -0700 (PDT)
Subject: Re: [PATCH] plugins: Add missing 'qemu/qht.h' header
To: qemu-devel@nongnu.org
References: <20210524165226.3785324-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <916b0a65-d087-304d-1cd2-168f820331f1@amsat.org>
Date: Mon, 14 Jun 2021 13:17:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210524165226.3785324-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW this patch has been merged as part of commit 824f4bac9ff
("accel/tcg: Reduce 'exec/tb-context.h' inclusion").

On 5/24/21 6:52 PM, Philippe Mathieu-Daudé wrote:
> When building a plugin we get:
> 
>   cc ... -c ../plugins/api.c
>   In file included from ../plugins/api.c:43:
>   ../plugins/plugin.h:45:16: error: field 'dyn_cb_arr_ht' has incomplete type
>        struct qht dyn_cb_arr_ht;
>                   ^~~~~~~~~~~~~
> 
> Since we expect all headers to be self-contained, add the missing
> "qemu/qht.h" to avoid other developers to hit the same problem.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  plugins/plugin.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/plugins/plugin.h b/plugins/plugin.h
> index 1aa29dcaddf..55017e35819 100644
> --- a/plugins/plugin.h
> +++ b/plugins/plugin.h
> @@ -13,6 +13,7 @@
>  #define _PLUGIN_INTERNAL_H_
>  
>  #include <gmodule.h>
> +#include "qemu/qht.h"
>  
>  #define QEMU_PLUGIN_MIN_VERSION 0
>  
> 

