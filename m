Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342722EF85C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:47:22 +0100 (CET)
Received: from localhost ([::1]:59656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxjF-0005rL-8S
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxxfe-0004fN-39
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:43:38 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxxfc-0001d0-9o
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:43:37 -0500
Received: by mail-pg1-x535.google.com with SMTP id c132so8278567pga.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7B5AjKFz/5qkReno8zVW1cgCBGyZ6HQPc6XThD0S/z4=;
 b=ez7yw7o2VV0taXBUjfpt8T9toefY122gTXYdZier7jlWsoxCisqUGYkt8V2SBSqsEH
 RoQC9NfY48HG21ov9xnOTYXxEbTrVwxKhWM9n5wsivMQLp+Ee9GYysmMUibQh0Y2P0z9
 TAEctAZYJe+yWyVpmybmFsE9pj75lnaLyLGg9ywn8BaHSKcrcuzDGS8QBh9598o9Y8Yp
 nGtfsRWkXU+Hu/JT+qi8iD/7tJ76WmEGMFYnbv7H6s54eQjE0w3U9YQ+6YsuF3Ue9wbM
 YbMjFdNZagMLiSuiKxPT4SDKT3hOTvqm4h+m3SuxilwWO2QsMXC3QRzY+zuiQbU4dv65
 iyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7B5AjKFz/5qkReno8zVW1cgCBGyZ6HQPc6XThD0S/z4=;
 b=SZrddS5q6F2MVHfWvpgwrrJNA2H3zKMy1InaQ4LKHNPPzmaGepVourtdDZBPAlmx+V
 jYvKjbsLZp1bF54p2/5kxJQy9nCXLKAq6Nkdjov4hU7KfJL2ahNmxl0DEwhjS5mnA1P/
 osA8b7w+uzsMFTxb2O9tigJxX+vXKsTONF0Vuh8AJ0mZ7tGEnRjnRkQrRyU6bwCDPatO
 QZmJKdK7CvjQJPh/xUM9kUkDa0qC3ul3i9rYe1x+ZxoIybgc77Om0hxhqxiYU7xEJJzW
 C/92iRIp6+jPwsTpIV4CFqid6zXNxjh9X4GGi1eyD5J9KVbbPknJuDVXoaLA7U5sEgNO
 k9MQ==
X-Gm-Message-State: AOAM533jSEXZBb8qCVKcdfVd14RSYfiHBGMiuPrcuFKyLIqI7BFMhKh7
 ORs9WrnZMyzzW/dT1dXfzXyseQ==
X-Google-Smtp-Source: ABdhPJx0CW+OApUBY1H6LCUFelopVtGn5vOWQjIyT88o5C3qF6ouFndHNmDmfDlI9or8Qg++s/s2TA==
X-Received: by 2002:aa7:90cf:0:b029:1a3:a176:f4d0 with SMTP id
 k15-20020aa790cf0000b02901a3a176f4d0mr5318227pfk.8.1610135014656; 
 Fri, 08 Jan 2021 11:43:34 -0800 (PST)
Received: from ?IPv6:2607:fb90:58e:547c:94a4:bdef:7aa2:3a7c?
 ([2607:fb90:58e:547c:94a4:bdef:7aa2:3a7c])
 by smtp.gmail.com with ESMTPSA id o140sm9478873pfd.26.2021.01.08.11.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 11:43:34 -0800 (PST)
Subject: Re: [PATCH v2 3/4] s390x/tcg: Only ignore content in r0 when
 specified via "b" or "x"
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210108132049.8501-1-david@redhat.com>
 <20210108132049.8501-4-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21b165f3-4d7a-3464-dcff-3c22cce43028@linaro.org>
Date: Fri, 8 Jan 2021 09:43:29 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108132049.8501-4-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.241,
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
Cc: Thomas Huth <thuth@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 3:20 AM, David Hildenbrand wrote:
> Using get_address() with register identifiers comming from an "r" field
> is wrong: if the "r" field designates "r0", we don't read the content
> and instead assume 0 - which should only be applied when the register
> was specified via "b" or "x".
> 
> PoP 5-11 "Operand-Address Generation":
>   "A zero in any of the B1, B2, X2, B3, or B4 fields indicates the absence
>    of the corresponding address component. For the absent component, a zero
>    is used in forming the intermediate sum, regardless of the contents of
>    general register 0. A displacement of zero has no special significance."
> 
> This BUG became visible for CSPG as generated by LLVM-12 in the upstream
> Linux kernel (v5.11-rc2), used while creating the linear mapping in
> vmem_map_init(): Trying to store to address 0 results in a Low Address
> Protection exception.
> 
> Debugging this was more complicated than it could have been: The program
> interrupt handler in the kernel will try to crash the kernel: doing so, it
> will enable DAT. As the linear mapping is not created yet (asce=0), we run
> into an addressing exception while tring to walk non-existant DAT tables,
> resulting in a program exception loop.
> 
> This allows for booting upstream Linux kernels compiled by clang-12. Most
> of these cases seem to be broken forever.
> 
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/insn-data.def |  8 ++++----
>  target/s390x/translate.c   | 15 +++++++++------
>  2 files changed, 13 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


