Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996E6076BA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 14:13:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olquJ-0004Ti-Ej
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:13:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqkD-0005pK-E7
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1olqjv-0005mC-PE
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:03:03 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1olqjt-00078Q-K8
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:03:03 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y8so2336414pfp.13
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 05:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=07wgdOr43C7yYIaMVonSRXnVYvZnbB+DRln6eWPco4Q=;
 b=UglWtv4NCrkJavzo6p6FRAW1uKW8lFDffHlZ7IWEMU3/hnQjK/a0wkt5y0kk129vMp
 4ogzJPjrvPLtIlBmv2V44GcrTI33Uyee0ktZXVnSAo7AygwHYy1HunY7sh065YeBhEGD
 xxbrG7xKZIsCYEk1vXi8B1g8BWzVZFCDnzaQ1lwbHkdRwKR/eKcjtvBM9q3u9553HLVb
 ljTBvHldqhKrij2gUfpb7YrizhQX9gmfwjELEP8ttuwHXwiVvaDO6YFq8ikBt51CGwFO
 npYRsLvVJqa8yhhqsmUkP28YlDWCff+ORsvYqi/2spAsRyffUXNCz1h1sJo/pFjQBqAc
 rSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=07wgdOr43C7yYIaMVonSRXnVYvZnbB+DRln6eWPco4Q=;
 b=dNdLLH0wwTIZh9vCbP+YFpQ2DdXguOnlkF1WPaxOhMGZPpSpHSwbAfw/GryRBXEq8u
 PyebKH6ZG03L38mYg4sZqxj7P0/SZeX0PfYPYfxEMLSm6ipEKebqXPnIH/gZRBi7E207
 hrHzW48kCM9XNXDBIxABhLbTChhRdK//DnsjTL0GtNVTH8wzVOAENWIITvkCHYt/kZOT
 PJkGhTHxocb0YQXbOdlU5NXoKdyVutcplsVICsqBzliQKTcSjGnT70rtMfMGyx38VCR4
 4XL3DauxrQRIsmgJ/B2jfSPmcXEIWTmsHw+Y6OqhXZBzTaehl/YJ+a2QZsfxlxz5hTwv
 lkKQ==
X-Gm-Message-State: ACrzQf0MuLDKIKl0dWUHmCe3nWuxJDJmT4FZDcsR13KJjh0bcRoLYfY7
 On0It/Q32+aP1TsmxTOAUTFkIQ==
X-Google-Smtp-Source: AMsMyM4s51UbGNBSAd2vITOHWUoFWjNttzQhQbmYvdWCOunBmajoVNJfYBvQQuKAQx1qnLYfN92Ezw==
X-Received: by 2002:a05:6a00:847:b0:563:b593:b685 with SMTP id
 q7-20020a056a00084700b00563b593b685mr18811077pfk.75.1666353776864; 
 Fri, 21 Oct 2022 05:02:56 -0700 (PDT)
Received: from [192.168.10.153]
 (ppp121-45-204-168.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.204.168])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a170903248300b00176d218889esm14486068plw.228.2022.10.21.05.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 05:02:56 -0700 (PDT)
Message-ID: <ea459602-7144-a484-ddeb-ed46e8ebb011@ozlabs.ru>
Date: Fri, 21 Oct 2022 23:02:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: x86, pflash, unassigned memory access
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: nikunj@amd.com, "Roth, Michael" <Michael.Roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <89d24ddd-bff8-53dd-19c9-66ac43ab0b63@ozlabs.ru>
 <e293f12d-0ecf-77d1-28ce-b67c620c953a@ozlabs.ru>
 <b21fc9a7-fa3e-00e8-f2e4-c0e80ee755ec@linaro.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <b21fc9a7-fa3e-00e8-f2e4-c0e80ee755ec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 18/10/2022 20:56, Philippe Mathieu-Daudé wrote:
> On 4/10/22 05:00, Alexey Kardashevskiy wrote:
>> Anyone, ping?
>>
>> On 27/09/2022 12:35, Alexey Kardashevskiy wrote:
>>> Hi!
>>>
>>> I am trying qemu-system-x86_64 with OVMF with the q35 machine, the 
>>> complete command line is below.
>>>
>>> It works fine (including SEV on AMD EPYC), but these 2 parameters 
>>> make me wonder if I miss something:
>>>
>>> -drive 
>>> if=pflash,format=raw,unit=0,file=/home/aik/OVMF_CODE.fd,readonly=on,id=MYPF \
>>> -d guest_errors
>>>
>>> With this, I see a bunch of
>>> ===
>>> Invalid access at addr 0xFFC00000, size 1, region '(null)', reason: 
>>> rejected
>>> Invalid access at addr 0xFFC00001, size 1, region '(null)', reason: 
>>> rejected
>>> Invalid access at addr 0xFFC00002, size 1, region '(null)', reason: 
>>> rejected
>>> ...
>>> Invalid access at addr 0xFFC00FFF, size 1, region '(null)', reason: 
>>> rejected
>>> QEMU Flash: Failed to find probe location
>>> QEMU flash was not detected. Writable FVB is not being installed.
> 
> Could you be missing the VAR STORE flash?
> 
> -drive if=pflash,format=raw,unit=1,file=/home/aik/OVMF_VARS.fd,id=FVB

Yes! This helps, thanks!



-- 
Alexey

