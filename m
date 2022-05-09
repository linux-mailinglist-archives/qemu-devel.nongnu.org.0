Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF851F679
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 10:21:09 +0200 (CEST)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnydh-0002fD-43
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 04:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nnyar-0000u9-4T
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:18:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nnyao-0007Yr-Hx
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652084289;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhMKcmi0HbN3MSLylKUabKp9ZNkm6fODYU12ttl531Y=;
 b=MEPk91QvG072y88F9BQKzoPLGcP5oyO33r2+6OdjvyRaDlceVWEL7ZjO63EBED5kRTpArj
 r1NWwv0ySL4e2RAya4tsz0Es/0h3sYWMlgO07jnZZciNq5ZGW2/ztkFAA45uKzKRiuu/EI
 woG3uvCdRW2QLnai/PaKV3VypnarsPA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640--7axEnBoMf-KW5YSNTllBg-1; Mon, 09 May 2022 04:18:07 -0400
X-MC-Unique: -7axEnBoMf-KW5YSNTllBg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p24-20020a1c5458000000b003945d2ffc6eso3958829wmi.5
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 01:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xhMKcmi0HbN3MSLylKUabKp9ZNkm6fODYU12ttl531Y=;
 b=h0q8XHxK942t88kPyF8XlllbwhArejctV5zBP0s2f9qYf1nHboCwbZHoOYOJNjUNM1
 cESyZKKBjuIr9NQDOLG6yUJYee+LqEigDhBKwiOBl2H3VWDbeLyxkp5B5MdGVj/srJCV
 eLMYWYHvxKaOfxY0Q3qzTx1MUexYlkAULxpav13/oM6CU6uHSOjv+2t0qHJuziLvaRC6
 ybW61MRmKsjvRlmI/5MHkLiueQnhQ72FLJPGmti/qk09akk3ckMzOVWkLjFKDQq1REnL
 vD90lO2vFTq+gQkNhLB7M3JblaUJIeF3wSYr2Psm9fGQ6Z3kPtNPJ+cJMTdiPZ4FcJRS
 WMRw==
X-Gm-Message-State: AOAM531608qhhRDduOd21hOIlXb28s7QojCauLA+TiNsZ3Adsol6aAe8
 jEmqUf2lyAB0EzpwKGENx5MtN+eOtjPUUnvzl5RRESfsTZ0vkG9biS/mzeDBQxUgoSwjUHyP2k5
 wweS+ou/YVUwsm18=
X-Received: by 2002:a05:600c:2216:b0:394:54e4:ac9 with SMTP id
 z22-20020a05600c221600b0039454e40ac9mr15110417wml.47.1652084286553; 
 Mon, 09 May 2022 01:18:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5LYJS6f8SPl3b12xZ0ngqMPLNTKc8YPgOknSG36ggiGfYT3zQcFjlDrA54JdKOf2sqpQ9Yw==
X-Received: by 2002:a05:600c:2216:b0:394:54e4:ac9 with SMTP id
 z22-20020a05600c221600b0039454e40ac9mr15110381wml.47.1652084286172; 
 Mon, 09 May 2022 01:18:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a05600c218900b0039453fe55a7sm15505155wme.35.2022.05.09.01.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 01:18:05 -0700 (PDT)
Message-ID: <99853fde-d02b-8099-39b7-df0ef218cee4@redhat.com>
Date: Mon, 9 May 2022 10:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 0/3] qtests/libqos: Allow PCI tests to be run with
 virt-machine
Content-Language: en-US
To: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com, stefanha@redhat.com
Cc: jean-philippe@linaro.org
References: <20220504152025.1785704-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220504152025.1785704-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 5/4/22 17:20, Eric Auger wrote:
> Up to now the virt-machine node only contains a virtio-mmio
> driver node but no driver that eventually produces any pci-bus
> interface.
>
> Hence, PCI libqos tests cannot be run with aarch64 binary.
>
> This series brings the pieces needed to be able to run PCI tests
> with the aarch64 binary: a generic-pcihost driver node gets
> instantiated by the machine. This later contains a pci-bus-generic
> driver which produces a pci-bus interface. Then all tests
> consuming the pci-bus interface can be run with the libqos arm
> virt machine.
>
> One of the first goal was to be able to run the virtio-iommu-pci
> tests as the virtio-iommu was initially targetting ARM and it
> was awkard to run the tests with the pc machine. This is now
> possible.
>
> Only the tests doing hotplug cannot be run yet as hotplug is
> not possible on the root bus. This will be dealt with separately
> by adding a root port to the object tree.
>
> Best Regards
>
> Eric
>
> This series can be found at:
> https://github.com/eauger/qemu/tree/libqos-pci-arm-v6

A gentle ping on this series.

Now 5b4f72f5e86 ("tests/qtest: properly initialise the vring used idx")
has landed and the all the enabled tests pass, Could someone please consider
pulling it. I have rebased it on

907b5105f1b  ("tests: move libqtest.h back under qtest")

so now I hope everything is OK

Thank you in advance

Eric

>
> History
>
> v5 -> v6:
> - change the libqtest.h header path after pull of
>   "tests: move libqtest.h back under qtest/"
>
> v4 -> v5:
> - Added Alex' R-b
> - Removed [PATCH v3 4/5] tests/qtest/vhost-user-blk-test:
>   Temporary hack to get tests passing on aarch64
>   following Alex' fix
>
> v3 -> v4:
> - handle endianess when accessing the cfg space (fix PPC64
>   BE failure). Tested on such machine.
>
> v2 -> v3:
> - force -cpu=max along with aarch64/virt
> - reduced the vhost-user-block-pci issue workaround to a
>   single guest_alloc() instead of enabling MSIs. Call for
>   help on this specific issue. The 2 tests which fail are:
>   test_basic and indirect.
>
> v1 -> v2:
> - copyright updated to 2022
> - QPCIBusARM renamed into QGenericPCIBus
> - QGenericPCIHost declarations and definitions moved in the same
>   place as the generic pci implementation
> - rename pci-arm.c/h in generic-pcihost.c/h and remove any ref to
>   ARM there
> - remove qos_node_produces_opts, qpci_new_arm, qpci_free_arm
> - ecam_alloc_ptr now is a field of QGenericPCIBus and not QPCIBus
> - new libqos_init to create generic-pcihost driver that contains
>   pci-bus-generic
> - QGenericPCIHost moved in the same place as the generic pci
>   bindings
> - collected Thomas A-b/R-b
>
> Eric Auger (3):
>   tests/qtest/libqos/pci: Introduce pio_limit
>   tests/qtest/libqos: Skip hotplug tests if pci root bus is not
>     hotpluggable
>   tests/qtest/libqos: Add generic pci host bridge in arm-virt machine
>
>  tests/qtest/e1000e-test.c             |   6 +
>  tests/qtest/libqos/arm-virt-machine.c |  19 ++-
>  tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
>  tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
>  tests/qtest/libqos/meson.build        |   1 +
>  tests/qtest/libqos/pci-pc.c           |   1 +
>  tests/qtest/libqos/pci-spapr.c        |   1 +
>  tests/qtest/libqos/pci.c              |  78 +++++----
>  tests/qtest/libqos/pci.h              |   6 +-
>  tests/qtest/vhost-user-blk-test.c     |  10 ++
>  tests/qtest/virtio-blk-test.c         |   5 +
>  tests/qtest/virtio-net-test.c         |   5 +
>  tests/qtest/virtio-rng-test.c         |   5 +
>  13 files changed, 387 insertions(+), 35 deletions(-)
>  create mode 100644 tests/qtest/libqos/generic-pcihost.c
>  create mode 100644 tests/qtest/libqos/generic-pcihost.h
>


