Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0EC370E26
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:15:09 +0200 (CEST)
Received: from localhost ([::1]:36212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldFgS-0002Hc-7V
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEwe-0008Rq-FY; Sun, 02 May 2021 12:27:48 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEwa-0002H5-Ah; Sun, 02 May 2021 12:27:45 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so2128224wmn.2; 
 Sun, 02 May 2021 09:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FWt7yBECQLriAxcdWcRLp5gtBtw5D27RO0R9Gai7E6M=;
 b=gh9Zq0uKo6n1JyNb5A+Sn78tJoUZubl/cEXZBPA4FjeWp4btIZRmQzNaa7NXBnKbvR
 BHfUQS0BjFMC+Za+1gmjDnWX8NZ1bTCQ/TDsDoQ84X8zGOeh+B7HiDCpmGcC9uZ6CcGe
 TaPuTMTGxaDyBis7pfTczYQeWVvRHf3TOVt674ewsSKHgHG2xRbrYzZwgHHcQkQuopQr
 xT97EYH0JNz4bDexenVwAmvu7Xkob31u0UsTXgQnGjeTQ5/rbE+Nm7eafdregS3Fc1en
 VmAmo9bMZntIqrbXAJNb/vfxHexJqTHzQsFs6z3e8zJQVEBKmJhGvy+nAUL/49UdMufB
 CSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWt7yBECQLriAxcdWcRLp5gtBtw5D27RO0R9Gai7E6M=;
 b=db9/Z8yKzbjLOa39Wnj33OtatQh+qz3+ObdBEYNzBdQMdPK6i6aGwQ3wxm37Swhs9I
 oWVDBv9wgb/e19RvSvJQwEttsUKIF94IekUh/nwIfp4XLIwDWI2cn/0ecV382v4ifcxA
 wXN9PXZ9O0njJHZr0gsMuyGRc098bvIIU6bHgrvJvNaaEsRwIWPI+OoZ/uCvihhde4KW
 tXqJ59FDmT45vxs6wu7Fh65AS9K3fa0WshW/vHfKGkUIgY4ST1YwrbWgOHIUmLW/HbQn
 gkIfyhST2l/M7jCQQ/eMZA5jD8I/MtYOkjNiUjPE+WNb8EfRjk0OxYGT5m2QJDH5GYtY
 cntQ==
X-Gm-Message-State: AOAM530ETFlQg3I/A4u3uE8MPthwV6UcKfoKugltxsR4DTrAvp9tw4zK
 hDOAaHmscoTo8hL3vS65Q7+ay2gvXn9uQ93s
X-Google-Smtp-Source: ABdhPJyoT5qaMB3XYh9C6DsqZefTNsfAKKljo9DgdRkSCOa0fcsXP5mZWMHfHmkTtWq6vLIrOKA8VA==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id
 l11mr5668085wmq.126.1619972862386; 
 Sun, 02 May 2021 09:27:42 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id w25sm4257220wmk.39.2021.05.02.09.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 09:27:41 -0700 (PDT)
Subject: Re: [PATCH-for-6.0?] hw/rx/rx-gdbsim: Do not accept invalid memory
 size
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210407223056.1870497-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dd370961-09fb-0dce-4527-e7490c9e8488@amsat.org>
Date: Sun, 2 May 2021 18:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210407223056.1870497-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent, could you take this patch via your Trivial tree please?

On 4/8/21 12:30 AM, Philippe Mathieu-Daudé wrote:
> We check the amount of RAM is enough, warn when it is
> not, but if so we neglect to bail out. Fix that by
> adding the missing exit() call.
> 
> Fixes: bda19d7bb56 ("hw/rx: Add RX GDB simulator")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/rx/rx-gdbsim.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
> index b1d7c2488ff..4e4ececae4b 100644
> --- a/hw/rx/rx-gdbsim.c
> +++ b/hw/rx/rx-gdbsim.c
> @@ -93,6 +93,7 @@ static void rx_gdbsim_init(MachineState *machine)
>          char *sz = size_to_str(mc->default_ram_size);
>          error_report("Invalid RAM size, should be more than %s", sz);
>          g_free(sz);
> +        exit(1);
>      }
>  
>      /* Allocate memory space */
> 

