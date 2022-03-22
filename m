Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF7C4E442F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:26:34 +0100 (CET)
Received: from localhost ([::1]:34874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhL7-0007CG-Km
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:26:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWhJP-000538-Sv
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:24:47 -0400
Received: from [2607:f8b0:4864:20::532] (port=43618
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWhJN-0006R9-SU
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:24:47 -0400
Received: by mail-pg1-x532.google.com with SMTP id c2so12971807pga.10
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lzprFcMAB1bziv0GJXN/cbiBBTEG/+CEd7xy24ExfKA=;
 b=uzfLhpPxvFgaE+VrUgJPXP4Erf7n3PymgoFiagbOGFVX65xvto/GZhJ4zTUSxfYz3E
 GB7rSZRJzDfIZYtEW02NoIvhnrQbwB8Z9c7blcWLc3dzhfANI0g29qjqy3wzOASmC3gl
 7ahUPbWtD1jeOzvdU9UPXtyscZKVYscpyfQ7mpTMgLFFAnw7bnzWQoCHBSw17yd2AbkV
 NEgXsuZZ5UTw5CVKXIqdZwmY3nKQI46xHEYpO8YUfywtpD5RNwz7mrzQLE+Xc9lvl6+I
 9QBzGSfgNRxSwtACGJhMYs82cEejxXY3G3Kdq5Nq3nrjTvafFMxqZsg2zHkH71/Zjy0J
 EPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lzprFcMAB1bziv0GJXN/cbiBBTEG/+CEd7xy24ExfKA=;
 b=4et10CV39g7zwsxzNsTJ3NEx47x/fK7el/vPNvJ1URsAmNgZAggYu46OWa+oKlkpE9
 OVsa5+j03sG8A3q6ER8Aj0dXKBatPWH1NCDikPfEIknvbjyZUmOZQlxrFPfDPjh8ea1d
 eBHSKd1ZR0a4xHo5mHvkOfhAONdjSXJqDnjv27ffukRBrNwdC0iyzQErDD5+07zy3fzz
 LnSlY9pUc0BWtVztIb0D4enM0S/XjB1rvNWNfWE7SXGD5y9WsX4hDOhUC0OnUzEFLO6L
 K/adnEP5qax/6kNo+hl4DBGzSv9+7mnSrfxaQYeImtcJaPSRXOxx/Kx/hcD/lzQ7GcVF
 Ua0A==
X-Gm-Message-State: AOAM532hBYFbq+UzBBo3hX0fsOdna8vO2K1nsm7xjuyQV1uX30+M/CdP
 2VBklbQGtod5AMN0Ct7jGM9llQ==
X-Google-Smtp-Source: ABdhPJznWtMKFRvRRaXaprJ8vjSkrKEPQUwNXukkkBMErkLBLJZGpMg6kb81zT3VBu/dyPd90vaz4Q==
X-Received: by 2002:a62:643:0:b0:4f7:2b29:159a with SMTP id
 64-20020a620643000000b004f72b29159amr29852841pfg.16.1647966284303; 
 Tue, 22 Mar 2022 09:24:44 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a056a000c9600b004f7ba8b445asm24435542pfv.65.2022.03.22.09.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 09:24:43 -0700 (PDT)
Message-ID: <3109c968-bad9-3fd5-3528-321cccacac48@linaro.org>
Date: Tue, 22 Mar 2022 09:24:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed
 linux systems
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org, qemu-mips@nongnu.org
References: <20220322154658.1687620-1-raj.khem@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220322154658.1687620-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Zhang Yi <yi.z.zhang@linux.intel.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 08:46, Khem Raj wrote:
> linux only wires MAP_SYNC for architectures which include
> asm-generic/mman-common.h and mips is one such architecture which is not
> including this file via linux/mman.h, therefore as a fall back
> these constants should be defined for such architectures on Linux
> as well.
> 
> This fixes build on mips/musl/linux
> 
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> Cc: Zhang Yi<yi.z.zhang@linux.intel.com>
> Cc: Michael S. Tsirkin<mst@redhat.com>
> ---
> v2: Improve commit message

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

