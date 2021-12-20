Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B7F47B0F7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:14:41 +0100 (CET)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLJA-0006f9-81
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzCX2-0008He-Q2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:52:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzCWy-0002lB-O5
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:52:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639983139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzJP0Z9ubQUWm8L+XDoVW51REQcnkIuPaYWVgn2mxu4=;
 b=J+Z3p5UpS9UpcZT2z+V5ZATQcZrJu0XfpCOb9kxM+/KR0WDugwI5y1E+P2MANn1OBMA+kG
 RKqkdQUwXW5nld8jbVob7JZOZmoUjXjJ+XHAUYJRPrBWAeYl9c4izsVfDMVFCaj5ff+aPQ
 sSx0kF18gs7bfkUKnXFdixl5H7/YWxA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-vnP6rTESOviq-n-a20WCZQ-1; Mon, 20 Dec 2021 01:52:15 -0500
X-MC-Unique: vnP6rTESOviq-n-a20WCZQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so2929458wmq.9
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 22:52:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TzJP0Z9ubQUWm8L+XDoVW51REQcnkIuPaYWVgn2mxu4=;
 b=yobiixpZtPklHJzllnOQtI38NU9IpFB1bvj1R+zIBJwlrYj2ORIode8XFaFOJDm/K2
 SXN2iSPzG8NDxqKBxrUHLoTyoRwufAm3MPp8u0cnlSTWoH+9SDaraHN+cFrnmm/JvyXo
 vNYIouN5SHVLm4WVYRWPIpp8vRTclwfx+qi9kIr1tySS+m1zhJdZ4v6VFoQgvLkHUXk1
 m3ekFZBNc6noy1v+rkGsTFO/zEgH+9L0ieqpHzB/s/eYcPzd1CQcWBbD5N0DZ2fEoNqP
 o2PHNLVCymmy8pnZmy0W+bazmyCvkggO14l4YHEQWBJxO8MCMo433zJ06HGhoNJ2+IuK
 OATA==
X-Gm-Message-State: AOAM533W8nIfGxYokKu4zMngjqMIQ95o9KSvh7YwGhS5yCTCDn4EcODi
 aeA0YjTkZSI5hXXFtmJQ0vBo97mJ+rh0tKDdmH/I4a0dIdoWHLRBv5qMc8Rr6nlVB1Ebsh7l65m
 AyWPpFt8HSJAXjMc=
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr2091050wrx.62.1639983133826; 
 Sun, 19 Dec 2021 22:52:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8nAxLU0ho4xNZMHg0F23XRXSfid0ri6KvdUHHhbQCQY/8hmwRa2NgxxPhgUAuR+a7Y0GPZg==
X-Received: by 2002:a05:6000:144c:: with SMTP id
 v12mr2091040wrx.62.1639983133665; 
 Sun, 19 Dec 2021 22:52:13 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id o13sm149828wms.17.2021.12.19.22.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Dec 2021 22:52:13 -0800 (PST)
Message-ID: <bc315dd4-d43d-092a-30b2-f609266715a2@redhat.com>
Date: Mon, 20 Dec 2021 07:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 00/16] qtest and gitlab-CI improvements
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
 <ed66cc5f-cc71-fcf8-3026-6fe775a1c5f8@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ed66cc5f-cc71-fcf8-3026-6fe775a1c5f8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/2021 17.33, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 12/15/21 08:33, Thomas Huth wrote:
> 
>> ----------------------------------------------------------------
>> * Add virtio-net failover test
>> * Make qtests a little bit more flexible with regards to reduced configs
>> * Move libssh setup from configure to meson.build
>> * Run device-crash-test in CI
>> * Add jobs for NetBSD and OpenBSD to the CI
>> * Test compilation with MSYS2 in the gitlab-ci, too
>> * Add new virtio-iommu test
>>
>> ----------------------------------------------------------------
> 
>> Laurent Vivier (4):
>>        qtest/libqos: add a function to initialize secondary PCI buses
>>        tests/qtest: add some tests for virtio-net failover
>>        tests/libqtest: add some virtio-net failover migration cancelling tests
>>        tests/libqtest: add a migration test with two couples of failover devices
> 
> On my ASan build directory I'm sometime getting:
> 
> Running test qtest-i386/virtio-net-failover
> (process:1558675): GLib-CRITICAL **: 16:19:12.556: g_rand_int: assertion
> 'rand != NULL' failed

Weird, since the test is not using that function? Could you get a backtrace?

  Thomas


