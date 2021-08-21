Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197413F3AC6
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 15:34:17 +0200 (CEST)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHR8U-0002JJ-Dk
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 09:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mHR6w-0001d3-7c
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 09:32:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mHR6q-0005y8-EP
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 09:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629552746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PYO23ymwNKUnv7XC44fv/VI2/37P/M5Vesj9Glph70k=;
 b=eX2hk6QrtXJq5hzJWmqsqSatcS48LdJeuMGCfwkZngZMijDihSHUMejfXtJ/zgx5DxM3Z5
 q9/DQ2EuQ4yAxsNUVWGcGlXhCGNEBazd+X5RDrpBOpXeGbcqj78d8Qy3qiV2izx9gBUwuY
 H4N6bKqKNnF7FWaplaeXs//FFN0LUkY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-MNom7O_9O2qpfmUzPKmfOg-1; Sat, 21 Aug 2021 09:32:21 -0400
X-MC-Unique: MNom7O_9O2qpfmUzPKmfOg-1
Received: by mail-wm1-f72.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso774460wmx.0
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PYO23ymwNKUnv7XC44fv/VI2/37P/M5Vesj9Glph70k=;
 b=o7Yz9q7Z7ApDneDhQIDldnkhQL8icp2hzssosmJzvqjLChNWjbqb7s+MZLXSLVq32e
 UOCEa1riOAaUuo5gppc9FR6oBQwUrfG53XtkM3wkcjarKGfkRnyeoriEZEdmb2aRIkDq
 p5aphY/aYWV7BM3m9bQSo0Q+T2kAHTAMR2kT7HZk+uziF9ugmV+3Fx44NETKtCjGENdq
 hszLhLEdR39+1tTDZFJbt39Se4lW4R0FK1U+NKW60o+Fknbb6QsmMIaoSYk1+w+8vBdu
 53ZfD1SdtkYV4adoTQbdTuJsXoxlt9OeJK2C1vzjXazwKz1F4AZGCY4QO6SN5rcsSteg
 L5Cg==
X-Gm-Message-State: AOAM530qmuJRTZsD9My8Mz7lmOcdC+NcvjSjIQC82EzXyR71OYFBpSFP
 zFUimT9TN3yq8mbYdpcu9U72kMMOqTAF8ZzBPcZbA7jx1Lj4AHKkFfEa65eIQkGkUbs0G3WvaJD
 3J90R7dACsd1tWN8=
X-Received: by 2002:a5d:65c2:: with SMTP id e2mr3922283wrw.191.1629552740627; 
 Sat, 21 Aug 2021 06:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy777ZyjHq9l+vTqeSeU5IRWcXF4zGVB8hM0mKcAQe5uilILJt9c7hg9y8cMfoDlangBPQtsg==
X-Received: by 2002:a5d:65c2:: with SMTP id e2mr3922265wrw.191.1629552740440; 
 Sat, 21 Aug 2021 06:32:20 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t7sm4980520wrq.90.2021.08.21.06.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Aug 2021 06:32:19 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <CAEUhbmXP7=0j10Kf3w1DsPb-ByCTv+dSGbF=0ARQXd44soyv6A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c66dc58e-a662-1447-21f5-d5fcca19812c@redhat.com>
Date: Sat, 21 Aug 2021 15:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXP7=0j10Kf3w1DsPb-ByCTv+dSGbF=0ARQXd44soyv6A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/21 12:01 PM, Bin Meng wrote:
> On Fri, Aug 20, 2021 at 11:52 PM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> When Linux refuses to overcommit a seriously wild allocation we get:
>>
>>   $ qemu-system-i386 -m 40000000
>>   qemu-system-i386: cannot set up guest memory 'pc.ram': Cannot allocate memory
>>
>> Slighly improve the error message, displaying the memory size
> 
> typo: Slightly

Oops.

>>              if (!new_block->host) {
>> +                g_autofree char *size_s = size_to_str(new_block->max_length);
> 
> Does g_autofree work with every compiler we support?
> 
> Looks it only applies to GCC and clang?
> https://www.gitmemory.com/issue/linuxwacom/libwacom/142/518787578

Which are the only two supported by the project AFAIK.

g_autofree depends on glib, minimum available since commit 00f2cfbbec6
("glib: bump min required glib library version to 2.48").

Merged here:

commit 3590b27c7a2be7a24b4b265
Merge: d013d220c71 57b9f113fce
Date:   Thu Aug 22 17:57:09 2019 +0100

    Merge remote-tracking branch
    'remotes/berrange/tags/autofree-pull-request' into staging

    require newer glib2 to enable autofree'ing of stack
    variables exiting scope

> Tested-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!


