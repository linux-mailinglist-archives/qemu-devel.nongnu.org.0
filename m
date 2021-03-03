Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F9032B6A6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:32:55 +0100 (CET)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOoI-00026L-4y
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOnB-0001Xr-FU
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:31:45 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHOn9-0006GW-Ld
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:31:45 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id l8so23938567ybe.12
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 02:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u222WvhyDizBU5ZC0pUWCXzryBMpwoY3VEG3uvgGMNs=;
 b=HjKJw63OpRvfVO00RwnWsT3YgChaqhv7PQNXCWe1RhauSp8FEE8iqp1lCyBE6BgF4K
 3/ChqnPvswbzQK2utTqIo8QtfjO5hioYm4iSrKEZh+eYHEkkVW+yl6Wv7hpeJ2iJR1eS
 GtT6OcFJnMIC269tu2pFIEPdSRQVtHUcZmxax3A2MtwgzkPKIeKV9m9zvGlbFN1gMD7y
 YzHTv6+u1aIL1/lHpx4vKPWvAvwqpBINKl0cYlBXkjaZCnBOIcH9c+xc1WqoVyXFTK7H
 L7qoqgcVQhFRV++9OO0xg0j3vH1Gc/bDADgtfwhHFiU/hZm+u88+qbUt2Yjk6a/Q1CBm
 g2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u222WvhyDizBU5ZC0pUWCXzryBMpwoY3VEG3uvgGMNs=;
 b=JyE3DCnOzBTWnxx3a40r/kGhYv+cYLgqHYtQMc1zve4I5ww292K+Rrc/ILFMAnaxp5
 umVMVyBDN5mJXc8EjbidraMAw26vW1qo5I5T9EHNKjF5NkMmhvHn/GgwEq8Tse5b84pP
 +xhxFMK1ejMY+zv58UX+psSmFBlH21ZMgdWaInsF+/pCteDXYtb+KdxkZ8fyICZjwkO4
 1U5038TsDCqHchhGE4JlQ9dLzLcWWE9C0K5QZvEhXEsk4ZGIPwGpUoh8t3neeNX9V8ps
 3NwV/D7C410QRsA3M90K3uf4GSEIsFgY309qHw++TSK9bliTjd4ndHsLhdKN0sJf7lVq
 fang==
X-Gm-Message-State: AOAM532LZFFLFr9wfWiXzLXdEwOPgWhr8di1wS/igRycESEbsFRjh4Bf
 tjbN5wlqNJLdy539Tk7kAPajJqEAUoDwechkdZ0=
X-Google-Smtp-Source: ABdhPJzw1wA7BghhGfMF0MxV3BbdUDfO8BJ55AL0TPSxEIsmSFMKhWVKHepU9fLjaTKf/cUGXmcPrhBznQIHrMKzaD0=
X-Received: by 2002:a25:abce:: with SMTP id v72mr39328199ybi.152.1614767502548; 
 Wed, 03 Mar 2021 02:31:42 -0800 (PST)
MIME-Version: 1.0
References: <1614763306-18026-1-git-send-email-bmeng.cn@gmail.com>
 <1614763306-18026-2-git-send-email-bmeng.cn@gmail.com>
 <39d86853-45aa-2231-b9d5-e38985747b5d@redhat.com>
In-Reply-To: <39d86853-45aa-2231-b9d5-e38985747b5d@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 3 Mar 2021 18:31:31 +0800
Message-ID: <CAEUhbmUqVgKb3juSWQorvZj_6aqrqF_O0k6CMy3EkAugLK8uQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/9] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Wed, Mar 3, 2021 at 6:15 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 3/3/21 10:21 AM, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The minimum Ethernet frame length is 60 bytes. For short frames with
> > smaller length like ARP packets (only 42 bytes), on a real world NIC
> > it can choose either padding its length to the minimum required 60
> > bytes, or sending it out directly to the wire. Such behavior can be
> > hardcoded or controled by a register bit. Similarly on the receive
> > path, NICs can choose either dropping such short frames directly or
> > handing them over to software to handle.
> >
> > On the other hand, for the network backends SLiRP/TAP, they don't
> > expose a way to control the short frame behavior. As of today they
> > just send/receive data from/to the other end connected to them,
> > which means any sized packet is acceptable. So they can send and
> > receive short frames without any problem. It is observed that ARP
> > packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
> > these ARP packets to the other end which might be a NIC model that
> > does not allow short frames to pass through.
> >
> > To provide better compatibility, for packets sent from SLiRP/TAP, we
> > change to pad short frames before sending it out to the other end.
> > This ensures SLiRP/TAP as an Ethernet sender do not violate the spec.
> > But with this change, the behavior of dropping short frames in the
> > NIC model cannot be emulated because it always receives a packet that
> > is spec complaint. The capability of sending short frames from NIC
> > models are still supported and short frames can still pass through
> > SLiRP/TAP interfaces.
> >
> > This commit should be able to fix the issue as reported with some
> > NIC models before, that ARP requests get dropped, preventing the
> > guest from becoming visible on the network. It was workarounded in
> > these NIC models on the receive path, that when a short frame is
> > received, it is padded up to 60 bytes.
> >
> > The following 2 commits seem to be the one to workaround this issue
> > in e1000 and vmxenet3 before, and should probably be reverted.
> >
> >   commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 byt=
es)")
> >   commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 b=
ytes)")
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v2:
> > - only pad short frames for SLiRP/TAP interfaces
> >
> >  include/net/eth.h |  1 +
> >  net/net.c         | 12 ++++++++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/include/net/eth.h b/include/net/eth.h
> > index 0671be6..7c825ec 100644
> > --- a/include/net/eth.h
> > +++ b/include/net/eth.h
> > @@ -31,6 +31,7 @@
> >
> >  #define ETH_ALEN 6
> >  #define ETH_HLEN 14
> > +#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
> >
> >  struct eth_header {
> >      uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
> > diff --git a/net/net.c b/net/net.c
> > index 32d71c1..27c3b25 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -638,6 +638,7 @@ static ssize_t qemu_send_packet_async_with_flags(Ne=
tClientState *sender,
> >                                                   NetPacketSent *sent_c=
b)
> >  {
> >      NetQueue *queue;
> > +    uint8_t min_buf[ETH_ZLEN];
> >      int ret;
> >
> >  #ifdef DEBUG_NET
> > @@ -649,6 +650,17 @@ static ssize_t qemu_send_packet_async_with_flags(N=
etClientState *sender,
> >          return size;
> >      }
> >
> > +    /* Pad to minimum Ethernet frame length for SLiRP and TAP */
> > +    if (sender->info->type =3D=3D NET_CLIENT_DRIVER_USER ||
> > +        sender->info->type =3D=3D NET_CLIENT_DRIVER_TAP) {
> > +        if (size < ETH_ZLEN) {
> > +            memcpy(min_buf, buf, size);
> > +            memset(&min_buf[size], 0, ETH_ZLEN - size);
> > +            buf =3D min_buf;
> > +            size =3D ETH_ZLEN;
> > +        }
>
> We can have zero-copy by using a static zeroed buf and rewrite
> this function to call the _iov() equivalents with a pair of
> struct iovec.

Do you have an example of doing zero-copy using _iov() equivalents?

Also I am not sure whether it's worth doing zero-copy given this is
only a 60 bytes copy.

>
> > +    }
> > +
> >      /* Let filters handle the packet first */
> >      ret =3D filter_receive(sender, NET_FILTER_DIRECTION_TX,
> >                           sender, flags, buf, size, sent_cb);
> >
>

Regards,
Bin

