Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F845BAF96
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 16:48:34 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZCdt-0005Az-05
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 10:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCSy-0000wd-Hd; Fri, 16 Sep 2022 10:37:27 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:45690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZCSw-0004ZE-Pm; Fri, 16 Sep 2022 10:37:16 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso20494576pjd.4; 
 Fri, 16 Sep 2022 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=vcvsZUpJWHPMkraQWN0s9tUJHFYUik65uBj1LFzhKHc=;
 b=bgGsXorTyxzXWx8phjVP1m0XAbaXvzjIUW+UiCYclOW/uS7zKbT3Wvx2gfAlrmKjrh
 HkLM5hc7UR5bMF8DrNpd6iVWb+MW4IheMP3mUpjnzxRGOCiXxqpVUODwup2s+3JChgje
 ZQ2zjeI9EYqE7xzJk29nb4+ymgfD2Fd9eaD3tAtJKmOElZpfafn0potDT7x39E9kImR7
 BmfoqHV/dG0CEAFo3p5YJCSdp7So9atU35EWZKHQ3YSZ9NjvOrB5Up7MO/wrvlmUn78g
 y88qhauVoe5y4GCqHYuenCr3avjWHCalsCODCpqNwsxMAEDhFtbd6Hvb5XXW/lM2P1ti
 E6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=vcvsZUpJWHPMkraQWN0s9tUJHFYUik65uBj1LFzhKHc=;
 b=a7D2roBtPyoW7viz4AKgrMO38BtH9kxSGycFOsj3a9dnvJwBWaxUtrVDibqp39Pwzk
 3EN33PNdlrXw2EML737nL5l5jbuEHnoMVDYK4iRlnKpDgKIzZp0qA+L5kD8ZMtllapvt
 7B47UoYKARE+0en1xi/AJKdcHWLls2uMW9hmgsQrkUemXBVPV7E+GCXH2+xygJs1J6a9
 NKn4+CImA1lvmHZ5aYLMqEq7QDWRYovPSRktaXlScneRuGVESDnJXx7EyGoTwBanhreh
 feDYFl6qNGKd4yTPb2VV/Jrrmd83zMWf3SeStKYo9uXCv/+jSkVypO6bG4tI9qb+yclK
 cLCA==
X-Gm-Message-State: ACrzQf2TxIoddWEnX3GrpSmMft4aY5cTiWv5d/vV1luxO6OnkjZj1l4A
 YZfm3hJMYvm3ZXHEes+Z6aEwAYBkYU9e6A==
X-Google-Smtp-Source: AMsMyM7/dqenNVSGiwhIFUzkzfjhvSugRFYKt87ZwGBKu6KGJS8oH47cTO7JAsbciYFizqUqXMOqRw==
X-Received: by 2002:a17:902:e94f:b0:173:d0d:c4f5 with SMTP id
 b15-20020a170902e94f00b001730d0dc4f5mr124595pll.167.1663339033009; 
 Fri, 16 Sep 2022 07:37:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00178682d5806sm4327714pls.191.2022.09.16.07.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 07:37:12 -0700 (PDT)
Message-ID: <1263ad1b-55fd-67e3-9647-2b49421acd34@amsat.org>
Date: Fri, 16 Sep 2022 16:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] .gitignore: add .cache/ to .gitignore
Content-Language: en-US
To: "Wang, Lei" <lei4.wang@intel.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220907150010.2047037-1-lei4.wang@intel.com>
In-Reply-To: <20220907150010.2047037-1-lei4.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.816,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/9/22 17:00, Wang, Lei wrote:
> $PROJECT/.cache/clangd/index is the intended location for project index
> data when using clangd as the language server. Ignore this directory to
> keep the git status clean.
> 
> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> ---
>   .gitignore | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


