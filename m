Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759BB483550
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:06:52 +0100 (CET)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4QnL-0006zL-4v
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:06:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4Qkh-0004ai-4l
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:04:13 -0500
Received: from [2607:f8b0:4864:20::635] (port=35424
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4Qkd-00078A-I8
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:04:05 -0500
Received: by mail-pl1-x635.google.com with SMTP id n16so25285394plc.2
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=AiKEFolOB7TlClq2xj4IEFa79NBsndpYBIuNRh4zh3c=;
 b=Iwc4Nn7AKA9+Ygc8o7+pU1iafAHJg+mnxA/lleykvYe0odb58UslaxgfiP8oejbwqA
 9miwM92xecrTVZlmntvNXE163Q9elzFNinvFeHASEE29kmkcjMYkaAZJRIwAIZA+uTJr
 32vWSd2vZUjpIwe/WUQ1ATWItVMqlrrj4iH9xtzUQFD3H2RGS8UDQGIoFg8wJeCk5m2/
 hHSICUs52l7qI8K0v0D/F+rQvFp8BD0fmCszYWZswOURlstLYs424nNxCfTTJ95gleEO
 ENxeoBByg94B8PjwYrK9XbpEf1mO360mktNZ5pdQWuMjIKjhCVxLYN7oanEn757Y0YKj
 KBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AiKEFolOB7TlClq2xj4IEFa79NBsndpYBIuNRh4zh3c=;
 b=pVEWVeDnATH0jcekQYQQoD0UkLgnfakNKNMW3Y48HsE5RK7SmHwx0PW8YqRRcPJWyO
 lq6JMXej+M0GQmXy74/cL9JeXaGjpkWC3npfdM17qC9ElXjrD9jTB+oJmZ6OC7mbCDzc
 lVF5zP5Y3xrBdZ/WAj0gQGrpTgnGlpFZ7vIfNJbwP7qajP6GudiooVnk54Tnf4IT/XfL
 KaUcT2FHqhe/G9mrUpnzkt2hszgWIP3/k32k9aQrbH/N5G62mm29Yme3auZH34TNJX1W
 eSc7NGAjN4r5FK4YtsMbG27RhRZ8XJXuQhFS8vTL1/uRnzSVVC0Gbcq89sjpr1TDKqY+
 pO5w==
X-Gm-Message-State: AOAM53145m6eXqTG12TicT7T84YSS4iVKewFudLpMOfUtse9yj3gqkJs
 9AYnRmaixVMaSnPjpEP7x4lZqIHxK7dIZQ==
X-Google-Smtp-Source: ABdhPJziEVpWb/XBgHQ0txOvxTckOIx9GGE4nFe7I91She7V/Aacme/TUBwxTSszkwkXLEXaynhUyA==
X-Received: by 2002:a17:90a:5409:: with SMTP id
 z9mr57322271pjh.129.1641229440682; 
 Mon, 03 Jan 2022 09:04:00 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d13sm33720248pfl.18.2022.01.03.09.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:04:00 -0800 (PST)
Subject: Re: [PATCH v2 1/9] target/ppc: Remove static inline
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220103063441.3424853-1-clg@kaod.org>
 <20220103063441.3424853-2-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ca1cb97-2896-3022-4604-9daa14ad6359@linaro.org>
Date: Mon, 3 Jan 2022 09:03:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103063441.3424853-2-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/2/22 10:34 PM, Cédric Le Goater wrote:
> The compiler should know better how to inline code if necessary.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> ---
>   target/ppc/excp_helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

