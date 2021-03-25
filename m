Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766C3496E1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 17:34:13 +0100 (CET)
Received: from localhost ([::1]:38580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPSw0-00068r-7z
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 12:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1lPSeq-0002vO-3U
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:16:28 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:44933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1lPSeo-000311-5X
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 12:16:27 -0400
Received: from mail-oo1-f47.google.com ([209.85.161.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MdwRi-1lxxvU2U4c-00b5sS for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021
 17:16:22 +0100
Received: by mail-oo1-f47.google.com with SMTP id
 i25-20020a4aa1190000b02901bbd9429832so622857ool.0
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 09:16:22 -0700 (PDT)
X-Gm-Message-State: AOAM530vBB9HtzUVOq+s1MgP2jvG8pZn98LPjnoY95rSbrlJz6xwhuP0
 lnU9f7uXcWteWucftP/wWMyZjd5jprZUbS5/jOE=
X-Google-Smtp-Source: ABdhPJz40zGDMo1wSX1zkqiDXapywpuj0bSrhnuz9h5ForG5wBDvfMGL2V6OtIi6jC0IJ5+bhRk7p1lHOro/If22Z3w=
X-Received: by 2002:a4a:e9a2:: with SMTP id t2mr7741520ood.15.1616688981139;
 Thu, 25 Mar 2021 09:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
In-Reply-To: <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Mar 2021 17:16:04 +0100
X-Gmail-Original-Message-ID: <CAK8P3a198aR8d0qUPg124O_P7bzO+Yagwe9ydprSGj789ydn2w@mail.gmail.com>
Message-ID: <CAK8P3a198aR8d0qUPg124O_P7bzO+Yagwe9ydprSGj789ydn2w@mail.gmail.com>
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
To: Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:XfdBmqEmEul5ASIRhlVFy2oUWY2qzRVZA3v4JcKHPrS98enokEu
 eFyuZbuwaKqX/S/xAGDMtdUs4XtCPsuyucLq19vc4xl/wJlR0u3O3oQ1sXBvZWa94vuUPdF
 hKLBRChW3sM1b4aNtS4kqY5XMRhQLebxsXzQdhLeL1GmQ75UbmGnxNnQFndV8M7X3aWmu1u
 920Kobur/1HE05UzxbPig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WR/gCL8SUE0=:W4EMzyd0y6nSAs/2zshBnH
 PMUrvcIsVVAzccgiJmhwwpSCjAutNlYaqSkdXkV2/fPJQrHl552w+i4wiGH6Hw6mzVDo2C8Xw
 lgjAv++BZ5D/ROk91pCCmBdwq6/KVFKeVhcToQd1Ri26Df+3kZHJnqVKc+sSJ6msUqOqo8Dfa
 BeeGoNU0bhVq4y1QLtY27oL0zkFghzrqdj68Fz0q4504AELqLRNgHjL1u2FmtUeZG2U+43824
 7WeWBCeB/RDsyodMOpVbliUS+IGuTtdRcM78Xh0Ld328gNSnYOKw0DH9nDIVzk+kgencJmbRw
 YJPOQPLXT0T0f+SWQEZLkyefPMM5bhnS63V5wAJLu+zLuFabowIyYBMeLcNpH7uBYuq/IIa9h
 w1+EBrWlqbVIQW28sMUlB3nrolR7WYhjC2QHOg3dz4jdXBst19Rss83eOI8reOHe4q9L5ctR3
 Z+uUdB+p9W6Y0zlA+E4pQLxUZkDpFAc=
Received-SPF: none client-ip=212.227.126.130; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Bill Mills <bill.mills@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 8:33 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> +static uint8_t vi2c_xfer(VuDev *dev, struct i2c_msg *msg)
> +{
> +    VuI2c *i2c = container_of(dev, VuI2c, dev.parent);
> +    struct i2c_rdwr_ioctl_data data;
> +    VI2cAdapter *adapter;
> +
> +    adapter = vi2c_find_adapter(i2c, msg->addr);
> +    if (!adapter) {
> +        g_printerr("Failed to find adapter for address: %x\n", msg->addr);
> +        return VIRTIO_I2C_MSG_ERR;
> +    }
> +
> +    data.nmsgs = 1;
> +    data.msgs = msg;
> +
> +    if (ioctl(adapter->fd, I2C_RDWR, &data) < 0) {
> +        g_printerr("Failed to transfer data to address %x : %d\n", msg->addr, errno);
> +        return VIRTIO_I2C_MSG_ERR;
> +    }

As you found during testing, this doesn't work for host kernels
that only implement the SMBUS protocol. Since most i2c clients
only need simple register read/write operations, I think you should
at least handle the common ones (and one two byte read/write)
here to make it more useful.

> +static void vi2c_handle_ctrl(VuDev *dev, int qidx)
> +{
> +    VuVirtq *vq = vu_get_queue(dev, qidx);
> +    struct i2c_msg msg;
> +    struct virtio_i2c_out_hdr *out_hdr;
> +    struct virtio_i2c_in_hdr *in_hdr;
> +    bool fail_next = false;
> +    size_t len, in_hdr_len;
> +
> +    for (;;) {
> +        VuVirtqElement *elem;
> +
> +        elem = vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
> +        if (!elem) {
> +            break;
> +        }
> +
> +        g_debug("%s: got queue (in %d, out %d)", __func__, elem->in_num,
> +                elem->out_num);
> +
> +        /* Validate size of out header */
> +        if (elem->out_sg[0].iov_len != sizeof(*out_hdr)) {
> +            g_warning("%s: Invalid out hdr %zu : %zu\n", __func__,
> +                      elem->out_sg[0].iov_len, sizeof(*out_hdr));
> +            continue;
> +        }
> +
> +        out_hdr = elem->out_sg[0].iov_base;
> +
> +        /* Bit 0 is reserved in virtio spec */
> +        msg.addr = out_hdr->addr >> 1;
> +
> +        /* Read Operation */
> +        if (elem->out_num == 1 && elem->in_num == 2) {
> +            len = elem->in_sg[0].iov_len;
> +            if (!len) {
> +                g_warning("%s: Read buffer length can't be zero\n", __func__);
> +                continue;
> +            }


It looks like you are not handling endianness conversion here. As far as I
can tell, the protocol requires little-endian data, but the code might
run on a big-endian CPU.

Jie Deng also pointed out the type differences, but actually handling
them correctly is more important that describing them the right way.

        Arnd

