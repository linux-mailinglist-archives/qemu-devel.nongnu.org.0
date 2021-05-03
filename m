Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC0371089
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 04:32:08 +0200 (CEST)
Received: from localhost ([::1]:38790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldONT-0004ky-AI
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 22:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldOMP-0004KK-Ox
 for qemu-devel@nongnu.org; Sun, 02 May 2021 22:31:01 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldOMM-0006LJ-1M
 for qemu-devel@nongnu.org; Sun, 02 May 2021 22:31:01 -0400
Received: by mail-pf1-x42f.google.com with SMTP id m11so3130628pfc.11
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 19:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eleHVou0WZ4IgVj6E+fLj/F2KWHwjk2+8FQf+wc90g4=;
 b=TG4mcmFu92iTrPxUK2Ij9BNYFrfhsDiG6feIycmn2QLKYAT+IbuI0odNBPx3MmIVxd
 z5i3oc1+jFcvwU7a53Oc8U+zxgXFthS3R9QQviUgVXpJOngk/w5fijeV5OX0Lb9kurW6
 mvc4YZnr30FSWIEq0JsYLosInz56ygWoSLwRl87X9fGTPE8Er+8tF9kst3X66DnLD/wX
 ZC2J/uiU2IGE8JXxUNfmz9Kt2r2JG+3qf5Di/90st2Oq6gmCazRv9MGyR109SkhqPTg5
 OWwRsnQe30tJxkpKJO6giiPiLiLA3/ze2ar/ZdEYHP3jzdKYgDLZqWLJuL1+XhgCzZDz
 t/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eleHVou0WZ4IgVj6E+fLj/F2KWHwjk2+8FQf+wc90g4=;
 b=UI/HlqobwE1JDCtt704+LO1F31oeyUduOHJLpvOl5QsYSvmqN42ZcAQpkB6ujr1ZNc
 R8gkyPXG6bUOuqZbU7HJyEjgepWjd7s1xbJ1ai5ce00KYjC6Gb18A56642tjfIIcwnyE
 zqPYXhTt3UoeBZCaqJu01zqZWJglve58NPWqk0kLk7vR5XEBNiNmxaHxq3dolIzB532j
 QrIn2O45ph9U4wb3KRnePNaErX87LfMun4RbN+A4feTFezAgK2q/ckGxNwr4iPdE4bYI
 6xDLMQU1c83J8H2qJXe9eJfK2ef8GzyTaWZAKXIJiALgR6Ri5rzrVd4xrjW+AB9u9I9o
 PIdw==
X-Gm-Message-State: AOAM531UgaRbEnwR8sHKIMrF7+MuXYrzs0A/vxFo75AkC6A2AvUqzpwA
 Tsa5BEKN8uLzpWCBKx8LGbUGIA==
X-Google-Smtp-Source: ABdhPJwLlECUMUy46/ySOWO/NQrRuG/ZGOgme5kyevitE2XzqDLlTKlKfs422RbaxZodCkkM6swRUg==
X-Received: by 2002:a62:1b97:0:b029:24e:44e9:a8c1 with SMTP id
 b145-20020a621b970000b029024e44e9a8c1mr16905285pfb.19.1620009056151; 
 Sun, 02 May 2021 19:30:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q27sm2058977pfl.41.2021.05.02.19.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 19:30:55 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/usb/host-stub: Remove unused header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210424224110.3442424-1-f4bug@amsat.org>
 <20210424224110.3442424-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <957acd0a-19d9-98bf-9ae4-1a84ca28fd59@linaro.org>
Date: Sun, 2 May 2021 19:30:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424224110.3442424-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 3:41 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/usb/host-stub.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

