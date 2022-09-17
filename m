Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F075BBADB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 00:23:50 +0200 (CEST)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZgE1-0007Ya-Fk
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 18:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZgBS-0005Km-VI
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 18:21:11 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZgBQ-0005Sn-MW
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 18:21:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b5so41423149wrr.5
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 15:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=xDcygNG3MabPnz2VhaD39fHwjZWCsiGx0x2lqhv5N0Y=;
 b=Vz2Cffo+BRfSYOnfHkec/FSP5keiNNO/ean0nidWmZ2GEupua509jlNALq1r9zkMI5
 JlRvIJDfsMATdJDNNnZWcsv+X6+0eAgnMH6icftqCIHyy78Mooq382GZllCQDoxPQtZ3
 RD+9DttyiPNI0w5bxXXmN9A6Mi4OrsBJhqwqm3AJLBBGrAudMmQwDyjPTUeGuNC6OcRY
 GdDA3CDwO40ShFQfR7oz8eCSGLwCcTJpJS50NsIIjfB77tau21Bs1Jjuo/sa6mCc0VLZ
 wLnSg/iy6IvOvStq6ptF3sYZARdQnntrKx8+T0SR6vYwXLEpw1DpXe9uvti0VjPrHT7a
 e8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=xDcygNG3MabPnz2VhaD39fHwjZWCsiGx0x2lqhv5N0Y=;
 b=n5SMnDMcgvBUR9qmOIKYzRmiJlQnKKCJ2rNpDDiqFrP3338+OSBYIl2LZrvadVqVEQ
 oszrzF8EMBL+4Ldrt0BPnjOrDHN4mn+mFL5436fcOiCWLLMVi6JpBw1roJqUUMHiSLBQ
 gfFqnBtmWvnFCy9YXmtCKIuNaNHqier/jfodiTTEekJpIt7KKyWDMBVKjGd+Cb2JeYCg
 bx7B4fGXAYTk2S0lTosDcvs5yUvH6IscIiGyGPbeUYn2hgVzk64GwS7jzm06yD+zJEjD
 bn4bzK2/VqMhILd7A1D9Yr6PChLfleER3sVBbOZ7G734J1b83rYNowRO16ZezAwcW/RI
 VRNw==
X-Gm-Message-State: ACrzQf0kGDS07RnjrWvakinGvkzmjaCUyioUTwIFKqerwHYKSZYhY9br
 j0BL7lcvPmnrObMw0GCjVrw=
X-Google-Smtp-Source: AMsMyM6oNq8xM13JYjAQO35kNpzcSd4YMFAQBVqDTBe0XyG4DjsoXVgq2hEgImWee9PV0mjjuirCCw==
X-Received: by 2002:adf:fb50:0:b0:22a:e4e9:a6b3 with SMTP id
 c16-20020adffb50000000b0022ae4e9a6b3mr3882168wrs.467.1663453263120; 
 Sat, 17 Sep 2022 15:21:03 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bn20-20020a056000061400b0022aeba020casm3071592wrb.83.2022.09.17.15.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 15:21:02 -0700 (PDT)
Message-ID: <1390857e-bb17-3507-00bc-7aa79f7bf239@amsat.org>
Date: Sun, 18 Sep 2022 00:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] target/m68k: rename M68K_FEATURE_M68000 to
 M68K_FEATURE_M68K
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 richard.henderson@linaro.org, lucienmp.qemu@gmail.com, qemu-devel@nongnu.org
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220917112515.83905-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 17/9/22 13:25, Mark Cave-Ayland wrote:
> The M68K_FEATURE_M68000 feature is misleading in that its name suggests the feature
> is defined just for Motorola 68000 CPUs, whilst in fact it is defined for all
> Motorola 680X0 CPUs.
> 
> In order to avoid confusion with the other M68K_FEATURE_M680X0 constants which
> define the features available for specific Motorola CPU models, rename
> M68K_FEATURE_M68000 to M68K_FEATURE_M68K and add comments to clarify its usage.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   target/m68k/cpu.c       |   2 +-
>   target/m68k/cpu.h       |   5 +-
>   target/m68k/helper.c    |   2 +-
>   target/m68k/op_helper.c |   2 +-
>   target/m68k/translate.c | 138 ++++++++++++++++++++--------------------
>   5 files changed, 75 insertions(+), 74 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

