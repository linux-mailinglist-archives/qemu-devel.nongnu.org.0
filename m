Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D63BB0544
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 23:36:53 +0200 (CEST)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8AIG-00064L-Eo
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 17:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8AGx-0005OU-Bw
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8AGw-0002Uc-Df
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:35:31 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:36872)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8AGw-0002UN-8F
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 17:35:30 -0400
Received: by mail-qt1-x842.google.com with SMTP id g13so26786070qtj.4
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 14:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PLwu+yElRBy0J7XnVBdwXrjH//mUSQK+qcy8gyfNs9I=;
 b=R0yoHXeGDMedll+b0KbyybWqljcIN82GczGBWQ8AyIifdq9j2ObIlMcxbODd+28XiM
 Jg9DrUSLddDpH/h9xhtF7Cenqm4fY2groX1MiPBAJxlYYk2AWd+yn/5GgGwdzMHlNtFo
 Tnv2hyfrl9IZhGV0lOOW5E0XcBEFPleGfD+IdVbII1aQdEHWzMCKYR22PM4YVfJoOYZ+
 c+pDsDOtDeXX9zO2BcILZPxPf+WdoARaMFpHWN4bOd+Alj33M0/TrB+uYAtBDX4lDqUC
 h3huL4WfQ5BLomEje80mErGA2Nf7a4QgwIgfzs2ffWuJA75lFsgyr32vMzD3di/RbgyV
 rvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PLwu+yElRBy0J7XnVBdwXrjH//mUSQK+qcy8gyfNs9I=;
 b=hd7F+c4GtYelb3XLT3YkNacr0GAoC9XQtxd9kYbcAAfcfSOeUbx6mT9U4fss3+B0nf
 IukQ+Hlnjefat4+gMvY6C9ZO2I0+HMYzQIbi0Roh2uJhlQM/5STN6i6k9k1gtUfeC9X7
 VL8pQlsqWSPvr9UrKJmV7A80A3E2FCnLEUFIER16wDYZfffX6JkU6z0CbPrq68we6KiU
 BbOQ21kRCMP9u3+6X510crSrhGWPBSVh8KFMqa+RkTlgnU3bs/MlXs4elmdUqQOFOD1Y
 tRKvXpVl/VM7oxYXfn7vkyh0kOta+97sgPU17eNwKP6JE7hYDBbO7RS0Drp1XxDM0FMm
 /vTQ==
X-Gm-Message-State: APjAAAWwf3HmeCMwtpAxqCh2VXPkGJVXebiCjgm+wMUP9CmA0oGLE/Kq
 3F1fQU8+rWyzPPRPCCDAx/YUDtMOSxsDkw==
X-Google-Smtp-Source: APXvYqyQ/8MLfv+FsykemAy3/7Ie1isrBv0lP4S2OXPXkSJj890I1ieJFnHTP7WRvl/Ccu4W3lW3oA==
X-Received: by 2002:ac8:647:: with SMTP id e7mr17059129qth.78.1568237729591;
 Wed, 11 Sep 2019 14:35:29 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id c137sm11367818qkg.110.2019.09.11.14.35.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 14:35:28 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190906075750.14791-1-david@redhat.com>
 <20190906075750.14791-24-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5bca0ec4-7903-c5e5-653a-f2a56cb5d798@linaro.org>
Date: Wed, 11 Sep 2019 17:35:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906075750.14791-24-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-devel] [PATCH v2 23/28] s390x/tcg: MVCIN: Fault-safe
 handling
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
Cc: Florian Weimer <fweimer@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefano Brivio <sbrivio@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/19 3:57 AM, David Hildenbrand wrote:
> We can process a maximum of 256 bytes, crossing two pages. Calculate the
> accessed range upfront - src is accessed right-to-left.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mem_helper.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

