Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D55365609
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:20:58 +0200 (CEST)
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnV2-0002fW-8W
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnSv-00027T-Oi
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:18:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYnSr-0001JL-Gw
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618913920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHz0dZF3qRUaF/BqQApic7OjVIZOr5upqJo5PWk9HQM=;
 b=ArLotxPJi29T4S1JC9OAzOcczdTY8TfiIZRG52l9PI4JYvS8UIyykM+TT0FV5BIadHpcpw
 g30CHKt7uoQw2cOZ4fYoPtsvXXMGuPY30YnyyYkK0fGhn5ahssrw2Rf1EzZr4nd2foNVjW
 H/3llyFXxC0G+7x8ySvzRfJhPsk4Iww=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-JGQyTm7uMeuw_Fbas3yENw-1; Tue, 20 Apr 2021 06:18:38 -0400
X-MC-Unique: JGQyTm7uMeuw_Fbas3yENw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c124-20020a1c9a820000b0290136c7a94cf3so906028wme.3
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VHz0dZF3qRUaF/BqQApic7OjVIZOr5upqJo5PWk9HQM=;
 b=gy07qVwdNe3F87IUZUWcebqoRmF/Nw3yfyv31Cqxbe0Uwez6cqOTOEcWBEkFmBe+JU
 Qg5Jg3awWzqt+5+qnd5J1CJsjm3uHpk6YyF1+LnPaJPDOAoqBQhs5oWOOdgWcnmM+C9C
 m9zDsbXO+o5dosJQHmSrPiyTJ6HmVVshHVNjyQ6c3mwFMTGCA2SkuQxt3aNHPpg0snhg
 Qf4zNrpQmX/IVHjx5ywJf2g1JYfzxkhOWwFzGr7YChU5ZfjnckhbDJt8CbABuiJlhgj3
 QE0+gUAgrvmdfsCxNozk5NPLIz5mIhFanPHCfCHDigKkJB7L9kIWi7MFgRJkSH4N/H8e
 i6lA==
X-Gm-Message-State: AOAM532VhmO11RfII1h+PTvkqDny9dZXSFFMct1f3EzdpnRtvb/5vXXn
 2/4n4EiP3vWveZU5N+G6D8IYbcfL0bpG41iJzR0hGhVzDsfV0WrbGlJMJRYDI1YTmBTMASbWHo0
 C1U3kD5TtGjvw37M=
X-Received: by 2002:a05:6000:1204:: with SMTP id
 e4mr19562918wrx.424.1618913917780; 
 Tue, 20 Apr 2021 03:18:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX/gfBAa0MFKw3+LvYpIekIL8MgsIYIqQ1RVEgjXKCJycwFkJLyuKDY7TO3EU+uImdI78XDw==
X-Received: by 2002:a05:6000:1204:: with SMTP id
 e4mr19562895wrx.424.1618913917610; 
 Tue, 20 Apr 2021 03:18:37 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a22sm25615901wrc.59.2021.04.20.03.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:18:36 -0700 (PDT)
Subject: Re: [PATCH v5 04/14] softmmu/memory: Pass ram_flags to
 qemu_ram_alloc_from_fd()
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-5-david@redhat.com>
 <83201a21-7f05-88dd-abc7-59576bce2fe9@redhat.com>
Message-ID: <6ab168bd-113c-6fcb-658a-70f71aca4ab0@redhat.com>
Date: Tue, 20 Apr 2021 12:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <83201a21-7f05-88dd-abc7-59576bce2fe9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 4/20/21 11:52 AM, Philippe Mathieu-Daudé wrote:
> On 4/13/21 11:14 AM, David Hildenbrand wrote:
>> Let's pass in ram flags just like we do with qemu_ram_alloc_from_file(),
>> to clean up and prepare for more flags.
>>
>> Simplify the documentation of passed ram flags: Looking at our
>> documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
>> repetitive.
>>
>> Reviewed-by: Peter Xu <peterx@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>  backends/hostmem-memfd.c | 7 ++++---
>>  hw/misc/ivshmem.c        | 5 ++---
>>  include/exec/memory.h    | 9 +++------
>>  include/exec/ram_addr.h  | 6 +-----
>>  softmmu/memory.c         | 7 +++----
>>  5 files changed, 13 insertions(+), 21 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Actually it would be clearer to define the 0 value, maybe:

#define RAM_NOFLAG     (0 << 0)


