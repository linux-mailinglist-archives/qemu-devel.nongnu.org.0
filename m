Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BBF432EF8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:08:34 +0200 (CEST)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjEf-0005fk-Hn
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mcjDG-0004Pz-0f
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:07:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mcjDC-0003ji-9B
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627221;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HtA5EmqMQG4WwzpxcxpqX45CDO9DwmwBZFDiPkLNoE=;
 b=ZdLhg7kut0mb1tnY0awTcKHs3gqGqDPEOpnDywFLh7Ku3+RTWOyW0Sarrpou/rDtRXA/5e
 XU4ajTQcKIOjKpwPDeQnYOKEo8wii2yB5LEeCO1o041Cs425ZaZc/W7vfXvJT5oCs2c6rw
 hjRBge1rYZRDeU+SIoZSsBkvq0xjTK8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-HE2nTHENNSeBRRpcgqHZ7Q-1; Tue, 19 Oct 2021 03:06:58 -0400
X-MC-Unique: HE2nTHENNSeBRRpcgqHZ7Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 s1-20020adfc541000000b001645b92c65bso4530621wrf.6
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 00:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6HtA5EmqMQG4WwzpxcxpqX45CDO9DwmwBZFDiPkLNoE=;
 b=76PqeP3seHddfzgNqZFQpQEjWZHfOMtGpWfOV1ZhY4JVukvA5ZcjU0KMYgTFzeceXQ
 CY7e5W22LaruHnfLeXiAhIwB0wXrgXwB1qEu/tG9vPpe2JBg8aNQEegISkCSjzf9f/7t
 cENsDvLT94xjWwKZVSZ6on1YCjKksREZjH1uI0GWUI34kB3AOBGfBI1+UiM6DdPob5Lb
 DEYsqBPGodZCcD/PDhnesm/I55cC1HrbivRofBsITlodmwktkaukbpd6sWRoUOxpL1me
 WakR0Qzhqx2rnHAuGFIh/cbYP25c2hr5Fqom46PvhmVfCPd91Nq0SyaSttgRvwpSPIdl
 4Ong==
X-Gm-Message-State: AOAM532YvjCWMAfWVI6/D9OJusd3HNG68MIc5kDTTd46XfRsa31wkzYR
 noLdCFIOVjkftzPrvGwekjDtXo0xoVb1+UXMSmdfkG+jUWdt6EjSGxZ5q2HFrZYsNzZxtXs32xr
 w9gnx3RiCaoC1RnFq+YqnDMiwlDOWdEGtF5b2/WSh9tDHClb57AJFjshWqMQQCzg3U4cBCg==
X-Received: by 2002:adf:97cc:: with SMTP id t12mr41364631wrb.189.1634627216146; 
 Tue, 19 Oct 2021 00:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTCP7x7dFCsu+LBE+Ab8Tw7YipoZ92Ew5l8zQ9hNO5vk/yAHbMqpQoIZt0KZHaJK7HK9H/YA==
X-Received: by 2002:adf:97cc:: with SMTP id t12mr41364547wrb.189.1634627215257; 
 Tue, 19 Oct 2021 00:06:55 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id z1sm4382789wre.21.2021.10.19.00.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 00:06:54 -0700 (PDT)
Subject: Re: [PATCH v3] tests: qtest: Add virtio-iommu test
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20211014083405.918151-1-eric.auger@redhat.com>
 <YWgedX6i96mC3ssy@myrica>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <7527eb26-1ae2-d61f-fa0d-1264c5141d98@redhat.com>
Date: Tue, 19 Oct 2021 09:06:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YWgedX6i96mC3ssy@myrica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 10/14/21 2:11 PM, Jean-Philippe Brucker wrote:
> Hi Eric,
>
> On Thu, Oct 14, 2021 at 04:34:05AM -0400, Eric Auger wrote:
>> Add the framework to test the virtio-iommu-pci device
>> and tests exercising the attach/detach, map/unmap API.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>>
>> ---
>>
>> This applies on top of jean-Philippe's
>> [PATCH v4 00/11] virtio-iommu: Add ACPI support
>> branch can be found at:
>> https://github.com/eauger/qemu.git
>> branch qtest-virtio-iommu-v3
>>
>> To run the tests:
>> make tests/qtest/qos-test
>> cd build
>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64  tests/qtest/qos-test
> Looks like some archs cannot run the test:
>
> $ make check	# built with all targets
> qemu-system-arm: -device virtio-iommu-device: VIRTIO-IOMMU is not attached to any PCI bus!
> Broken pipe
> ERROR qtest-arm/qos-test - too few tests run (expected 80, got 75)
>
> Also, should the test run on aarch64?
So this should be fixed now.
I removed the following pieces that caused the trouble
qos_node_create_driver("virtio-iommu-device", virtio_iommu_device_create);
qos_node_consumes("virtio-iommu-device", "virtio-bus", NULL);
qos_node_produces("virtio-iommu-device", "virtio");
qos_node_produces("virtio-iommu-device", "virtio-iommu");
>
> [...]
>> diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
>> new file mode 100644
>> index 0000000000..ac4d38c779
>> --- /dev/null
>> +++ b/tests/qtest/virtio-iommu-test.c
>> @@ -0,0 +1,299 @@
>> +/*
>> + * QTest testcase for VirtIO IOMMU
>> + *
>> + * Copyright (c) 2021 Red Hat, Inc.
>> + *
>> + * Authors:
>> + *  Eric Auger <eric.auger@redhat.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
>> + * option) any later version.  See the COPYING file in the top-level directory.
>> + *
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "libqtest-single.h"
>> +#include "qemu/module.h"
>> +#include "libqos/qgraph.h"
>> +#include "libqos/virtio-iommu.h"
>> +#include "hw/virtio/virtio-iommu.h"
>> +
>> +#define PCI_SLOT_HP             0x06
>> +#define QVIRTIO_IOMMU_TIMEOUT_US (30 * 1000 * 1000)
>> +
>> +static QGuestAllocator *alloc;
>> +
>> +static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
>> +{
>> +    QVirtioIOMMU *v_iommu = obj;
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    uint64_t input_range_start = qvirtio_config_readq(dev, 8);
>> +    uint64_t input_range_end = qvirtio_config_readq(dev, 16);
>> +    uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
>> +    uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
>> +
>> +    g_assert_cmpint(input_range_start, ==, 0);
>> +    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
>> +    g_assert_cmpint(domain_range_start, ==, 0);
>> +    g_assert_cmpint(domain_range_end, ==, 32);
> By the way, this value seems to be left from when the config declared a
> number of domain bits. It's now a range so the value could be UINT32_MAX.
> Right now the driver can't manage more than 32 endpoints at a time.
> I have a patch changing that but planning to send later, it doesn't feel
> urgent.
OK so effectively the qemu device has not been updated accordingly. So
if you have a patch ready, I will let you send it and update the test
later then.
>
>> +}
>> +
>> +/**
>> + * send_attach_detach - Send an attach/detach command to the device
>> + * @type: VIRTIO_IOMMU_T_ATTACH/VIRTIO_IOMMU_T_DETACH
>> + * @domain: domain the end point is attached to
>> + * @ep: end-point
> ("endpoint"?)
ok
>
>> + */
>> +static int send_attach_detach(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                              uint8_t type, uint32_t domain, uint32_t ep)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_attach req; /* same layout as detach */
> Should the reserved fields be initialized to zero?
yes
>
> The test fails here with my recent bypass patch, which sanity-checks the
> new flags field. But I could change the test in the bypass series, since
> the test doesn't fail as is.
>
> On a related note, the spec says that the device MUST reject the request
> if field reserved is not zero. I can also send a patch for that.
OK this test may be added later.
>
>> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    struct virtio_iommu_req_tail buffer;
>> +    int ret;
>> +
>> +    req.head.type = type;
>> +    req.domain = domain;
>> +    req.endpoint = ep;
> A driver would explicitly write little-endian in there with cpu_to_le*().
> I guess that also matters here if the test could run on a big-endian host?
yes I see such conversions in tests/qtest/virtio-9p-test.c too.
>
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    qtest_memread(qts, wr_addr, &buffer, wr_size);
>> +    ret = buffer.status;
> Could check that the rest of the buffer is still 0
TBD
>
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>> +
>> +/**
>> + * send_map - Send a map command to the device
>> + * @domain: domain the new binding is attached to
> (what is the new binding?)
meant mapping, fixed
>
>> + * @virt_start: iova start
>> + * @virt_end: iova end
>> + * @phys_start: base physical address
>> + * @flags: mapping flags
>> + */
>> +static int send_map(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                    uint32_t domain, uint64_t virt_start, uint64_t virt_end,
>> +                    uint64_t phys_start, uint32_t flags)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_map req;
>> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    struct virtio_iommu_req_tail buffer;
>> +    int ret;
>> +
>> +    req.head.type = VIRTIO_IOMMU_T_MAP;
>> +    req.domain = domain;
>> +    req.virt_start = virt_start;
>> +    req.virt_end = virt_end;
>> +    req.phys_start = phys_start;
>> +    req.flags = flags;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    qtest_memread(qts, wr_addr, &buffer, wr_size);
>> +    ret = buffer.status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>> +
>> +/**
>> + * send_unmap - Send an unmap command to the device
>> + * @domain: domain the new binding is attached to
>> + * @virt_start: iova start
>> + * @virt_end: iova end
>> + */
>> +static int send_unmap(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                      uint32_t domain, uint64_t virt_start, uint64_t virt_end)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_unmap req;
>> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    struct virtio_iommu_req_tail buffer;
>> +    int ret;
>> +
>> +    req.head.type = VIRTIO_IOMMU_T_UNMAP;
>> +    req.domain = domain;
>> +    req.virt_start = virt_start;
>> +    req.virt_end = virt_end;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    qtest_memread(qts, wr_addr, &buffer, wr_size);
>> +    ret = buffer.status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>> +
>> +/* Test unmap scenari documented in the spec v0.12 */
>> +static void test_attach_detach(void *obj, void *data, QGuestAllocator *t_alloc)
>> +{
>> +    QVirtioIOMMU *v_iommu = obj;
>> +    QTestState *qts = global_qtest;
>> +    int ret;
>> +
>> +    alloc = t_alloc;
>> +
>> +    /* type, domain, ep */
>> +
>> +    /* attach ep0 to domain 0 */
> By the way, what endpoint is this, the host bridge?  I'm still trying to
> understand the test framework, how do we know that ep 0 exists and ep 1
> doesn't?
Yes that's the host bridge
There is graph built based defined relations between components
https://wiki.qemu.org/Features/qtest_driver_framework

that's why at the moment the test is not run on aarch64 because some
relations are missing and the virt machine libqos node does not induce
the instantiation of any PCI bus I think.

>
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 0, 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    /* attach a non existing device (1) */
> (444)?
yep
>
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 0, 444);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
>> +
>> +    /* detach a non existing device (1) */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 0, 1);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
>> +
>> +    /* move ep0 from domain 0 to domain 1 */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    /* detach ep0 to domain 0 */
> from
>
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 0, 0);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_INVAL);
>> +
>> +    /* detach ep0 from domain 1 */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 1, 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +    ret = send_map(qts, v_iommu, 1, 0x0, 0xFFF, 0xa1000,
>> +                   VIRTIO_IOMMU_MAP_F_READ);
>> +    g_assert_cmpint(ret, ==, 0);
> I was going to say that success here depends on the minimum page size
> offered by the device (if the page size if 64k this request would fail),
> but there is no check for page alignment at the moment.
>
> It's just a SHOULD in the spec so we don't have to add the check, but it
> may help with the VFIO integration - even though VFIO will fail unaligned
> MAP ioctls, we report success to the driver. So I've added alignment
> checks to my TODO list, but nothing urgent
OK
>
>> +    ret = send_map(qts, v_iommu, 1, 0x2000, 0x2FFF, 0xb1000,
>> +                   VIRTIO_IOMMU_MAP_F_READ);
>> +    g_assert_cmpint(ret, ==, 0);
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 1, 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +}
>> +
>> +static void test_map_unmap(void *obj, void *data, QGuestAllocator *t_alloc)
>> +{
>> +    QVirtioIOMMU *v_iommu = obj;
>> +    QTestState *qts = global_qtest;
>> +    int ret;
>> +
>> +    alloc = t_alloc;
>> +
>> +    /* attach ep0 to domain 1 */
>> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    ret = send_map(qts, v_iommu, 0, 0, 0xFFF, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
>> +
>> +    /* domain, virt start, virt end, phys start, flags */
>> +    ret = send_map(qts, v_iommu, 1, 0, 0xFFF, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
>> +    g_assert_cmpint(ret, ==, 0);
> Could you also check that resending the map returns INVAL?
added
>
>> +
>> +    ret = send_unmap(qts, v_iommu, 4, 0x10, 0xFFF);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
>> +
>> +    ret = send_unmap(qts, v_iommu, 1, 0x10, 0xFFF);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_RANGE);
>> +
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 0x1000);
>> +    g_assert_cmpint(ret, ==, 0); /* unmap everything */
>> +
>> +    /* Spec example sequence */
>> +
>> +    /* 1 */
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
>> +    g_assert_cmpint(ret, ==, 0); /* doesn't unmap anything */
>> +
>> +    /* 2 */
>> +    send_map(qts, v_iommu, 1, 0, 9, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
> Same as above, the IOVAs aren't aligned on page size (the example assumes
> a 1-byte granule, which arguably isn't the best idea but seemed easier to
> read). The device currently accepts this but it would be better to write
> the test to comply with page alignment. I can also change that when I get
> to the alignment checks.
this was supposed to map onto virtio-v1.1-cs01.pdf examples
5.13.6.6. Maybe we should also consider to change the spec then?
>
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,9] */
>> +
>> +    /* 3 */
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xb1000, VIRTIO_IOMMU_MAP_F_READ);
>> +    send_map(qts, v_iommu, 1, 5, 9, 0xb2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [5,9] */
>> +
>> +    /* 4 */
>> +    send_map(qts, v_iommu, 1, 0, 9, 0xc1000, VIRTIO_IOMMU_MAP_F_READ);
> Could check the return values: INVAL here means the previous unmap didn't
> actually work
done
>
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
>> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_RANGE); /* doesn't unmap anything */
>> +
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 10);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    /* 5 */
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xd1000, VIRTIO_IOMMU_MAP_F_READ);
>> +    send_map(qts, v_iommu, 1, 5, 9, 0xd2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] */
>> +
>> +    ret = send_unmap(qts, v_iommu, 1, 5, 9);
>> +    g_assert_cmpint(ret, ==, 0);
>> +
>> +    /* 6 */
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xe2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] */
>> +
>> +    /* 7 */
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xf2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    send_map(qts, v_iommu, 1, 10, 14, 0xf3000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 14);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [10,14] */
>> +
>> +    send_unmap(qts, v_iommu, 1, 0, 100);
> Shouldn't be needed?
removed
>
>> +    send_map(qts, v_iommu, 1, 10, 14, 0xf3000, VIRTIO_IOMMU_MAP_F_READ);
>> +    send_map(qts, v_iommu, 1, 0, 4, 0xf2000, VIRTIO_IOMMU_MAP_F_READ);
>> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
>> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [10,14] */
> Only unmaps [0,4]
OK

Thanks!

Eric
>
> Thanks,
> Jean
>
>> +}
>> +
>> +static void register_virtio_iommu_test(void)
>> +{
>> +    qos_add_test("config", "virtio-iommu", pci_config, NULL);
>> +    qos_add_test("attach_detach", "virtio-iommu", test_attach_detach, NULL);
>> +    qos_add_test("map_unmap", "virtio-iommu", test_map_unmap, NULL);
>> +}
>> +
>> +libqos_init(register_virtio_iommu_test);
>> -- 
>> 2.30.1
>>


