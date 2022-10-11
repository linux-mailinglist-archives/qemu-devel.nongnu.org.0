Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D25FB2EF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:12:20 +0200 (CEST)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiF3T-00012C-Ex
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiE4c-0000xM-3v
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiE4V-00045P-4T
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665490158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqyl++94GKw7NaJRzj4c964iwLaOOYWXPDn4ROZtHxc=;
 b=Bp80LiQ8w2DxYeQYGphWHhTX3/d+b25O/LiRD3+7lhaYQb8NFsSKTnCkjIE7kGKgd3fX0q
 s7d8QPT2iS514vXgqQVUtQkLPwWWGoKQzr4JwYJdyr2uKKmZNaRkmM3wNfqdfybKfRSSJC
 WQ/1BfsnC+sioz8trSWUtTQz6EherrQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-qLbKYvVZPCeoyk2G8-mIAA-1; Tue, 11 Oct 2022 08:09:17 -0400
X-MC-Unique: qLbKYvVZPCeoyk2G8-mIAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n6-20020a7bc5c6000000b003c6bbe5d5cfso2616478wmk.4
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 05:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jqyl++94GKw7NaJRzj4c964iwLaOOYWXPDn4ROZtHxc=;
 b=H9RRMazQp/QdarfBHreAXK1oAWuuKzS7EvpdreGtOsQD3vhL1VIvrUisj6OeTX35nx
 X/FZqX4iT0j3yRqkGZQvZr8feAoxhETFoPfvcCHPqyQMqqYvMet6A4vcLjox2OPDjQv4
 3t65IIa1C3YIp2mU9dxUezt6kjhVjEGOnxtCoNbYrOiy0vVOXY9e6RQnzvIkY+ChSO8f
 Mu0ROJ0yKH0Q6VEigbuwVAy2Vbc/aBjWVcyY0hBbVqMJm2yToocBkeXOoteLzHkce3SQ
 fJe1S6s6k6k+WzFf6jjfPRr1Z2i3U9bJKKExOgs+GN/CDBOCP5kYq/90V88urFpCHWFZ
 HWfg==
X-Gm-Message-State: ACrzQf0yB4K7pPCQJJOZBC15e282TiTWld46KXv8aEd5jAYfXJQ0JtaR
 8jU4+88gmF8uSaGIzjJI9UdLmJCcB0FWhlPoZ0IRc0s1yoC3r0oZgaw4rI4XzzMqV3nyRGFZqOd
 J8WA4SwjW1XlIhQA=
X-Received: by 2002:adf:ec03:0:b0:22e:4d3:bb37 with SMTP id
 x3-20020adfec03000000b0022e04d3bb37mr14703142wrn.665.1665490155955; 
 Tue, 11 Oct 2022 05:09:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7lx2telqMLsHVL6aOhbF+9oZ/ta3ZrmfIEn3uWSEXDjwKeNz96QyahEzAHNeyRUfoHqjsWJw==
X-Received: by 2002:adf:ec03:0:b0:22e:4d3:bb37 with SMTP id
 x3-20020adfec03000000b0022e04d3bb37mr14703120wrn.665.1665490155711; 
 Tue, 11 Oct 2022 05:09:15 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b0022e6f0d0d7csm14340828wrm.18.2022.10.11.05.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 05:09:15 -0700 (PDT)
Message-ID: <dcef7214-d4a0-91c1-87d0-26afb7381c6c@redhat.com>
Date: Tue, 11 Oct 2022 14:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PING PATCH v5] Add 'q35' machine type to hotplug tests
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <91db0531-0793-92bd-2d0e-8ad8921cbfb9@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <91db0531-0793-92bd-2d0e-8ad8921cbfb9@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_LOW=-0.7,
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

On 11/10/2022 12.18, Michael Labiuk wrote:
> I would like to ping a patch

Sorry, it took me a little bit longer to get back to this...

Anyway, patches look fine, and I've queued them now (with the typo fixed in 
the first patch) to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next

  Thomas

> 
> 
> On 9/30/22 01:35, Michael Labiuk via wrote:
>> Add pci bridge setting to run hotplug tests on q35 machine type.
>> Hotplug tests was bounded to 'pc' machine type by commit 7b172333f1b
>>
>> v5 -> v4:
>>
>> * Unify device removing in tests.
>> * Using qtest_has_machine("q35") as condition.
>> * fixed typos.
>> * Replaced snprintf.
>>
>> v4 -> v3:
>>
>> * Moving helper function process_device_remove() to separate commit.
>> * Refactoring hd-geo-test to avoid code duplication.
>>
>> Michael Labiuk (9):
>>    tests/x86: add helper qtest_qmp_device_del_send()
>>    tests/x86: Add subtest with 'q35' machine type to device-plug-test
>>    tests/x86: Refactor hot unplug hd-geo-test
>>    tests/x86: Add 'q35' machine type to override-tests in hd-geo-test
>>    tests/x86: Add 'q35' machine type to hotplug hd-geo-test
>>    tests/x86: Fix comment typo in drive_del-test
>>    tests/x86: replace snprint() by g_strdup_printf() in drive_del-test
>>    tests/x86: Add 'q35' machine type to drive_del-test
>>    tests/x86: Add 'q35' machine type to ivshmem-test
>>
>>   tests/qtest/device-plug-test.c |  56 ++++--
>>   tests/qtest/drive_del-test.c   | 125 +++++++++++--
>>   tests/qtest/hd-geo-test.c      | 319 ++++++++++++++++++++++++---------
>>   tests/qtest/ivshmem-test.c     |  18 ++
>>   tests/qtest/libqos/pci-pc.c    |   8 +-
>>   tests/qtest/libqtest.c         |  16 +-
>>   tests/qtest/libqtest.h         |  10 ++
>>   7 files changed, 425 insertions(+), 127 deletions(-)
>>
> 


