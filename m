Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF45FE098
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:12:03 +0200 (CEST)
Received: from localhost ([::1]:43012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2gc-0005rv-DX
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oj2cK-0001Rh-G7
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oj2cI-0005CW-Mu
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665684451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xh6eb71touqR5scc5c3fkKRKYTMcODh0hXteItqQVW4=;
 b=T3UvTZtnRydw8tvwGyoRufpB+5a76Rc66ZHlmfTB0i/RG+FehLSFW/f1RrM4+dBPq/A4hC
 RUg+FVxkGaneGnCoDm8q1m1kn5YMZNwUpC0O+FC1TFQ8Q4/DsvNbHGvOwZ8j45W8YEar5z
 eaLfYv08OhhcctodUnQ0NMQ9Ym+DR54=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-_m0vBCJ3NBW_896J2H5m0w-1; Thu, 13 Oct 2022 14:07:24 -0400
X-MC-Unique: _m0vBCJ3NBW_896J2H5m0w-1
Received: by mail-wm1-f72.google.com with SMTP id
 b7-20020a05600c4e0700b003bde2d860d1so1567908wmq.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xh6eb71touqR5scc5c3fkKRKYTMcODh0hXteItqQVW4=;
 b=Crb6eZyyWCcDcjcJccwVBJAb0ceNKyYWqYzRRijxXkPKJdVL3NDwT+dSt3z8Mpe5OS
 W/vSLAdzld5pI5iaWygS7v1isSeIys3hAbJb6ov/gCDndZxWcqW4B7rIKwwDZ4x/DMgK
 BhJwfjL+4b+pl6l2OWO2QXtLXlzCh0vn9geT+2liWJS5Reri6MzqMnTEedue/cbf1iMm
 aXjteiLEowFiukPDj5PvFGkU78PvBPZV/EWAa5VbcqUPXaeM7S3eK5AS2wkATaWkkozM
 qIuJCv0NtkvEXl5bSLDdymWUoW74dMcXYsBJhFMML6WCwjr3jioLyYSDYxaMBvpfcATQ
 NPHg==
X-Gm-Message-State: ACrzQf2B+D9lm27gd+j3CDV33P1fXIEa23Swoe6SRyH5WlVGm5W3qvBl
 RON18Cy8F/hi36ViUP6gFeBmWBllR99q0tVkzr9OXo50ajM+J30Kj55NUi1Fxnz2L5LNxDPJb34
 ejeH+RsQGo+9tin8=
X-Received: by 2002:a05:600c:5022:b0:3be:ed8:9a25 with SMTP id
 n34-20020a05600c502200b003be0ed89a25mr7594642wmr.194.1665684443319; 
 Thu, 13 Oct 2022 11:07:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7/IkHCzZGKqEvOiMDGO51p6rC7Iq6g0DV/xEpIgrEOzY5LjF4z2uws8DvGk7hOX21HKA31Mw==
X-Received: by 2002:a05:600c:5022:b0:3be:ed8:9a25 with SMTP id
 n34-20020a05600c502200b003be0ed89a25mr7594592wmr.194.1665684442902; 
 Thu, 13 Oct 2022 11:07:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:9d00:a34c:e448:d59b:831?
 (p200300cbc7069d00a34ce448d59b0831.dip0.t-ipconnect.de.
 [2003:cb:c706:9d00:a34c:e448:d59b:831])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003a5f54e3bbbsm5281434wmo.38.2022.10.13.11.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:07:22 -0700 (PDT)
Message-ID: <85c57cbb-7ea1-4dc0-f6cd-eba56a129567@redhat.com>
Date: Thu, 13 Oct 2022 20:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 09/13] block: add BlockRAMRegistrar
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Xu <peterx@redhat.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-10-stefanha@redhat.com>
 <20221007105121.qxhuroqnqhzqkmgo@sgarzare-redhat> <Y0hTYt6kwEasO5ea@fedora>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Y0hTYt6kwEasO5ea@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13.10.22 20:05, Stefan Hajnoczi wrote:
> On Fri, Oct 07, 2022 at 12:51:21PM +0200, Stefano Garzarella wrote:
>> On Thu, Oct 06, 2022 at 05:35:03PM -0400, Stefan Hajnoczi wrote:
>>> Emulated devices and other BlockBackend users wishing to take advantage
>>> of blk_register_buf() all have the same repetitive job: register
>>> RAMBlocks with the BlockBackend using RAMBlockNotifier.
>>>
>>> Add a BlockRAMRegistrar API to do this. A later commit will use this
>>> from hw/block/virtio-blk.c.
>>>
>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>> MAINTAINERS                          |  1 +
>>> include/sysemu/block-ram-registrar.h | 37 ++++++++++++++++++
>>> block/block-ram-registrar.c          | 58 ++++++++++++++++++++++++++++
>>> block/meson.build                    |  1 +
>>> 4 files changed, 97 insertions(+)
>>> create mode 100644 include/sysemu/block-ram-registrar.h
>>> create mode 100644 block/block-ram-registrar.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 0dcae6168a..91aed2cdc7 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2498,6 +2498,7 @@ F: block*
>>> F: block/
>>> F: hw/block/
>>> F: include/block/
>>> +F: include/sysemu/block-*.h
>>> F: qemu-img*
>>> F: docs/tools/qemu-img.rst
>>> F: qemu-io*
>>> diff --git a/include/sysemu/block-ram-registrar.h b/include/sysemu/block-ram-registrar.h
>>> new file mode 100644
>>> index 0000000000..d8b2f7942b
>>> --- /dev/null
>>> +++ b/include/sysemu/block-ram-registrar.h
>>> @@ -0,0 +1,37 @@
>>> +/*
>>> + * BlockBackend RAM Registrar
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#ifndef BLOCK_RAM_REGISTRAR_H
>>> +#define BLOCK_RAM_REGISTRAR_H
>>> +
>>> +#include "exec/ramlist.h"
>>> +
>>> +/**
>>> + * struct BlockRAMRegistrar:
>>> + *
>>> + * Keeps RAMBlock memory registered with a BlockBackend using
>>> + * blk_register_buf() including hotplugged memory.
>>> + *
>>> + * Emulated devices or other BlockBackend users initialize a BlockRAMRegistrar
>>> + * with blk_ram_registrar_init() before submitting I/O requests with the
>>> + * BDRV_REQ_REGISTERED_BUF flag set.
>>> + */
>>> +typedef struct {
>>> +    BlockBackend *blk;
>>> +    RAMBlockNotifier notifier;
>>> +    bool ok;
>>> +} BlockRAMRegistrar;
>>> +
>>> +void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk);
>>> +void blk_ram_registrar_destroy(BlockRAMRegistrar *r);
>>> +
>>> +/* Have all RAMBlocks been registered successfully? */
>>> +static inline bool blk_ram_registrar_ok(BlockRAMRegistrar *r)
>>> +{
>>> +    return r->ok;
>>> +}
>>> +
>>> +#endif /* BLOCK_RAM_REGISTRAR_H */
>>> diff --git a/block/block-ram-registrar.c b/block/block-ram-registrar.c
>>> new file mode 100644
>>> index 0000000000..25dbafa789
>>> --- /dev/null
>>> +++ b/block/block-ram-registrar.c
>>> @@ -0,0 +1,58 @@
>>> +/*
>>> + * BlockBackend RAM Registrar
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "sysemu/block-backend.h"
>>> +#include "sysemu/block-ram-registrar.h"
>>> +#include "qapi/error.h"
>>> +
>>> +static void ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
>>> +                            size_t max_size)
>>> +{
>>> +    BlockRAMRegistrar *r = container_of(n, BlockRAMRegistrar, notifier);
>>> +    Error *err = NULL;
>>> +
>>> +    if (!r->ok) {
>>> +        return; /* don't try again if we've already failed */
>>> +    }
>>
>> The segfault I was seeing is gone, though, and I'm getting a doubt.
>>
>> Here we basically just report the error and prevent new regions from being
>> registered. The VM still starts though and the blkio driver works as if
>> nothing happened.
>>
>> For drivers that require all regions to be registered, this can cause
>> problems, so should we stop the VM in case of failure or put the blkio
>> driver in a state such that IOs are not submitted?
>>
>> Or maybe it's okay and then the device will somehow report the error when it
>> can't find the mapped region?
> 
> The BlockDriver supports the fast path for registered bufs but also has
> a slow path using bounce buffers. When registered bufs fail it uses
> bounce buffers. That's why the guest still boots.

So, that means if we hotplug memory and would be out of slots, it would 
still continue working? Would there be some kind of a warning to let the 
user know that this might come with a performance regression?

-- 
Thanks,

David / dhildenb


