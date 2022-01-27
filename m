Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C55149DA90
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 07:22:48 +0100 (CET)
Received: from localhost ([::1]:41782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCyBD-0004cu-ED
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 01:22:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCy69-0002Xc-K8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:17:33 -0500
Received: from [2607:f8b0:4864:20::630] (port=40671
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCy67-0003H3-A6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:17:32 -0500
Received: by mail-pl1-x630.google.com with SMTP id y17so1633148plg.7
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vAL0dvkoPRt1QNaBJ32TQCK4sRd+iwM6qmNJtrqFdyI=;
 b=MLqColQypcGQs0DuGUJy5252t26pdU3PNjeL4f6VGuaXBdFllcNZbxe5tK87KlADIq
 upxBofLwDhifKjPJ3WlYFKcWU+WuXIseimW2KHyFKNd8FjH1yaa9yR1Bud8wDCERXC8z
 PYpc/VbVca0vX84OQMyQITuO0BbNS9laF0gNFtppu5AhYciMcmC28GBlpHpMaPNGHeAX
 lLpYaQyz8XDX/rnv9uemrlddus/idq35YaJw6VIL4oI4FqHLufqBn1KaqNBzMTWvv3ud
 piaWp6bD9QaDxNgrC2I/cuiRHIOBzT/bSXY5V6/YsO3FxIp72Z7dE+pK3RPuRiNr2Hl2
 YTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vAL0dvkoPRt1QNaBJ32TQCK4sRd+iwM6qmNJtrqFdyI=;
 b=6TdQU/8aNZUjx5IG5Hdu48D840uOu5FTXPT1rDJlYHYXNEoI1c2dqGaeH47hEikuP9
 Wn/kGsfsEQpFN4bqfVuIZl8SgXlKnbSN56oJYegx0jHPeSauMf6LC1/veECVANssxSH+
 +BVXfWruQyAOd6z1Sm+kvt7+3L0LAz6kGD1WskHnnCeX9HCLY+Y2o4FGAkgNi7XuNsm+
 QB/+E04sziUFwRlGzKY9RZpi5XRAZ/6BCBvwytQkPi7qz1ScrrCCjdvMoLvnHLVLNalb
 Lg6cBzP+1ix3pNBUsbUEb0hzwvLqlCIa4m7rJFQuHh59KTQurSaKxOGBzQ6mYRaSCfqt
 AOvw==
X-Gm-Message-State: AOAM532ZAg8yja/aHt65bP84IQxJNxfUr6kD5jZ4CRQfA+z/0v50VWE0
 ZOvVQVD/oUAFqQHFx/Oq43NAf2go9rOGozQq
X-Google-Smtp-Source: ABdhPJyrya/Pa4ajGHZW+T214d0Ttu8UUCxyUYkHftfdg6paSJAyKetDZIUYTh+Lvy86OTZ7i1wHwA==
X-Received: by 2002:a17:902:edc5:: with SMTP id
 q5mr2297347plk.28.1643264250001; 
 Wed, 26 Jan 2022 22:17:30 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id g1sm4102239pfj.58.2022.01.26.22.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 22:17:29 -0800 (PST)
Message-ID: <c0ca39a6-1ef8-3174-c1a7-ff6fc3c9b945@linaro.org>
Date: Thu, 27 Jan 2022 17:17:24 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/40] bsd-user/signal-common.h: Move signal functions
 prototypes to here
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h          | 8 --------
>   bsd-user/signal-common.h | 6 ++++++
>   2 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

