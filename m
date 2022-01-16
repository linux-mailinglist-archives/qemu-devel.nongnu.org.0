Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBC948FEFE
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 22:13:31 +0100 (CET)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9CqA-0000VJ-TM
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 16:13:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9ClU-0005gf-P3; Sun, 16 Jan 2022 16:08:41 -0500
Received: from [2a00:1450:4864:20::52b] (port=41927
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9ClQ-00005N-Ae; Sun, 16 Jan 2022 16:08:38 -0500
Received: by mail-ed1-x52b.google.com with SMTP id t24so57217702edi.8;
 Sun, 16 Jan 2022 13:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gidbh4bWTBeQTsE3hvokbSiDAKrhPfegKbvESsD1faw=;
 b=YeZftjYxMvB8mxL1Ij65z5Jyv9luP9DioiZGmRrbqJDCjzYJd+/Y6b/jTKfoKROW2M
 9bL9RYysnXVtWpXjXRaDnBFM+qwP8qcptnVADf89vOGc+9BoqIbZyv2pPDSOPeXCPOY2
 nvsz4RMtcQapBYtvLIL0Yw/vWY/gapjbakhQZl++cDNMVo0vSABO36pOij3vqy27Jl7f
 AzoL33nBYjrY5MDmVSbQuLdbOPbctJHkgdRr6k/9vAxGz37u/JWmV1vgq/VspgeCcJW6
 lcr33IxBXYPtcvkANvcWH9om1OrUgOILs2Ub/dJQdrIvH2Ojutf1Ky6Xdrd81MHVgf5P
 HZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gidbh4bWTBeQTsE3hvokbSiDAKrhPfegKbvESsD1faw=;
 b=7ck8Os1t/t2UVKaDlxXl4inJgkC52iIlnYThkdX1OWNDg5kS7q9SfRY4aluYdf/a5Q
 x/bMKoLeHgNCyn/Q/rZ4aivoa6o/HPOaDavSnBoD8bQniHO4mLXElcEBkrJ5WxK6KZud
 pX4BhIE9Jsezc4TrEF4TjQ5WIoNuuvaDgKCfPfMjUobtSbLTQHEF706inBlqy/QEaX8d
 befOzj51J79XIs+hW6+6ikbEnajSBd/g6cGmLuj92TJvDYrxroZmBeg/0v7KPjWx0Efx
 DmEw/xScoGt9fX2EbfaQG9Wudq8DTBnYn8rCIHZf9Us+fxV34PLeQnBnsLBU3BUW+QnN
 bsUw==
X-Gm-Message-State: AOAM533O+SGja/wJ8qAZoV2ewuuXBmzccYKfqh54x/vZNQu2zJQkjt6X
 M16Ut4OHA8nUeO0kpigfgtn2GEA2akDmjZjC
X-Google-Smtp-Source: ABdhPJwkWxZsU/3Qk0sO9gX4q7NBidti/ySsOgWOiAKHpRUmyvttVJ/w6y5x5X7mj7t97iLUoSu4MA==
X-Received: by 2002:a17:907:96a0:: with SMTP id
 hd32mr3197361ejc.459.1642367312102; 
 Sun, 16 Jan 2022 13:08:32 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id di5sm3765331ejc.45.2022.01.16.13.08.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 13:08:31 -0800 (PST)
Message-ID: <75ccfaf6-4b5b-1ec5-3b99-d32f7b5e4536@amsat.org>
Date: Sun, 16 Jan 2022 22:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] intc: Unexport InterruptStatsProviderClass-related
 functions
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220116122327.73048-1-shentey@gmail.com>
In-Reply-To: <20220116122327.73048-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 26
X-Spam_score: 2.6
X-Spam_bar: ++
X-Spam_report: (2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/1/22 13:23, Bernhard Beschow wrote:
> The functions are only used within their respective source files, so no
> need for exporting.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/intc/i8259_common.c            | 6 +++---
>   hw/intc/ioapic_common.c           | 2 +-
>   include/hw/i386/ioapic_internal.h | 1 -
>   include/hw/isa/i8259_internal.h   | 3 ---
>   4 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

