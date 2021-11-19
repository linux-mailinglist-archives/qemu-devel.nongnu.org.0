Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB731456C17
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:05:50 +0100 (CET)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzq9-0000fw-6R
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:05:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnzod-0008RH-1A
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:04:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnzoZ-0002zK-E7
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637312650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxj7Y/JEQz10KI2PXIrnWqHZtnEbNAWgD3/h1PMRvLY=;
 b=ejCoazeaJbM5h2Zte7dlYEc3/vBjpaVDlRJ75ZxCwSzpTYDNBiDnltJgJXwqiLQ/+sDfRv
 TJAKtTcuenWp1HuflLiDlX8ie/6g/U+/VaMm1AcN9rjKlax1AlV7txkjQQWxmp9tVVFzO+
 gwGHyJdPcxmt0YAVpf8hj8Sstj1gBpE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-aqC9ljZtPKiUWpFYU8CK5w-1; Fri, 19 Nov 2021 04:04:09 -0500
X-MC-Unique: aqC9ljZtPKiUWpFYU8CK5w-1
Received: by mail-wm1-f71.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso5593568wme.8
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 01:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rxj7Y/JEQz10KI2PXIrnWqHZtnEbNAWgD3/h1PMRvLY=;
 b=Unje8jnjIW6lPBGR6xtZPgzmXiDAFWE5UuIyBE0kJKW8vXwoOJ5qlq6HeGAPhWe6Qt
 cte/zJGwYxj0P6o/zDeaZ/wMo1yebdq5QFtA2INfiBzuYIr7mmLO6KDLpPksPK2xDf+j
 6ZnTBXGz57bS8xHiFk3KXs9VuvyME4OOnVix2Be+Z5c8fzIhfrOetkkGKbCzjodQv0tL
 IqmdmSROYOUJVgT77RXP4CxA0BSlTV3CXKCTIpxeUiDVEBOQ7WGzxAKvWS/ki7o5/LWn
 GKOTHao2cKf/K2JIIgZ5i1BCtZF+meKKvR0D1ipqHHErQmK+ScDy0G/6b4Qk+ycD3JUA
 zSyg==
X-Gm-Message-State: AOAM531VyBoZRusjQ/OV0aA59kqbEzzzEmYINxYEiN1JAu6vMZCqhjPR
 uN1ZyAYe9DQiDevsiAsZAGNpawME4i1Q/DGE4lZ5iBW+c0nCFC11KrpYyYbKQTsbBWIUn9pJgGr
 lIIrt++7N1hNA0Lz2EH3ujt1ZmNg7YQNfHCDuGXmYyE4K0cx1cr/e3Z4n8SqDoIRZRg==
X-Received: by 2002:adf:e686:: with SMTP id r6mr5362816wrm.379.1637312647784; 
 Fri, 19 Nov 2021 01:04:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWi4RJa69BCLr7wVgvgPr7lA9yUUbOYOkvhGsRpdhygxSln9Af9MFN0hJ0/pNgp3waWf9toA==
X-Received: by 2002:adf:e686:: with SMTP id r6mr5362771wrm.379.1637312647516; 
 Fri, 19 Nov 2021 01:04:07 -0800 (PST)
Received: from [192.168.100.42] ([82.142.2.234])
 by smtp.gmail.com with ESMTPSA id l21sm2390620wrb.38.2021.11.19.01.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 01:04:07 -0800 (PST)
Message-ID: <663c1513-96df-6f58-a8e8-c7a4a1e9632f@redhat.com>
Date: Fri, 19 Nov 2021 10:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 0/3] tests/qtest: add some tests for virtio-net failover
To: qemu-devel@nongnu.org
References: <20211119084948.434680-1-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211119084948.434680-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I did something wrong and the last patch adding the test has been removed from the series.

I'm going to send a v5 with the test added correctly.

Sorry for the noise.

Laurent

On 19/11/2021 09:49, Laurent Vivier wrote:
> This series adds a qtest entry to test virtio-net failover feature.
> 
> We check following error cases:
> 
> - check missing id on device with failover_pair_id triggers an error
> - check a primary device plugged on a bus that doesn't support hotplug
>    triggers an error
> 
> We check the status of the machine before and after hotplugging cards and
> feature negotiation:
> 
> - check we don't see the primary device at boot if failover is on
> - check we see the primary device at boot if failover is off
> - check we don't see the primary device if failover is on
>    but failover_pair_id is not the one with on (I think this should be changed)
> - check the primary device is plugged after the feature negotiation
> - check the result if the primary device is plugged before standby device and
>    vice-versa
> - check the if the primary device is coldplugged and the standy device
>    hotplugged and vice-versa
> - check the migration triggers the unplug and the hotplug
> 
> There is one preliminary patch in the series:
> 
> - PATCH 1 introduces a function to enable PCI bridge.
>    Failover needs to be plugged on a pcie-root-port and while
>    the root port is not configured the cards behind it are not
>    available
> 
> v4:
> - rely on query-migrate status to know the migration state rather than
>    to wait the STOP event.
> - remove the patch to add time out to qtest_qmp_eventwait()
> 
> v3:
> - fix a bug with ACPI unplug and add the related test
> 
> v2:
> - remove PATCH 1 that introduced a function that can be replaced by
>    qobject_to_json_pretty() (Markus)
> - Add migration to a file and from the file to check the card is
>    correctly unplugged on the source, and hotplugged on the dest
> - Add an ACPI call to eject the card as the kernel would do
> 
> Laurent Vivier (3):
>    qtest/libqos: add a function to initialize secondary PCI buses
>    tests/qtest: add some tests for virtio-net failover
>    failover: fix unplug pending detection
> 
>   hw/acpi/pcihp.c                   |  30 +-
>   include/hw/pci/pci_bridge.h       |   8 +
>   tests/qtest/libqos/pci.c          | 118 ++++++
>   tests/qtest/libqos/pci.h          |   1 +
>   tests/qtest/meson.build           |   3 +
>   tests/qtest/virtio-net-failover.c | 658 ++++++++++++++++++++++++++++++
>   6 files changed, 815 insertions(+), 3 deletions(-)
>   create mode 100644 tests/qtest/virtio-net-failover.c
> 


