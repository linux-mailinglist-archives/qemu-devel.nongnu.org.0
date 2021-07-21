Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E03D14C0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:02:45 +0200 (CEST)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FcK-0007JC-Dm
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6Fap-0006c4-GN
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6Fal-0001v8-Pk
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626886866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MECP1s5GJFx+L4kzagewO7u+S+EVCjrLs6tYLiLzTl8=;
 b=WLnnX/1yPxoMMeFHvtTVEQ1Xba0JsyxAMR0IluMwMOniU7VfyIzUQg165bry1dEJexq+FX
 SWxtIbFZGeBuu//BOY1CsQ0CpgYN5Wn8KgcHfohqU1zColMOb4FjYfIX0gP0GHrMRLu+bO
 PzT0W5Zct3KEB/Je4KrPGqjRY12I1YE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-Wr2dRtL0MFClA1V3mFpQiQ-1; Wed, 21 Jul 2021 13:01:05 -0400
X-MC-Unique: Wr2dRtL0MFClA1V3mFpQiQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l18-20020a05600c1d12b02902278758ab90so1266816wms.9
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 10:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MECP1s5GJFx+L4kzagewO7u+S+EVCjrLs6tYLiLzTl8=;
 b=WFG6/A0kB9Kx8rlQn39A94mzYFvw5e8E5D7deyMVHn6dO5EtPyZOLBNdnSEROfOUVw
 ebLB5GDoh+M0IBqYgSfj6MbUqvDBQ5LBEPnBxFZGTrSAUTGaoP+yyNffpCCbMvo+MmMq
 xe5z4Cw5Vq56ly/mYg8SqOrY2utYoC8IdCKfv75mz1z0SkXB1rEZIb6B42RyV0gjl8Lk
 SPF82U82qH777v33ZjkTpN5pLHSGOhYKuPdS6kq+vo8zUlJkXVnInknf2mlBAEzAzT//
 qjLFyVMke7aODfwnC0zXul7n0xoAGYoCNv8blTLSKuty9ry9y5TOSXTRZ5zRUc1Noqoc
 Avtg==
X-Gm-Message-State: AOAM533x/tI7IVtpyPg8IY5/ejUep7LI+hUNQ0K43VFaw+IwdESVxaxX
 IUl+m0Pmh9qq/Qxgf4gmRg3FDX3eMP8VRhO64ce+vHLVad4jKM4JZ5A0v8gwNX2s17x3ENT33HT
 vwYGbQDWi7f5S3/U=
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr43452717wrs.158.1626886864033; 
 Wed, 21 Jul 2021 10:01:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/vX0s1eCrswk2HdUBzjwIGL59gOzRxXkwuGE8ws0cAzZgAVBEDhlXYCs5sMNOTMX1fH9Szg==
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr43452682wrs.158.1626886863743; 
 Wed, 21 Jul 2021 10:01:03 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.146])
 by smtp.gmail.com with ESMTPSA id k13sm28134117wrp.34.2021.07.21.10.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 10:01:03 -0700 (PDT)
Subject: Re: [PATCH v4] failover: unregister ROM on unplug
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210721160905.234915-1-lvivier@redhat.com>
 <20210721121922-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <312c926e-8771-c255-dafa-20864d054640@redhat.com>
Date: Wed, 21 Jul 2021 19:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721121922-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2021 18:19, Michael S. Tsirkin wrote:
> On Wed, Jul 21, 2021 at 06:09:05PM +0200, Laurent Vivier wrote:
>> The intend of failover is to allow to migrate a VM with a VFIO
>> networking card without disrupting the network operation by switching
>> to a virtio-net device during the migration.
>>
>> This simple change allows to test failover with a simulated device
>> like e1000e rather than a vfio device, even if it's useless in real
>> life it can help to debug failover.
>>
>> This is interesting to developers that want to test failover on
>> a system with no vfio device. Moreover it simplifies host networking
>> configuration as we can use the same bridge for virtio-net and
>> the other failover networking device.
>>
>> Without this change the migration of a system configured with failover
>> fails with:
>>
>>   ...
>>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>>   -device e1000,failover_pair_id=virtionet0,... \
>>   ...
>>
>>   (qemu) migrate ...
>>
>>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>>   error while loading state for instance 0x0 of device 'ram'
>>   load of migration failed: Invalid argument
>>
>> This happens because QEMU correctly unregisters the interface vmstate but
>> not the ROM one. This patch fixes that.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> And does failover_replug_primary roll it all back then?

It seems not.

To check I have started a migration, then I have canceled it, and I have started a
migration to a file (migrate "exec:cat > mig") and I have analyzed the result with the
script scripts/analyze-migration.py

But:

* with VFIO it's not a problem as we never migrate VFIO device itself,

* with an emulated PCI device, it's only a problem if we disable failover after having
canceled a first try (because if we keep failover we acts like for VFIO and we unplug the
card and don't migrate vmstates). This means we need a scenario like that to hit the bug:

    - enable failover with an emulated PCI device
    - migrate to another machine
    - cancel/abort the migration before the end of the migration
    - unplug the virtio-net device to disable the failover behavior,
    - migrate the machine again with only the emulated PCI device

  but as I said previously failover with emulated PCI device is only for developers and
test purpose and not to use in production...

Thanks,
Laurent


