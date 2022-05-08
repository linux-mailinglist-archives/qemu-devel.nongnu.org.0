Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47CE51EB3F
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:20:24 +0200 (CEST)
Received: from localhost ([::1]:51400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXT5-0000nv-Pu
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXQl-0007Pn-CR
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:17:59 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXQj-0008S9-Tv
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:17:59 -0400
Received: by mail-pj1-x1034.google.com with SMTP id p6so10360464pjm.1
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=elR9s2s9TXom3qetYxO64JKKbyNSi9tiVws8BTb60ds=;
 b=zcp6FJ07ozJWHaYZ7a8IAkC+mypieD3L3VVB5KYN5AFh6JpWJj1+qOjKMTFUhTRlYR
 68dhXiHC6bD2fJUT9vb0ZoaYo/Az2HlT097lrlLYWzk3orbcnbIJ2Zv8f7dMAK9s7Hi8
 H0V2ZNlH7m5ocZi7pZmHkibnDtSvTy6FqRSD7jQZqf6o/nU2EkS+v5KNPma1Ewui8Jwk
 O3ilUFkVLDextFN1LGw/7J0/3WAXgnq7e/koiKWUQgE+40e/9PGZSH/PLK2fBSxtK4H7
 nqjc4+XUSjxXK/yjntLsMYV44WcfuoWh0LrY/ye36uCQWMWJNdtfd8oE/uu+WCTjXZMw
 Z0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=elR9s2s9TXom3qetYxO64JKKbyNSi9tiVws8BTb60ds=;
 b=506bjrO1938F6lwxE7OaO0tfkBZ6zU62ObuhDFXj/k4riy9LW9CtPStWU2o4rYEmdB
 XIg54W3j0FVE4Y4kXusNnf6622hOgHnjeBIbi9rUiW2IXW/VDdA8d3wRb8qlqIvLuCPv
 i7nYQJiPBI8FcL6huaYcal8vCr2ZTO6ie2XRqyHj9qWfjpIg5tae0sSN913O8DRMtRAY
 CMHuHgrsIjz3DYTUGsDiRugJ7QDwyaZZyavgnLzZwlUPkW49VVa2ARElhS0VLhvENuYE
 y19jazs2clOazuOmAySLL/qERbCgJSZgpAEfbUuGSxN7jf06YAbwfVdelVS2JT03dzYt
 0mCA==
X-Gm-Message-State: AOAM532T4+AOg4pT8SQXGKketiY3TmQQDJOhgerx+P+IWXKIEzwxrrwo
 YkBAkPeQrq/78PRPxUUyLXRz/sQmgJUR6g==
X-Google-Smtp-Source: ABdhPJxbWYMNKkDYUh3DBGQyvhZBm0fmImpwJ7LtyAdJoFGcFRtbFT+wi6lXKTg+Z7VrA6J3fmjG8g==
X-Received: by 2002:a17:903:40c2:b0:15c:fd2a:7198 with SMTP id
 t2-20020a17090340c200b0015cfd2a7198mr10422661pld.0.1651979876587; 
 Sat, 07 May 2022 20:17:56 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 in13-20020a17090b438d00b001dc1950ead5sm9778002pjb.38.2022.05.07.20.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:17:55 -0700 (PDT)
Message-ID: <052ee6da-95b0-0c1d-d99d-2c3e19423822@linaro.org>
Date: Sat, 7 May 2022 22:17:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 47/50] hppa: remove the empty hppa_sys.h file
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-48-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-48-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> This file is now just a simple wrapper that includes hppa_hardware.h so remove
> the file completely, and update its single user in machine.c to include
> hppa_hardware.h directly.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/hppa_sys.h | 8 --------
>   hw/hppa/machine.c  | 2 +-
>   2 files changed, 1 insertion(+), 9 deletions(-)
>   delete mode 100644 hw/hppa/hppa_sys.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

