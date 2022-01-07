Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47A486EC3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 01:28:17 +0100 (CET)
Received: from localhost ([::1]:52382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5d7A-0002Ux-8K
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 19:28:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5d0h-0002hc-Jb
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:21:35 -0500
Received: from [2607:f8b0:4864:20::62f] (port=36535
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5d0g-0004k1-02
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:21:35 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p14so3638562plf.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4i3R5XvZDqNA7FDFL1iY88dsu4G7gFpNhlbrIfWmoYw=;
 b=ZVFdfvefvbpghnEwacJxBCMezU97glFSf9l2cn35d+qiqC02ngwTOM5uE3eLchY380
 UHyU6x3gdqTswy3ag2LGybyLIccxpHU/w7aQ5pfI1WIf9gJHbQdotezykpdLCFiS8BX7
 voFW6uo11TljDLrOoonTQPj5DP4NqBHkFL3C4uvqJeBses4Rsrv2cIsbj5ukTula7nEj
 cTgPKWfRJKgf6HFGh9Ex2CC3gQDwPxSENJTVOe1qbkA4WbCeXw26ZtmTi0Ff2GHSi6Fg
 sb/sKdJITpTPgeFOjQRhN+jKTyaU0QONDVMw5cZMATOaqAYSU/EhL3LFEmdD80iJ8m2N
 M/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4i3R5XvZDqNA7FDFL1iY88dsu4G7gFpNhlbrIfWmoYw=;
 b=S/35mwhIx6/ndir8gGTz0S7Uj48W0YdfFv/zXTZGGvPF720O+K8Hh63+wFayMRPf+Z
 sT4Kg6uLY6XNJ6ivERqEwUwB5h0lC9Eyzqc5O7RRpA0B5hXaex+3Aq11dZ0MVP3NSLsw
 LoXzKA7abZpC6zQ/S50iMbKpmDRaoSOsd34s/lfpc5NROPUSVn9masObayybHuos7TQl
 blK1EfYCKWHB6AZyLBXPdTxqK0NY64UhMBbCm6z+jByAPOlWTO6gUHw6lzClsAwtxzZL
 hcnOHcOj8nWK9r2wBiJ75nqQtvjuc5JSqVHunAtMk27c0N7mWGqWeOKNaPb6QC288kaJ
 EHZw==
X-Gm-Message-State: AOAM531f3vMcenHXVq2jbiuOWcEcY+ca4yAR9gs9+JPEtyOQwWb+UhDi
 eJItiCC6V38UEHqY9rtZawcrWg==
X-Google-Smtp-Source: ABdhPJw+mu2YBApEUuxJEXLBRBIcMKDdVicHtjGx0qXBVZAwWIuK0BruaNndl0y+4HYGwTarlPzDUg==
X-Received: by 2002:a17:90b:3ec3:: with SMTP id
 rm3mr12619636pjb.31.1641514892066; 
 Thu, 06 Jan 2022 16:21:32 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k20sm3419698pfk.111.2022.01.06.16.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 16:21:31 -0800 (PST)
Subject: Re: [PATCH v2 5/9] hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len'
 argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9381985-75a3-a9a0-0e07-d3689eaa815b@linaro.org>
Date: Thu, 6 Jan 2022 16:21:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 12:54 AM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Various APIs use 'pval' naming for 'pointer to val'.
> rdma_pci_dma_map() uses 'plen' for 'PCI length', but since
> 'PCI' is already explicit in the function name, simplify
> and rename the argument 'len'. No logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/rdma/rdma_utils.h |  2 +-
>   hw/rdma/rdma_utils.c | 14 +++++++-------
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

