Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C104AA850
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 12:22:24 +0100 (CET)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGJ95-0001mJ-BC
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 06:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGJ5w-0008D0-Bs
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:19:08 -0500
Received: from [2607:f8b0:4864:20::1031] (port=45910
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGJ5u-0001So-0L
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 06:19:08 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso8556694pjm.4
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 03:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qXoQsEYx48JAcXVGvMq4QeIZyqhwnnEuP6jKDGewOVA=;
 b=fRVoXVFTJZXB8RH5eSIw2EPGWEH8iKA87jayxiyiELS9LpA638TmtCAh6s524klVml
 tvjYFlP3Hyqj4SR4n5mdkMhy0B3l+S3frh88SXO6AKHTX0RNuiqk7aPOg20CIE1s8/sa
 Q852dIClWFkzqvQYknjTN/ZgAW3JX4GkoaWhtYl9EOiAx2+T5N2UC+I73EvNGCr3c18G
 bnB0JNL83ks7vPoaLrd6NhwdEw9zkfuLz0fFKePBQ5MEyKafPsUC9PSey+zW8vDjBBxj
 YxUvMKr3ztPvmUF+ad4WkPeypVgx10I0S5j+/sv6lrv4dLHbtr1whgKadbGxMVcZ2BKR
 EtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qXoQsEYx48JAcXVGvMq4QeIZyqhwnnEuP6jKDGewOVA=;
 b=eckEb3oZ5WHU62SeT09mD6TOrpDUbYxjscTJdSmy6rzFB8xXcFvSekYZ9/Zj8dGqYi
 5S80z4F9M18pRoB0CgLcdcKtp9NlLQbALjppyh5OuLN/3ihHbjKm83dmF/41H0p/sxsa
 yKOgrbKwXNaBOKauzMn1SCiQKVJjus6/bnHJJhOE0GRfF07RkbcGiSYZqcywG+Y5jWYl
 NMmCrisna590yY0jtx6NvquJWb34PlZfuQEaUAzgMo3Axed6igpH5J531Q/v9V8sSOnD
 9QmLpHSsZmxyZzfPvGGVFeTt/pbNLxhjcLvJyWO4L8PW36JLlzktNDcZ2Jy0r1wxDiIh
 Gw8Q==
X-Gm-Message-State: AOAM530EnNZqAg2Io9F7SqmNeMeUGTn/7vGtlcLfJJcpEmj/F8d58dUW
 Zp3+WFLoe3PdD06/Hxx7epI=
X-Google-Smtp-Source: ABdhPJzaiL+j2uHcBjuTHItekshsSwad6lhH0t+yiuCbxc/Z+d4Vh58e6fQ1EDH+avA/hsqr0DNG4g==
X-Received: by 2002:a17:902:9689:: with SMTP id
 n9mr7986009plp.33.1644059944714; 
 Sat, 05 Feb 2022 03:19:04 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f5sm5477936pfc.0.2022.02.05.03.19.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 03:19:04 -0800 (PST)
Message-ID: <74d9a3d4-58e6-9fb3-cacc-e3b6067d2373@amsat.org>
Date: Sat, 5 Feb 2022 12:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PULL 0/2] VFIO fixes 2022-02-03
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
References: <164392758602.1683127.4327439310436541025.stgit@omen>
 <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
In-Reply-To: <CAFEAcA-CX6hPOEEr_Yjcd1=4AHfkYgnkQ_ruUJ4mFwBYz1fLQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 5/2/22 11:49, Peter Maydell wrote:
> On Thu, 3 Feb 2022 at 22:38, Alex Williamson <alex.williamson@redhat.com> wrote:
>>
>> The following changes since commit 8f3e5ce773c62bb5c4a847f3a9a5c98bbb3b359f:
>>
>>    Merge remote-tracking branch 'remotes/hdeller/tags/hppa-updates-pull-request' into staging (2022-02-02 19:54:30 +0000)
>>
>> are available in the Git repository at:
>>
>>    git://github.com/awilliam/qemu-vfio.git tags/vfio-fixes-20220203.0
>>
>> for you to fetch changes up to 36fe5d5836c8d5d928ef6d34e999d6991a2f732e:
>>
>>    hw/vfio/common: Silence ram device offset alignment error traces (2022-02-03 15:05:05 -0700)
>>
>> ----------------------------------------------------------------
>> VFIO fixes 2022-02-03
>>
>>   * Fix alignment warnings when using TPM CRB with vfio-pci devices
>>     (Eric Auger & Philippe Mathieu-Daudé)
> 
> Hi; this has a format-string issue that means it doesn't build
> on 32-bit systems:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2057116569
> 
> ../hw/vfio/common.c: In function 'vfio_listener_region_add':
> ../hw/vfio/common.c:893:26: error: format '%llx' expects argument of
> type 'long long unsigned int', but argument 6 has type 'intptr_t' {aka
> 'int'} [-Werror=format=]
> error_report("%s received unaligned region %s iova=0x%"PRIx64
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../hw/vfio/common.c:899:26:
> qemu_real_host_page_mask);
> ~~~~~~~~~~~~~~~~~~~~~~~~
> 
> For intptr_t you want PRIxPTR.

Thanks Peter.

Eric, can you follow up on this series, looking at Igor comments wrt
migration state?

Phil.

