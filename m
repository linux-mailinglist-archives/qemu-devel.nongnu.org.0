Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339C49F048
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:01:58 +0100 (CET)
Received: from localhost ([::1]:56864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFeH-0006Bg-62
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:01:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDFS5-0000ch-2j
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:49:22 -0500
Received: from [2607:f8b0:4864:20::102b] (port=44004
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDFS2-0004Kw-07
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:49:19 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so4924003pja.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=k/Ibr7IkHqfCm+XxvrUap1+NWm9gAF8mzEPuBRwij1A=;
 b=EiKKg6jovEewQ57SAH8vaa9Evx8Sgg2Sj4ZfNNxREHqc3rFehB1rZiDQ/enKvT+aBZ
 Qn7wMa2Q8mG6JtXPKnOJD4jXgQPpk+f0mU9H6ckbezsz6064ZGPefka8g6pmIEpvqGoR
 0qfsIioGHfcObS+ulZzxh2ySZyuQopIfnZ1NJ0JWT5IRrE4CWwaInUuocAJlxRUgIkin
 1IHbp8XC2BbG3NarSEOftbOWZQVNyLOvckDUP1Qf6ln0yo0HbMubQxLq2sJ99g2ddx89
 9SMbTuHFN0Kwu3ZxId9bDVi3drbz7DORaX2ByvTChp6GuJZDmn98IxKdFKMBoU2J6XKN
 cJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=k/Ibr7IkHqfCm+XxvrUap1+NWm9gAF8mzEPuBRwij1A=;
 b=39lZIGsjubmSBp/nwfk4qZmJnbjGKctSqxzpmEyUyCfu7/E2RvuElvUm5r9i65g+Ae
 +9JK/WM2G8lc3x4BXKy59by7rtxEozUcmU2v5SZFysUF/ecmvbETs9XW8F/LgCSVw9y8
 lDpj2ZSHnj1lar69utRS4isBnvbYn1mxUO81FDGp/TJj2Ep2x104D++UuJELx59bdJni
 iwbe4fLT0JWsuOabAsWcQKgBORWfA0uh7dAV9gJlL4ba4kF5c75jzoirDvEtmW4vfu+J
 XamrEjnE4jUGjB3es0SSwwHwFQsS2UPYmDAog74XSvE0WX5zGchBGB26Jk6acD4+lwug
 wzpw==
X-Gm-Message-State: AOAM532qOg1UWxVbQLVg6Ly0z8lkUGNj5HdLnIaSGPTrk13ZqLwp+jqV
 zyzrZoHmmRz+dCOGHC9F4AWYBw==
X-Google-Smtp-Source: ABdhPJy9W3KrwZySVwKwkGzReMxd/cRjt17y8VRfSIZGV6gD6YTC5WfXm9vRcUfNryGX+qVTgzStXw==
X-Received: by 2002:a17:90b:33ca:: with SMTP id
 lk10mr6927941pjb.45.1643330956634; 
 Thu, 27 Jan 2022 16:49:16 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id j15sm6923927pfj.102.2022.01.27.16.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 16:49:16 -0800 (PST)
Message-ID: <bb149ce3-fe9d-645c-00b5-dc6280ba6f22@linaro.org>
Date: Fri, 28 Jan 2022 11:49:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 10/10] hw/dma: Use dma_addr_t type definition when
 relevant
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220111184309.28637-1-f4bug@amsat.org>
 <20220111184309.28637-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111184309.28637-11-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 05:43, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Update the obvious places where dma_addr_t should be used
> (instead of uint64_t, hwaddr, size_t, int32_t types).
> 
> This allows to have &dma_addr_t type portable on 32/64-bit
> hosts.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Reviewed-by: David Hildenbrand<david@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/sysemu/dma.h  |  8 +++++---
>   hw/nvme/ctrl.c        |  2 +-
>   hw/rdma/rdma_utils.c  |  2 +-
>   hw/scsi/megasas.c     | 10 +++++-----
>   softmmu/dma-helpers.c | 16 +++++++++-------
>   5 files changed, 21 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

