Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B431C3515A5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:35:27 +0200 (CEST)
Received: from localhost ([::1]:52364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRyPu-0005H7-71
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRyOg-0004qp-9c
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:34:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRyOd-0002Zj-En
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:34:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id j9so2038003wrx.12
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=u0IBq1fayG9cpa2NeDye206OFffUkzE644kFB0OWqSg=;
 b=hReZmzaqxWBl+dFqEmm8uJ+ZcfCiE43J9Hm0TlWoe24RukhG7vX/AbbCO1D7S974Fd
 Dmfc0PuXlBIbBirpnVWYdGFYhEACdtNrxzQscWuAQdVgAuj2yITSpQOp59XqNRznWQ3y
 W56hAWJLcXpZcx0lEUaWjclD0HIWafyU34Wm7JbVnoH70cdqeD37UzogQ/U2oXcNUvb6
 23PHCH20yP/BUzt+EgRQV0MWdvInf3QrHD7XUgGe9mkiO1e4sQK1V4y/woAZv3jg2YUK
 D1fRpKueWWfolisbLKy70tk6MZtCCI7RQ8KokXj1YWtDwyxQb7QmPnBCZj8sjsAOL7PI
 aXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=u0IBq1fayG9cpa2NeDye206OFffUkzE644kFB0OWqSg=;
 b=OjGUQGLC9bqOIVXSrq3cU6S5JSAYG5aNRDqamrClrcBb45IDFnTcdFY+upeG84Ewmd
 n3CvKnNSbhegBwZUjxKmGgoy26MF5QTtAJOvd/Abk2zfmG6yY7l896Q0II4WmeZBtzkU
 F4BJXCVYsrzy6yp+ZJztuunlT/jbjWKgueG0ab4giPZDK89BKDcI1fubY4xxrz9dcW2n
 pbqbT4t/6ETtHtSUNIiJJCL9afebGPJCRGX0pQmcbaOXLAcbQ46ICf5QaO3z72004Kcd
 1pyr3OuBKpeo9n1OXyjiA4IqfvvFGszzZeLc6+k3BXZAqy9DQpF3emzcDJgdPHEUZL59
 U9tA==
X-Gm-Message-State: AOAM5332Ggn/YEkeVz7OVKkz7vHqHDxs10j5E5PS/RRTU8/M0hlsxbSV
 fIRyHJ1iiA55Nw3LLJDAtN3Rrw==
X-Google-Smtp-Source: ABdhPJyIff/f8K0crukI5nEumXZj+hsBfd+cV/R3cx3mQ+neVLBG8sKgNA31Fmdh1vhhxnrV7pVaFQ==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr9923850wrq.227.1617287645092; 
 Thu, 01 Apr 2021 07:34:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t8sm10382656wrr.10.2021.04.01.07.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 07:34:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 414CE1FF7E;
 Thu,  1 Apr 2021 15:34:03 +0100 (BST)
References: <cover.1617278395.git.viresh.kumar@linaro.org>
 <e0adcd9552cee4de0ee844f6b3c87fb2b2f2357c.1617278395.git.viresh.kumar@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 4/6] tools/vhost-user-i2c: Add backend driver
Date: Thu, 01 Apr 2021 14:43:51 +0100
In-reply-to: <e0adcd9552cee4de0ee844f6b3c87fb2b2f2357c.1617278395.git.viresh.kumar@linaro.org>
Message-ID: <87eefu13c4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> This adds the vhost-user backend driver to support virtio based I2C and
> SMBUS devices.
>
> vhost-user-i2c --help
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
<snip>
> +
> +static VI2cAdapter *vi2c_create_adapter(int32_t bus, uint16_t client_add=
r[],
> +                                        int32_t n_client)
> +{
> +    VI2cAdapter *adapter;
> +    char path[20];

If you use:

    g_autofree char *path =3D NULL;

If fact you could also use g_autofree with adapter to make you exit case
a little easier.

> +    uint64_t funcs;
> +    int32_t fd, i;
> +
> +    if (bus < 0) {
> +        return NULL;
> +    }
> +
> +    adapter =3D g_malloc0(sizeof(*adapter));

g_malloc will abort() on lack of memory so you can skip the check here.

> +    if (!adapter) {
> +        g_printerr("failed to alloc adapter");
> +        return NULL;
> +    }
> +
> +    snprintf(path, sizeof(path), "/dev/i2c-%d", bus);
> +    path[sizeof(path) - 1] =3D '\0';

then this becomes:

  path =3D g_strdup_printf("/dev/i2c-%d", bus);

> +
> +    fd =3D open(path, O_RDWR);
> +    if (fd < 0) {
> +        g_printerr("virtio_i2c: failed to open %s\n", path);
> +        goto fail;
> +    }
> +
> +    adapter->fd =3D fd;
> +    adapter->bus =3D bus;
> +
> +    if (ioctl(fd, I2C_FUNCS, &funcs) < 0) {
> +        g_printerr("virtio_i2c: failed to get functionality %s: %d\n", p=
ath,
> +                   errno);
> +        goto close_fd;
> +    }
> +
> +    if (funcs & I2C_FUNC_I2C) {
> +        adapter->smbus =3D false;
> +    } else if (funcs & I2C_FUNC_SMBUS_WORD_DATA) {
> +        adapter->smbus =3D true;
> +    } else {
> +        g_printerr("virtio_i2c: invalid functionality %lx\n", funcs);
> +        goto close_fd;
> +    }
> +
> +    for (i =3D 0; i < n_client; i++) {
> +        if (client_addr[i]) {
> +            if (!vi2c_set_client_addr(adapter, client_addr[i])) {
> +                goto close_fd;
> +            }
> +
> +            if (adapter->clients[client_addr[i]]) {
> +                g_printerr("client addr 0x%x repeat, not allowed.\n",
> +                           client_addr[i]);
> +                goto close_fd;
> +            }
> +
> +            adapter->clients[client_addr[i]] =3D true;
> +            if (verbose) {
> +                g_print("Added client 0x%x to bus %u\n", client_addr[i],=
 bus);
> +            }
> +        }
> +    }
> +
> +    if (verbose) {
> +        g_print("Added adapter: bus: %d, func %s\n", bus,
> +                adapter->smbus ? "smbus" : "i2c");
> +    }
> +    return adapter;

This would then be:

  return g_steal_pointer(adapter);

> +
> +close_fd:
> +    close(fd);
> +fail:
> +    g_free(adapter);
> +    return NULL;
> +}
> +
> +/*
> + * Virtio I2C device list format.
> + *
> + * <bus>:<client_addr>[:<client_addr>],
> + * [<bus>:<client_addr>[:<client_addr>]]
> + *
> + * bus (dec): adatper bus number.
> + *     e.g. 2 for /dev/i2c-2
> + * client_addr (hex): address for client device
> + *     e.g. 0x1C or 1C
> + *
> + * Example: --device-list=3D"2:0x1c:0x20,3:0x10:0x2c"
> + *
> + * Note: client address can not repeat.
> + */
> +static int32_t vi2c_parse(VuI2c *i2c)
> +{
> +    uint16_t client_addr[MAX_I2C_VDEV];
> +    int32_t n_adapter =3D 0, n_client;
> +    int64_t addr, bus;
> +    const char *cp, *t;
> +
> +    while (device_list) {
> +        /* Read <bus>:<client_addr>[:<client_addr>] entries one by one */
> +        cp =3D strsep(&device_list, ",");

The glib approach would be to use g_strsplit(device_list, ",", 0) which
you can then iterate over with something like:

    for (i =3D 0; cp[i] !=3D NULL; i++) {

    }=20

    g_strfreev(cp);

> +
> +        if (!cp || *cp =3D=3D '\0') {
> +            break;
> +        }
> +
> +        if (n_adapter =3D=3D MAX_I2C_ADAPTER) {
> +            g_printerr("too many adapter (%d), only support %d\n", n_ada=
pter,
> +                       MAX_I2C_ADAPTER);
> +            goto out;
> +        }
> +
> +        if (qemu_strtol(cp, &t, 10, &bus) || bus < 0) {
> +            g_printerr("Invalid bus number %s\n", cp);
> +            goto out;
> +        }
> +
> +        cp =3D t;
> +        n_client =3D 0;
> +
> +        /* Parse clients <client_addr>[:<client_addr>] entries one by
> one */

Then this would be:

     **dev =3D g_strsplit(cp[i], ":", 2);
     if (dev && dev[0]) {

         if (dev[1]) {
         }
     }
     g_freestrv(dev);

which would avoid you manually iterating over the string.

> +        while (cp !=3D NULL && *cp !=3D '\0') {
> +            if (*cp =3D=3D ':') {
> +                cp++;
> +            }
> +
> +            if (n_client =3D=3D MAX_I2C_VDEV) {
> +                g_printerr("too many devices (%d), only support %d\n",
> +                           n_client, MAX_I2C_VDEV);
> +                goto out;
> +            }
> +
> +            if (qemu_strtol(cp, &t, 16, &addr) ||
> +                addr < 0 || addr > MAX_I2C_VDEV) {
> +                g_printerr("Invalid address %s : %lx\n", cp, addr);
> +                goto out;
> +            }
> +
> +            client_addr[n_client++] =3D addr;
> +            cp =3D t;
> +            if (verbose) {
> +                g_print("i2c adapter %ld:0x%lx\n", bus, addr);
> +            }
> +        }
> +
> +        i2c->adapter[n_adapter] =3D vi2c_create_adapter(bus, client_addr,
> +                                                      n_client);
> +        if (!i2c->adapter[n_adapter]) {
> +            goto out;
> +        }
> +
> +        n_adapter++;
> +    }
> +
> +    if (!n_adapter) {
> +        g_printerr("Failed to add any adapters\n");
> +        return -1;
> +    }
> +
> +    i2c->adapter_num =3D n_adapter;
> +
> +    if (!vi2c_map_adapters(i2c)) {
> +        return 0;
> +    }
> +
> +out:
> +    vi2c_remove_adapters(i2c);
> +    return -1;
> +}
> +
<snip>
> +
> +static void vi2c_handle_ctrl(VuDev *dev, int qidx)
> +{
> +    VuVirtq *vq =3D vu_get_queue(dev, qidx);
> +    struct virtio_i2c_out_hdr *out_hdr;
> +    size_t i, count =3D 0, len, in_hdr_len;
> +    struct i2c_msg *msgs;
> +    VuVirtqElement *elem;
> +    uint8_t status;
> +    struct {
> +        struct virtio_i2c_in_hdr *in_hdr;
> +        VuVirtqElement *elem;
> +        size_t size;
> +    } *info;
> +
> +    /* Count number of messages */
> +    do {
> +        elem =3D vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
> +    } while (elem && ++count);

Can you expand on this comment as to why we can't process each message
as we come to it?

> +
> +    if (!count) {
> +        if (verbose) {
> +            g_printerr("Virtqueue can't have 0 elements\n");
> +        }
> +        return;
> +    }
> +
> +    /* Rewind everything, now that we have counted the number of message=
s */
> +    vu_queue_rewind(dev, vq, count);
> +
> +    if (verbose) {
> +        g_print("Received %ld messages in virtqueue\n", count);
> +    }
> +
> +    /* Allocate memory for msgs and info */
> +    msgs =3D g_malloc0_n(count, sizeof(*msgs) + sizeof(*info));
> +    if (!msgs) {
> +        g_printerr("failed to allocate space for messages\n");
> +        return;
> +    }

g_malloc0_n will abort() or succeed. Could this be a g_new and be typed
in some way?

> +    info =3D (void *)(msgs + count);
> +
> +    for (i =3D 0; i < count; i++) {
> +        elem =3D vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
> +        if (!elem) {
> +            g_printerr("Failed to pop element: %ld : %ld\n", i, count);
> +            goto out;
> +        }

not withstanding the above comment this seems like an assert() because
it should never fail?

> +        info[i].elem =3D elem;
> +        info[i].size =3D sizeof(*info[i].in_hdr);
> +
> +        g_debug("%s: got queue (in %d, out %d)", __func__, elem->in_num,
> +                elem->out_num);
> +
> +        /* Validate size of "out" header */
> +        if (elem->out_sg[0].iov_len !=3D sizeof(*out_hdr)) {
> +            g_warning("%s: Invalid out hdr %zu : %zu\n", __func__,
> +                      elem->out_sg[0].iov_len, sizeof(*out_hdr));
> +            goto out;
> +        }
> +
> +        out_hdr =3D elem->out_sg[0].iov_base;
> +
> +        /* Bit 0 is reserved in virtio spec */
> +        msgs[i].addr =3D le16toh(out_hdr->addr) >> 1;
> +
> +        /* Read Operation */
> +        if (elem->out_num =3D=3D 1 && elem->in_num =3D=3D 2) {
> +            len =3D elem->in_sg[0].iov_len;
> +            if (!len) {
> +                g_warning("%s: Read buffer length can't be zero\n", __fu=
nc__);
> +                goto out;
> +            }
> +
> +            msgs[i].buf =3D elem->in_sg[0].iov_base;
> +            msgs[i].flags =3D I2C_M_RD;
> +            msgs[i].len =3D len;
> +
> +            info[i].in_hdr =3D elem->in_sg[1].iov_base;
> +            info[i].size +=3D len;
> +            in_hdr_len =3D elem->in_sg[1].iov_len;
> +        } else if (elem->out_num =3D=3D 2 && elem->in_num =3D=3D 1) {
> +            /* Write Operation */
> +            len =3D elem->out_sg[1].iov_len;
> +            if (!len) {
> +                g_warning("%s: Write buffer length can't be zero\n", __f=
unc__);
> +                goto out;
> +            }
> +
> +            msgs[i].buf =3D elem->out_sg[1].iov_base;
> +            msgs[i].flags =3D 0;
> +            msgs[i].len =3D len;
> +
> +            info[i].in_hdr =3D elem->in_sg[0].iov_base;
> +            in_hdr_len =3D elem->in_sg[0].iov_len;
> +        } else {
> +            g_warning("%s: Transfer type not supported (in %d, out %d)\n=
",
> +                      __func__, elem->in_num, elem->out_num);
> +            goto out;
> +        }
> +
> +        /* Validate size of "in" header */
> +        if (in_hdr_len !=3D sizeof(*(info[i].in_hdr))) {
> +            g_warning("%s: Invalid in hdr %zu : %zu\n", __func__, in_hdr=
_len,
> +                      sizeof(*(info[i].in_hdr)));
> +            goto out;
> +        }
> +    }
> +
> +    status =3D vi2c_xfer(dev, msgs, count);
> +
> +    for (i =3D 0; i < count; i++) {
> +        info[i].in_hdr->status =3D status;
> +        vu_queue_push(dev, vq, info[i].elem, info[i].size);
> +    }
> +
> +    vu_queue_notify(dev, vq);
> +
> +out:
> +    g_free(msgs);
> +}
> +
<snip>
> diff --git a/tools/vhost-user-i2c/meson.build b/tools/vhost-user-i2c/meso=
n.build
> new file mode 100644
> index 000000000000..f71e9fec7df6
> --- /dev/null
> +++ b/tools/vhost-user-i2c/meson.build
> @@ -0,0 +1,10 @@
> +executable('vhost-user-i2c', files(
> +  'main.c'),
> +  dependencies: [qemuutil, glib, gio],
> +  install: true,
> +  install_dir: get_option('libexecdir'))
> +
> +configure_file(input: '50-qemu-i2c.json.in',
> +               output: '50-qemu-i2c.json',
> +               configuration: config_host,

FYI this now needs to be:

               configuration: { 'libexecdir' : get_option('prefix') / get_o=
ption('libexecdir') },

to properly pass libexecdir above.

> +               install_dir: qemu_datadir / 'vhost-user')


--=20
Alex Benn=C3=A9e

