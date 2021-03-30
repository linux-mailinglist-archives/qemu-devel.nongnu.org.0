Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8865234E759
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:17:34 +0200 (CEST)
Received: from localhost ([::1]:57940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDJN-0001uJ-LH
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRDDQ-0006wN-LZ
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:11:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRDDM-0004GA-Hy
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:11:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e18so16003928wrt.6
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A1/hwK7SmHteWqnxypWdRVmiA3kAY4f3b8n6N4vM/E0=;
 b=H/ydsLVyMQ68CDl0kXRr+zsuhdaJahdPGvZKUsoWnZ22CDGKvAscVmU2C/n4PP94js
 aYGAJZQNVSCbRas7AUWBvEROTtUU3A5rgEQgFS3p78yQ8LnQfzCNcWD7sJ5uetasJ88n
 BjWVYUWBwHwjhA25BRxXFT2xJtkw1URGA4vA6Mt/M5y2BN+65+s8qr1s9AuHJ+hkmGxW
 Nu8eCfWsaJ7Rj60pFJfJT0mxdpWMohSIkWoykyE9TrIXMfjRiQAiArA8AjoONQs4PBwg
 wo8aC0mNX4JLJn0vyWlSdz8dXC86V9Kh9QnCk85keiRSg/znNWVMEBwbzv5wkgxmSe1c
 TDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A1/hwK7SmHteWqnxypWdRVmiA3kAY4f3b8n6N4vM/E0=;
 b=Ru/od+xkl+pfmzXbQiw3WiV4OxPB5LuAW8rSjTpIYO0GfT0jiyBEXF2E/WOSrtcRuz
 get4ZYhrcuqrNhLh3XwFhah1169Ey2YYQA6yVgQknJC2UfZQF34Vr6Rq8E9TREp3hvAX
 ZGCAhJgoldBRnILlBedGJY7ODv2ADOxuCZTPZw75KIZAG0SX0vlOxEHkJZLCRCYWLevK
 sJ7sacEgX/n4cN7uhmdlghSPrQ8pqVn7wGBpWvUBX65qRR5aBwCEtkimX/JstUzgDTsd
 1/8DU5Q1DZhAmwUwwI8MEnCZAykgqifbW4xN4oN9f5z14vqhEDJSFrUu39KR8xHajtWA
 8Mkg==
X-Gm-Message-State: AOAM533lAD5NjeT+SNCrk1ln2x9rNzFhP8HgcCPhRa/E9p7qzp2Lxjz9
 CZGfVLhtwEYFbr8LZEscq2w=
X-Google-Smtp-Source: ABdhPJwuELH6ox8J19ekzIB1vzOYLb8++QsQcpZvTmAqvFeINmTRT6fxq3mEfVfCizEO82kc49BUvg==
X-Received: by 2002:adf:82af:: with SMTP id 44mr32538518wrc.279.1617106277151; 
 Tue, 30 Mar 2021 05:11:17 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z8sm32318917wrh.37.2021.03.30.05.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 05:11:16 -0700 (PDT)
Subject: Re: [PATCH] target/xtensa: make xtensa_modules static on import
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20210330073057.24627-1-jcmvbkbc@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9a3b6060-3617-367b-29c6-959ff8f28d9c@amsat.org>
Date: Tue, 30 Mar 2021 14:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210330073057.24627-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yury Gribov <tetra2005@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/21 9:30 AM, Max Filippov wrote:
> xtensa_modules variable defined in each xtensa-modules.c.inc is only
> used locally by the including file. Make it static.
> 

Reported-by: Yury Gribov <tetra2005@gmail.com>

> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/xtensa/import_core.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/xtensa/import_core.sh b/target/xtensa/import_core.sh
> index f3404039cc20..53d3c4d099bb 100755
> --- a/target/xtensa/import_core.sh
> +++ b/target/xtensa/import_core.sh
> @@ -35,6 +35,7 @@ tar -xf "$OVERLAY" -O binutils/xtensa-modules.c | \
>          -e '/^#include "ansidecl.h"/d' \
>          -e '/^Slot_[a-zA-Z0-9_]\+_decode (const xtensa_insnbuf insn)/,/^}/s/^  return 0;$/  return XTENSA_UNDEFINED;/' \
>          -e 's/#include <xtensa-isa.h>/#include "xtensa-isa.h"/' \
> +        -e 's/^\(xtensa_isa_internal xtensa_modules\)/static \1/' \
>      > "$TARGET"/xtensa-modules.c.inc
>  
>  cat <<EOF > "${TARGET}.c"
> 


