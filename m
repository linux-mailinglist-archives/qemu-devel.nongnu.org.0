Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1C18D599
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 18:20:56 +0100 (CET)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFLKJ-00018t-Pl
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 13:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jFLIy-0008DF-Hu
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jFLIx-0007GP-Je
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:19:32 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jFLIx-0007G9-DD
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:19:31 -0400
Received: by mail-pf1-x441.google.com with SMTP id i13so3616650pfe.3
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 10:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6iYTAUZHXhzPr8h/s6dATTcyRkAxu0q3vktCZ23eIGE=;
 b=a4svp2cFXSWIqdPTGFFFwQnxG+bG8YSEn9WaiKgk1+V5xEgzSUE9TcyOadsRJnDT8w
 vzpf3k6NLK034AuIj4KZEIyaykwA7CarUsYIjpNkYjCc3hLDO8QglpwP+G1RiyinwESR
 RCb8RBzTowS8BGS2F4FYObjrwqYez97nbP+n7iuXgtkAhK4ZKHTnXlwxI4G9BM4ksDzf
 aqJTWJhSsCrh2/xjDfRyd2pWd0tCpBLs83vi5Dbs758QdApzhIT29GpiiTVbwn3A+e7x
 QxnYmEVu32NFbq0MBDCWCcBr/kW0EzMRUpUKWHEKQOrJHg/rUMFmcjWNXXyxYgslP2ND
 qGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6iYTAUZHXhzPr8h/s6dATTcyRkAxu0q3vktCZ23eIGE=;
 b=W51KI4JpgRcngHng/n6VnVz/mvwlplW8NvAe7QSXzVrL9CV+18cPT/Ff74NDokuxR5
 e71dZanvlJR9AmtAb2hlMMz4fi76IcQHjWGEYvWhmgnd29MBMmoOchiaBf/rgMUXjb/0
 kXJfRpPC4Gic1lRZIafIYkASCzXgD18u7oLMSb0YOt80a98h0zlqYoLxHDiN3Bj+lTjB
 KjUjoWpT0fQPOIocgsEOYtIUI0KgyQIkzFkgJEBrUtRFDeh4lqHek4C6j/WzhhujxYaC
 mHRukW2SAxWLlHY1SCLrJSm2MomEWvEN6soz/OrDExPIlzKvJWcSRqhx6vXNDQJWX9xk
 Ygzg==
X-Gm-Message-State: ANhLgQ1violv5TNO0u0rSPAJjyTlqjgFE5CI65wRnUO3/4qgjxrXaKs1
 lkQBBc5qCgYFooKjaqobG2rAQw==
X-Google-Smtp-Source: ADFU+vsEGw7ZcPTmVmkjzYrmH24CG1invihUjFOTHtwCgz7zbrmvQ8o/jorRJYnqQcAxbxBbsaCAXg==
X-Received: by 2002:a62:31c4:: with SMTP id x187mr10486091pfx.83.1584724770407; 
 Fri, 20 Mar 2020 10:19:30 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 n29sm2003038pgf.33.2020.03.20.10.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 10:19:29 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] linux-user/flatload.c: Use "" for include of QEMU
 header target_flat.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200319193323.2038-1-peter.maydell@linaro.org>
 <20200319193323.2038-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70fcfc57-2623-2699-dd1b-3876f2692341@linaro.org>
Date: Fri, 20 Mar 2020 10:19:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200319193323.2038-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/20 12:33 PM, Peter Maydell wrote:
> The target_flat.h file is a QEMU header, so we should include it using
> quotes, not angle brackets.
> 
> Coverity otherwise is unable to find the header:
> 
> "../linux-user/flatload.c", line 40: error #1712: cannot open source file
>           "target_flat.h"
>   #include <target_flat.h>
>                           ^
> 
> because the relevant directory is only on the -iquote path, not the -I path.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I don't know why Coverity in particular has trouble here but
> real compilers don't. Still, the "" is the right thing.
> ---
>  linux-user/flatload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


