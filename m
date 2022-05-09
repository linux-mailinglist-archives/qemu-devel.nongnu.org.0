Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E9C520035
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:46:29 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4ea-0001WR-Gi
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1no4Se-0002Vz-2P
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1no4Sa-0003VW-FA
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652106843;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jAIIaw3Pd3n4E6KzpCgv97nWsVvS6ET2UpJK/GZ64a8=;
 b=St0CrPxkk0fxeNXc1spthV+ONmsaCyJ8xodO/Wdx1Gq4ttfCAwlxFr6FtDApKyBYhwvA51
 Np6iZIsKkzr8TEGEF2Qm+0Mz5ItnZRigwanuVmWkYsH1SUPvnYKHuwNyLh5sw6IIpIWtfH
 6QER6n/uvf2GDmtdqfARx/IiAfOdhBc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111--s-_8ZdmN8OQWEo1CcPJDQ-1; Mon, 09 May 2022 10:34:02 -0400
X-MC-Unique: -s-_8ZdmN8OQWEo1CcPJDQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d13-20020ac85acd000000b002f3be21793dso9710476qtd.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 07:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jAIIaw3Pd3n4E6KzpCgv97nWsVvS6ET2UpJK/GZ64a8=;
 b=IvXQC2l7WiBuahcs6usipl5VdqbAOSxRSzRaYKpGTKwBqMcS7EIbF6l3NRkhEpw0y1
 C4FsZ09BHdoJWFoXpJP6COL+dhA8pS5k2sMrsYN3ncXRTDrST/U/7jrspPVehMuY4P1c
 Urn9oJxFtoI7uHt5shac1Vu3Mshbj6YmaFHDlF99tEAPT/MS2BzF6sDS4YUXiX73iRgN
 ydNQedKfe7yz96K0UV4+YsFU5PsRmlKhibU5HuQxBznkJ9h7mP9nSKlfH/EwLwla96T1
 +nCZytwXQfwZ+mgZ5gQrJKuGvbwGpqzD9Pk3PImU09pwA+atlz2dvNTyg5Bw7WSMmG5M
 8yUA==
X-Gm-Message-State: AOAM5317GFlThkor1K3i0h0GYShPt8L2evS88+HbPrmO3vyMJsZ2AvXR
 2K56Jmn/k8CnmhSWiFbs3tC+EByTx77l7fDFz7LIGJ8CtSAcesVdlgjIyoervZgw6IzP6uHl2F5
 I8T1aRo8iWD7RlKI=
X-Received: by 2002:ac8:5e4c:0:b0:2f3:c50e:53a6 with SMTP id
 i12-20020ac85e4c000000b002f3c50e53a6mr14868164qtx.499.1652106841605; 
 Mon, 09 May 2022 07:34:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPnw4joLmhQzxQ8LPUKZT1p6ELy39G35G98VPPL4UMRKoRKIWz765FOohulo4ccCWWrJ+SMQ==
X-Received: by 2002:ac8:5e4c:0:b0:2f3:c50e:53a6 with SMTP id
 i12-20020ac85e4c000000b002f3c50e53a6mr14868142qtx.499.1652106841386; 
 Mon, 09 May 2022 07:34:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac8454b000000b002f39b99f6aasm7664032qtn.68.2022.05.09.07.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 07:34:00 -0700 (PDT)
Message-ID: <763c598d-b01a-32eb-2bd5-0d2537f0e6e6@redhat.com>
Date: Mon, 9 May 2022 16:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 3/3] tests/qtest/libqos: Add generic pci host bridge in
 arm-virt machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, david@gibson.dropbear.id.au,
 clg@kaod.org, eesposit@redhat.com, Coiby.Xu@gmail.com, stefanha@redhat.com,
 jean-philippe@linaro.org
References: <20220504152025.1785704-1-eric.auger@redhat.com>
 <20220504152025.1785704-4-eric.auger@redhat.com> <87bkw6u7np.fsf@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87bkw6u7np.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Alex,

On 5/9/22 15:59, Alex Bennée wrote:
> Eric Auger <eric.auger@redhat.com> writes:
>
>> Up to now the virt-machine node contains a virtio-mmio node.
>> However no driver produces any PCI interface node. Hence, PCI
>> tests cannot be run with aarch64 binary.
>>
>> Add a GPEX driver node that produces a pci interface node. This latter
>> then can be consumed by all the pci tests. One of the first motivation
>> was to be able to run the virtio-iommu-pci tests.
>>
>> We still face an issue with pci hotplug tests as hotplug cannot happen
>> on the pcie root bus and require a generic root port. This will be
>> addressed later on.
>>
>> We force cpu=max along with aarch64/virt machine as some PCI tests
>> require high MMIO regions to be available.
> Where would I be able to force disable-legacy=off for the PCI device
in libqos/vhost-user-gpio-pci.c qos_node_consumes("vhost-user-blk-pci",
"pci-bus", &opts);
I think you can use opts to force disable-legacy to off.

see vhost-user-blk.c.
> from? Building on this for GPIO I run into the following:
>
>   subprocess_run_one_test: /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/vhost-user-gpio-pci/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess
>   vhost_user_test_setup: -M virt, -cpu max -device vhost-user-gpio-pci,id=gpio0,addr=04.0,chardev=chr-vhost-user-test
>   vu_gpio_get_protocol_features: 0x202
>   qemu-system-aarch64: -device vhost-user-gpio-pci,id=gpio0,addr=04.0,chardev=chr-vhost-user-test: Device doesn't support modern mode, and legacy mode is disabled
>   Set disable-legacy to off
>   Broken pipe
>
> and I think this needs to be applied to the root bus device?
you mean the disable-legacy? I guess it should be applied to your device?

Eric
>
> Anyway otherwise it looks OK to me:
>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>


