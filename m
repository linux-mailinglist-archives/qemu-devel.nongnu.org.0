Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF44AC66B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:52:55 +0100 (CET)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7G0-0007B2-EW
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:52:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH6Yk-00070q-L5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:08:10 -0500
Received: from [2607:f8b0:4864:20::431] (port=35811
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH6Yi-0007u9-BG
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:08:10 -0500
Received: by mail-pf1-x431.google.com with SMTP id u130so13753410pfc.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 08:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iS2JO+1aOpLnlE+AHwekWF/KjbBDo6aPTC7Nb40Sw8I=;
 b=dtybf8EuHteKj/0za+wUjbUkJLHEeTkDANdtJ0PZ5AeHsDWCC0r4Jae5ybfHIMR4hy
 vBfov4DNc4bCRaxNfBY9Egwl/lZhiuKOlHSiGDjZTx+AZdOtFxJeC4cJiHNrYWscLQBc
 G6E2XNwxlF2Z8T2OS5NpiS22vK76Pht7gMXcZtmFpPyc2QdG6anJA+Y5MQvwZdr1yNU+
 3klVf6qWDw29w6N1Yv0nRaOR/gzcVgOQ1eZ/58DzaexLeeSyl8A/YfrmwoR5XTpjT51U
 GrK0jSoOle1CVPhBVgxBqMDF4oF2fhvoZl7VMQcCtZcuVv+zzcb+WYAGjQieTbgU61LA
 cPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iS2JO+1aOpLnlE+AHwekWF/KjbBDo6aPTC7Nb40Sw8I=;
 b=46Qda6EvIjHs/kLQEYpCDwkbt4E1zx1My18vI1aZwTR6sovucWi/zK6jq4cGYjSROv
 1/ZvBPEumbflGmdwPrtaU9ZFwr0w1ScPlrqG5hhxxU6YaWO8Xjjugi9UXIzH+KOAtw45
 HLas65jHA7DwAxJiksKg/ooQ1OCn36Pbgtr4x2yxZtKbWtROwq5xsCJZ2jDguQg/+zTv
 bu0vtmFnEmXXkSNljemmCv6md4zyTMNnC9b9B1O38FRGG0tpJiyNVgqeRnBXeqeLB/HX
 J8r4YyKOgF4w7QoOlcUa28gUazG2gYwZ08Hm1L+DVKScn16YaxcWYYfkULrhUwjbb0Lv
 pMog==
X-Gm-Message-State: AOAM533W3sS88EPn/Is71mrFdROJsofI4WHALJ7OL/si/lS3CrxVVN4n
 0MjWA/9r0mWyLMwGoOnFLU0=
X-Google-Smtp-Source: ABdhPJx5xC8AcEiNshAEpLMo9Hk/fkTdLyvXL5zcpcropNVBLQ4KTgrM1tZpOx6lTp8IVMNs4y41zQ==
X-Received: by 2002:a63:7a53:: with SMTP id j19mr57122pgn.533.1644250084961;
 Mon, 07 Feb 2022 08:08:04 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id g9sm13151990pfc.109.2022.02.07.08.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 08:08:04 -0800 (PST)
Message-ID: <9ee51368-df12-1f9f-70e4-1fbad90f43ae@amsat.org>
Date: Mon, 7 Feb 2022 17:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
 <20220207085045.1de46df1.alex.williamson@redhat.com>
In-Reply-To: <20220207085045.1de46df1.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/2/22 16:50, Alex Williamson wrote:
> On Sat, 5 Feb 2022 10:49:35 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:

>> Hi; this has a format-string issue that means it doesn't build
>> on 32-bit systems:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
>>
>> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
>> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
>> type 'long long unsigned int', but argument 6 has type 'intptr_t' {aka
>> 'int'} [-Werror=format=]
>> error_report("%s received unaligned region %s iova=0x%"PRIx64
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ../hw/vfio/common.c:899:26:
>> qemu_real_host_page_mask);
>> ~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> For intptr_t you want PRIxPTR.
> 
> Darn.  Well, let me use this opportunity to ask, how are folks doing
> 32-bit cross builds on Fedora?  I used to keep an i686 PAE VM for this
> purpose, but I was eventually no longer able to maintain the build
> dependencies.  Looks like this failed on a mipsel cross build, but I
> don't see such a cross compiler in Fedora.  I do mingw32/64 cross
> builds, but they leave a lot to be desired for code coverage.  Thanks,

You can use docker images:
https://wiki.qemu.org/Testing/DockerBuild


