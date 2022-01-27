Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5390B49DC14
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:59:29 +0100 (CET)
Received: from localhost ([::1]:40338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzgm-0006Bw-98
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzTc-0004MM-01
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:45:58 -0500
Received: from [2607:f8b0:4864:20::1033] (port=42751
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzTa-0007oZ-Bd
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:45:51 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2111282pjb.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lCw9ta7n/I3HwQtTQCyrjySl200ZQ46KXG78jOurB3I=;
 b=VRQGfFF91Nrgid25w74d9gDTQID0/PId2p1VzfNi5gCUHx3adSBKh73xDdc0KPj9QM
 J4zE4lgP9Wkvisq384N+Esa9UiSR0D126kUaAvtpv53wAzAWlyW8nvAbDLLjhK3zXFrA
 bgaUfhng4dELYAq3JXxRSQRCtCfISF8tDFbNpiew7cMygfHDHZ9ma2W+H+gsVAaQ7O3b
 KMZb3Dyy7KZNuoYXbGnwXjhExxDaD7y5EMv8ovwb87qwSZmfJOkJ48eUNXhS1FAI0a9L
 TIgrcirILC/QMrXNhGGUF035HUWCA2Yu6PvBitd78+8XahH5KabWlcsLF19UDAd5wc24
 4Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lCw9ta7n/I3HwQtTQCyrjySl200ZQ46KXG78jOurB3I=;
 b=Cz7UHL9cN7ctOqH8oiFpWwBD15TXyQxweXT735x5Gr+XBQAJqlFrBiIL5AvG943x9D
 AJvRR9bEVuSWV9jabGWSTFh0G2WSs8tj75obYCmBoARPbhD2BVxfzg2FdNJMENM25E/w
 18/vnT+XoD/1afem6BWR9G7vsAtLqdfbayHUqgc2ujUHHRPottDVH/VCfHgs+BkAF2+6
 S/rchICrGZ9bMnyVEhziR8nwtCmz8vMbX1GTdOMpP6BK7Xfebk9rNRE82zVWIUgiTBR1
 wTL1eNo9Yv9kTAFz4Oxm14BSNHXvEsiVQ7X5aYXu0P7+YxlfBHR9VedYrB3IY+Dpz3S8
 kSPw==
X-Gm-Message-State: AOAM532Nj9aF78u8pSVrYF0jVPNeEBXx9PPEgoJpkS5MeNz96JbT5uI+
 ME5b4HoNmS1nSdckbWpAsxTZxw==
X-Google-Smtp-Source: ABdhPJzwERGb+Y1mBcSw1yQ2i+fuwXlIUp/hABLvISMTq+p8lyJ6guvww18KxIU5OJOWKL5WKUMZJw==
X-Received: by 2002:a17:902:9a02:: with SMTP id
 v2mr2707927plp.138.1643269548344; 
 Wed, 26 Jan 2022 23:45:48 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id h9sm4691357pfi.124.2022.01.26.23.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:45:47 -0800 (PST)
Message-ID: <a81ec12d-12c6-268b-067e-c5c927d20aa1@linaro.org>
Date: Thu, 27 Jan 2022 18:45:40 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 30/40] bsd-user/signal.c: sigset manipulation routines.
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-31-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-31-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> target_sigemptyset: resets a set to having no bits set
> target_sigaddset:   adds a signal to a set
> target_sigismember: returns true when signal is a member
> host_to_target_sigset_internal: convert host sigset to target
> host_to_target_sigset: convert host sigset to target
> target_to_host_sigset_internal: convert target sigset to host
> target_to_host_sigset: convert target sigset to host
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal-common.h |  2 ++
>   bsd-user/signal.c        | 74 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

