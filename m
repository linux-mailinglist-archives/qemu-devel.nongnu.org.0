Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4EA39D5CE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 09:17:56 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq9WF-0003KM-5J
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 03:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq9UY-0002OC-1J
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 03:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lq9UU-0002yG-RX
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 03:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623050165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIoH7qz/E/dzI8x/wGCnLPRHxL+JpjM+xdrIxQArNPY=;
 b=aS8KTMoQvI0AyhHjU8/LUUtydEzLeOhAkpXP3OP0X0WmKwbnf/z4RbSByDEANy/PmBHM52
 82ih062oeec9BJNoWwRrzM7FLu0+loOlgwgMi9Up9yDtNQmpxcAXT5j/4JULIqmnIujEh6
 QskAoxoLtq6MHi/TFs4R6vkBjd11aMU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-rgsJsKIlNSGVmWp-7LVJDg-1; Mon, 07 Jun 2021 03:16:03 -0400
X-MC-Unique: rgsJsKIlNSGVmWp-7LVJDg-1
Received: by mail-wm1-f72.google.com with SMTP id
 i13-20020a05600c354db029019c437c377eso2097206wmq.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 00:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SIoH7qz/E/dzI8x/wGCnLPRHxL+JpjM+xdrIxQArNPY=;
 b=N6WduqEuH0cIPEPeyqIQQy2Jd5b4e1g0o2Ariv3rvuSem6GieVVGjmtZutHFhZPS3E
 mHydnW8epxUO2YwUtf9jqsfnDgrRxhcYmi5yk7rcnhwYHvhxJf5klGZAflm5XFyRlEs3
 Q+DKW3eC6RG0w/tz9ZNpLFfAq7hrzn3evlogSnUNfV3tg2jS5fgwi4p1/B4vnVZ7QxQL
 2zsHRiEwtfjUCfo7V0tDrpH5VshNP9aM0ALiW8oBdjcvhRzLcvguj+vvf+YVfD6gGwns
 MUazQ64MVA0y6e2+OVeIm8XbeVzNroQjPPsTMhFN0TlrJriuBCbqhgJApwxalRQogWd/
 JnDQ==
X-Gm-Message-State: AOAM530BVsP40f+NJNHAQvZxh7Rra5kLYzrcUeaW9Yr2vp68UDj3LFxK
 Thg7Ul2j1Is3QjViv2UfcxOJuXIHecK5sFuU9Vnz+PCG7pePPCfTf9WuO4kOxcymH9oHEcVgF8E
 hOZ9FaI2SFr8Rx8eOlHJQs3G06RJLethi9OOMlLCIiMTwqjzg65O8E7yJRBM8nkw=
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr15522789wmk.97.1623050162816; 
 Mon, 07 Jun 2021 00:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhIlUvKgsM8lV4PpuMPq34ZisgafRK0WVHZuBGKa7JKSDMewpFjQmBpEMvCMsSVR2d4cowUw==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr15522758wmk.97.1623050162479; 
 Mon, 07 Jun 2021 00:16:02 -0700 (PDT)
Received: from thuth.remote.csb (pd957536e.dip0.t-ipconnect.de.
 [217.87.83.110])
 by smtp.gmail.com with ESMTPSA id t12sm19000280wre.9.2021.06.07.00.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 00:16:02 -0700 (PDT)
Subject: Re: [PATCH 0/2] Improve vmstate_vmbus_dev handling
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
References: <20210603104139.556512-1-thuth@redhat.com>
 <29f1529e-5865-db7e-698d-e7a046f012a3@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <071039e6-2364-d9f3-2b19-ea2cbf454d2a@redhat.com>
Date: Mon, 7 Jun 2021 09:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <29f1529e-5865-db7e-698d-e7a046f012a3@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Jon Doron <arilou@gmail.com>,
 Roman Kagan <rkagan@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/06/2021 18.01, Maciej S. Szmigiero wrote:
> Hi Thomas,
> 
> On 03.06.2021 12:41, Thomas Huth wrote:
>> I accidentally came accross vmstate_vmbus_dev and noticed that
>> it is currently not used at all ... wire it up and make it
>> static, since it is only used in one file.
>>
>> Thomas Huth (2):
>>    hw/hyperv/vmbus: Wire up vmstate_vmbus_dev
>>    hw/hyperv/vmbus: Make vmstate_vmbus_dev static
>>
>>   hw/hyperv/vmbus.c         | 29 +++++++++++++++--------------
>>   include/hw/hyperv/vmbus.h |  3 ---
>>   2 files changed, 15 insertions(+), 17 deletions(-)
>>
> 
> I think the idea is to embed vmstate_vmbus_dev into a child device
> VMStateDescription using VMSTATE_STRUCT() - since particular VMBus
> devices aren't merged yet there are currently no users of it.

Ok, then never mind. But some comments in the source code would be really 
helpful - in the current shape, it simply looks like an oversight...

  Thomas


