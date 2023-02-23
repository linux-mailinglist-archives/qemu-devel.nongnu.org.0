Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145736A02E3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 07:42:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5Ib-0003JK-Oz; Thu, 23 Feb 2023 01:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dhoff749@gmail.com>)
 id 1pV5IO-0003IP-26; Thu, 23 Feb 2023 01:41:37 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dhoff749@gmail.com>)
 id 1pV5IM-0001Xc-3c; Thu, 23 Feb 2023 01:41:35 -0500
Received: by mail-qt1-x835.google.com with SMTP id r5so141205qtp.4;
 Wed, 22 Feb 2023 22:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A/N/kLam9B7risJ4JbDksr0IWP6ULAcGeWuDBgYMOpc=;
 b=QY2FfVgr+QYgQwVELI8Tsjbr9yyiHlkmaW4HbuiCHJXzuhodn7D298kJFRBjiedfoG
 kr3LRuNQAby6eaMZ9yc2vKw4kSXZeQTsD6f++t+fKWSLNJXp6HBvdvjnQxyMPpGaUrnE
 +A1pT3oGoRDZ3cBkYc05BCTh+4VmGJdoZ5mvc3tYgbPDx8n4Jhrfvp3YNATYAdJkMwji
 gSAxQN6xgR+UTLF+lwRwwgVEwEamY9KYOqM11f0pqzQzhLpWCrL/lyTyKsV6AamPGj2q
 A7N9TPF0uDWfwR7isNOpbAwOIjwfubKSBvjWoGeYbjMIs4A8+kuJSA0bdiy5yt0ZQ7Wz
 HOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A/N/kLam9B7risJ4JbDksr0IWP6ULAcGeWuDBgYMOpc=;
 b=6A7Ay7iWpgJwcxzDmrsEDRKennP9b/tEMBZlTiFci83WgKznnxmE7k1Nyk0bDqz1OC
 MvjWy/9SD6y6KVOn2QbsnJzP7lPvDulcH/AGGNnTScYa0PDlesojEwbfsBCKTCUYICaS
 +IMIRKTPszYs+ydbN3Q3Wm6p/dVHY8f1mTuLjdAYKndKU4YrnPc/NqrHkS6opsLbgNQR
 RmADcEGTMUABoX09INoLohJlwG86LpTHy3bb9ntFRw9UOAxVhbbbrTvxl42jCrQZvjPz
 +Sly51veAaSb6uA8KmSHa0iIDIZQU4GA2+UtuLQlEhLgEeRxoWfjdBY36zIoF5RsfAHb
 wtNQ==
X-Gm-Message-State: AO0yUKVSgRZMbY3WW223hrsuLGuLWVDOgwb4zTDThsRzlsr8qinC6bnq
 3B9zdbd2SVAEB+M0vQwniwg130EEud+mzo8HI2qCAkZt
X-Google-Smtp-Source: AK7set93TJ76fFG7k0BiBg/NpQD2D+jccCdTq4QLr5CL+m/rI6wipGMelCzHICc734QmpgM+8dKIUTr4h+tedsldI4U=
X-Received: by 2002:ac8:408b:0:b0:3bf:a16e:970 with SMTP id
 p11-20020ac8408b000000b003bfa16e0970mr1384753qtl.1.1677134491597; Wed, 22 Feb
 2023 22:41:31 -0800 (PST)
MIME-Version: 1.0
References: <20221112063241.2190502-1-dhoff749@gmail.com>
In-Reply-To: <20221112063241.2190502-1-dhoff749@gmail.com>
From: Dan Hoffman <dhoff749@gmail.com>
Date: Wed, 22 Feb 2023 22:41:20 -0800
Message-ID: <CAFXChK+5t5Nmt1eOz4tOTXe3z3f1YT+3=EKqVP+cC-MH_Frz3Q@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio: added virtio-serial test cases
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=dhoff749@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Is there interest in this?


On Fri, Nov 11, 2022 at 10:33 PM Daniel Hoffman <dhoff749@gmail.com> wrote:
>
> The previous test cases for virtio-serial only tested initialization of
> the device. I've included four new test cases: rx for virtconsole, tx
> for virtconsole, rx for virtserialport, tx for virtserialport. It
> follows the general pattern of virtio-net (i.e. chardev file descriptor
> backend with a socketpair connected via fork-exec).
>
> Signed-off-by: Daniel Hoffman <dhoff749@gmail.com>
> ---
>  tests/qtest/libqos/virtio-serial.c |  51 +++++++++
>  tests/qtest/libqos/virtio-serial.h |   2 +
>  tests/qtest/virtio-serial-test.c   | 177 ++++++++++++++++++++++++++++-
>  3 files changed, 228 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qtest/libqos/virtio-serial.c b/tests/qtest/libqos/virtio-serial.c
> index 1d689c3e38..8723bffe1b 100644
> --- a/tests/qtest/libqos/virtio-serial.c
> +++ b/tests/qtest/libqos/virtio-serial.c
> @@ -22,6 +22,10 @@
>  #include "qgraph.h"
>  #include "virtio-serial.h"
>
> +#include "qemu/iov.h"
> +
> +static QGuestAllocator *alloc;
> +
>  static void *qvirtio_serial_get_driver(QVirtioSerial *v_serial,
>                                         const char *interface)
>  {
> @@ -43,6 +47,33 @@ static void *qvirtio_serial_device_get_driver(void *object,
>      return qvirtio_serial_get_driver(&v_serial->serial, interface);
>  }
>
> +static void virtio_serial_setup(QVirtioSerial *interface)
> +{
> +    QVirtioDevice *vdev = interface->vdev;
> +    qvirtio_set_features(vdev, (1ULL << 1) | (1ULL << 32));
> +
> +    interface->n_queues = 6;
> +    interface->queues = g_new(QVirtQueue*, interface->n_queues);
> +
> +    for (int i = 0; i < interface->n_queues; i++) {
> +        interface->queues[i] = qvirtqueue_setup(interface->vdev, alloc, i);
> +    }
> +
> +    qvirtio_set_driver_ok(vdev);
> +}
> +
> +static void qvirtio_serial_device_destructor(QOSGraphObject *obj)
> +{
> +}
> +
> +static void qvirtio_serial_device_start_hw(QOSGraphObject *obj)
> +{
> +    QVirtioSerialDevice *v_serial = (QVirtioSerialDevice *)obj;
> +    QVirtioSerial *interface = &v_serial->serial;
> +
> +    virtio_serial_setup(interface);
> +}
> +
>  static void *virtio_serial_device_create(void *virtio_dev,
>                                           QGuestAllocator *t_alloc,
>                                           void *addr)
> @@ -51,13 +82,30 @@ static void *virtio_serial_device_create(void *virtio_dev,
>      QVirtioSerial *interface = &virtio_device->serial;
>
>      interface->vdev = virtio_dev;
> +    alloc = t_alloc;
>
> +    virtio_device->obj.destructor = qvirtio_serial_device_destructor;
> +    virtio_device->obj.start_hw = qvirtio_serial_device_start_hw;
>      virtio_device->obj.get_driver = qvirtio_serial_device_get_driver;
>
>      return &virtio_device->obj;
>  }
>
>  /* virtio-serial-pci */
> +static void qvirtio_serial_pci_destructor(QOSGraphObject *obj)
> +{
> +}
> +
> +static void qvirtio_serial_pci_start_hw(QOSGraphObject *obj)
> +{
> +    QVirtioSerialPCI *v_serial = (QVirtioSerialPCI *) obj;
> +    QVirtioSerial *interface = &v_serial->serial;
> +    QOSGraphObject *pci_vobj = &v_serial->pci_vdev.obj;
> +
> +    qvirtio_pci_start_hw(pci_vobj);
> +    virtio_serial_setup(interface);
> +}
> +
>  static void *qvirtio_serial_pci_get_driver(void *object, const char *interface)
>  {
>      QVirtioSerialPCI *v_serial = object;
> @@ -76,7 +124,10 @@ static void *virtio_serial_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
>
>      virtio_pci_init(&virtio_spci->pci_vdev, pci_bus, addr);
>      interface->vdev = &virtio_spci->pci_vdev.vdev;
> +    alloc = t_alloc;
>
> +    obj->destructor = qvirtio_serial_pci_destructor;
> +    obj->start_hw = qvirtio_serial_pci_start_hw;
>      obj->get_driver = qvirtio_serial_pci_get_driver;
>
>      return obj;
> diff --git a/tests/qtest/libqos/virtio-serial.h b/tests/qtest/libqos/virtio-serial.h
> index 3db43b2bb8..ce6ae164cb 100644
> --- a/tests/qtest/libqos/virtio-serial.h
> +++ b/tests/qtest/libqos/virtio-serial.h
> @@ -29,6 +29,8 @@ typedef struct QVirtioSerialDevice QVirtioSerialDevice;
>
>  struct QVirtioSerial {
>      QVirtioDevice *vdev;
> +    int n_queues;
> +    QVirtQueue **queues;
>  };
>
>  struct QVirtioSerialPCI {
> diff --git a/tests/qtest/virtio-serial-test.c b/tests/qtest/virtio-serial-test.c
> index 2541034822..190075d6f5 100644
> --- a/tests/qtest/virtio-serial-test.c
> +++ b/tests/qtest/virtio-serial-test.c
> @@ -11,6 +11,36 @@
>  #include "libqtest-single.h"
>  #include "qemu/module.h"
>  #include "libqos/virtio-serial.h"
> +#include "standard-headers/linux/virtio_console.h"
> +#include "qemu/iov.h"
> +
> +static void virtio_serial_test_cleanup(void *sockets)
> +{
> +    int *sv = sockets;
> +
> +    close(sv[0]);
> +    qos_invalidate_command_line();
> +    close(sv[1]);
> +    g_free(sv);
> +}
> +
> +static void *virtio_serial_test_setup(GString *cmd_line, void *arg)
> +{
> +    int ret;
> +    int *sv = g_new(int, 3);
> +
> +    ret = socketpair(PF_UNIX, SOCK_STREAM, 0, sv);
> +    g_assert_cmpint(ret, !=, -1);
> +
> +    g_string_append_printf(
> +        cmd_line,
> +        " -chardev socket,fd=%d,id=virtioserial0",
> +        sv[1]);
> +
> +    sv[2] = arg ? 1 : 0;
> +    g_test_queue_destroy(virtio_serial_test_cleanup, sv);
> +    return sv;
> +}
>
>  /* Tests only initialization so far. TODO: Replace with functional tests */
>  static void virtio_serial_nop(void *obj, void *data, QGuestAllocator *alloc)
> @@ -18,6 +48,132 @@ static void virtio_serial_nop(void *obj, void *data, QGuestAllocator *alloc)
>      /* no operation */
>  }
>
> +static void tx_test(
> +    QVirtioDevice *dev,
> +    QGuestAllocator *alloc,
> +    QVirtQueue *vq,
> +    int socket)
> +{
> +    QTestState *qts = global_qtest;
> +    uint64_t req_addr;
> +    uint64_t free_head;
> +    char test[] = "TEST";
> +    char buffer[5];
> +    struct iovec iov[] = {
> +        {
> +            .iov_base = buffer,
> +            .iov_len = strlen(test)
> +        }
> +    };
> +    int ret;
> +
> +    req_addr = guest_alloc(alloc, 4);
> +    qtest_memwrite(qts, req_addr, test, strlen(test));
> +
> +    free_head = qvirtqueue_add(qts, vq, req_addr, 4, false, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +
> +    ret = iov_recv(socket, iov, 1, 0, strlen(test));
> +    g_assert_cmpint(ret, ==, strlen(test));
> +
> +    buffer[strlen(test)] = '\0';
> +    g_assert_cmpstr(buffer, ==, test);
> +
> +    guest_free(alloc, req_addr);
> +}
> +
> +static void rx_test(
> +    QVirtioDevice *dev,
> +    QGuestAllocator *alloc,
> +    QVirtQueue *vq,
> +    int socket)
> +{
> +    QTestState *qts = global_qtest;
> +    uint64_t req_addr;
> +    uint64_t free_head;
> +    char test[] = "TEST";
> +    char buffer[5];
> +    struct iovec iov[] = {
> +        {
> +            .iov_base = test,
> +            .iov_len = strlen(test)
> +        }
> +    };
> +    int ret;
> +
> +    req_addr = guest_alloc(alloc, 4);
> +
> +    free_head = qvirtqueue_add(qts, vq, req_addr, 4, true, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +
> +    ret = iov_send(socket, iov, 1, 0, strlen(test));
> +    g_assert_cmpint(ret, ==, strlen(test));
> +
> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL, 5 * 1000 * 1000);
> +    qtest_memread(qts, req_addr, buffer, strlen(test));
> +
> +    buffer[strlen(test)] = '\0';
> +    g_assert_cmpstr(buffer, ==, test);
> +
> +    guest_free(alloc, req_addr);
> +}
> +
> +static void send_recv_test(void *obj, void *data, QGuestAllocator *alloc)
> +{
> +    QVirtioSerial *serial_if = obj;
> +    QVirtioDevice *dev = serial_if->vdev;
> +    uint32_t port_open_addr, port_open_free_head;
> +    int *sv = data;
> +
> +    /*
> +     * the first port is always virtconsole due to backwards compatibility
> +     * consideraitons so we must use the multiport feature to add the correct
> +     * port
> +     */
> +    QVirtQueue *rx = serial_if->queues[sv[2] == 0 ? 0 : 4];
> +    QVirtQueue *tx = serial_if->queues[sv[2] == 0 ? 1 : 5];
> +    QVirtQueue *control_tx = serial_if->queues[3];
> +
> +    port_open_addr = guest_alloc(alloc, 8);
> +
> +    qtest_writel(global_qtest, port_open_addr + 0, sv[2]);
> +    qtest_writew(global_qtest, port_open_addr + 4, VIRTIO_CONSOLE_PORT_READY);
> +    qtest_writew(global_qtest, port_open_addr + 6, 1);
> +    port_open_free_head = qvirtqueue_add(
> +        global_qtest,
> +        control_tx,
> +        port_open_addr,
> +        8,
> +        false,
> +        false);
> +    qvirtqueue_kick(
> +        global_qtest,
> +        dev,
> +        control_tx,
> +        port_open_free_head);
> +
> +    qtest_writel(global_qtest, port_open_addr + 0, sv[2]);
> +    qtest_writew(global_qtest, port_open_addr + 4, VIRTIO_CONSOLE_PORT_OPEN);
> +    qtest_writew(global_qtest, port_open_addr + 6, 1);
> +    port_open_free_head = qvirtqueue_add(
> +        global_qtest,
> +        control_tx,
> +        port_open_addr,
> +        8,
> +        false,
> +        false);
> +    qvirtqueue_kick(
> +        global_qtest,
> +        dev,
> +        control_tx,
> +        port_open_free_head);
> +
> +    guest_free(alloc, port_open_addr);
> +
> +    tx_test(dev, alloc, tx, sv[0]);
> +    rx_test(dev, alloc, rx, sv[0]);
> +}
> +
>  static void serial_hotplug(void *obj, void *data, QGuestAllocator *alloc)
>  {
>      qtest_qmp_device_add(global_qtest, "virtserialport", "hp-port", "{}");
> @@ -28,12 +184,29 @@ static void register_virtio_serial_test(void)
>  {
>      QOSGraphTestOptions opts = { };
>
> -    opts.edge.before_cmd_line = "-device virtconsole,bus=vser0.0";
> +    opts.before = virtio_serial_test_setup;
> +
> +    opts.arg = (gpointer)0;
> +    opts.edge.before_cmd_line =
> +        "-device virtconsole,bus=vser0.0,chardev=virtioserial0";
>      qos_add_test("console-nop", "virtio-serial", virtio_serial_nop, &opts);
> +    qos_add_test(
> +        "console-send-recv",
> +        "virtio-serial",
> +        send_recv_test,
> +        &opts);
>
> -    opts.edge.before_cmd_line = "-device virtserialport,bus=vser0.0";
> +    opts.arg = (gpointer)1;
> +    opts.edge.before_cmd_line =
> +        "-device virtserialport,bus=vser0.0,chardev=virtioserial0";
>      qos_add_test("serialport-nop", "virtio-serial", virtio_serial_nop, &opts);
>
> +    qos_add_test(
> +        "serialport-send-recv",
> +        "virtio-serial",
> +        send_recv_test,
> +        &opts);
> +
>      qos_add_test("hotplug", "virtio-serial", serial_hotplug, NULL);
>  }
>  libqos_init(register_virtio_serial_test);
> --
> 2.34.1
>

