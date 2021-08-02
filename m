Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFCF3DE340
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 01:51:09 +0200 (CEST)
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAhi8-0002PP-9Q
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 19:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1mAhfx-0000Y4-V3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:48:53 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1mAhfu-0001vX-Qk
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 19:48:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso513692wms.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 16:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CVZmNkpYSmAmxYJBKs20xUNgf1HsB8eRp5WnKrLhDUw=;
 b=KXYucAKBatrNlL4dk9j91iqyQ2UbH2Lr35iTvrJLnkIsR6RSUfqq+vWzVGqCEZOxzk
 R62G50Zk9YMST1XxKfq14lyvvs8ZIJ6lqtIZWixS1+b8btUhb/C+y+3voQCaOOc4Hm+k
 5Ij+wnP2MBIyXc212OEjaWWE2ordi/0giThZbrEa/QfL+2VyWUdX5bSmBwVhPQ8rlmg8
 fzkDEgJJUqKRI3W6xJKsFtS+Qg/DsJ4aTXa2DoWgVrob8UjNQmBizx0RtHawTABf0jjY
 ZYw1nzn47LO9+XCIJ5YGFZx2Gg8BH63XWTC3QZOkGDc3EYTU9mvWVPYGlXGMRrqchAwe
 ZkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CVZmNkpYSmAmxYJBKs20xUNgf1HsB8eRp5WnKrLhDUw=;
 b=LntsJn9TN93B0BX/7Fi+g0OAXYzeLM0tCrG6vThtcyjlL9PFLFdJkVOhXHGnU7N8lk
 kRfI1S+s0c8UM1qkmGRNko01P2poYlINdYAhO//2GlPt/9KGSQQyymHpWbA/iVtSKE3+
 ZVmzfNjIOPEcpHa95ROK5vDd+izuTBGsHnO5Ma3hVwRAN5OFwVMksWe+szfA5QQP38wq
 U27UJPDx4XGVns2l5JYzdNKXD9w435s4MgwwNrp08r3LQWEYLPaXZmx7S/ToDuwF+cMw
 Ul8JXiEaLwkMwxBtG5jHOQSYKp3P49fKBFH5hl9gqyjjYrVtcsQi4j6XCFAnJ55Pt1c7
 mnbQ==
X-Gm-Message-State: AOAM531Je1L6RzkBXePmgDd5SMYPIWVfPlScMuQpwODjHLkdFctvpheo
 N21ZjpSfWaJSomcsMPttKpBRFCeXoKSZgf5JSVoU8w==
X-Google-Smtp-Source: ABdhPJyjp9/npGa1MrCfS3mB2r15RNjkOb0UQrGeML2iRBQcbTkXxt5OhcojR39wkLTWZTImJTpnpWSxS9QuVVKAEvY=
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr1331435wmb.12.1627948129304; 
 Mon, 02 Aug 2021 16:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210802230323.1164787-1-stmao@google.com>
 <20210802230323.1164787-2-stmao@google.com>
In-Reply-To: <20210802230323.1164787-2-stmao@google.com>
From: Shengtan Mao <stmao@google.com>
Date: Mon, 2 Aug 2021 19:48:38 -0400
Message-ID: <CAMiADQ_p-UWJL7pwkr8h+zJEjNx3N+R=m6MG2EsgOKVP_RJN2Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/i2c: add remote I2C device
To: Corey Minyard <cminyard@mvista.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Chris Rauer <crauer@google.com>, Hao Wu <wuhaotsh@google.com>, 
 Patrick Venture <venture@google.com>, maoshengtan2011@gmail.com
Content-Type: multipart/alternative; boundary="000000000000f6165805c89c3506"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=stmao@google.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f6165805c89c3506
Content-Type: text/plain; charset="UTF-8"

This patch set was sent in error (duplicates and bad version names). Please
ignore it.

Sorry for the inconvenience,
Shengtan Mao

On Mon, Aug 2, 2021 at 7:03 PM Shengtan Mao <stmao@google.com> wrote:

> This patch adds the remote I2C device, which supports the usage of
> external I2C devices.
> Signed-off-by: Shengtan Mao <stmao@google.com>
> ---
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/Kconfig                |   4 +
>  hw/i2c/meson.build            |   1 +
>  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
>  6 files changed, 340 insertions(+)
>  create mode 100644 hw/i2c/remote-i2c.c
>  create mode 100644 tests/qtest/remote-i2c-test.c
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 90b19c0861..58fdfab90d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -392,6 +392,7 @@ config NPCM7XX
>      select MAX34451
>      select PL310  # cache controller
>      select PMBUS
> +    select REMOTE_I2C
>      select SERIAL
>      select SSI
>      select UNIMP
> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> index 8217cb5041..278156991d 100644
> --- a/hw/i2c/Kconfig
> +++ b/hw/i2c/Kconfig
> @@ -1,6 +1,10 @@
>  config I2C
>      bool
>
> +config REMOTE_I2C
> +    bool
> +    select I2C
> +
>  config SMBUS
>      bool
>      select I2C
> diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
> index d3df273251..ba0215db61 100644
> --- a/hw/i2c/meson.build
> +++ b/hw/i2c/meson.build
> @@ -6,6 +6,7 @@ i2c_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true:
> files('smbus_ich9.c'))
>  i2c_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_i2c.c'))
>  i2c_ss.add(when: 'CONFIG_BITBANG_I2C', if_true: files('bitbang_i2c.c'))
>  i2c_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_i2c.c'))
> +i2c_ss.add(when: 'CONFIG_REMOTE_I2C', if_true: files('remote-i2c.c'))
>  i2c_ss.add(when: 'CONFIG_IMX_I2C', if_true: files('imx_i2c.c'))
>  i2c_ss.add(when: 'CONFIG_MPC_I2C', if_true: files('mpc_i2c.c'))
>  i2c_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('microbit_i2c.c'))
> diff --git a/hw/i2c/remote-i2c.c b/hw/i2c/remote-i2c.c
> new file mode 100644
> index 0000000000..083eaf2210
> --- /dev/null
> +++ b/hw/i2c/remote-i2c.c
> @@ -0,0 +1,117 @@
> +/*
> + * Remote I2C Device
> + *
> + * Copyright (c) 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "chardev/char-fe.h"
> +#include "hw/i2c/i2c.h"
> +#include "hw/qdev-properties-system.h"
> +
> +#define TYPE_REMOTE_I2C "remote-i2c"
> +#define REMOTE_I2C(obj) OBJECT_CHECK(RemoteI2CState, (obj),
> TYPE_REMOTE_I2C)
> +#define ONE_BYTE 1
> +
> +typedef struct {
> +    I2CSlave parent_obj;
> +    CharBackend chr;
> +} RemoteI2CState;
> +
> +typedef enum {
> +    REMOTE_I2C_START_RECV = 0,
> +    REMOTE_I2C_START_SEND = 1,
> +    REMOTE_I2C_FINISH = 2,
> +    REMOTE_I2C_NACK = 3,
> +    REMOTE_I2C_RECV = 4,
> +    REMOTE_I2C_SEND = 5,
> +} RemoteI2CCommand;
> +
> +static uint8_t remote_i2c_recv(I2CSlave *s)
> +{
> +    RemoteI2CState *i2c = REMOTE_I2C(s);
> +    uint8_t resp = 0;
> +    uint8_t type = REMOTE_I2C_RECV;
> +    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
> +
> +    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
> +    return resp;
> +}
> +
> +static int remote_i2c_send(I2CSlave *s, uint8_t data)
> +{
> +    RemoteI2CState *i2c = REMOTE_I2C(s);
> +    uint8_t type = REMOTE_I2C_SEND;
> +    uint8_t resp = 1;
> +    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
> +    qemu_chr_fe_write_all(&i2c->chr, &data, ONE_BYTE);
> +
> +    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
> +    return resp ? -1 : 0;
> +}
> +
> +/* Returns non-zero when no response from the device. */
> +static int remote_i2c_event(I2CSlave *s, enum i2c_event event)
> +{
> +    RemoteI2CState *i2c = REMOTE_I2C(s);
> +    uint8_t type;
> +    uint8_t resp = 1;
> +    switch (event) {
> +    case I2C_START_RECV:
> +        type = REMOTE_I2C_START_RECV;
> +        break;
> +    case I2C_START_SEND:
> +        type = REMOTE_I2C_START_SEND;
> +        break;
> +    case I2C_FINISH:
> +        type = REMOTE_I2C_FINISH;
> +        break;
> +    case I2C_NACK:
> +        type = REMOTE_I2C_NACK;
> +    }
> +    qemu_chr_fe_write_all(&i2c->chr, &type, ONE_BYTE);
> +    qemu_chr_fe_read_all(&i2c->chr, &resp, ONE_BYTE);
> +    return resp ? -1 : 0;
> +}
> +
> +static Property remote_i2c_props[] = {
> +    DEFINE_PROP_CHR("chardev", RemoteI2CState, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void remote_i2c_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    k->recv = &remote_i2c_recv;
> +    k->send = &remote_i2c_send;
> +    k->event = &remote_i2c_event;
> +    device_class_set_props(dc, remote_i2c_props);
> +}
> +
> +static const TypeInfo remote_i2c_type = {
> +    .name = TYPE_REMOTE_I2C,
> +    .parent = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(RemoteI2CState),
> +    .class_size = sizeof(I2CSlaveClass),
> +    .class_init = remote_i2c_class_init,
> +};
> +
> +static void remote_i2c_register(void)
> +{
> +    type_register_static(&remote_i2c_type);
> +}
> +
> +type_init(remote_i2c_register)
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e22a0792c5..95faa2c379 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -218,6 +218,7 @@ qos_test_ss.add(
>    'pca9552-test.c',
>    'pci-test.c',
>    'pcnet-test.c',
> +  'remote-i2c-test.c',
>    'sdhci-test.c',
>    'spapr-phb-test.c',
>    'tmp105-test.c',
> diff --git a/tests/qtest/remote-i2c-test.c b/tests/qtest/remote-i2c-test.c
> new file mode 100644
> index 0000000000..b6ab210e4c
> --- /dev/null
> +++ b/tests/qtest/remote-i2c-test.c
> @@ -0,0 +1,216 @@
> +/*
> + * QTests for Remote I2C Device
> + *
> + * Copyright (c) 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu/config-file.h"
> +#include "sysemu/sysemu.h"
> +#include "libqos/qgraph.h"
> +#include "libqos/i2c.h"
> +
> +#include <sys/socket.h>
> +
> +#define TEST_ID "remote-i2c-test"
> +#define TEST_ADDR (0x62)
> +#define QEMU_CMD_CHR
>      \
> +    " -chardev socket,id=i2c-chardev,host=localhost,port=%d,reconnect=10"
> +
> +typedef enum {
> +    REMOTE_I2C_START_RECV = 0,
> +    REMOTE_I2C_START_SEND = 1,
> +    REMOTE_I2C_FINISH = 2,
> +    REMOTE_I2C_NACK = 3,
> +    REMOTE_I2C_RECV = 4,
> +    REMOTE_I2C_SEND = 5,
> +} RemoteI2CCommand;
> +
> +static int setup_fd(int *sock)
> +{
> +    fd_set readfds;
> +    int fd;
> +
> +    FD_ZERO(&readfds);
> +    FD_SET(*sock, &readfds);
> +    g_assert(select((*sock) + 1, &readfds, NULL, NULL, NULL) == 1);
> +
> +    fd = accept(*sock, NULL, 0);
> +    g_assert(fd >= 0);
> +
> +    return fd;
> +}
> +
> +static void test_recv(QI2CDevice *i2cdev, int fd, uint8_t *msg, uint16_t
> len)
> +{
> +    uint16_t buf_size = len + 2;
> +    uint8_t *buf = g_new(uint8_t, buf_size);
> +    uint16_t bytes_read = 0;
> +    uint8_t zero = 0;
> +    ssize_t rv;
> +
> +    /* write device responses to socket */
> +    rv = write(fd, &zero, 1);
> +    g_assert_cmpint(rv, ==, 1);
> +    rv = write(fd, msg, len);
> +    g_assert_cmpint(rv, ==, len);
> +    rv = write(fd, &zero, 1);
> +    g_assert_cmpint(rv, ==, 1);
> +
> +    /* check received value */
> +    qi2c_recv(i2cdev, buf, len);
> +    for (int i = 0; i < len; ++i) {
> +        g_assert_cmphex(buf[i], ==, msg[i]);
> +    }
> +
> +    /* check controller writes to chardev */
> +    do {
> +        bytes_read += read(fd, buf + bytes_read, buf_size - bytes_read);
> +    } while (bytes_read < buf_size);
> +
> +    g_assert_cmphex(buf[0], ==, REMOTE_I2C_START_RECV);
> +    for (int i = 1; i < len - 1; ++i) {
> +        g_assert_cmphex(buf[i], ==, REMOTE_I2C_RECV);
> +    }
> +    g_assert_cmphex(buf[buf_size - 1], ==, REMOTE_I2C_FINISH);
> +
> +    g_free(buf);
> +}
> +
> +static void test_send(QI2CDevice *i2cdev, int fd, uint8_t *msg, uint16_t
> len)
> +{
> +    uint16_t buf_size = len * 2 + 2;
> +    uint8_t *buf = g_new0(uint8_t, buf_size);
> +    uint16_t bytes_read = 0;
> +    ssize_t rv;
> +    int j = 0;
> +
> +    /* write device ACKs to socket*/
> +    rv = write(fd, buf, len + 2);
> +    g_assert_cmpint(rv, ==, len + 2);
> +
> +    qi2c_send(i2cdev, msg, len);
> +
> +    /* check controller writes to chardev */
> +    do {
> +        bytes_read += read(fd, buf + bytes_read, buf_size - bytes_read);
> +    } while (bytes_read < buf_size);
> +
> +    g_assert_cmphex(buf[0], ==, REMOTE_I2C_START_SEND);
> +    for (int i = 1; i < buf_size - 1; i += 2) {
> +        g_assert_cmphex(buf[i], ==, REMOTE_I2C_SEND);
> +        g_assert_cmphex(buf[i + 1], ==, msg[j++]);
> +    }
> +    g_assert_cmphex(buf[buf_size - 1], ==, REMOTE_I2C_FINISH);
> +
> +    g_free(buf);
> +}
> +
> +static void test_remote_i2c_recv(void *obj, void *data,
> +                                 QGuestAllocator *t_alloc)
> +{
> +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
> +    int *sock = (int *)data;
> +    int fd = setup_fd(sock);
> +
> +    uint8_t msg[] = {0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E,
> 0x4F};
> +
> +    test_recv(i2cdev, fd, msg, 1);
> +    test_recv(i2cdev, fd, msg, 2);
> +    test_recv(i2cdev, fd, msg, 3);
> +    test_recv(i2cdev, fd, msg, 4);
> +    test_recv(i2cdev, fd, msg, 5);
> +    test_recv(i2cdev, fd, msg, 6);
> +    test_recv(i2cdev, fd, msg, 7);
> +    test_recv(i2cdev, fd, msg, 8);
> +    test_recv(i2cdev, fd, msg, 9);
> +}
> +
> +static void test_remote_i2c_send(void *obj, void *data,
> +                                 QGuestAllocator *t_alloc)
> +{
> +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
> +    int *sock = (int *)data;
> +    int fd = setup_fd(sock);
> +
> +    uint8_t msg[] = {0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E,
> 0x4F};
> +
> +    test_send(i2cdev, fd, msg, 1);
> +    test_send(i2cdev, fd, msg, 2);
> +    test_send(i2cdev, fd, msg, 3);
> +    test_send(i2cdev, fd, msg, 4);
> +    test_send(i2cdev, fd, msg, 5);
> +    test_send(i2cdev, fd, msg, 6);
> +    test_send(i2cdev, fd, msg, 7);
> +    test_send(i2cdev, fd, msg, 8);
> +    test_send(i2cdev, fd, msg, 9);
> +}
> +
> +static in_port_t open_socket(int *sock)
> +{
> +    struct sockaddr_in myaddr;
> +    socklen_t addrlen;
> +
> +    myaddr.sin_family = AF_INET;
> +    myaddr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
> +    myaddr.sin_port = 0;
> +
> +    *sock = socket(AF_INET, SOCK_STREAM, 0);
> +    g_assert(*sock != -1);
> +    g_assert(bind(*sock, (struct sockaddr *)&myaddr, sizeof(myaddr)) !=
> -1);
> +
> +    addrlen = sizeof(myaddr);
> +    g_assert(getsockname(*sock, (struct sockaddr *)&myaddr, &addrlen) !=
> -1);
> +    g_assert(listen(*sock, 1) != -1);
> +
> +    return ntohs(myaddr.sin_port);
> +}
> +
> +static void remote_i2c_test_cleanup(void *socket)
> +{
> +    int *s = socket;
> +
> +    close(*s);
> +    qos_invalidate_command_line();
> +    g_free(s);
> +}
> +
> +static void *remote_i2c_test_setup(GString *cmd_line, void *arg)
> +{
> +    int *sock = g_new(int, 1);
> +
> +    g_string_append_printf(cmd_line, QEMU_CMD_CHR, open_socket(sock));
> +    g_test_queue_destroy(remote_i2c_test_cleanup, sock);
> +    return sock;
> +}
> +
> +static void register_remote_i2c_test(void)
> +{
> +    QOSGraphEdgeOptions edge = {
> +        .extra_device_opts = "id=" TEST_ID
> ",address=0x62,chardev=i2c-chardev"};
> +    add_qi2c_address(&edge, &(QI2CAddress){TEST_ADDR});
> +
> +    qos_node_create_driver("remote-i2c", i2c_device_create);
> +    qos_node_consumes("remote-i2c", "i2c-bus", &edge);
> +
> +    QOSGraphTestOptions opts = {
> +        .before = remote_i2c_test_setup,
> +    };
> +    qemu_add_opts(&qemu_chardev_opts);
> +    qos_add_test("test_remote_i2c_recv", "remote-i2c",
> test_remote_i2c_recv,
> +                 &opts);
> +    qos_add_test("test_remote_i2c_send", "remote-i2c",
> test_remote_i2c_send,
> +                 &opts);
> +}
> +libqos_init(register_remote_i2c_test);
> --
> 2.32.0.554.ge1b32706d8-goog
>
>

--000000000000f6165805c89c3506
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch set was sent in error (duplicates and bad versi=
on names). Please ignore it.=C2=A0<div><br></div><div>Sorry for the inconve=
nience,</div><div>Shengtan Mao</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 7:03 PM Shengtan=
 Mao &lt;<a href=3D"mailto:stmao@google.com">stmao@google.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This patch add=
s the remote I2C device, which supports the usage of<br>
external I2C devices.<br>
Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=
=3D"_blank">stmao@google.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0hw/i2c/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A04 +<br>
=C2=A0hw/i2c/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0hw/i2c/remote-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 117 +++=
+++++++++++++++<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<b=
r>
=C2=A0tests/qtest/remote-i2c-test.c | 216 +++++++++++++++++++++++++++++++++=
+<br>
=C2=A06 files changed, 340 insertions(+)<br>
=C2=A0create mode 100644 hw/i2c/remote-i2c.c<br>
=C2=A0create mode 100644 tests/qtest/remote-i2c-test.c<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 90b19c0861..58fdfab90d 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -392,6 +392,7 @@ config NPCM7XX<br>
=C2=A0 =C2=A0 =C2=A0select MAX34451<br>
=C2=A0 =C2=A0 =C2=A0select PL310=C2=A0 # cache controller<br>
=C2=A0 =C2=A0 =C2=A0select PMBUS<br>
+=C2=A0 =C2=A0 select REMOTE_I2C<br>
=C2=A0 =C2=A0 =C2=A0select SERIAL<br>
=C2=A0 =C2=A0 =C2=A0select SSI<br>
=C2=A0 =C2=A0 =C2=A0select UNIMP<br>
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig<br>
index 8217cb5041..278156991d 100644<br>
--- a/hw/i2c/Kconfig<br>
+++ b/hw/i2c/Kconfig<br>
@@ -1,6 +1,10 @@<br>
=C2=A0config I2C<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
+config REMOTE_I2C<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 select I2C<br>
+<br>
=C2=A0config SMBUS<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select I2C<br>
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build<br>
index d3df273251..ba0215db61 100644<br>
--- a/hw/i2c/meson.build<br>
+++ b/hw/i2c/meson.build<br>
@@ -6,6 +6,7 @@ i2c_ss.add(when: &#39;CONFIG_ACPI_X86_ICH&#39;, if_true: fi=
les(&#39;smbus_ich9.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_ASPEED_SOC&#39;, if_true: files(&#39;asp=
eed_i2c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_BITBANG_I2C&#39;, if_true: files(&#39;bi=
tbang_i2c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_EXYNOS4&#39;, if_true: files(&#39;exynos=
4210_i2c.c&#39;))<br>
+i2c_ss.add(when: &#39;CONFIG_REMOTE_I2C&#39;, if_true: files(&#39;remote-i=
2c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_IMX_I2C&#39;, if_true: files(&#39;imx_i2=
c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_MPC_I2C&#39;, if_true: files(&#39;mpc_i2=
c.c&#39;))<br>
=C2=A0i2c_ss.add(when: &#39;CONFIG_NRF51_SOC&#39;, if_true: files(&#39;micr=
obit_i2c.c&#39;))<br>
diff --git a/hw/i2c/remote-i2c.c b/hw/i2c/remote-i2c.c<br>
new file mode 100644<br>
index 0000000000..083eaf2210<br>
--- /dev/null<br>
+++ b/hw/i2c/remote-i2c.c<br>
@@ -0,0 +1,117 @@<br>
+/*<br>
+ * Remote I2C Device<br>
+ *<br>
+ * Copyright (c) 2021 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+<br>
+#include &quot;chardev/char-fe.h&quot;<br>
+#include &quot;hw/i2c/i2c.h&quot;<br>
+#include &quot;hw/qdev-properties-system.h&quot;<br>
+<br>
+#define TYPE_REMOTE_I2C &quot;remote-i2c&quot;<br>
+#define REMOTE_I2C(obj) OBJECT_CHECK(RemoteI2CState, (obj), TYPE_REMOTE_I2=
C)<br>
+#define ONE_BYTE 1<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 I2CSlave parent_obj;<br>
+=C2=A0 =C2=A0 CharBackend chr;<br>
+} RemoteI2CState;<br>
+<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 REMOTE_I2C_START_RECV =3D 0,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_START_SEND =3D 1,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_FINISH =3D 2,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_NACK =3D 3,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_RECV =3D 4,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_SEND =3D 5,<br>
+} RemoteI2CCommand;<br>
+<br>
+static uint8_t remote_i2c_recv(I2CSlave *s)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteI2CState *i2c =3D REMOTE_I2C(s);<br>
+=C2=A0 =C2=A0 uint8_t resp =3D 0;<br>
+=C2=A0 =C2=A0 uint8_t type =3D REMOTE_I2C_RECV;<br>
+=C2=A0 =C2=A0 qemu_chr_fe_write_all(&amp;i2c-&gt;chr, &amp;type, ONE_BYTE)=
;<br>
+<br>
+=C2=A0 =C2=A0 qemu_chr_fe_read_all(&amp;i2c-&gt;chr, &amp;resp, ONE_BYTE);=
<br>
+=C2=A0 =C2=A0 return resp;<br>
+}<br>
+<br>
+static int remote_i2c_send(I2CSlave *s, uint8_t data)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteI2CState *i2c =3D REMOTE_I2C(s);<br>
+=C2=A0 =C2=A0 uint8_t type =3D REMOTE_I2C_SEND;<br>
+=C2=A0 =C2=A0 uint8_t resp =3D 1;<br>
+=C2=A0 =C2=A0 qemu_chr_fe_write_all(&amp;i2c-&gt;chr, &amp;type, ONE_BYTE)=
;<br>
+=C2=A0 =C2=A0 qemu_chr_fe_write_all(&amp;i2c-&gt;chr, &amp;data, ONE_BYTE)=
;<br>
+<br>
+=C2=A0 =C2=A0 qemu_chr_fe_read_all(&amp;i2c-&gt;chr, &amp;resp, ONE_BYTE);=
<br>
+=C2=A0 =C2=A0 return resp ? -1 : 0;<br>
+}<br>
+<br>
+/* Returns non-zero when no response from the device. */<br>
+static int remote_i2c_event(I2CSlave *s, enum i2c_event event)<br>
+{<br>
+=C2=A0 =C2=A0 RemoteI2CState *i2c =3D REMOTE_I2C(s);<br>
+=C2=A0 =C2=A0 uint8_t type;<br>
+=C2=A0 =C2=A0 uint8_t resp =3D 1;<br>
+=C2=A0 =C2=A0 switch (event) {<br>
+=C2=A0 =C2=A0 case I2C_START_RECV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D REMOTE_I2C_START_RECV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case I2C_START_SEND:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D REMOTE_I2C_START_SEND;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case I2C_FINISH:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D REMOTE_I2C_FINISH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case I2C_NACK:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 type =3D REMOTE_I2C_NACK;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 qemu_chr_fe_write_all(&amp;i2c-&gt;chr, &amp;type, ONE_BYTE)=
;<br>
+=C2=A0 =C2=A0 qemu_chr_fe_read_all(&amp;i2c-&gt;chr, &amp;resp, ONE_BYTE);=
<br>
+=C2=A0 =C2=A0 return resp ? -1 : 0;<br>
+}<br>
+<br>
+static Property remote_i2c_props[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_CHR(&quot;chardev&quot;, RemoteI2CState, chr),<b=
r>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void remote_i2c_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 k-&gt;recv =3D &amp;remote_i2c_recv;<br>
+=C2=A0 =C2=A0 k-&gt;send =3D &amp;remote_i2c_send;<br>
+=C2=A0 =C2=A0 k-&gt;event =3D &amp;remote_i2c_event;<br>
+=C2=A0 =C2=A0 device_class_set_props(dc, remote_i2c_props);<br>
+}<br>
+<br>
+static const TypeInfo remote_i2c_type =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_REMOTE_I2C,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_I2C_SLAVE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(RemoteI2CState),<br>
+=C2=A0 =C2=A0 .class_size =3D sizeof(I2CSlaveClass),<br>
+=C2=A0 =C2=A0 .class_init =3D remote_i2c_class_init,<br>
+};<br>
+<br>
+static void remote_i2c_register(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;remote_i2c_type);<br>
+}<br>
+<br>
+type_init(remote_i2c_register)<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index e22a0792c5..95faa2c379 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -218,6 +218,7 @@ qos_test_ss.add(<br>
=C2=A0 =C2=A0&#39;pca9552-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;pci-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;pcnet-test.c&#39;,<br>
+=C2=A0 &#39;remote-i2c-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;sdhci-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;spapr-phb-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;tmp105-test.c&#39;,<br>
diff --git a/tests/qtest/remote-i2c-test.c b/tests/qtest/remote-i2c-test.c<=
br>
new file mode 100644<br>
index 0000000000..b6ab210e4c<br>
--- /dev/null<br>
+++ b/tests/qtest/remote-i2c-test.c<br>
@@ -0,0 +1,216 @@<br>
+/*<br>
+ * QTests for Remote I2C Device<br>
+ *<br>
+ * Copyright (c) 2021 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+<br>
+#include &quot;qemu/config-file.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;libqos/qgraph.h&quot;<br>
+#include &quot;libqos/i2c.h&quot;<br>
+<br>
+#include &lt;sys/socket.h&gt;<br>
+<br>
+#define TEST_ID &quot;remote-i2c-test&quot;<br>
+#define TEST_ADDR (0x62)<br>
+#define QEMU_CMD_CHR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 &quot; -chardev socket,id=3Di2c-chardev,host=3Dlocalhost,por=
t=3D%d,reconnect=3D10&quot;<br>
+<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 REMOTE_I2C_START_RECV =3D 0,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_START_SEND =3D 1,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_FINISH =3D 2,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_NACK =3D 3,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_RECV =3D 4,<br>
+=C2=A0 =C2=A0 REMOTE_I2C_SEND =3D 5,<br>
+} RemoteI2CCommand;<br>
+<br>
+static int setup_fd(int *sock)<br>
+{<br>
+=C2=A0 =C2=A0 fd_set readfds;<br>
+=C2=A0 =C2=A0 int fd;<br>
+<br>
+=C2=A0 =C2=A0 FD_ZERO(&amp;readfds);<br>
+=C2=A0 =C2=A0 FD_SET(*sock, &amp;readfds);<br>
+=C2=A0 =C2=A0 g_assert(select((*sock) + 1, &amp;readfds, NULL, NULL, NULL)=
 =3D=3D 1);<br>
+<br>
+=C2=A0 =C2=A0 fd =3D accept(*sock, NULL, 0);<br>
+=C2=A0 =C2=A0 g_assert(fd &gt;=3D 0);<br>
+<br>
+=C2=A0 =C2=A0 return fd;<br>
+}<br>
+<br>
+static void test_recv(QI2CDevice *i2cdev, int fd, uint8_t *msg, uint16_t l=
en)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t buf_size =3D len + 2;<br>
+=C2=A0 =C2=A0 uint8_t *buf =3D g_new(uint8_t, buf_size);<br>
+=C2=A0 =C2=A0 uint16_t bytes_read =3D 0;<br>
+=C2=A0 =C2=A0 uint8_t zero =3D 0;<br>
+=C2=A0 =C2=A0 ssize_t rv;<br>
+<br>
+=C2=A0 =C2=A0 /* write device responses to socket */<br>
+=C2=A0 =C2=A0 rv =3D write(fd, &amp;zero, 1);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(rv, =3D=3D, 1);<br>
+=C2=A0 =C2=A0 rv =3D write(fd, msg, len);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(rv, =3D=3D, len);<br>
+=C2=A0 =C2=A0 rv =3D write(fd, &amp;zero, 1);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(rv, =3D=3D, 1);<br>
+<br>
+=C2=A0 =C2=A0 /* check received value */<br>
+=C2=A0 =C2=A0 qi2c_recv(i2cdev, buf, len);<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; len; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(buf[i], =3D=3D, msg[i]);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* check controller writes to chardev */<br>
+=C2=A0 =C2=A0 do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_read +=3D read(fd, buf + bytes_read, buf=
_size - bytes_read);<br>
+=C2=A0 =C2=A0 } while (bytes_read &lt; buf_size);<br>
+<br>
+=C2=A0 =C2=A0 g_assert_cmphex(buf[0], =3D=3D, REMOTE_I2C_START_RECV);<br>
+=C2=A0 =C2=A0 for (int i =3D 1; i &lt; len - 1; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(buf[i], =3D=3D, REMOTE_I2C_REC=
V);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_assert_cmphex(buf[buf_size - 1], =3D=3D, REMOTE_I2C_FINISH=
);<br>
+<br>
+=C2=A0 =C2=A0 g_free(buf);<br>
+}<br>
+<br>
+static void test_send(QI2CDevice *i2cdev, int fd, uint8_t *msg, uint16_t l=
en)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t buf_size =3D len * 2 + 2;<br>
+=C2=A0 =C2=A0 uint8_t *buf =3D g_new0(uint8_t, buf_size);<br>
+=C2=A0 =C2=A0 uint16_t bytes_read =3D 0;<br>
+=C2=A0 =C2=A0 ssize_t rv;<br>
+=C2=A0 =C2=A0 int j =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 /* write device ACKs to socket*/<br>
+=C2=A0 =C2=A0 rv =3D write(fd, buf, len + 2);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(rv, =3D=3D, len + 2);<br>
+<br>
+=C2=A0 =C2=A0 qi2c_send(i2cdev, msg, len);<br>
+<br>
+=C2=A0 =C2=A0 /* check controller writes to chardev */<br>
+=C2=A0 =C2=A0 do {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bytes_read +=3D read(fd, buf + bytes_read, buf=
_size - bytes_read);<br>
+=C2=A0 =C2=A0 } while (bytes_read &lt; buf_size);<br>
+<br>
+=C2=A0 =C2=A0 g_assert_cmphex(buf[0], =3D=3D, REMOTE_I2C_START_SEND);<br>
+=C2=A0 =C2=A0 for (int i =3D 1; i &lt; buf_size - 1; i +=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(buf[i], =3D=3D, REMOTE_I2C_SEN=
D);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(buf[i + 1], =3D=3D, msg[j++]);=
<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_assert_cmphex(buf[buf_size - 1], =3D=3D, REMOTE_I2C_FINISH=
);<br>
+<br>
+=C2=A0 =C2=A0 g_free(buf);<br>
+}<br>
+<br>
+static void test_remote_i2c_recv(void *obj, void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QGuestAllocator *t_alloc)<br>
+{<br>
+=C2=A0 =C2=A0 QI2CDevice *i2cdev =3D (QI2CDevice *)obj;<br>
+=C2=A0 =C2=A0 int *sock =3D (int *)data;<br>
+=C2=A0 =C2=A0 int fd =3D setup_fd(sock);<br>
+<br>
+=C2=A0 =C2=A0 uint8_t msg[] =3D {0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D,=
 0x4E, 0x4F};<br>
+<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 1);<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 2);<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 3);<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 4);<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 5);<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 6);<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 7);<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 8);<br>
+=C2=A0 =C2=A0 test_recv(i2cdev, fd, msg, 9);<br>
+}<br>
+<br>
+static void test_remote_i2c_send(void *obj, void *data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QGuestAllocator *t_alloc)<br>
+{<br>
+=C2=A0 =C2=A0 QI2CDevice *i2cdev =3D (QI2CDevice *)obj;<br>
+=C2=A0 =C2=A0 int *sock =3D (int *)data;<br>
+=C2=A0 =C2=A0 int fd =3D setup_fd(sock);<br>
+<br>
+=C2=A0 =C2=A0 uint8_t msg[] =3D {0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D,=
 0x4E, 0x4F};<br>
+<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 1);<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 2);<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 3);<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 4);<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 5);<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 6);<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 7);<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 8);<br>
+=C2=A0 =C2=A0 test_send(i2cdev, fd, msg, 9);<br>
+}<br>
+<br>
+static in_port_t open_socket(int *sock)<br>
+{<br>
+=C2=A0 =C2=A0 struct sockaddr_in myaddr;<br>
+=C2=A0 =C2=A0 socklen_t addrlen;<br>
+<br>
+=C2=A0 =C2=A0 myaddr.sin_family =3D AF_INET;<br>
+=C2=A0 =C2=A0 myaddr.sin_addr.s_addr =3D htonl(INADDR_LOOPBACK);<br>
+=C2=A0 =C2=A0 myaddr.sin_port =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 *sock =3D socket(AF_INET, SOCK_STREAM, 0);<br>
+=C2=A0 =C2=A0 g_assert(*sock !=3D -1);<br>
+=C2=A0 =C2=A0 g_assert(bind(*sock, (struct sockaddr *)&amp;myaddr, sizeof(=
myaddr)) !=3D -1);<br>
+<br>
+=C2=A0 =C2=A0 addrlen =3D sizeof(myaddr);<br>
+=C2=A0 =C2=A0 g_assert(getsockname(*sock, (struct sockaddr *)&amp;myaddr, =
&amp;addrlen) !=3D -1);<br>
+=C2=A0 =C2=A0 g_assert(listen(*sock, 1) !=3D -1);<br>
+<br>
+=C2=A0 =C2=A0 return ntohs(myaddr.sin_port);<br>
+}<br>
+<br>
+static void remote_i2c_test_cleanup(void *socket)<br>
+{<br>
+=C2=A0 =C2=A0 int *s =3D socket;<br>
+<br>
+=C2=A0 =C2=A0 close(*s);<br>
+=C2=A0 =C2=A0 qos_invalidate_command_line();<br>
+=C2=A0 =C2=A0 g_free(s);<br>
+}<br>
+<br>
+static void *remote_i2c_test_setup(GString *cmd_line, void *arg)<br>
+{<br>
+=C2=A0 =C2=A0 int *sock =3D g_new(int, 1);<br>
+<br>
+=C2=A0 =C2=A0 g_string_append_printf(cmd_line, QEMU_CMD_CHR, open_socket(s=
ock));<br>
+=C2=A0 =C2=A0 g_test_queue_destroy(remote_i2c_test_cleanup, sock);<br>
+=C2=A0 =C2=A0 return sock;<br>
+}<br>
+<br>
+static void register_remote_i2c_test(void)<br>
+{<br>
+=C2=A0 =C2=A0 QOSGraphEdgeOptions edge =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .extra_device_opts =3D &quot;id=3D&quot; TEST_=
ID &quot;,address=3D0x62,chardev=3Di2c-chardev&quot;};<br>
+=C2=A0 =C2=A0 add_qi2c_address(&amp;edge, &amp;(QI2CAddress){TEST_ADDR});<=
br>
+<br>
+=C2=A0 =C2=A0 qos_node_create_driver(&quot;remote-i2c&quot;, i2c_device_cr=
eate);<br>
+=C2=A0 =C2=A0 qos_node_consumes(&quot;remote-i2c&quot;, &quot;i2c-bus&quot=
;, &amp;edge);<br>
+<br>
+=C2=A0 =C2=A0 QOSGraphTestOptions opts =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .before =3D remote_i2c_test_setup,<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 qemu_add_opts(&amp;qemu_chardev_opts);<br>
+=C2=A0 =C2=A0 qos_add_test(&quot;test_remote_i2c_recv&quot;, &quot;remote-=
i2c&quot;, test_remote_i2c_recv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;opts);<=
br>
+=C2=A0 =C2=A0 qos_add_test(&quot;test_remote_i2c_send&quot;, &quot;remote-=
i2c&quot;, test_remote_i2c_send,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;opts);<=
br>
+}<br>
+libqos_init(register_remote_i2c_test);<br>
-- <br>
2.32.0.554.ge1b32706d8-goog<br>
<br>
</blockquote></div>

--000000000000f6165805c89c3506--

