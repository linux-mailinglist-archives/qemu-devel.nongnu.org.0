Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F51A4A9BA1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:08:04 +0100 (CET)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0Bv-0003cp-JW
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:08:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG03d-00086H-7Y
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG03a-0006xD-42
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:59:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643986765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AswyeELEJ5NiNrnqBw3nfutJruaS9gilG1FtGeFySGc=;
 b=HVdNzkkdAG1EZeM1OBIe57ma3u9S4AvmzJTr3Wx6kuq3CBeNrMieONTPHbSy0lCafcsBJw
 8FMQP8nut27Vxhe4WKOP4v+5fuafrEK83aFfHGYd8PINuqZq7hReAZyE8S4iq2fcrLJhGw
 5GZUZ9XFeMy+aEmWoy7we40Agg1iAyI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-W9Y8aPorPSuuRxkGzMJIcw-1; Fri, 04 Feb 2022 09:59:24 -0500
X-MC-Unique: W9Y8aPorPSuuRxkGzMJIcw-1
Received: by mail-wr1-f71.google.com with SMTP id
 s25-20020adfa299000000b001d8d032255fso2115220wra.14
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 06:59:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AswyeELEJ5NiNrnqBw3nfutJruaS9gilG1FtGeFySGc=;
 b=pbKxmc6+ThWNjbZKVB6qZyqrzgjP3257sI5aKdsj+BsE6AfmbxvZP/G5Jmn3ZRU9Sg
 6CsO6Q11nfmM+k1uayUIWfJZNAuIJT/4UCRQWF7LTGJ6eFAYoCdbTBNDL00Xo8L6r8M/
 0NAIYhkvZqh5dfaW9K5AjqMxP3pj1C4XRg+Q5+kFYKKEjZH4rgQP0tbcCXQTiGndGxNC
 QgB6pkHmRwoWuPd+iznWha9hurKuKEbWSO4INKsCW5XEme7E94vZuf7ylKyJjuhHiv5H
 PzoXvXuxM81l8/D/NxNIPVlvlQP6y3MJt3W8m2vhNd3538V5LxuCF5XsUS9mBLPbgsKO
 85og==
X-Gm-Message-State: AOAM531bkkLBPGFrOPJ9Igyl2LcARxa93Ml+HqIHb0Fo8eRWaOGflqn6
 wmEX4dNX4IvOip2WcLkcJRXPIfMNvJMY5pgJiExwSmQwfCItW3pHYgUZK8iqqqcWfWVtaAekqdt
 k9uixGsJDl9w0J3A=
X-Received: by 2002:a05:6000:128c:: with SMTP id
 f12mr2003161wrx.77.1643986763313; 
 Fri, 04 Feb 2022 06:59:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxE0K0W7PwS+XwFyR+mWwT9g9A9J7klB2SLpJu7EzhLZeiuoSJ7AchJCXroSlL424u4MtLheQ==
X-Received: by 2002:a05:6000:128c:: with SMTP id
 f12mr2003148wrx.77.1643986763095; 
 Fri, 04 Feb 2022 06:59:23 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id m64sm1794398wmm.31.2022.02.04.06.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 06:59:22 -0800 (PST)
Message-ID: <e3cb7d0e-17d8-daf8-f308-3f4007b6d8d2@redhat.com>
Date: Fri, 4 Feb 2022 15:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/10] exec/ramblock: Add missing includes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-7-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-7-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.37, Philippe Mathieu-Daudé wrote:
> Add missing includes to avoid when refactoring include/
> 
>    include/exec/ramblock.h:26:21: error: field has incomplete type 'struct rcu_head'
>      struct rcu_head rcu;
>                      ^

... and errors due to missing definition of RAMBlockNotifier.

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/exec/ramblock.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
> index 664701b759..6cbedf9e0c 100644
> --- a/include/exec/ramblock.h
> +++ b/include/exec/ramblock.h
> @@ -21,6 +21,8 @@
>   
>   #ifndef CONFIG_USER_ONLY
>   #include "cpu-common.h"
> +#include "qemu/rcu.h"
> +#include "exec/ramlist.h"
>   
>   struct RAMBlock {
>       struct rcu_head rcu;

Reviewed-by: Thomas Huth <thuth@redhat.com>


