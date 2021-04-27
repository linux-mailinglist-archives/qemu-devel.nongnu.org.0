Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C5A36C5F6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:19:44 +0200 (CEST)
Received: from localhost ([::1]:59884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMgp-0001dQ-7r
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbMVz-0005yA-MW
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbMVv-0006Qb-9S
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619525305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWpk78itXvEXOeGAQa5LeLTvdGlpzh0HH/9BHTsSuBY=;
 b=JlU6XnBsAHWfBLO2fpET8z6+P1FLzW+N/QZYPhS//WqCaGtKpN5a14DdiW5BTj5MqBK/zv
 8dfHD70qjpFWNgt0TWflKGUgwnc0oz+mz/IJFGEnAx+5gOUyguN+6R8texSMxzgzHYxbhs
 xaQZCFIM/eMpxf/CKSWgEm9JdkU7a9M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-QyZ6obTsO8ybgH1YyArkTA-1; Tue, 27 Apr 2021 08:08:24 -0400
X-MC-Unique: QyZ6obTsO8ybgH1YyArkTA-1
Received: by mail-wm1-f72.google.com with SMTP id
 26-20020a05600c021ab029012e366eff83so2459516wmi.4
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 05:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mWpk78itXvEXOeGAQa5LeLTvdGlpzh0HH/9BHTsSuBY=;
 b=XOArlP58HNzqUYp4LJiAJiYhCF7xeqW2WQVBjiufzHGv19qX8cqqg4GEsJs24fEZau
 7ZbfpMkBK1TqG6q9UZ01lqZcSuQhW9R1pTSp2IgOTMlwDnaRg+3xVedqcBcsZSxyIsGU
 NLbOrRhetgESgaIjIa0eJvpPW8cjXGsdz9kzRBvUl7wi/rcO/d8Ccva1GzgxVv9qSX/N
 RbqiIxntOtw/H7zJn7LT4wGH7SUMXouuLi1tcIcnwi15qAYaaiJcV9teMiAzN7Vly2OC
 TR/gTp3JvopbdD1v7xRCt8D+O/iE4vsLNuCnK0VY0rQ9EdJEsx8BASVdAg6K1CJEE5Yq
 XqpQ==
X-Gm-Message-State: AOAM532Cbu1iYs6sZEDXlxqfEYv+Y/Xzj0Akxyz0sM4AWwBtuzG+m2sw
 +cZndk5U6Xr6Ufc5APyCxuKLB0panGUh4kbE3hWQKDvWOTnG3cDUF8CyRSOLBQ1kRmxOY1MahRK
 TO1yX1ubBqFTsBiU=
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr28752954wrx.281.1619525302961; 
 Tue, 27 Apr 2021 05:08:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAbmngEuFJSmX7C1FjV6HRP4DuMcpvKpTyQQYdXh3rbzn2Xwi0RpWclSVwcEPSx+H9q8vVXg==
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr28752923wrx.281.1619525302778; 
 Tue, 27 Apr 2021 05:08:22 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u6sm3271443wml.6.2021.04.27.05.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:08:22 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] Introduce cluster cpu topology support
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210331095343.12172-1-wangyanan55@huawei.com>
 <13983bec-8b6b-4277-288a-e243d096bfb3@redhat.com>
 <a883cf7e-b820-9d20-6424-e2add3007e9b@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d21d4ec0-9b2a-c881-5e2c-0542b4166704@redhat.com>
Date: Tue, 27 Apr 2021 14:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a883cf7e-b820-9d20-6424-e2add3007e9b@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 1:00 PM, wangyanan (Y) wrote:
> On 2021/4/27 17:57, Philippe Mathieu-Daudé wrote:
>> On 3/31/21 11:53 AM, Yanan Wang wrote:
>>> Hi,
>>> This series introduces the cluster cpu topology support, besides now
>>> existing sockets, cores, and threads.
>>>
>>> A cluster means a group of cores that share some resources (e.g. cache)
>>> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
>>> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
>>> share L3 cache data while cores within each cluster share the L2 cache.
>>>
>>> Also, there are some x86 CPU implementations (e.g. Jacobsville) where L2
>>> cache is shared among a cluster of cores instead of being exclusive to
>>> one single core. For example, on Jacobsville there are 6 clusters of 4
>>> Atom cores, each cluster sharing a separate L2, and 24 cores sharing
>>> L3).
>>> About this series:
>>> Note that, this series was implemented based on [3] and [4]. Although
>>> they
>>> have not merged into qemu mainline for now, it's still meaning to
>>> post this
>>> series to express the thoughts first. So a RFC is sent and any
>>> comments are
>>> welcomed and appreciated.
>> At a glance: tests/unit/test-x86-cpuid.c should be adapted to be generic
>> (but still supporting target-specific sub-tests) and some aarch64 tests
>> added.
>>
>> Similarly the ARM PPTT tables tested in tests/qtest/bios-tables-test.c.
>>
>> Otherwise, the overall series looks good and coherent, but it isn't my
>> area :)
> Thank you for the reminder of the related tests. :)
> I will have some work to make them cover the new features introduced
> by this series.

BTW if after 4 weeks and 2 pings nobody sent negative feedback or
NAcked your series, it usually means the community is not against
your purposal, but has some doubts this feature is necessary or
well designed. Tests help to show your work is safe, as it doesn't
break anything. You might need to better explain why this feature
is needed, and what are the limitations of what is currently
possible.

OTOH QEMU has been in "feature freeze" for the next v6.0 release
for the same amount of time, so maybe the maintainers/reviewers
were busy with bugs and still have your series in their TODO list.

Regards,

Phil.


