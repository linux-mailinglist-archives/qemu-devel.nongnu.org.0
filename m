Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F38549E2D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:56:42 +0200 (CEST)
Received: from localhost ([::1]:48058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qAz-0002Yj-4u
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q77-0007wS-Ic
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:52:41 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q75-0005Qj-Qq
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:52:41 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 15so6661194pfy.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zo+TkXJsLH7gKpZbSnWgUBwhUj3KRr8hXZCwbigWRhs=;
 b=aJePBiS3YI5N/RG7AQOF2arf66tyjToNRqrNagtarSIY2w2AA8sjVpXnp1tKtO247h
 swg5jyXs9dxU0/LjWihhJPvzCghBRnC/zYG+6n9a543nqd/n79BD8T9nB42KgmDo27Th
 1eozX1ySNoipVV7DiwcplyjgYKgZl/g122YWdTqhjJF2iydGrKyTa14Fy7OxBZD8znEB
 ELjG2Kh37vPP4qCT/bsXMtjGUv/TBQwsYcNslhF4RRzh9XWSwkwugvXjNXUuLkytOsAG
 w4Cc7Yz6CT30EAKmKBAfzH/FAt0z/rPVZq54xMF0EJ+TWn3DZlKcVZyxm+MZn4n98yFt
 xGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zo+TkXJsLH7gKpZbSnWgUBwhUj3KRr8hXZCwbigWRhs=;
 b=YQxI5fu7l9n994g7dJvi+tbHLDzfZI4+8qxgXmAhXbNLKhQLZzfGAMK16XsmMBYIlP
 2KGaS02XDQFXDcJgC0oufDRBoK64NQXqiwQ6cE4kYwnKXt6xtY685NdlKC6nDpYelCuG
 yCPZD7d0EXyCZ2bFAQfQDDNpk7PGzxt3TwcrKW+EaUXonlyLOovfDdATu+8HeLOlSwJl
 rohA1RVKQ3D2G7/Ib5aRxmIIEz5eVyPX1s0gAwDvVA/MhE4sMH90DLISAEa3NRTs20rO
 VwRt0ezgQRw5s79dyYb/oOXn/qRFzX1L1IDZKahFoS2tPZA/uZaeJ6BzKNxxDapR3dgw
 0whg==
X-Gm-Message-State: AOAM531xcdT8QoIsPNoYTv1o3GUxqoVjueMaY6OlRv2lH6nEXimEFdh0
 eFR5jtg0auZzB80mG3pvPmVVqA==
X-Google-Smtp-Source: ABdhPJw8FVhbmZv6D+9fe15NTXuH4yv5c+ofnXgL70fAMURAfLjV9J98IUNEDOiyQ4GINzbhESPmJw==
X-Received: by 2002:a05:6a00:2286:b0:51c:48b7:a445 with SMTP id
 f6-20020a056a00228600b0051c48b7a445mr841592pfe.62.1655149958365; 
 Mon, 13 Jun 2022 12:52:38 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 17-20020a17090a005100b001e87ae821f8sm5689444pjb.36.2022.06.13.12.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:52:37 -0700 (PDT)
Message-ID: <4fa22f2c-406f-25a8-4a13-f349512bff94@linaro.org>
Date: Mon, 13 Jun 2022 12:52:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 08/11] bsd-user: Implement rmdir and undocumented -_getcwd
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-9-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 6/12/22 13:48, Warner Losh wrote:
> Implemenet rmdir and __getcwd. Declare __getcwd as extern because
> there's no installed FreeBSD header that has it. It's used internally by
> libc, which doesn't provide an external declaration, but does export the
> symbol.

Typo in subject: s/-/_/.

> @@ -55,6 +55,7 @@ extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
>           int copy);
>   extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
>           int copy);
> +extern int __getcwd(char *path, size_t len);

Do you really want to rely on this export?
Unless it does something special, I'd just declare a local version of the syscall as you 
do with safe_*.

> +/* undocumented __getcwd(char *buf, size_t len)  system call */

Surely the syscall itself is documented?


r~

