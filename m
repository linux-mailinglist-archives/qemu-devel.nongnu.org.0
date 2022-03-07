Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDD54CFD47
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:46:04 +0100 (CET)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBoR-0004sQ-0g
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:46:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nRAv1-0000Ia-3i
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nRAuy-0001XF-HF
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646650122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5ciJXeLnsc/lvf/dcN0gGFpUfH9o5H+UjesffG3q5o=;
 b=UyKQPnb/5VZAH+1GlNjhZ5rQ9hyKCtGSzFNIKI/OvwHzlw0cWaNHHeYwrsGKvaYEMS2bF5
 JH7Xh5glm7a0aOlJm7LBs1GKqvly8C1n338AvYMNo4wysrL8bx9HO2Fgwl0/nW354hdhBs
 eoLpwt4JRahdZMoWN/0FYHVuRR6frKc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-aDgATWInMlOGWVeyZPbx-A-1; Mon, 07 Mar 2022 05:48:41 -0500
X-MC-Unique: aDgATWInMlOGWVeyZPbx-A-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b0037e3d70e7e1so7717208wme.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N5ciJXeLnsc/lvf/dcN0gGFpUfH9o5H+UjesffG3q5o=;
 b=u3w21Pv05d7aVsaXyPnqk4kzmvXz7Xsr5QBuB1oJnHstDzTYYZ3h6GxbHtstDb/hiW
 ZhgeNJH4mXB5AOHjW6EWmVjXs1i2ZEe58SRflgQx0+k/XfTyJnf925g6aRKEZBpJZk2V
 0sV4h1TVQW2qnV5CSOLJrCuGaclN6wLYaygR5To9DOtZOhKRzJrogEnk18UNLsoNXmSm
 AOio5R8CGSCnGQAYFVKNmF8eDfC6tLBbN4LXLWKVQD1xX3dAjrIT1JIdgp/madZ3cwNo
 4lLA/+iidCAVh1YOQy+wlZa9JWEEh43tE2LE0PR3KceTyymlTghsG/AcsdEeRNF6k5Ta
 fWdg==
X-Gm-Message-State: AOAM531RIs/d87gDffsrFWMC58V9UFDPhijE1X7v4c3HDcurf/WjRTJG
 jiT/zArO1fuK9OZKoDiBkr8EhBkkkoZRvANcUqYiMN3Dbob8pJssZgTj7ANNFMkhcq1t1VzdtZb
 2cuJjC8WgiJ5CxhOF7lMxPvjlPXlBjjUFHZY/prL7w61Pa58LGeYLXn6RIJ58Okow
X-Received: by 2002:a05:600c:5011:b0:389:948e:bb4 with SMTP id
 n17-20020a05600c501100b00389948e0bb4mr8015742wmr.107.1646650120283; 
 Mon, 07 Mar 2022 02:48:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfdAVt96h96GuMOhRi2wn/p1334XWra6G2Ycylf1Z1hSMNC5GoDfIM10V5dtgNyaxnUleggA==
X-Received: by 2002:a05:600c:5011:b0:389:948e:bb4 with SMTP id
 n17-20020a05600c501100b00389948e0bb4mr8015723wmr.107.1646650120027; 
 Mon, 07 Mar 2022 02:48:40 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm12721060wmz.43.2022.03.07.02.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:48:39 -0800 (PST)
Subject: Re: [PULL 00/45] virtio,pc,pci: features, cleanups, fixes
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
 <CAFEAcA8Vo4bi_ar-Av7mzbCO6ZFv9pABpyi=0niGPi0U5Vxdvg@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <f6dc066e-1d34-b132-d559-c306131ff954@redhat.com>
Date: Mon, 7 Mar 2022 11:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Vo4bi_ar-Av7mzbCO6ZFv9pABpyi=0niGPi0U5Vxdvg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, Michael,

On 3/4/22 11:13 PM, Peter Maydell wrote:
> On Fri, 4 Mar 2022 at 13:37, Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:
>>
>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>>
>> for you to fetch changes up to 74bc2c502da74191a34fb61b4c890061368269c8:
>>
>>   docs: vhost-user: add subsection for non-Linux platforms (2022-03-04 08:30:53 -0500)
>>
>> ----------------------------------------------------------------
>> virtio,pc,pci: features, cleanups, fixes
>>
>> vhost-user enabled on non-linux systems
>> beginning of nvme sriov support
>> bigger tx queue for vdpa
>> virtio iommu bypass
>> pci tests for arm
>>
>> Fixes, cleanups all over the place
>>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>
>> ----------------------------------------------------------------
> 
> This failed an assertion on ppc64:
> 
>>>> G_TEST_DBUS_DAEMON=/home/pm215/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=./qemu-system-aarch64 QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon MALLOC_PERTURB_=120 /home/pm215/qemu/build/all/tests/qtest/qos-test --tap -k
> ▶  71/716 /aarch64/xlnx-zcu102/generic-sdhci/sdhci/sdhci-tests/registers
>          OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/AC97/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e1000/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e1000-82544gc/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/e1000-82545em/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82550/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82551/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82557a/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82557b/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82557c/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82558a/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82558b/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82559a/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82559b/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82559c/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82559er/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82562/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/i82801/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/ES1370/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 /aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/megasas/pci-device/pci-device-tests/nop
> OK
> ▶  71/716 ERROR:../../tests/qtest/libqos/pci.c:232:qpci_device_enable:
> assertion failed (cmd & PCI_COMMAND_IO == PCI_COMMAND_IO): (0x00000000
> == 0x00000001) ERROR
Please forgive me for the extra work. Peter do you know if the host is BE?

Thanks

Eric
> 
> 
> 
> -- PMM
> 


