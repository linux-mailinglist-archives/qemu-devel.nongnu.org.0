Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5114A6737
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:44:46 +0100 (CET)
Received: from localhost ([::1]:51332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0xA-0007Ts-Pt
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEwwP-0008GT-3W
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:27:41 -0500
Received: from [2607:f8b0:4864:20::d32] (port=36414
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEwwN-0000Ba-9D
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:27:40 -0500
Received: by mail-io1-xd32.google.com with SMTP id h7so22130956iof.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XOs26yZ/+ZnuUB6D3yFsJLpmR+auB9WNsmN/OxPLeu8=;
 b=wpbvJiTTQWi0aGzgclsEOuQk+DQ7+nFKdRdFzV6oPvTBeoOFfsl0fLTVnUAA7puMKi
 NqimNS+mpMNSgRyNcWnuE8Z6T6rURrJS1hrWy+dVHgt2f/GX7FssxSIkIeM6KVS7EFjR
 UeYLAuimOuylMS7pmShldFRZz+B2gfH06o7TKm5ZdejPPyVtO+q+yeLjg+X7z8rLRYaG
 wE2+h4Dp9srrzuS0YTicumM/r06TlEX801ka9E+Y96OYGO4LbG2U/dRcy2hkeFTd9YG1
 BRolMwIWAXR3fFwawjMj3IxPxwNCx+OdmwXLZcLNTS3CSDMGywmOWOWAwITuJ9KByCDv
 s3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XOs26yZ/+ZnuUB6D3yFsJLpmR+auB9WNsmN/OxPLeu8=;
 b=5sbXsCSmWW1oC4kBnXGXpIRNQtg6MTa2DxkiKhRBWqQzBJK/63Og/JWeN9ToNAWlUX
 bqzxbZwSW20TNTxz42Q0SWSp3hFb1hL9etAJwzzJLdf2s41oUd9WHpXjTkpAsFC6zhwS
 Hz5duO9UZWG+1SAr6TxZYfLuTrlSyT2uN+/r8cFbsLyrKQFoEJq0/Ponz3XnqWiO1AB2
 NPkZn6US72jvoVoNoN6EOyYGOCJ4U8kag2MnrVhSsIOVAiSFfX8UZrtM8D0g6UT6aT7B
 NhFfhRY6I+SoSa8M0SKCCh850mrh3reFvuRDcW7nHVpEeFphu4nElpYXS0qD2w1aggb8
 K9Eg==
X-Gm-Message-State: AOAM532wryC8KAF70XdF7mtbnxhJrrNxe06p+0+kn4xEjots2XlcHsZb
 f4thG1icxSsquFQHNrp/Iiw/8Q==
X-Google-Smtp-Source: ABdhPJx1SJDXNPCX3wUO6jSZWdfTyjElOmLcypl5Br1fCQSI+lqp9qaERR96Rb4d0Ylafj5I6X+S/Q==
X-Received: by 2002:a02:9695:: with SMTP id w21mr7007176jai.99.1643736457203; 
 Tue, 01 Feb 2022 09:27:37 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id g21sm11868983iow.4.2022.02.01.09.27.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:27:36 -0800 (PST)
Message-ID: <234ca91e-b4bf-b1ee-1668-a7917caf8346@linaro.org>
Date: Wed, 2 Feb 2022 04:27:24 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/22] bsd-user/x86_64/target_arch_cpu.h: Remove openbsd
 syscall
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd32.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> This doesn't build on openbsd at the moment, and this could
> should arguably be in bsd-user/*bsd/x86_64 somewhere. Until
> we refactor to support OpenBSD/NetBSD again, drop it here.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/target_arch_cpu.h | 27 ++++++++-------------------
>   1 file changed, 8 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

