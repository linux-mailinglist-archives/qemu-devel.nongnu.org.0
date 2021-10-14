Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4CF42D934
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:21:26 +0200 (CEST)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazjh-0005XQ-EZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mazaa-0004kv-Q5
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:12:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mazaY-0008M6-5Z
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:12:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id v17so18732163wrv.9
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QVtON9XeBCSDzcPcskDWyqn3f1EzfVbacEX3W1xLvB4=;
 b=N5meJWU4ixokmueH3zot53nSX729w0r/ua2vZyeTTQyucts6IyAcQZIZO1VR+884IL
 6OWppDLTXzDIZxOwptuhsvnm/XUUDGOP/VzT+BCNmvcqhGzXJL+cKYl94KHaJYZPQeq7
 FwXOhcI9MEKr/WGIm8xK4XoUHGpf/Onh2R8wCnnYPrbbiJBRSBV6LOGw3LPyOoOXbTRG
 zRlO2rCUQU9PjFtpxu1zmqLASksivKUyaPBi+kX3biJzboRPBPWzAzKdJQM+assPfTas
 xarbuHUGldZQkW2HFOr+aX7tsKvRp8/V1xUwueg7XhFgbUkRbfuO0YS6LJbrNy/cABxu
 j6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QVtON9XeBCSDzcPcskDWyqn3f1EzfVbacEX3W1xLvB4=;
 b=KvSDf7rcKj4nzV1i4X/54GLlKMm++okHWblDa6m39TMndTRhxz5M+bFYwTLbQ4PL5a
 ehAM5ZQFfwpu72i8HVidkHIqF2Wg7fZF1Xkn7gbpNzDkOwC0HcN3K1P8xy01yl7BOVUA
 UTpP1FNYWX+WIosfC3TTD2ACLsleZGcGzZ2GqmPod2XfXzhlPx8zESz2LJeWa3F1mtqD
 waxZ9ry3X6Qsbx1Xq8jhpcqXf0Y+4lL4bMEyYoej3WGq0zLUvbWg/0t5gp9WGitcJ+j+
 CKcP48dyXUShaCYsgVeAGMJ5rnJLnpr1xqOScFEQvihdP0aOC1d3MTqN+TAEHw8tUpfd
 YT1g==
X-Gm-Message-State: AOAM530aqabKBmtIB0awL56ClwSpBcwmjxf0WWWZPY+awyLrm1ooUeRo
 LJKYWBQQElaNCRv57smAmU2p/w==
X-Google-Smtp-Source: ABdhPJwoMBwpZ/lWYb9YCBIoTfb/YM+92FpftUO0z3jf8kLeeMGbBOlSCow7La/gW6the8jaH+PhsQ==
X-Received: by 2002:a05:6000:2af:: with SMTP id
 l15mr6382758wry.296.1634213515580; 
 Thu, 14 Oct 2021 05:11:55 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id c77sm2074504wme.48.2021.10.14.05.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 05:11:55 -0700 (PDT)
Date: Thu, 14 Oct 2021 13:11:33 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3] tests: qtest: Add virtio-iommu test
Message-ID: <YWgedX6i96mC3ssy@myrica>
References: <20211014083405.918151-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014083405.918151-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On Thu, Oct 14, 2021 at 04:34:05AM -0400, Eric Auger wrote:
> Add the framework to test the virtio-iommu-pci device
> and tests exercising the attach/detach, map/unmap API.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> ---
> 
> This applies on top of jean-Philippe's
> [PATCH v4 00/11] virtio-iommu: Add ACPI support
> branch can be found at:
> https://github.com/eauger/qemu.git
> branch qtest-virtio-iommu-v3
> 
> To run the tests:
> make tests/qtest/qos-test
> cd build
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64  tests/qtest/qos-test

Looks like some archs cannot run the test:

$ make check	# built with all targets
qemu-system-arm: -device virtio-iommu-device: VIRTIO-IOMMU is not attached to any PCI bus!
Broken pipe
ERROR qtest-arm/qos-test - too few tests run (expected 80, got 75)

Also, should the test run on aarch64?


[...]
> diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
> new file mode 100644
> index 0000000000..ac4d38c779
> --- /dev/null
> +++ b/tests/qtest/virtio-iommu-test.c
> @@ -0,0 +1,299 @@
> +/*
> + * QTest testcase for VirtIO IOMMU
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * Authors:
> + *  Eric Auger <eric.auger@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> + * option) any later version.  See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest-single.h"
> +#include "qemu/module.h"
> +#include "libqos/qgraph.h"
> +#include "libqos/virtio-iommu.h"
> +#include "hw/virtio/virtio-iommu.h"
> +
> +#define PCI_SLOT_HP             0x06
> +#define QVIRTIO_IOMMU_TIMEOUT_US (30 * 1000 * 1000)
> +
> +static QGuestAllocator *alloc;
> +
> +static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtioIOMMU *v_iommu = obj;
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    uint64_t input_range_start = qvirtio_config_readq(dev, 8);
> +    uint64_t input_range_end = qvirtio_config_readq(dev, 16);
> +    uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
> +    uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
> +
> +    g_assert_cmpint(input_range_start, ==, 0);
> +    g_assert_cmphex(input_range_end, ==, UINT64_MAX);
> +    g_assert_cmpint(domain_range_start, ==, 0);
> +    g_assert_cmpint(domain_range_end, ==, 32);

By the way, this value seems to be left from when the config declared a
number of domain bits. It's now a range so the value could be UINT32_MAX.
Right now the driver can't manage more than 32 endpoints at a time.
I have a patch changing that but planning to send later, it doesn't feel
urgent.

> +}
> +
> +/**
> + * send_attach_detach - Send an attach/detach command to the device
> + * @type: VIRTIO_IOMMU_T_ATTACH/VIRTIO_IOMMU_T_DETACH
> + * @domain: domain the end point is attached to
> + * @ep: end-point

("endpoint"?)

> + */
> +static int send_attach_detach(QTestState *qts, QVirtioIOMMU *v_iommu,
> +                              uint8_t type, uint32_t domain, uint32_t ep)
> +{
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    QVirtQueue *vq = v_iommu->vq;
> +    uint64_t ro_addr, wr_addr;
> +    uint32_t free_head;
> +    struct virtio_iommu_req_attach req; /* same layout as detach */

Should the reserved fields be initialized to zero?

The test fails here with my recent bypass patch, which sanity-checks the
new flags field. But I could change the test in the bypass series, since
the test doesn't fail as is.

On a related note, the spec says that the device MUST reject the request
if field reserved is not zero. I can also send a patch for that.

> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
> +    struct virtio_iommu_req_tail buffer;
> +    int ret;
> +
> +    req.head.type = type;
> +    req.domain = domain;
> +    req.endpoint = ep;

A driver would explicitly write little-endian in there with cpu_to_le*().
I guess that also matters here if the test could run on a big-endian host?

> +
> +    ro_addr = guest_alloc(alloc, ro_size);
> +    wr_addr = guest_alloc(alloc, wr_size);
> +
> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> +                           QVIRTIO_IOMMU_TIMEOUT_US);
> +    qtest_memread(qts, wr_addr, &buffer, wr_size);
> +    ret = buffer.status;

Could check that the rest of the buffer is still 0

> +    guest_free(alloc, ro_addr);
> +    guest_free(alloc, wr_addr);
> +    return ret;
> +}
> +
> +/**
> + * send_map - Send a map command to the device
> + * @domain: domain the new binding is attached to

(what is the new binding?)

> + * @virt_start: iova start
> + * @virt_end: iova end
> + * @phys_start: base physical address
> + * @flags: mapping flags
> + */
> +static int send_map(QTestState *qts, QVirtioIOMMU *v_iommu,
> +                    uint32_t domain, uint64_t virt_start, uint64_t virt_end,
> +                    uint64_t phys_start, uint32_t flags)
> +{
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    QVirtQueue *vq = v_iommu->vq;
> +    uint64_t ro_addr, wr_addr;
> +    uint32_t free_head;
> +    struct virtio_iommu_req_map req;
> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
> +    struct virtio_iommu_req_tail buffer;
> +    int ret;
> +
> +    req.head.type = VIRTIO_IOMMU_T_MAP;
> +    req.domain = domain;
> +    req.virt_start = virt_start;
> +    req.virt_end = virt_end;
> +    req.phys_start = phys_start;
> +    req.flags = flags;
> +
> +    ro_addr = guest_alloc(alloc, ro_size);
> +    wr_addr = guest_alloc(alloc, wr_size);
> +
> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> +                           QVIRTIO_IOMMU_TIMEOUT_US);
> +    qtest_memread(qts, wr_addr, &buffer, wr_size);
> +    ret = buffer.status;
> +    guest_free(alloc, ro_addr);
> +    guest_free(alloc, wr_addr);
> +    return ret;
> +}
> +
> +/**
> + * send_unmap - Send an unmap command to the device
> + * @domain: domain the new binding is attached to
> + * @virt_start: iova start
> + * @virt_end: iova end
> + */
> +static int send_unmap(QTestState *qts, QVirtioIOMMU *v_iommu,
> +                      uint32_t domain, uint64_t virt_start, uint64_t virt_end)
> +{
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    QVirtQueue *vq = v_iommu->vq;
> +    uint64_t ro_addr, wr_addr;
> +    uint32_t free_head;
> +    struct virtio_iommu_req_unmap req;
> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
> +    struct virtio_iommu_req_tail buffer;
> +    int ret;
> +
> +    req.head.type = VIRTIO_IOMMU_T_UNMAP;
> +    req.domain = domain;
> +    req.virt_start = virt_start;
> +    req.virt_end = virt_end;
> +
> +    ro_addr = guest_alloc(alloc, ro_size);
> +    wr_addr = guest_alloc(alloc, wr_size);
> +
> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> +                           QVIRTIO_IOMMU_TIMEOUT_US);
> +    qtest_memread(qts, wr_addr, &buffer, wr_size);
> +    ret = buffer.status;
> +    guest_free(alloc, ro_addr);
> +    guest_free(alloc, wr_addr);
> +    return ret;
> +}
> +
> +/* Test unmap scenari documented in the spec v0.12 */
> +static void test_attach_detach(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtioIOMMU *v_iommu = obj;
> +    QTestState *qts = global_qtest;
> +    int ret;
> +
> +    alloc = t_alloc;
> +
> +    /* type, domain, ep */
> +
> +    /* attach ep0 to domain 0 */

By the way, what endpoint is this, the host bridge?  I'm still trying to
understand the test framework, how do we know that ep 0 exists and ep 1
doesn't?

> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 0, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    /* attach a non existing device (1) */

(444)?

> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 0, 444);
> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
> +
> +    /* detach a non existing device (1) */
> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 0, 1);
> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
> +
> +    /* move ep0 from domain 0 to domain 1 */
> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    /* detach ep0 to domain 0 */

from

> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 0, 0);
> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_INVAL);
> +
> +    /* detach ep0 from domain 1 */
> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 1, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +    ret = send_map(qts, v_iommu, 1, 0x0, 0xFFF, 0xa1000,
> +                   VIRTIO_IOMMU_MAP_F_READ);
> +    g_assert_cmpint(ret, ==, 0);

I was going to say that success here depends on the minimum page size
offered by the device (if the page size if 64k this request would fail),
but there is no check for page alignment at the moment.

It's just a SHOULD in the spec so we don't have to add the check, but it
may help with the VFIO integration - even though VFIO will fail unaligned
MAP ioctls, we report success to the driver. So I've added alignment
checks to my TODO list, but nothing urgent

> +    ret = send_map(qts, v_iommu, 1, 0x2000, 0x2FFF, 0xb1000,
> +                   VIRTIO_IOMMU_MAP_F_READ);
> +    g_assert_cmpint(ret, ==, 0);
> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_DETACH, 1, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +}
> +
> +static void test_map_unmap(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtioIOMMU *v_iommu = obj;
> +    QTestState *qts = global_qtest;
> +    int ret;
> +
> +    alloc = t_alloc;
> +
> +    /* attach ep0 to domain 1 */
> +    ret = send_attach_detach(qts, v_iommu, VIRTIO_IOMMU_T_ATTACH, 1, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    ret = send_map(qts, v_iommu, 0, 0, 0xFFF, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
> +
> +    /* domain, virt start, virt end, phys start, flags */
> +    ret = send_map(qts, v_iommu, 1, 0, 0xFFF, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);
> +    g_assert_cmpint(ret, ==, 0);

Could you also check that resending the map returns INVAL?

> +
> +    ret = send_unmap(qts, v_iommu, 4, 0x10, 0xFFF);
> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_NOENT);
> +
> +    ret = send_unmap(qts, v_iommu, 1, 0x10, 0xFFF);
> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_RANGE);
> +
> +    ret = send_unmap(qts, v_iommu, 1, 0, 0x1000);
> +    g_assert_cmpint(ret, ==, 0); /* unmap everything */
> +
> +    /* Spec example sequence */
> +
> +    /* 1 */
> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
> +    g_assert_cmpint(ret, ==, 0); /* doesn't unmap anything */
> +
> +    /* 2 */
> +    send_map(qts, v_iommu, 1, 0, 9, 0xa1000, VIRTIO_IOMMU_MAP_F_READ);

Same as above, the IOVAs aren't aligned on page size (the example assumes
a 1-byte granule, which arguably isn't the best idea but seemed easier to
read). The device currently accepts this but it would be better to write
the test to comply with page alignment. I can also change that when I get
to the alignment checks.

> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,9] */
> +
> +    /* 3 */
> +    send_map(qts, v_iommu, 1, 0, 4, 0xb1000, VIRTIO_IOMMU_MAP_F_READ);
> +    send_map(qts, v_iommu, 1, 5, 9, 0xb2000, VIRTIO_IOMMU_MAP_F_READ);
> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [5,9] */
> +
> +    /* 4 */
> +    send_map(qts, v_iommu, 1, 0, 9, 0xc1000, VIRTIO_IOMMU_MAP_F_READ);

Could check the return values: INVAL here means the previous unmap didn't
actually work

> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
> +    g_assert_cmpint(ret, ==, VIRTIO_IOMMU_S_RANGE); /* doesn't unmap anything */
> +
> +    ret = send_unmap(qts, v_iommu, 1, 0, 10);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    /* 5 */
> +    send_map(qts, v_iommu, 1, 0, 4, 0xd1000, VIRTIO_IOMMU_MAP_F_READ);
> +    send_map(qts, v_iommu, 1, 5, 9, 0xd2000, VIRTIO_IOMMU_MAP_F_READ);
> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] */
> +
> +    ret = send_unmap(qts, v_iommu, 1, 5, 9);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    /* 6 */
> +    send_map(qts, v_iommu, 1, 0, 4, 0xe2000, VIRTIO_IOMMU_MAP_F_READ);
> +    ret = send_unmap(qts, v_iommu, 1, 0, 9);
> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] */
> +
> +    /* 7 */
> +    send_map(qts, v_iommu, 1, 0, 4, 0xf2000, VIRTIO_IOMMU_MAP_F_READ);
> +    send_map(qts, v_iommu, 1, 10, 14, 0xf3000, VIRTIO_IOMMU_MAP_F_READ);
> +    ret = send_unmap(qts, v_iommu, 1, 0, 14);
> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [10,14] */
> +
> +    send_unmap(qts, v_iommu, 1, 0, 100);

Shouldn't be needed?

> +    send_map(qts, v_iommu, 1, 10, 14, 0xf3000, VIRTIO_IOMMU_MAP_F_READ);
> +    send_map(qts, v_iommu, 1, 0, 4, 0xf2000, VIRTIO_IOMMU_MAP_F_READ);
> +    ret = send_unmap(qts, v_iommu, 1, 0, 4);
> +    g_assert_cmpint(ret, ==, 0); /* unmaps [0,4] and [10,14] */

Only unmaps [0,4]

Thanks,
Jean

> +}
> +
> +static void register_virtio_iommu_test(void)
> +{
> +    qos_add_test("config", "virtio-iommu", pci_config, NULL);
> +    qos_add_test("attach_detach", "virtio-iommu", test_attach_detach, NULL);
> +    qos_add_test("map_unmap", "virtio-iommu", test_map_unmap, NULL);
> +}
> +
> +libqos_init(register_virtio_iommu_test);
> -- 
> 2.30.1
> 

