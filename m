Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F34A6660
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:53:01 +0100 (CET)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF096-0000WP-EV
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:53:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx3K-0005xP-6L
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:34:51 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=45820
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx3I-0001M2-Oa
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:34:49 -0500
Received: by mail-io1-xd2c.google.com with SMTP id s18so22105756ioa.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ps0qnp9KhZzw3gXlAIkpCzYSEhXoXIUwQRV4Ae7ZRF8=;
 b=lcEDoRMBiwuJ+z3cKnnRyBERMHrGV2x/7o3nAKtmQdmKtzSQLr3b5MZEUZuSSWo/7e
 ZGwdoaGsMqvsHKMAwEpQ1B6iPvcrMmv0dupQaeeQ3j3Pb6p1VheReu8SWyQ52uIfrYiA
 xydv8D7UMXRHzxlU/vqsIce0m3d+sro2/5pQ3VXlIYOBmcm+ubxli5O4OkOZ0+sG8wi1
 YLmMbBBFw+j6vZCQisKfi87/cqWMzwnhP4wFTfGIDgS0JnD8IKVnhHwyBoQteXsl+Yac
 hWMu9xwxeYuGuVIs6B5ie6bH6gbg96xSHE1vtw23h7x8muCx9LQgJc4HxYSBnZcOeBAe
 piXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ps0qnp9KhZzw3gXlAIkpCzYSEhXoXIUwQRV4Ae7ZRF8=;
 b=JzMIjOWWnVWViFF7o0aN+HTfh5hjM+w0kb4v2hk8I2+nz9ey0qb9dlcpSTfxJsD16c
 C2k7Efxr48Ga3gJjsLONGRBmpN6JKxlRZubGWg33GyeQ3cXaP/K0LhB8gxNUffONzsIV
 AtoVhu7sN2ih0DeaEXsSCoLb02/I+TrxZbJmXqzfJCWYJeVh/uZCV5VUwtOU4Vz0lVIh
 XLP3VZJJkoDI8WA+PnYm99n17CniXq2pb8MSxFwmYIjPotMlA8YzhGB2UwTfErK5rW/s
 hlD8KN9Kd8qMGLtJ58UXn/rM5oP3sU1KqKi1/nIRJXevOy7DBs12vEKCYScRUzgOZrHH
 HdMg==
X-Gm-Message-State: AOAM533aOsMqdIL2STkg78FoLabjEfvm3NJGRmSYdJK7skPuyzuUb2aN
 z++K2FSTyWhRVYHotnBiMLjOEg==
X-Google-Smtp-Source: ABdhPJyoyWyFXsXm0wZ6/7dLiPVzPEqojQo/78D9ZEgsOoIz6WbJkTAPqmsFf18jJc5rR/bbqWSFvQ==
X-Received: by 2002:a02:7f53:: with SMTP id r80mr13668969jac.295.1643736887685; 
 Tue, 01 Feb 2022 09:34:47 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id m5sm6436684iov.36.2022.02.01.09.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:34:47 -0800 (PST)
Message-ID: <ca0f83ea-7c84-086d-760b-eb8adc9f5290@linaro.org>
Date: Wed, 2 Feb 2022 04:34:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/22] bsd-user/x86_64/target_arch_thread.h: Assume a
 FreeBSD target
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-8-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2c.google.com
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
> Since we can't run on anything else, assume for the moment that this is
> a FreeBSD target. In the future, we'll need to handle this properly via
> some include file in bsd-user/*bsd/x86_64/mumble.h. There's a number of
> other diffs that would be needed to make things work on OtherBSD, so it
> doesn't make sense to preseve this one detail today.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/x86_64/target_arch_thread.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

