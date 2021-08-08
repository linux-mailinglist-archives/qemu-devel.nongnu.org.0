Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DE33E38FF
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:21:26 +0200 (CEST)
Received: from localhost ([::1]:53512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbFV-0003my-T3
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbDx-0001hC-4a
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:19:49 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbDv-0004Gc-Q8
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:19:48 -0400
Received: by mail-pl1-x62f.google.com with SMTP id u16so12890599ple.2
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tvUxrQD1PTGGMC5LERbzRbZlWlH2E5ffY02ZgZuYex8=;
 b=kj7q+EcG5PQOOqGN31vTLq+/R+3DkmiqCdcyq0wJj5QJspbIcDpRF/AjVud9zXdta0
 7Dil7sCBNipbNVCukjjMFa1dNh1sAszAD9/mJxfvRb/JzJt+YJuAcrRRMQezVg4LQTiR
 R2+7dyBLQudJKwQUQdWInBFU7xuSI8mKP3knfdkLxWHms67mgTPgwcDqE+RjbQI+RcUH
 srUUp70mGdNFrhu3nEcKUjjKFZUL4glGFS99MMNukEmlAv8/XKQC2xw9lS0TjprWzX+C
 LrUXgbKFmsmJ4UDSikld9VgnuUpLvXoq0Oba/l0UJwtgmQoK0LrwwkeJoyY5bvcER77P
 GN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tvUxrQD1PTGGMC5LERbzRbZlWlH2E5ffY02ZgZuYex8=;
 b=dq3gMYnHftpTVQvg9mOrxRQj3hH+YDLeU7zhUpSd+0psY7z16bXcGqoRO0v64eyPxx
 uiRdptXXu2uvDdCwNhW+2D8AmW/gBPlhWF2UZA0d6ao2E5qqhSK8jLSJqOzBCaBBdI1h
 QqDQcKriyiwQSio/uXoQjTN9sbjnQwiGRWy9RVetCexrHiRzg4psw3bwfEQrMoQuxg2s
 PGfOAKqh0FA0/aLRLIM/ayE+Q3z5l3kVG99RLGf/BEL758bCaXNRZJKkq/pnSbSzLdEz
 qPiEPQrtMrXesbQH6wyp77ap1jCwBawIpFEatZXnK9OLnkdAH2ZydXPFnPIEH5fClGgz
 0MDA==
X-Gm-Message-State: AOAM532Kew7UFyhn474HMPFqjNe3a+Sz5KYSzUAfQdWZ0fW6PslcCcZs
 wdWL4kQv05QE3Q7ZR8+8DlTqhg==
X-Google-Smtp-Source: ABdhPJy8+oT/zpO2p6Kj0Vqmo3nfMhCVX4yuUS/GNJSrHuXAdS7mN8V99enNwK/1t4d55e6BTMLzWg==
X-Received: by 2002:a63:fd51:: with SMTP id m17mr59127pgj.395.1628399986608;
 Sat, 07 Aug 2021 22:19:46 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c27sm15865152pfj.34.2021.08.07.22.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:19:46 -0700 (PDT)
Subject: Re: [PATCH for 6.2 18/49] bsd-user: add host-os.h
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96f13c01-fd41-89e3-f24a-c42d464c7acf@linaro.org>
Date: Sat, 7 Aug 2021 19:19:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-19-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: kevans@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Host OS specific bits for this implementation go in this file.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/host-os.h | 23 +++++++++++++++++++++++
>   bsd-user/netbsd/host-os.h  | 23 +++++++++++++++++++++++
>   bsd-user/openbsd/host-os.h | 23 +++++++++++++++++++++++
>   3 files changed, 69 insertions(+)
>   create mode 100644 bsd-user/freebsd/host-os.h
>   create mode 100644 bsd-user/netbsd/host-os.h
>   create mode 100644 bsd-user/openbsd/host-os.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

